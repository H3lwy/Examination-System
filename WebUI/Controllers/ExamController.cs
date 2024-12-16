using Application.DTOs;
using Domain.Models;
using Infrastructure.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;


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

    [HttpGet("GetExamById/{id}")]
    public async Task<IActionResult> GetExamById(int id)
    {
        var exam = await _Db.Exams
            .Include(e => e.ExamQuestions)
            .ThenInclude(eq => eq.Question)
            .FirstOrDefaultAsync(e => e.ExamId == id);

        if (exam == null)
            return NotFound($"Exam with ID {id} not found.");

        var questionIds = exam.ExamQuestions.Select(eq => eq.QuestionId).ToList();

        return Ok(new
        {
            exam.ExamId,
            exam.ExamName,
            exam.SubjectId,
            exam.TimeLimit,
            exam.PassScore,
            questionIds = exam.ExamQuestions.Select(eq => eq.QuestionId).ToList()
        });

    }



    [HttpGet("GetQuestionsByExam/{examId}")]
    public async Task<IActionResult> GetQuestionsByExam(int examId)
    {
        var questions = await _Db.ExamQuestions
            .Where(eq => eq.ExamId == examId)
            .Include(eq => eq.Question)
            .Select(eq => new
            {
                eq.Question.QuestionId,
                eq.Question.QuestionText,
                Choices = eq.Question.choices.Select(c => new
                {
                    c.ChoiceId,
                    c.ChoiceText,
                    c.IsCorrect
                })
            })
            .ToListAsync();

        if (!questions.Any())
            return NotFound($"No questions found for Exam ID {examId}.");

        return Ok(questions);
    }


    [HttpGet("ExamsBySubject/{subjectId}")]
    public async Task<IActionResult> GetExamsBySubject(int subjectId, int pageNumber = 1, int pageSize = 10)
    {
        var exams = await _Db.Exams
            .Where(e => e.SubjectId == subjectId)
            .Skip((pageNumber - 1) * pageSize)
            .Take(pageSize)
            .Select(e => new
            {
                e.ExamId,
                e.ExamName,
                e.TimeLimit,
                e.PassScore
            })
            .ToListAsync();

        var totalExams = await _Db.Exams.CountAsync(e => e.SubjectId == subjectId);

        if (!exams.Any())
            return NotFound($"No exams found for Subject ID {subjectId}.");

        return Ok(new
        {
            Exams = exams,
            TotalPages = (int)Math.Ceiling((double)totalExams / pageSize),
            CurrentPage = pageNumber
        });
    }


    [Authorize(Roles = "Admin")]
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
            PassScore = examDto.PassScore,
            ExamQuestions = new List<ExamQuestion>()
        };

        if (examDto.QuestionIds != null && examDto.QuestionIds.Any())
        {
            var validQuestions = await _Db.Questions
                .Where(q => examDto.QuestionIds.Contains(q.QuestionId))
                .ToListAsync();

            if (validQuestions.Count != examDto.QuestionIds.Count)
                return BadRequest("Some question IDs are invalid.");

            foreach (var question in validQuestions)
            {
                exam.ExamQuestions.Add(new ExamQuestion
                {
                    QuestionId = question.QuestionId
                });
            }
        }

        await _Db.Exams.AddAsync(exam);
        await _Db.SaveChangesAsync();

        return Ok(new
        {
            Message = "Exam added successfully.",
            Exam = new
            {
                exam.ExamId,
                exam.ExamName,
                exam.SubjectId,
                exam.TimeLimit,
                exam.PassScore
            }
        });
    }

    [Authorize(Roles = "Admin")]
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
    [Authorize(Roles = "Admin")]
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
