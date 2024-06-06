using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace EstayBackend.Models
{
    public class Hotels
    {
        [Key]
        public int HotelId {  get; set; }

        [MaxLength(50)]
        public string HotelName { get; set;}

        [MaxLength(10)]
        public string HotelType {  get; set; }

        public int HotelRating {  get; set; }

        public int HotelPrice { get; set; }

        [ForeignKey("HotelLocation")]
        public int HotelLocationId {  get; set; }
        public HotelLocation? HotelLocation { get; set; }

        [MaxLength(255)]
        public string HotelImage { get; set; }
        public string HotelDescription { get; set; }

        public ICollection<Room> Rooms { get; set; }
        public ICollection<Transactions> Transactions { get; set; }
    }
}
