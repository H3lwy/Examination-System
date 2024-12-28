using Domain.Interfaces;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using SendGrid;
using SendGrid.Helpers.Mail;

public class SendGridEmailService : IEmailService
{
    private readonly IConfiguration _config;
    private readonly ILogger<SendGridEmailService> _logger;
    private readonly string _sendGridKey;
    private readonly string _fromEmail;
    private readonly string _fromName;

    public SendGridEmailService(IConfiguration config, ILogger<SendGridEmailService> logger)
    {
        _config = config;
        _logger = logger;

        _sendGridKey = _config.GetSection("SendGrid:ApiKey").Value;
        _fromEmail = _config.GetSection("SendGrid:FromEmail").Value;
        _fromName = _config.GetSection("SendGrid:FromName").Value;

        if (string.IsNullOrEmpty(_sendGridKey))
        {
            _logger.LogError("SendGrid API key is missing from configuration");
            throw new ArgumentNullException(nameof(_sendGridKey), "SendGrid API key is not configured");
        }
        if (string.IsNullOrEmpty(_fromEmail))
        {
            _logger.LogError("SendGrid From Email is missing from configuration");
            throw new ArgumentNullException(nameof(_fromEmail), "SendGrid From Email is not configured");
        }
        if (string.IsNullOrEmpty(_fromName))
        {
            _logger.LogError("SendGrid From Name is missing from configuration");
            throw new ArgumentNullException(nameof(_fromName), "SendGrid From Name is not configured");
        }

        if (!_sendGridKey.StartsWith("SG."))
        {
            _logger.LogWarning("SendGrid API key format appears invalid - should start with 'SG.'");
        }

        _ = ValidateConfiguration();
    }

    public async Task<(bool success, string error)> SendEmailAsync(string toEmail, string subject, string content)
    {
        try
        {
            _logger.LogInformation("Preparing to send email to {Email} with subject '{Subject}'", toEmail, subject);
            _logger.LogDebug("Using sender email: {FromEmail}", _fromEmail);

            var client = new SendGridClient(_sendGridKey);
            var from = new EmailAddress(_fromEmail, _fromName);
            var to = new EmailAddress(toEmail);

            var msg = MailHelper.CreateSingleEmail(from, to, subject,
                content,
                content
            );

            _logger.LogDebug("Sending email via SendGrid API");
            var response = await client.SendEmailAsync(msg);

            if (response.StatusCode == System.Net.HttpStatusCode.Accepted ||
                response.StatusCode == System.Net.HttpStatusCode.OK)
            {
                _logger.LogInformation("Successfully sent email to {Email}", toEmail);
                return (true, null);
            }

            var responseBody = await response.Body.ReadAsStringAsync();
            _logger.LogError("SendGrid API error. Status: {Status}, Response: {Response}",
                response.StatusCode, responseBody);

            switch (response.StatusCode)
            {
                case System.Net.HttpStatusCode.Unauthorized:
                    return (false, "Email service authentication failed - invalid API key");

                case System.Net.HttpStatusCode.Forbidden:
                    return (false, "Email service authorization failed - check sender verification status");

                case System.Net.HttpStatusCode.BadRequest:
                    return (false, "Invalid email request - please verify email addresses");

                case System.Net.HttpStatusCode.TooManyRequests:
                    return (false, "Rate limit exceeded - please try again later");

                default:
                    return (false, $"Failed to send email (Status: {response.StatusCode})");
            }
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Exception while sending email to {Email}", toEmail);
            return (false, "An unexpected error occurred while sending email");
        }
    }

    private async Task ValidateConfiguration()
    {
        try
        {
            _logger.LogInformation("Validating SendGrid configuration...");

            var client = new SendGridClient(_sendGridKey);

            var response = await client.RequestAsync(
                method: SendGridClient.Method.GET,
                urlPath: "verified_senders"
            );

            if (response.StatusCode == System.Net.HttpStatusCode.OK)
            {
                _logger.LogInformation("SendGrid API key is valid and has correct permissions");

                var body = await response.Body.ReadAsStringAsync();
                _logger.LogInformation("Verified senders response: {Response}", body);

                if (!body.Contains(_fromEmail))
                {
                    _logger.LogWarning("Sender email {Email} does not appear to be verified", _fromEmail);
                }
            }
            else if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)
            {
                _logger.LogError("SendGrid API key is invalid or revoked");
            }
            else if (response.StatusCode == System.Net.HttpStatusCode.Forbidden)
            {
                _logger.LogError("SendGrid API key does not have sufficient permissions");
            }
            else
            {
                _logger.LogError("Unknown error validating SendGrid configuration. Status: {Status}", response.StatusCode);
            }
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Failed to validate SendGrid configuration");
        }
    }
}
