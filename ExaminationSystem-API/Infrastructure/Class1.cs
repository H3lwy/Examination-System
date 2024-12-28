using SendGrid;
using SendGrid.Helpers.Mail;

class Program
{
    static async Task Main(string[] args)
    {
        var apiKey = "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";
        var client = new SendGridClient(apiKey);

        var from = new EmailAddress("hisham.alwy@atos.net", "Examination System");
        var subject = "Test Email";
        var to = new EmailAddress("hisham.3lwy@gmail.com");
        var plainTextContent = "This is a plain text test email.";
        var htmlContent = "<strong>This is a test email.</strong>";
        var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);

        var response = await client.SendEmailAsync(msg);

        Console.WriteLine($"Status Code: {response.StatusCode}");
        var responseBody = await response.Body.ReadAsStringAsync();
        Console.WriteLine($"Response Body: {responseBody}");
    }
}
