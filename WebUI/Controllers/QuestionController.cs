using Application.DTOs;
using Domain.Models;
using Infrastructure.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace WebUI.Controllers
{
    [Authorize(Roles = "Admin")]
    [Route("api/[controller]")]
    [ApiController]
    public class QuestionController : ControllerBase
    {
        private readonly AppDbContext _Db;

        public QuestionController(AppDbContext db)
        {
            _Db = db;
        }
        [HttpGet]
        public async Task<IActionResult> GetAllQuestions()
        {
            var questions = await _Db.Questions.Include(q => q.choices).ToListAsync();
            return Ok(questions);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetQuestionById(int id)
        {
            var question = await _Db.Questions.Include(q => q.choices).FirstOrDefaultAsync(q => q.QuestionId == id);
            if (question == null) return NotFound("Question not found.");
            return Ok(question);
        }

        [HttpPost("AddQuestion")]
        public async Task<IActionResult> AddQuestion([FromBody] QuestionDto questionDto)
        {
            if (!ModelState.IsValid) return BadRequest("Invalid data.");

            var exam = await _Db.Exams.FindAsync(questionDto.ExamId);
            if (exam == null) return NotFound("Exam not found.");

            var question = new Question
            {
                QuestionText = questionDto.QuestionText,
                examQuestions = new List<ExamQuestion>
        {
            new ExamQuestion { ExamId = questionDto.ExamId }
        }
            };

            await _Db.Questions.AddAsync(question);
            await _Db.SaveChangesAsync();

            return Ok(new { Message = "Question created successfully." });
        }


        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateQuestion(int id, [FromBody] QuestionWithChoicesDto dto)
        {
            var existingQuestion = await _Db.Questions.Include(q => q.choices).FirstOrDefaultAsync(q => q.QuestionId == id);
            if (existingQuestion == null) return NotFound("Question not found.");

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
            var question = await _Db.Questions.FindAsync(id);
            if (question == null) return NotFound("Question not found.");
            _Db.Questions.Remove(question);
            await _Db.SaveChangesAsync();
            return Ok(new { Message = "Question deleted successfully." });
        }
    }
}
