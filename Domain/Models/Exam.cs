namespace Domain.Models
{
    public class Exam
    {
        public int ExamId { get; set; }
        public string ExamName { get; set; }
        public int SubjectId { get; set; }
        public Subject Subject { get; set; }
        public TimeSpan TimeLimit { get; set; }
        public int PassScore { get; set; }
        public ICollection<ExamQuestion> ExamQuestions { get; set; }
        public ICollection<StudentExam> StudentExams { get; set; }

    }
}
