using Microsoft.AspNetCore.SignalR;

namespace WebUI.Hubs;
public class AdminHub : Hub
{
    public async Task SendNotificationToAdmin(string message)
    {
        await Clients.Group("AdminGroup").SendAsync("ReceiveNotification", message);
    }

    public override async Task OnConnectedAsync()
    {
        await Groups.AddToGroupAsync(Context.ConnectionId, "AdminGroup");

        await base.OnConnectedAsync();
    }

}



