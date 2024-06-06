using System.ComponentModel.DataAnnotations;

namespace EstayBackend.Models
{
    public class City
    {
        [Key]
        public int CityId {  get; set; }

        [MaxLength(30)]
        public string CityName { get; set; }

        public ICollection<HotelLocation> HotelLocation { get; set; }
    }
}
