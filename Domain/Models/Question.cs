namespace Domain.Models
{
    public class Question
    {
        public int QuestionId { get; set; }
        public string QuestionText { get; set; }
        public int SubjectId { get; set; }
        public Subject Subject { get; set; }
        public ICollection<Choice> choices { get; set; }
        public ICollection<ExamQuestion> examQuestions { get; set; }
    }
}
