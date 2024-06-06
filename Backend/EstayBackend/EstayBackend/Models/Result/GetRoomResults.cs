namespace EstayBackend.Models.Result
{
    public class GetRoomResults
    {
        public int RoomId {  get; set; }
        public string RoomName { get; set; }
        public int RoomNumber {  get; set; }
        public string RoomStatus {  get; set; }
        public Hotels Hotels {  get; set; }
    }
}
