using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace EstayBackend.Models
{
    public class HotelLocation
    {
        [Key]
        public int HotelLocationId {  get; set; }

        [MaxLength(50)]
        public string HotelLocationName { get; set; }

        [ForeignKey("City")]
        public int CityId {  get; set; }
        public City City { get; set; }

        public ICollection<Hotels> Hotels { get; set; }
    }
}
