using Application.DTOs;
using Domain.Models;
using Infrastructure.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace WebUI.Controllers
{
    [Authorize(Policy = "Admin")]
    [Route("api/[controller]")]
    [ApiController]
    public class AdminController : ControllerBase
    {
        private readonly AppDbContext _Db;
        private readonly UserManager<User> _UserManager;
        public AdminController(AppDbContext Db, UserManager<User> UserManager)
        {
            _Db = Db;
            _UserManager = UserManager;
        }

        [HttpGet("AllStudentsNumbers")]
        public async Task<IActionResult> GetAllStudentsNumbers()
        {
            var students = await _UserManager.GetUsersInRoleAsync("Student");
            return Ok(students.Count);
        }

        [HttpGet("CompletedExamsNumbers")]
        public async Task<IActionResult> GetAllExamsCompletedNumbers()
        {
            var completedExams = await _Db.StudentExams
                .Include(e => e.Exam)
                .Include(e => e.Student)
                .Where(e => e.IsCompleted)
                .ToListAsync();

            if (completedExams.Any())
            {
                return Ok(completedExams.Count);
            }
            else
            {
                return NotFound("No completed exams found.");
            }
        }

        [HttpGet("PassedExamsNumbers")]
        public async Task<IActionResult> GetAllExamsPassedNumbers()
        {
            var PassedExams = await _Db.StudentExams
                .Include(e => e.Exam)
                .Include(e => e.Student)
                .Where(e => e.IsCompleted && e.Score >= e.Exam.PassScore)
                .ToListAsync();

            if (PassedExams.Any())
            {
                return Ok(PassedExams.Count);
            }
            else
            {
                return NotFound("No Passed exams found.");
            }
        }

        [HttpGet("FailedExamsNumbers")]
        public async Task<IActionResult> GetAllExamsFailedNumbers()
        {
            var FailedExams = await _Db.StudentExams
                .Include(e => e.Exam)
                .Include(e => e.Student)
                .Where(e => e.IsCompleted && e.Score < e.Exam.PassScore)
                .ToListAsync();

            if (FailedExams.Any())
            {
                return Ok(FailedExams.Count);
            }
            else
            {
                return NotFound("No Failed exams found.");
            }
        }

        [HttpGet("AllStudents")]
        public async Task<IActionResult> GetStudents(int pageNumber = 1, int pageSize = 10)
        {
            var students = await _UserManager.GetUsersInRoleAsync("Student");

            var paginatedStudents = students
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize)
                .Select(s => new StudentDto
                {
                    Id = s.Id,
                    FirstName = s.FirstName,
                    LastName = s.LastName,
                    UserName = s.UserName,
                    Email = s.Email,
                    IsActive = s.IsActive
                })
                .ToList();

            return Ok(new
            {
                Students = paginatedStudents,
                TotalPages = (int)Math.Ceiling((double)students.Count / pageSize),
                CurrentPage = pageNumber
            });
        }


        [HttpPut("{id}/status")]
        public async Task<IActionResult> UpdateUserStatus(string id, [FromBody] UpdateUserStatusDto dto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var user = await _UserManager.FindByIdAsync(id);
            if (user == null)
            {
                return NotFound("User not found.");
            }

            user.IsActive = dto.IsActive;
            var result = await _UserManager.UpdateAsync(user);
            if (!result.Succeeded)
            {
                return BadRequest("Failed to update user status.");
            }

            var updatedUserDto = new StudentDto
            {
                Id = user.Id,
                UserName = user.UserName,
                FirstName = user.FirstName,
                LastName = user.LastName,
                IsActive = user.IsActive
            };

            return Ok(updatedUserDto);
        }

    }
}

