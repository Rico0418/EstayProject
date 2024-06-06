namespace EstayBackend.Models.Result
{
    public class GetTransactionsResult
    {
        public int TransactionId { get; set; }
        public DateTime TransactionDate { get; set; }
        public string TransactionStatus {  get; set; }
        public int TotalRoom { get; set; }
        public int TotalPrice {  get; set; }
        public int TotalStay {  get; set; }
        public Users Users { get; set; }
        public PaymentMethod PaymentMethod { get; set; }
        public Hotels Hotels { get; set; }
    }
}
