using Application.DTOs;
using Domain.Models;
using Infrastructure.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace WebUI.Controllers
{
    //[Authorize(Roles = "Admin")]
    [Route("api/[controller]")]
    [ApiController]
    public class QuestionController : ControllerBase
    {
        private readonly AppDbContext _Db;

        public QuestionController(AppDbContext db)
        {
            _Db = db;
        }

        [HttpGet("AllQuestions")]
        public async Task<IActionResult> GetAllQuestions(int pageNumber = 1, int pageSize = 10)
        {
            var totalQuestions = await _Db.Questions.CountAsync();

            var questions = await _Db.Questions
                .Include(q => q.Subject)
                .Include(q => q.choices)
                .OrderBy(q => q.QuestionId)
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize)
                .Select(q => new
                {
                    q.QuestionId,
                    q.QuestionText,
                    SubjectName = q.Subject.SubjectName,
                    Choices = q.choices.Select(c => new
                    {
                        c.ChoiceId,
                        c.ChoiceText,
                        c.IsCorrect
                    }).ToList()
                })
                .ToListAsync();

            int totalPages = (int)Math.Ceiling((double)totalQuestions / pageSize);

            return Ok(new
            {
                Questions = questions,
                TotalPages = totalPages,
                CurrentPage = pageNumber
            });
        }




        [HttpGet("{id}")]
        public async Task<IActionResult> GetQuestionById(int id)
        {
            var question = await _Db.Questions
                .Include(q => q.choices)
                .FirstOrDefaultAsync(q => q.QuestionId == id);

            if (question == null) return NotFound("Question not found.");

            return Ok(new
            {
                question.QuestionId,
                question.QuestionText,
                question.SubjectId,
                Choices = question.choices.Select(c => new
                {
                    c.ChoiceId,
                    c.ChoiceText,
                    c.IsCorrect
                })
            });
        }

        [HttpGet("GetQuestionsBySubject/{subjectId}")]
        public async Task<IActionResult> GetQuestionsBySubject(int subjectId)
        {
            var questions = await _Db.Questions
                .Where(q => q.SubjectId == subjectId)
                .Select(q => new
                {
                    q.QuestionId,
                    q.QuestionText
                })
                .ToListAsync();

            if (!questions.Any())
                return NotFound($"No questions found for Subject ID {subjectId}.");

            return Ok(questions);
        }

        [HttpPost("AddQuestion")]
        public async Task<IActionResult> AddQuestion([FromBody] QuestionWithChoicesDto questionDto)
        {
            if (!ModelState.IsValid) return BadRequest("Invalid data.");

            var subject = await _Db.Subjects.FindAsync(questionDto.SubjectId);
            if (subject == null) return NotFound("Subject not found.");

            var question = new Question
            {
                QuestionText = questionDto.QuestionText,
                SubjectId = questionDto.SubjectId,
                choices = questionDto.Choices.Select(c => new Choice
                {
                    ChoiceText = c.ChoiceText,
                    IsCorrect = c.IsCorrect
                }).ToList()
            };

            await _Db.Questions.AddAsync(question);
            await _Db.SaveChangesAsync();

            return Ok(new { Message = "Question created successfully." });
        }



        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateQuestion(int id, [FromBody] QuestionWithChoicesDto dto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest("Invalid data.");
            }

            var existingQuestion = await _Db.Questions
                .Include(q => q.choices)
                .Include(q => q.examQuestions)
                .FirstOrDefaultAsync(q => q.QuestionId == id);

            if (existingQuestion == null)
            {
                return NotFound("Question not found.");
            }

            var relatedAnswers = _Db.StudentExamQuestionAnswers
                .AsEnumerable()
                .Where(a => existingQuestion.choices.Any(c => c.ChoiceId == a.SelectedChoiceId))
                .ToList();
            _Db.StudentExamQuestionAnswers.RemoveRange(relatedAnswers);

            _Db.Choices.RemoveRange(existingQuestion.choices);

            existingQuestion.QuestionText = dto.QuestionText;

            existingQuestion.choices = dto.Choices.Select(c => new Choice
            {
                ChoiceText = c.ChoiceText,
                IsCorrect = c.IsCorrect
            }).ToList();

            _Db.Questions.Update(existingQuestion);
            await _Db.SaveChangesAsync();

            return Ok(existingQuestion);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteQuestion(int id)
        {
            var question = await _Db.Questions
                .Include(q => q.choices)
                .Include(q => q.examQuestions)
                .FirstOrDefaultAsync(q => q.QuestionId == id);

            if (question == null)
                return NotFound("Question not found.");

            _Db.Choices.RemoveRange(question.choices);

            _Db.ExamQuestions.RemoveRange(question.examQuestions);

            _Db.Questions.Remove(question);
            await _Db.SaveChangesAsync();

            return Ok(new { Message = "Question deleted successfully." });
        }


    }
}
