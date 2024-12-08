using Application.DTOs;
using Domain.Models;
using Infrastructure.Data;
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
