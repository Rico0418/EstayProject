using System.ComponentModel.DataAnnotations;

namespace EstayBackend.Models.Request
{
    public class CreateLoginRequest
    {
        [Required]
        [MaxLength(100)]
        public string UserEmail { get; set; }

        [Required]
        [MaxLength(10)]
        public string UserPassword { get; set; }

    }
}
