using System.ComponentModel.DataAnnotations;

namespace EstayBackend.Models.Request
{
    public class GetIdRequest
    {
        [Required]
        public string UserId { get; set; }
    }
}
