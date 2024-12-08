namespace Application.DTOs
{
    public class StudentExamDto
    {
        public int ExamId { get; set; }
        public string StudentName { get; set; }
        public string SubjectName { get; set; }
        public double Score { get; set; }
        public DateTime DateTimeTaken { get; set; }
    }
}
