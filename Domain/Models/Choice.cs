namespace Domain.Models
{
    public class Choice
    {
        public int ChoiceId { get; set; }
        public int QuestionId { get; set; }
        public Question Question { get; set; }
        public string ChoiceText { get; set; }
        public Boolean IsCorrect { get; set; }

    }
}