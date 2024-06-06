using Azure.Identity;
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
    public class UserController : ControllerBase
    {
        private readonly AppDbContext _context;

        public UserController(AppDbContext context)
        {
            _context = context;
        }


        // GET: api/<UserController>
        [HttpGet]
        public async Task<ActionResult<IEnumerable<GetUsersResult>>> Get()
        {
            var user = await _context.Users
                .OrderBy(x => x.UserName)
                .Select(x => new GetUsersResult()
                {
                    UserId = x.UserId,
                    Username = x.UserName,
                    UserEmail = x.UserEmail,
                    UserPassword = x.UserPassword,
                    UserPhoneNumber = x.UserPhoneNumber,
                    UserAge = x.UserAge,
                })
                .ToListAsync();

            var response = new ApiResponse<IEnumerable<GetUsersResult>>()
            {
                StatusCode = StatusCodes.Status200OK,
                RequestMethod = HttpContext.Request.Method,
                Data = user
            };
            return Ok(response);
        }

        // GET api/<UserController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<UserController>
        [Route("api/User/login")]
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] CreateLoginRequest createLoginRequest)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var checkEmail = await _context.Users.SingleOrDefaultAsync(
                x => x.UserEmail == createLoginRequest.UserEmail);
            if(checkEmail == null)
            {
                return NotFound("Email Not Found");
            }
            if(checkEmail.UserPassword != createLoginRequest.UserPassword)
            {
                return Unauthorized("Invalid Password");
            }
            var response = new
            {
                UserId = checkEmail.UserId,
                UserName = checkEmail.UserName,
                UserEmail = checkEmail.UserEmail,
                UserPassword = checkEmail.UserPassword,
                UserPhoneNumber = checkEmail.UserPhoneNumber,
                UserAge = checkEmail.UserAge,
            };
            return Ok(response);
        }

        [Route("api/User/register")]
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] CreateSignUpRequest createSignUpRequest)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var checkEmail = await _context.Users.FirstOrDefaultAsync(
                x => x.UserEmail == createSignUpRequest.UserEmail);
            if(checkEmail != null)
            {
                return Conflict("Email already taken");
            }
            var checkPassword = await _context.Users.FirstOrDefaultAsync(
               x => x.UserPassword == createSignUpRequest.UserPassword);
            if (checkPassword != null)
            {
                return Conflict("Password already taken");
            }
            var checkPhoneNum = await _context.Users.FirstOrDefaultAsync(
               x => x.UserPhoneNumber == createSignUpRequest.UserPhoneNumber);
            if (checkPhoneNum != null)
            {
                return Conflict("Phone number already taken");
            }
            var user = new Users
            {
                UserName = createSignUpRequest.UserName,
                UserEmail = createSignUpRequest.UserEmail,
                UserPassword = createSignUpRequest.UserPassword,
                UserPhoneNumber = createSignUpRequest.UserPhoneNumber,
                UserAge = createSignUpRequest.UserAge,
            };
            _context.Users.Add(user);
            await _context.SaveChangesAsync();
            return Ok();
        }
    }
}
