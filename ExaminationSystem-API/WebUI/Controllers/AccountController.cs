using Application.DTOs;
using Domain.Interfaces;
using Domain.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.WebUtilities;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Net;
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
        private readonly IEmailService _emailService;
        private readonly ILogger<AccountController> _logger;

        public AccountController(IConfiguration config, UserManager<User> UserManager, RoleManager<IdentityRole> RoleManager, IEmailService emailService, ILogger<AccountController> logger)
        {
            _config = config;
            _UserManager = UserManager;
            _RoleManager = RoleManager;
            _emailService = emailService;
            _logger = logger;
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
                        Errors = new List<string> { "User does not exist" },
                        Result = false
                    });
                }

                if (!await _UserManager.IsEmailConfirmedAsync(UserExist))
                {
                    _logger.LogWarning("Login attempt for unconfirmed email: {Email}", dto.Email);
                    return BadRequest(new AuthResult
                    {
                        Errors = new List<string> { "Email not confirmed" },
                        Result = false
                    });
                }


                var IsCorrect = await _UserManager.CheckPasswordAsync(UserExist, dto.Password);

                if (!IsCorrect)
                {
                    return BadRequest(new AuthResult()
                    {
                        Errors = new List<string> { "Invalid credentials" },
                        Result = false
                    });
                }

                if (!UserExist.IsActive)
                {
                    return Forbid();
                }

                var JwtToken = GenerateJwtToken(UserExist);

                return Ok(new AuthResult()
                {
                    Token = JwtToken,
                    Result = true,
                });
            }

            return BadRequest(new AuthResult()
            {
                Errors = new List<string> { "Invalid payload" }
            });
        }



        [HttpPost]
        [Route("Register")]
        public async Task<IActionResult> Register([FromBody] RegisterUserDto dto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(new AuthResult
                {
                    Result = false,
                    Errors = ModelState.Values.SelectMany(v => v.Errors)
                                               .Select(e => e.ErrorMessage)
                                               .ToList()
                });
            }

            var EmailExist = await _UserManager.FindByEmailAsync(dto.Email);

            if (EmailExist != null)
            {
                return BadRequest(new AuthResult
                {
                    Result = false,
                    Errors = new List<string> { "Email already exists" }
                });
            }

            var User = new User
            {
                FirstName = dto.FirstName,
                LastName = dto.LastName,
                Email = dto.Email,
                UserName = dto.UserName
            };

            var IsCreated = await _UserManager.CreateAsync(User, dto.Password);

            if (!IsCreated.Succeeded)
            {
                return BadRequest(new AuthResult
                {
                    Result = false,
                    Errors = IsCreated.Errors.Select(e => e.Description).ToList()
                });
            }

            var isRoleAdded = await _UserManager.AddToRoleAsync(User, "Student");
            if (!isRoleAdded.Succeeded)
            {
                return BadRequest(new AuthResult
                {
                    Result = false,
                    Errors = isRoleAdded.Errors.Select(e => e.Description).ToList()
                });
            }

            var token = await _UserManager.GenerateEmailConfirmationTokenAsync(User);
            var encodedToken = WebEncoders.Base64UrlEncode(Encoding.UTF8.GetBytes(token));
            var appUrl = _config["AppUrl"];

            if (string.IsNullOrEmpty(appUrl))
            {
                _logger.LogError("AppUrl configuration is missing.");
                return StatusCode(500, new AuthResult
                {
                    Result = false,
                    Errors = new List<string> { "Server configuration error" }
                });
            }

            var confirmationLink = $"{appUrl}/confirm-email?email={WebUtility.UrlEncode(User.Email)}&token={encodedToken}";

            var templatePath = Path.Combine(Directory.GetCurrentDirectory(), "C:\\Users\\ADMIN\\Desktop\\Examination-System-master\\Examination-System-master\\ExaminationSystem-API\\Application\\EmailTemplate.html");

            string templateContent = await System.IO.File.ReadAllTextAsync(templatePath);
            string emailContent = templateContent.Replace("{{ConfirmationLink}}", confirmationLink);


            var (emailSent, error) = await _emailService.SendEmailAsync(
                User.Email,
                "Confirm Your Email",
                emailContent
            );

            if (!emailSent)
            {
                _logger.LogError("Failed to send confirmation email to {Email}. Error: {Error}", User.Email, error);
                return StatusCode(500, new AuthResult
                {
                    Result = false,
                    Errors = new List<string> { "Failed to send confirmation email. Please try again later." }
                });
            }

            return Ok(new AuthResult
            {
                Result = true,
                Errors = new List<string>() { "Registration successful. Please check your email to confirm your account." }
            });
        }

        [HttpGet]
        [Route("CheckUserAvailability")]
        public async Task<IActionResult> CheckUserAvailability([FromQuery] string email = null, [FromQuery] string userName = null)
        {
            if (string.IsNullOrEmpty(email) && string.IsNullOrEmpty(userName))
            {
                return BadRequest(new { Error = "At least one of 'email' or 'userName' must be provided." });
            }

            var emailExists = !string.IsNullOrEmpty(email)
                && (await _UserManager.FindByEmailAsync(email)) != null;

            var userNameExists = !string.IsNullOrEmpty(userName)
                && (await _UserManager.FindByNameAsync(userName)) != null;

            return Ok(new
            {
                EmailExists = emailExists,
                UserNameExists = userNameExists
            });
        }

        [HttpPost]
        [Route("ForgotPassword")]
        public async Task<IActionResult> ForgotPassword([FromBody] ForgotPasswordDto dto)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var user = await _UserManager.FindByEmailAsync(dto.Email);
                    if (user == null || !await _UserManager.IsEmailConfirmedAsync(user))
                    {
                        _logger.LogWarning("Forgot password attempted for invalid or unconfirmed email: {Email}", dto.Email);
                        return Ok(new AuthResult
                        {
                            Result = true,
                            Errors = new List<string>() { "If your email is registered and confirmed, you will receive a password reset link." }
                        });
                    }

                    var token = await _UserManager.GeneratePasswordResetTokenAsync(user);
                    var encodedToken = WebEncoders.Base64UrlEncode(Encoding.UTF8.GetBytes(token));
                    var appUrl = _config["AppUrl"];
                    var resetLink = $"{appUrl}/reset-password?email={WebUtility.UrlEncode(user.Email)}&token={encodedToken}";

                    var templatePath = Path.Combine(Directory.GetCurrentDirectory(), "C:\\Users\\ADMIN\\Desktop\\Examination-System-master\\Examination-System-master\\ExaminationSystem-API\\Application\\forgotpassword.html");

                    string templateContent = await System.IO.File.ReadAllTextAsync(templatePath);
                    string emailContent = templateContent.Replace("{{resetLink}}", resetLink);

                    var (emailSent, error) = await _emailService.SendEmailAsync(
                        user.Email,
                        "Reset Your Password",
                        emailContent
                    );

                    if (!emailSent)
                    {
                        _logger.LogError("Failed to send password reset email to {Email}. Error: {Error}",
                            user.Email, error);
                        return StatusCode(500, new AuthResult
                        {
                            Result = false,
                            Errors = new List<string> { error ?? "Failed to send email" }
                        });
                    }

                    return Ok(new AuthResult
                    {
                        Result = true,
                        Errors = new List<string>() { "If your email is registered and confirmed, you will receive a password reset link." }
                    });
                }
                catch (Exception ex)
                {
                    _logger.LogError(ex, "Exception occurred in ForgotPassword endpoint");
                    return StatusCode(500, new AuthResult
                    {
                        Result = false,
                        Errors = new List<string> { "An unexpected error occurred" }
                    });
                }
            }

            return BadRequest(new AuthResult
            {
                Result = false,
                Errors = new List<string> { "Invalid payload" }
            });
        }

        [HttpPost]
        [Route("ResetPassword")]
        public async Task<IActionResult> ResetPassword([FromBody] ResetPasswordDto dto)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var user = await _UserManager.FindByEmailAsync(dto.Email);
                    if (user == null)
                    {
                        _logger.LogWarning("Reset password attempted for non-existent email: {Email}", dto.Email);
                        return Ok(new AuthResult
                        {
                            Result = true,
                            Errors = new List<string>() { "If your email is registered, your password will be reset." }
                        });
                    }

                    var decodedToken = Encoding.UTF8.GetString(WebEncoders.Base64UrlDecode(dto.Token));

                    var result = await _UserManager.ResetPasswordAsync(user, decodedToken, dto.NewPassword);

                    if (!result.Succeeded)
                    {
                        return BadRequest(new AuthResult
                        {
                            Result = false,
                            Errors = result.Errors.Select(e => e.Description).ToList()
                        });
                    }

                    return Ok(new AuthResult
                    {
                        Result = true,
                        Errors = new List<string> { "Password reset successful." }
                    });
                }
                catch (Exception ex)
                {
                    _logger.LogError(ex, "Exception occurred in ResetPassword endpoint");
                    return StatusCode(500, new AuthResult
                    {
                        Result = false,
                        Errors = new List<string> { "An unexpected error occurred" }
                    });
                }
            }

            return BadRequest(new AuthResult
            {
                Result = false,
                Errors = new List<string> { "Invalid payload" }
            });
        }

        [HttpPost]
        [Route("HandleEmailConfirmation")]
        public async Task<IActionResult> HandleEmailConfirmation([FromBody] EmailConfirmationRequestDto dto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(new AuthResult
                {
                    Result = false,
                    Errors = new List<string> { "Invalid payload" }
                });
            }

            try
            {
                var user = await _UserManager.FindByEmailAsync(dto.Email);
                if (user == null)
                {
                    _logger.LogWarning("Email confirmation attempted for non-existent email: {Email}", dto.Email);
                    return BadRequest(new AuthResult
                    {
                        Result = false,
                        Errors = new List<string> { "User not found" }
                    });
                }

                var decodedToken = Encoding.UTF8.GetString(WebEncoders.Base64UrlDecode(dto.Token));
                var result = await _UserManager.ConfirmEmailAsync(user, decodedToken);

                if (!result.Succeeded)
                {
                    return BadRequest(new
                    {
                        Result = false,
                        Errors = result.Errors.Select(e => e.Description).ToList()
                    });
                }

                var jwtToken = GenerateJwtToken(user);

                return Ok(new
                {
                    Result = true,
                    Token = jwtToken,
                    Message = "Email confirmed successfully"
                });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Exception occurred in HandleEmailConfirmation endpoint");
                return StatusCode(500, new AuthResult
                {
                    Result = false,
                    Errors = new List<string> { "An unexpected error occurred" }
                });
            }
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
                new Claim(JwtRegisteredClaimNames.Iat, new DateTimeOffset(DateTime.UtcNow).ToUnixTimeSeconds().ToString(), ClaimValueTypes.Integer64),
                new Claim("FirstName", user.FirstName),
                new Claim("LastName", user.LastName)
            };

            authClaims.AddRange(userRoles.Select(role => new Claim(ClaimTypes.Role, role)));

            var tokendisc = new SecurityTokenDescriptor()
            {
                Subject = new ClaimsIdentity(authClaims),
                Expires = DateTime.UtcNow.AddHours(1),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256),
            };

            var token = jwttokenhandler.CreateToken(tokendisc);
            var jwttoken = jwttokenhandler.WriteToken(token);

            return jwttoken;
        }


    }
}
