using System.ComponentModel.DataAnnotations;

namespace EstayBackend.Models.Request
{
    public class CreatePaymentMethodRequest
    {
        [Required]
        public int PaymentMethodId { get; set; }

        [Required]
        [MaxLength(10)]
        public string PaymentMethodType { get; set; }

        [Required]
        [MaxLength(10)]
        public string PaymentMethodName { get; set; }
    }
}
