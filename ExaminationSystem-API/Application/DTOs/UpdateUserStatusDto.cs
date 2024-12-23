using System.ComponentModel.DataAnnotations;

namespace Application.DTOs
{
    public class UpdateUserStatusDto
    {
        [Required]
        public bool IsActive { get; set; }
    }

}
