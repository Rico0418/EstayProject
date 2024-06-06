using System.ComponentModel.DataAnnotations;

namespace EstayBackend.Models.Request
{
    public class CreateTransactionsRequest
    {
        public DateTime TransactionDate { get; set; }

        [MaxLength(10)]
        public string TransactionStatus {  get; set; }

        public int TotalRoom {  get; set; }
        public int TotalPrice {  get; set; }
        public int TotalStay {  get; set; }

//       public Users Users { get; set; }
        public Guid UserId { get; set; }
//        public Hotels Hotels { get; set; }
        public int HotelId { get; set; }
        public int PaymentMethodId { get; set; }
//        public PaymentMethod PaymentMethod { get; set; }
    }
}
