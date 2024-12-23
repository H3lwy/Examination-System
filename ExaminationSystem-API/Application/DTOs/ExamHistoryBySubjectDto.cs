namespace Application.DTOs
{
    public class ExamHistoryBySubjectDto
    {
        public int StudentExamId { get; set; }
        public DateTime DateTimeTaken { get; set; }
        public double Score { get; set; }
        public Boolean IsPassed { get; set; }
        public string ExamName { get; set; }
        public int PassScore { get; set; }
        public string StudentName { get; set; }
    }
}
