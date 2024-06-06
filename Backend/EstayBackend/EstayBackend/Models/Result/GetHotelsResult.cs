namespace EstayBackend.Models.Result
{
    public class GetHotelsResult
    {
        public int HotelId {  get; set; }
        public string HotelName { get; set;}
        public string HotelType {  get; set;}
        public int HotelRating {  get; set;}
        public int HotelPrice {  get; set;}

        public HotelLocation HotelLocation { get; set;}
        public string HotelImage {  get; set;}
        public string HotelDescription { get; set;}
    }
}
