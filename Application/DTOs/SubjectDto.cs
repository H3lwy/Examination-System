using System.ComponentModel.DataAnnotations;

namespace Application.DTOs
{
    public class SubjectDto
    {
        [Required]
        public string SubjectName { get; set; }
        [Required]
        public string SubjectDescription { get; set; }
    }
}
