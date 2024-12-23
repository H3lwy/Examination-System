namespace Domain.Models
{
    public class StudentExam
    {
        public int StudentExamId { get; set; }
        public string StudentId { get; set; }
        public User Student { get; set; }
        public int ExamId { get; set; }
        public Exam Exam { get; set; }
        public int SubjectId { get; set; }
        public Subject Subject { get; set; }
        public DateTime DateTimeTaken { get; set; } = DateTime.UtcNow;
        public Boolean IsCompleted { get; set; }
        public double Score { get; set; }
        public ICollection<StudentExamQuestionAnswer> studentExamQuestionAnswers { get; set; }
    }
}
