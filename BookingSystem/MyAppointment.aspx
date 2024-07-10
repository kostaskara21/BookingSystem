<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyAppointment.aspx.cs" Inherits="BookingSystem.MyAppointments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MyAppointment</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-image: url(myappointmentBG.jpg); 
            background-size: cover; 
            background-repeat: no-repeat; 
            background-position: center; 
            height: 100vh; 
        }
        .center{
            margin: 0;
            height: 100vh;
            display: flex;
            margin-top: 50px;
            flex-direction: column; 
            justify-content: center; 
            align-items: center; 
        }
        .link-item {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="center" >
            <asp:Label ID="Label1" runat="server" Text="MY APPOINTMENT" Font-Size="XX-Large"></asp:Label>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="link-item">
                        <a href='<%# Eval("Url") %>'><%# Eval("name") %></a><br /></div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        
    </form>
</body>
</html>
