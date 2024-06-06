using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace EstayBackend.Models
{
    public class Room
    {
        [Key]
        public int RoomId { get; set; }

        [MaxLength(5)]
        public string RoomName { get; set; }

        public int RoomNumber {  get; set; }

        [MaxLength(30)]
        public string RoomStatus { get; set; }

        [ForeignKey("Hotels")]
        public int HotelId { get; set; }
        public Hotels Hotels { get; set; }
    }
}
