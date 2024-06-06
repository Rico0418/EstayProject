using EstayBackend.Data;
using EstayBackend.Models.Request;
using EstayBackend.Models.Result;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace EstayBackend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HotelLocationController : ControllerBase
    {
        private readonly AppDbContext _context;

        public HotelLocationController(AppDbContext context)
        {
            _context = context;
        }


        // GET: api/<HotelLocationController>
        [HttpGet]
        public  async Task<ActionResult<IEnumerable<GetHotelLocationResult>>> Get()
        {
            var location = await _context.HotelLocation
               .OrderBy(x => x.HotelLocationName)
               .Select(x => new GetHotelLocationResult()
               {
                   HotelLocationId = x.HotelLocationId,
                   HotelLocationName = x.HotelLocationName,
                   City = x.City,
               })
               .ToListAsync();
            var response = new ApiResponse<IEnumerable<GetHotelLocationResult>>()
            {
                StatusCode = StatusCodes.Status200OK,
                RequestMethod = HttpContext.Request.Method,
                Data = location
            };
            return Ok(response);
        }


    }
}
