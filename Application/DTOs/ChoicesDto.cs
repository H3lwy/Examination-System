namespace Application.DTOs
{
    public class ChoicesDto
    {
        public int QuestionId { get; set; }
        public List<ChoiceDto> Choices { get; set; }
    }

    public class ChoiceDto
    {
        public string ChoiceText { get; set; }
        public bool IsCorrect { get; set; }
    }
}
