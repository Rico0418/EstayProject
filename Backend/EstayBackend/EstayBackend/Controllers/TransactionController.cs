using EstayBackend.Data;
using EstayBackend.Models;
using EstayBackend.Models.Request;
using EstayBackend.Models.Result;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace EstayBackend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TransactionController : ControllerBase
    {
        private readonly AppDbContext _context;

        public TransactionController(AppDbContext context)
        {
            _context = context;
        }
        // GET: api/<ValuesController>
        [HttpGet]
        public async Task<ActionResult<IEnumerable<GetTransactionsResult>>> Get([FromQuery] string userId)
        {
            if (!Guid.TryParse(userId, out Guid userID))
            {
                return BadRequest("Invalid UserId format.");
            }

            var transaction = await _context.Transactions
                .Where(x => x.UserId == userID)
                .OrderBy(x => x.TransactionDate)
                .Select(x => new GetTransactionsResult()
                {
                    TransactionId = x.TransactionId,
                    TransactionStatus = x.TransactionStatus,
                    TransactionDate = x.TransactionDate,
                    TotalPrice = x.TotalPrice,
                    TotalRoom = x.TotalRoom,
                    TotalStay = x.TotalStay,
                    Users = x.Users,
                    Hotels = x.Hotels,
                    PaymentMethod = x.PaymentMethod,
                })
                .ToListAsync();
            var response = new ApiResponse<IEnumerable<GetTransactionsResult>>
            {
                StatusCode = StatusCodes.Status200OK,
                RequestMethod = HttpContext.Request.Method,
                Data = transaction
            };
            return Ok(response);
        }


        // POST api/<ValuesController>
        [Route("api/CreateTransaction")]
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] CreateTransactionsRequest createTransactionsRequest)
        {
            if(!ModelState.IsValid) return BadRequest(ModelState);
            var transaction = new Transactions
            {
                TransactionDate = createTransactionsRequest.TransactionDate,
                TransactionStatus = createTransactionsRequest.TransactionStatus,
                TotalPrice = createTransactionsRequest.TotalPrice,
                TotalRoom = createTransactionsRequest.TotalRoom,
                TotalStay = createTransactionsRequest.TotalStay,
                UserId = createTransactionsRequest.UserId,
                HotelId = createTransactionsRequest.HotelId,
                PaymentMethodId = createTransactionsRequest.PaymentMethodId
            };
            _context.Transactions.Add(transaction);
            await _context.SaveChangesAsync();
            return Ok();
        }


    }
}
