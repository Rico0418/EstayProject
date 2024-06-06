using EstayBackend.Data;
using EstayBackend.Models.Result;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace EstayBackend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HotelController : ControllerBase
    {
        private readonly AppDbContext _context;
        public HotelController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/<HotelController>
        [HttpGet]
        public  async Task<ActionResult<IEnumerable<GetHotelsResult>>> Get()
        {
            var hotels = await _context.Hotels
                .OrderBy(x => x.HotelName)
                .Select(x => new GetHotelsResult()
                {
                    HotelId = x.HotelId,
                    HotelName = x.HotelName,
                    HotelType = x.HotelType,
                    HotelRating = x.HotelRating,
                    HotelPrice = x.HotelPrice,
                    HotelLocation = x.HotelLocation,
                    HotelImage = x.HotelImage,
                    HotelDescription = x.HotelDescription
                })
                .ToListAsync();
            var response = new ApiResponse<IEnumerable<GetHotelsResult>>()
            {
                StatusCode = StatusCodes.Status200OK,
                RequestMethod = HttpContext.Request.Method,
                Data = hotels
            };
            return Ok(response);

        }

    }
}
