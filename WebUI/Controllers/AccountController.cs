using Application.DTOs;
using Domain.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace WebUI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly IConfiguration _config;
        private readonly UserManager<User> _UserManager;
        private readonly RoleManager<IdentityRole> _RoleManager;
        public AccountController(IConfiguration config, UserManager<User> UserManager, RoleManager<IdentityRole> RoleManager)
        {
            _config = config;
            _UserManager = UserManager;
            _RoleManager = RoleManager;
        }

        [HttpPost]
        [Route("Register")]
        public async Task<IActionResult> Register([FromBody] RegisterUserDto dto)
        {
            if (ModelState.IsValid)
            {
                var EmailExist = await _UserManager.FindByEmailAsync(dto.Email);

                if (EmailExist != null)
                {
                    return BadRequest(new AuthResult()
                    {
                        Result = false,
                        Errors = new List<string>()
                        {
                            "Email already exist"
                        }
                    });
                }
                var User = new User()
                {
                    FirstName = dto.FirstName,
                    LastName = dto.LastName,
                    Email = dto.Email,
                    UserName = dto.UserName,
                };
                var IsCreated = await _UserManager.CreateAsync(User, dto.Password);

                if (IsCreated.Succeeded)
                {
                    var roleExist = await _RoleManager.RoleExistsAsync("Student");
                    if (!roleExist)
                    {
                        await _RoleManager.CreateAsync(new IdentityRole("Student"));
                    }

                    await _UserManager.AddToRoleAsync(User, "Student");

                    var token = GenerateJwtToken(User);

                    return Ok(new AuthResult()
                    {
                        Token = token,
                        Result = true,
                        Errors = new List<string>() { "There is no error" }
                    });
                }
                return BadRequest(new AuthResult()
                {
                    Errors = new List<string>()
                    {
                        "Server Error"
                    },
                    Result = false
                });
            }
            return BadRequest();
        }

        [Route("Login")]
        [HttpPost]
        public async Task<IActionResult> Login([FromBody] LoginUserDto dto)
        {
            if (ModelState.IsValid)
            {
                var UserExist = await _UserManager.FindByEmailAsync(dto.Email);

                if (UserExist == null)
                {
                    return BadRequest(new AuthResult()
                    {
                        Errors = new List<string> { "User Not Exist" },
                        Result = false
                    });
                }

                var IsCorrect = await _UserManager.CheckPasswordAsync(UserExist, dto.Password);

                if (!IsCorrect)
                {
                    return BadRequest(new AuthResult()
                    {
                        Errors = new List<string> { "Invalid Credentials" },
                        Result = false
                    });
                }
                if (UserExist.IsActive)
                {

                    var JwtToken = GenerateJwtToken(UserExist);

                    return Ok(new AuthResult()
                    {
                        Token = JwtToken,
                        Result = true,
                    });

                }

                return BadRequest(new AuthResult()
                {
                    Errors = new List<string> { "The Account Is Disable" },
                    Result = false
                });

            }
            return BadRequest(new AuthResult()
            {
                Errors = new List<string> { " Invalid Payload" }
            });
        }


        private string GenerateJwtToken(User user)
        {
            var jwttokenhandler = new JwtSecurityTokenHandler();

            var key = Encoding.UTF8.GetBytes(_config.GetSection("JwtConfig:Secret").Value);

            var userRoles = _UserManager.GetRolesAsync(user).Result;

            var authClaims = new List<Claim>
    {
        new Claim(ClaimTypes.NameIdentifier, user.Id),
        new Claim(JwtRegisteredClaimNames.Sub, user.Email),
        new Claim(JwtRegisteredClaimNames.Email, user.Email),
        new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
        new Claim(JwtRegisteredClaimNames.Iat, new DateTimeOffset(DateTime.UtcNow).ToUnixTimeSeconds().ToString(), ClaimValueTypes.Integer64)
    };

            authClaims.AddRange(userRoles.Select(role => new Claim(ClaimTypes.Role, role)));

            var tokendisc = new SecurityTokenDescriptor()
            {
                Subject = new ClaimsIdentity(authClaims),
                Expires = DateTime.UtcNow.AddHours(1),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256), // توقيع الرمز
            };

            var token = jwttokenhandler.CreateToken(tokendisc);
            var jwttoken = jwttokenhandler.WriteToken(token);

            return jwttoken;
        }


    }
}
