namespace EstayBackend.Models.Result
{
    public class GetUsersResult
    {
        public Guid UserId { get; set; }
        public string Username {  get; set; }
        public string UserEmail { get; set; }
        public string UserPassword {  get; set; }
        public string UserPhoneNumber { get; set; }
        public int UserAge {  get; set; }
    }
}
