namespace Application.DTOs
{
    public class ExamSubmissionDto
    {
        public string StudentId { get; set; }
        public int ExamId { get; set; }
        public int SubjectId { get; set; }
        public List<AnswerDto> Answers { get; set; }
    }

    public class AnswerDto
    {
        public int QuestionId { get; set; }
        public int SelectedChoiceId { get; set; }
    }
}
