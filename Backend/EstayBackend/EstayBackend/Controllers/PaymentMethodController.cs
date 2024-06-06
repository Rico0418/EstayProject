using EstayBackend.Data;
using EstayBackend.Models.Result;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.SqlServer.Query.Internal;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace EstayBackend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PaymentMethodController : ControllerBase
    {
        private readonly AppDbContext _context;
        public PaymentMethodController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/<PaymentMethodController>
        [HttpGet]
        public async Task<ActionResult<IEnumerable<GetPaymentMethodResult>>> Get()
        {
            var type = await _context.PaymentMethod
                 .OrderBy(x => x.PaymentMethodId)
                 .Select(x => new GetPaymentMethodResult()
                 {
                     PaymentMethodId = x.PaymentMethodId,
                     PaymentMethodType = x.PaymentMethodType,
                     PaymentMethodName = x.PaymentMethodName,
                 })
                 .ToListAsync();
            var response = new ApiResponse<IEnumerable<GetPaymentMethodResult>>()
            {
                StatusCode = StatusCodes.Status200OK,
                RequestMethod = HttpContext.Request.Method,
                Data = type
            };
            return Ok(response);
        }



    }
}
