namespace Application.DTOs
{
    public class ExamDto
    {
        public string ExamName { get; set; }
        public int SubjectId { get; set; }
        public TimeSpan TimeLimit { get; set; }
        public int PassScore { get; set; }
    }
}
