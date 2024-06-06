using System.ComponentModel.DataAnnotations;

namespace EstayBackend.Models
{
    public class PaymentMethod
    {
        [Key]
        public int PaymentMethodId {  get; set; }

        [MaxLength(10)]
        public string PaymentMethodType {  get; set; }

        [MaxLength(10)]
        public string PaymentMethodName {  get; set; }

        public ICollection<Transactions> Transactions { get; set; }
    }
}
