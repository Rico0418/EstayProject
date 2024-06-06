using EstayBackend.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using EstayBackend.Data;
using EstayBackend.Models.Result;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace EstayBackend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CityController : ControllerBase
    {
        private readonly AppDbContext _context;

        public CityController (AppDbContext context)
        {
            _context = context;
        }
        // GET: api/<CityController>
        [HttpGet]
        public async Task<ActionResult<IEnumerable<GetCityResult>>> Get()
        {
            var city = await _context.City
                .OrderBy(x=> x.CityName)
                .Select(x=> new GetCityResult()
                {
                    CityId = x.CityId,
                    CityName = x.CityName,
                })
        .ToListAsync();
            var response = new ApiResponse<IEnumerable<GetCityResult>>()
            {
                StatusCode = StatusCodes.Status200OK,
                RequestMethod = HttpContext.Request.Method,
                Data = city
            };
            return Ok(response);
        }





    }
}
