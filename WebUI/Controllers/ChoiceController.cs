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
    public class ChoiceController : ControllerBase
    {
        private readonly AppDbContext _Db;

        public ChoiceController(AppDbContext db)
        {
            _Db = db;
        }

        [HttpGet("GetChoicesByQuestion/{questionId}")]
        public async Task<IActionResult> GetChoicesByQuestion(int questionId)
        {
            var question = await _Db.Questions
                .Include(q => q.choices)
                .FirstOrDefaultAsync(q => q.QuestionId == questionId);

            if (question == null)
                return NotFound("Question not found.");

            var choices = question.choices.Select(c => new
            {
                c.ChoiceId,
                c.ChoiceText,
                c.IsCorrect
            });

            return Ok(choices);
        }

        [HttpPost("AddChoices")]
        public async Task<IActionResult> AddChoices([FromBody] ChoicesDto choicesDto)
        {
            if (!ModelState.IsValid) return BadRequest("Invalid data.");

            var question = await _Db.Questions.FindAsync(choicesDto.QuestionId);
            if (question == null) return NotFound("Question not found.");

            var choices = choicesDto.Choices.Select(c => new Choice
            {
                QuestionId = choicesDto.QuestionId,
                ChoiceText = c.ChoiceText,
                IsCorrect = c.IsCorrect
            }).ToList();

            await _Db.Choices.AddRangeAsync(choices);
            await _Db.SaveChangesAsync();

            return Ok(new { Message = "Choices added successfully." });
        }

        [HttpPut("UpdateChoice/{choiceId}")]
        public async Task<IActionResult> UpdateChoice(int choiceId, [FromBody] ChoiceDto choiceDto)
        {
            if (!ModelState.IsValid) return BadRequest("Invalid data.");

            var choice = await _Db.Choices.FindAsync(choiceId);
            if (choice == null)
                return NotFound("Choice not found.");

            choice.ChoiceText = choiceDto.ChoiceText;
            choice.IsCorrect = choiceDto.IsCorrect;

            _Db.Choices.Update(choice);
            await _Db.SaveChangesAsync();

            return Ok(new { Message = "Choice updated successfully.", Choice = choice });
        }

        [HttpDelete("DeleteChoice/{choiceId}")]
        public async Task<IActionResult> DeleteChoice(int choiceId)
        {
            var choice = await _Db.Choices.FindAsync(choiceId);
            if (choice == null)
                return NotFound("Choice not found.");

            _Db.Choices.Remove(choice);
            await _Db.SaveChangesAsync();

            return Ok(new { Message = "Choice deleted successfully." });
        }

    }
}
