using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace EstayBackend.Models
{
    public class Transactions
    {
        [Key]
        public int TransactionId {  get; set; }
        public DateTime TransactionDate { get; set; }

        [MaxLength(10)]
        public string TransactionStatus {  get; set; }

        public int TotalRoom {  get; set; }
        public int TotalPrice {  get; set; }
        public int TotalStay {  get; set; }

        [ForeignKey("Users")]
        public Guid UserId { get; set; }
        public Users Users { get; set; }

        [ForeignKey("PaymentMethod")]
        public int PaymentMethodId {  get; set; }
        public PaymentMethod PaymentMethod { get; set; }

        [ForeignKey("Hotels")]
        public int HotelId {  get; set; }
        public Hotels Hotels { get; set; }
    }
}
