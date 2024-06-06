using System.ComponentModel.DataAnnotations;

namespace EstayBackend.Models
{
    public class Users
    {
        [Key]
        public Guid UserId { get; set; }

        [MaxLength(50)]
        public string UserName {  get; set; }

        [MaxLength(100)]
        public string UserEmail { get; set; }

        [MaxLength(10)]
        public string UserPassword { get; set; }

        [MaxLength(13)]
        public string UserPhoneNumber {  get; set; }

        public int UserAge {  get; set; }

        public ICollection<Transactions> Transactions { get; set; }
    }
}
