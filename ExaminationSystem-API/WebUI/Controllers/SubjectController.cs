using Application.DTOs;
using Domain.Models;
using Infrastructure.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

[Route("api/[controller]")]
[ApiController]
public class SubjectController : ControllerBase
{
    private readonly AppDbContext _Db;

    public SubjectController(AppDbContext Db)
    {
        _Db = Db;
    }

    [HttpGet("AllSubjects")]
    public async Task<IActionResult> GetAllSubjects()
    {
        var subjects = await _Db.Subjects.ToListAsync();

        if (!subjects.Any())
            return NotFound("No subjects found.");

        return Ok(subjects);
    }


    [HttpGet("{id}")]
    public async Task<IActionResult> GetSubjectById(int id)
    {
        var subject = await _Db.Subjects.FindAsync(id);
        if (subject == null)
            return NotFound($"Subject with ID {id} not found.");

        return Ok(subject);
    }

    [HttpGet("Examhistory/{subjectId}")]
    [Authorize(Roles = "Admin")]
    public async Task<IActionResult> GetExamHistoryBySubject(int subjectId)
    {
        var subject = await _Db.Subjects.FindAsync(subjectId);
        if (subject == null)
            return NotFound($"Subject with ID {subjectId} not found.");

        var examHistories = await _Db.StudentExams
            .Where(e => e.Exam.SubjectId == subjectId)
            .Include(e => e.Exam)
            .Include(e => e.Student)
            .Select(e => new ExamHistoryBySubjectDto
            {
                StudentExamId = e.StudentExamId,
                DateTimeTaken = e.DateTimeTaken,
                Score = e.Score,
                IsPassed = e.Score >= e.Exam.PassScore,
                ExamName = e.Exam.ExamName,
                PassScore = e.Exam.PassScore,
                StudentName = $"{e.Student.FirstName} {e.Student.LastName}"
            })
            .OrderByDescending(se => se.DateTimeTaken)
            .ToListAsync();

        if (!examHistories.Any())
            return NotFound("No exam history found for this subject.");

        return Ok(examHistories);
    }

    [Authorize(Roles = "Admin")]
    [HttpPost("AddSubject")]
    public async Task<IActionResult> AddSubject([FromBody] SubjectDto subjectDto)
    {
        if (!ModelState.IsValid)
            return BadRequest("Invalid subject data.");

        var subject = new Subject
        {
            SubjectName = subjectDto.SubjectName,
            SubjectDescription = subjectDto.SubjectDescription
        };

        await _Db.Subjects.AddAsync(subject);
        await _Db.SaveChangesAsync();
        return Ok(new { Message = "Subject added successfully.", Subject = subject });
    }

    [Authorize(Roles = "Admin")]
    [HttpPut("EditSubject/{id}")]
    public async Task<IActionResult> EditSubject(int id, [FromBody] SubjectDto subjectDto)
    {
        var subject = await _Db.Subjects.FindAsync(id);
        if (subject == null)
            return NotFound($"Subject with ID {id} not found.");

        subject.SubjectName = subjectDto.SubjectName;
        subject.SubjectDescription = subjectDto.SubjectDescription;

        _Db.Subjects.Update(subject);
        await _Db.SaveChangesAsync();

        return Ok(new { Message = "Subject updated successfully.", Subject = subject });
    }
    [Authorize(Roles = "Admin")]
    [HttpDelete("DeleteSubject/{id}")]
    public async Task<IActionResult> DeleteSubject(int id)
    {
        var subject = await _Db.Subjects.FindAsync(id);
        if (subject == null)
            return NotFound($"Subject with ID {id} not found.");

        _Db.Subjects.Remove(subject);
        await _Db.SaveChangesAsync();
        return Ok(new { Message = "Subject deleted successfully." });
    }
}
