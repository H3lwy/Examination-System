using Application.DTOs;
using Domain.Models;
using Infrastructure.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

[Authorize(Policy = "Admin")]
[Route("api/[controller]")]
[ApiController]
public class ExamController : ControllerBase
{
    private readonly AppDbContext _Db;

    public ExamController(AppDbContext Db)
    {
        _Db = Db;
    }

    [HttpGet("AllExams")]
    public async Task<IActionResult> GetAllExams(int pageNumber = 1, int pageSize = 10)
    {
        var exams = await _Db.Exams
            .Include(e => e.Subject)
            .Skip((pageNumber - 1) * pageSize)
            .Take(pageSize)
            .Select(e => new
            {
                e.ExamId,
                e.ExamName,
                e.Subject.SubjectName,
                e.TimeLimit,
                e.PassScore
            })
            .ToListAsync();

        var totalExams = await _Db.Exams.CountAsync();

        return Ok(new
        {
            Exams = exams,
            TotalPages = (int)Math.Ceiling((double)totalExams / pageSize),
            CurrentPage = pageNumber
        });
    }

    [HttpPost("AddExam")]
    public async Task<IActionResult> AddExam([FromBody] ExamDto examDto)
    {
        if (!ModelState.IsValid)
            return BadRequest("Invalid exam data.");

        var subject = await _Db.Subjects.FindAsync(examDto.SubjectId);
        if (subject == null)
            return NotFound($"Subject with ID {examDto.SubjectId} not found.");

        var exam = new Exam
        {
            ExamName = examDto.ExamName,
            SubjectId = examDto.SubjectId,
            TimeLimit = examDto.TimeLimit,
            PassScore = examDto.PassScore
        };

        await _Db.Exams.AddAsync(exam);
        await _Db.SaveChangesAsync();

        return Ok(new
        {
            Message = "Exam added successfully."
        });
    }


    [HttpPut("EditExam/{id}")]
    public async Task<IActionResult> EditExam(int id, [FromBody] ExamDto examDto)
    {
        var existingExam = await _Db.Exams.FindAsync(id);
        if (existingExam == null)
            return NotFound($"Exam with ID {id} not found.");

        existingExam.ExamName = examDto.ExamName;
        existingExam.SubjectId = examDto.SubjectId;
        existingExam.TimeLimit = examDto.TimeLimit;
        existingExam.PassScore = examDto.PassScore;

        _Db.Exams.Update(existingExam);
        await _Db.SaveChangesAsync();

        return Ok(new { Message = "Exam updated successfully.", Exam = existingExam });
    }

    [HttpDelete("DeleteExam/{id}")]
    public async Task<IActionResult> DeleteExam(int id)
    {
        var exam = await _Db.Exams.FindAsync(id);
        if (exam == null)
            return NotFound($"Exam with ID {id} not found.");

        _Db.Exams.Remove(exam);
        await _Db.SaveChangesAsync();
        return Ok(new { Message = "Exam deleted successfully." });
    }
}
