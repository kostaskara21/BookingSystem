<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Appointment.aspx.cs" Inherits="BookingSystem.Appointment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Appointment</title>
    <style>
        .main {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    text-align: center;
    background-image: url(bgappointment.png);
}
    .main h1 {
    margin-bottom: 20px;
    }


    </style>
</head>
<body style=" background-image: url(bgappointment.png);">
    <form id="form1" runat="server">
        <div class="main">
    <h1>Welcome to the
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </h1>
            </div>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Meeting ID: "></asp:Label>
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="TextBox1" runat="server" Height="180px" ReadOnly="True" Width="288px"></asp:TextBox>
        </p>
    </form>
</body>
</html>
