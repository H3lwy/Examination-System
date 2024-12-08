namespace Domain.Models
{
    public class Subject
    {
        public int SubjectId { get; set; }
        public string SubjectName { get; set; }
        public string SubjectDescription { get; set; }
        public ICollection<Exam> exams { get; set; }
        public ICollection<StudentExam> students { get; set; }
    }
}
