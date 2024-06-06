using System.ComponentModel.DataAnnotations;

namespace EstayBackend.Models.Request
{
    public class UpdateRoomRequest
    {
        [Required]
        [MaxLength(10)]
        public string RoomStatus {  get; set; }

        [Required]
        public int RoomID { get; set; }
    }
}
