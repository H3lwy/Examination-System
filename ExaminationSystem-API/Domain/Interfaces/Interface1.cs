namespace Domain.Interfaces
{
    public interface IEmailService
    {
        Task<(bool success, string error)> SendEmailAsync(string toEmail, string subject, string content);
    }
}
