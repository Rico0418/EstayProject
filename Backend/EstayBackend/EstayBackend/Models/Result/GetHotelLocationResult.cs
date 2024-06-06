namespace EstayBackend.Models.Result
{
    public class GetHotelLocationResult
    {
        public int HotelLocationId {  get; set; }
        public string HotelLocationName { get; set; }
        public City City { get; set; }
    }
}
