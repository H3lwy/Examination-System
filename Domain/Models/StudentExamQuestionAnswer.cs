namespace Domain.Models
{
    public class StudentExamQuestionAnswer
    {
        public int StudentExamQuestionAnswerId { get; set; }
        public int StudentExamId { get; set; }
        public StudentExam StudentExam { get; set; }
        public int QuestionId { get; set; }
        public Question Question { get; set; }
        public int SelectedChoiceId { get; set; }
        public Choice Choice { get; set; }
        public Boolean IsCorrect { get; set; }
    }
}