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
    public class RoomController : ControllerBase
    {
        private readonly AppDbContext _context;

        public RoomController(AppDbContext context)
        {
            _context = context;
        }


        // GET: api/<RoomController>
        [HttpGet]
        public async Task<ActionResult<IEnumerable<GetRoomResults>>> Get()
        {
            var room = await _context.Room
                .OrderBy(x => x.RoomName)
                .Select(x => new GetRoomResults()
                {
                    RoomId = x.RoomId,
                    RoomName = x.RoomName,
                    RoomNumber = x.RoomNumber,
                    RoomStatus = x.RoomStatus,
                    Hotels = x.Hotels,
                })
                 .ToListAsync();
            var response = new ApiResponse<IEnumerable<GetRoomResults>>()
            {
                StatusCode = StatusCodes.Status200OK,
                RequestMethod = HttpContext.Request.Method,
                Data = room
            };
            return Ok(response);

        }


        // PUT api/<RoomController>/5
        [HttpPut]
        public async Task<IActionResult> Put([FromBody] UpdateRoomRequest UpdateRoomRequest)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var room = await _context.Room.FirstOrDefaultAsync(r => r.RoomId == UpdateRoomRequest.RoomID);

            if(room.RoomStatus == "Occupied")
            {
                return NotFound("Room already Taken");
            }
            if(room.RoomId != UpdateRoomRequest.RoomID)
            {
                return BadRequest("RoomId in the request body doesn't match the router parameter");
            }
            UpdateRoomRequest.RoomStatus = "Occupied";
            room.RoomStatus = UpdateRoomRequest.RoomStatus;
            await _context.SaveChangesAsync();
            return Ok();
        }

    }
}
