namespace Application.DTOs
{
    public class QuestionWithChoicesDto
    {
        public string QuestionText { get; set; }
        public List<ChoiceDto> Choices { get; set; }
    }

}
