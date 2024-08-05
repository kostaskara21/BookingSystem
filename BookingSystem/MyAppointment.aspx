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
        .center {
            margin: 0;
            height: 100vh;
            display: flex;
            margin-top: 50px;
            flex-direction: column; 
            justify-content: center; 
            align-items: center; 
        }
        table {
            border-collapse: collapse;
            width: 100%;
            max-width: 600px;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="center">
            <div>
                <asp:Label ID="Label1" runat="server" Text="MY APPOINTMENT" Font-Size="XX-Large"></asp:Label>&nbsp;&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" Text="Back" Height="24px" Width="109px" OnClick="Button2_Click" />
            </div>
            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <table>
                        <tr>
                            <th>Appointment</th>
                            <th>Date/Time</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><a href='<%# Eval("Url") %>'><%# Eval("name") %></a></td>
                        <td><%# Eval("date") %> <%# Eval("time") %></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
