namespace Application.DTOs
{
    public class QuestionWithChoicesDto
    {
        public string QuestionText { get; set; }
        public int SubjectId { get; set; }
        public List<ChoiceDto> Choices { get; set; }
    }


}
