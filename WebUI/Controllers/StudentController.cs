﻿using Application.DTOs;
using Domain.Models;
using Infrastructure.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

[Authorize(Roles = "Student")]
[Route("api/[controller]")]
[ApiController]
public class StudentController : ControllerBase
{
    private readonly AppDbContext _Db;

    public StudentController(AppDbContext Db)
    {
        _Db = Db;
    }

    [HttpGet("GetAllSubjects")]
    public async Task<IActionResult> GetAllSubjects()
    {
        var subjects = await _Db.Subjects.ToListAsync();
        if (!subjects.Any())
            return NotFound("No subjects found.");

        return Ok(subjects.Select(s => new
        {
            s.SubjectName,
            s.SubjectDescription
        }));
    }


    [HttpGet("GetRandomQuestions/{examId}")]
    public async Task<IActionResult> GetRandomQuestions(int examId)
    {
        var examQuestions = await _Db.ExamQuestions
            .Where(e => e.ExamId == examId)
            .Include(e => e.Question)
                .ThenInclude(q => q.choices)
            .Select(e => e.Question)
            .ToListAsync();

        if (!examQuestions.Any())
            return NotFound("No questions found for this exam.");

        var randomQuestions = examQuestions
            .OrderBy(q => Guid.NewGuid())
            .Take(10)
            .Select(q => new
            {
                q.QuestionId,
                q.QuestionText,
                Choices = q.choices.Select(c => new
                {
                    c.ChoiceId,
                    c.ChoiceText
                })
            });

        return Ok(randomQuestions);
    }

    [HttpGet("GetExamHistory/{studentId}")]
    public async Task<IActionResult> GetExamHistory(string studentId)
    {
        var examHistory = await _Db.StudentExams
            .Where(e => e.StudentId == studentId)
            .Include(e => e.Exam)
            .Select(e => new
            {
                e.StudentExamId,
                e.DateTimeTaken,
                e.Score,
                IsPassed = e.Score >= e.Exam.PassScore,
                e.Exam.ExamName,
                e.Exam.PassScore,
                //e.Exam.TimeLimit,
                e.Exam.Subject.SubjectName
            })
            .OrderByDescending(se => se.DateTimeTaken)
            .ToListAsync();

        if (!examHistory.Any())
            return NotFound("No exam history found for the student.");

        return Ok(examHistory);
    }


    [HttpPost("SubmitExamAnswers")]
    public async Task<IActionResult> SubmitExamAnswers([FromBody] ExamSubmissionDto submission)
    {
        if (!ModelState.IsValid) return BadRequest("Invalid data.");

        var student = await _Db.Users.FindAsync(submission.StudentId);
        if (student == null) return NotFound("Student not found.");

        var exam = await _Db.Exams.FindAsync(submission.ExamId);
        if (exam == null) return NotFound("Exam not found.");

        var studentExam = new StudentExam
        {
            StudentId = submission.StudentId,
            ExamId = submission.ExamId,
            SubjectId = submission.SubjectId,
            DateTimeTaken = DateTime.UtcNow,
            IsCompleted = false
        };

        await _Db.StudentExams.AddAsync(studentExam);
        await _Db.SaveChangesAsync();

        double correctAnswers = 0;
        double totalQuestions = submission.Answers.Count;

        foreach (var answer in submission.Answers)
        {
            var correctChoice = await _Db.Choices
                .Where(c => c.QuestionId == answer.QuestionId && c.IsCorrect)
                .FirstOrDefaultAsync();

            if (correctChoice == null)
                return NotFound($"No correct choice found for Question ID {answer.QuestionId}.");

            bool isCorrect = correctChoice.ChoiceId == answer.SelectedChoiceId;

            var answerRecord = new StudentExamQuestionAnswer
            {
                StudentExamId = studentExam.StudentExamId,
                QuestionId = answer.QuestionId,
                SelectedChoiceId = answer.SelectedChoiceId,
                IsCorrect = isCorrect
            };

            await _Db.StudentExamQuestionAnswers.AddAsync(answerRecord);

            if (isCorrect)
                correctAnswers++;
        }

        studentExam.Score = (correctAnswers / totalQuestions) * 100;
        studentExam.IsCompleted = true;

        _Db.StudentExams.Update(studentExam);
        await _Db.SaveChangesAsync();

        return Ok(new
        {
            Message = "Exam submitted successfully.",
            Score = studentExam.Score,
            PassScore = exam.PassScore,
            IsPassed = studentExam.Score >= exam.PassScore
        });
    }



}
