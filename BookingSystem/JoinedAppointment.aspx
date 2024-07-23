<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JoinedAppointment.aspx.cs" Inherits="BookingSystem.JoinedAppointment" %>


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
        .form-table {
            margin: 0 auto;
            width: 80%;
            border-collapse: collapse;
        }
        .form-table th, .form-table td {
            padding: 10px;
            text-align: left;
        }
        .form-table td {
            vertical-align: top;
        }
        .form-table .label {
            width: 20%;
        }
        .form-table .input {
            width: 30%;
        }
        .form-table .actions {
            text-align: center;
        }
        .form-table .actions button {
            margin: 5px;
        }
        .content-wrapper {
            display: flex;
            justify-content: space-between;
            margin: 20px;
        }
        .comments-section, .interested-users-section {
            width: 45%;
        }
        .comments-section {
            margin-right: 5%;
        }
        .comment-box {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body style="background-image: url(bgappointment.png);">
    <form id="form1" runat="server">
        <div class="main">
            <h1>Welcome to the <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                <asp:TextBox ID="TextBox16" runat="server" Visible="False"></asp:TextBox>
            </h1>
        </div>
        
        <table class="form-table">
            <tr>
                <td class="label"><asp:Label ID="Label2" runat="server" Text="Meeting ID: "></asp:Label></td>
                <td class="input"><asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
                <td class="label"><asp:Label ID="Label9" runat="server" Text="Date:"></asp:Label></td>
                <td class="input">
                    <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                    <asp:TextBox ID="TextBox10" runat="server" type="date" Visible="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="label"><asp:Label ID="Label11" runat="server" Text="Time:"></asp:Label></td>
                <td class="input">
                    <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
                    <asp:TextBox ID="TextBox12" type="time" runat="server" Visible="false"></asp:TextBox>
                </td>
                <td class="label"><asp:Label ID="Label14" runat="server" Text="Duration:"></asp:Label></td>
                <td class="input">
                    <asp:Label ID="Label15" runat="server" Text="Label"></asp:Label>
                    <asp:TextBox ID="TextBox15" type="number" runat="server" Visible="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="4" class="actions">
                    <asp:Button ID="Button4" runat="server" Text="Delete" OnClick="Button4_Click" />
                    <asp:Button ID="Button5" runat="server" Text="Edit" OnClick="Button5_Click" Visible="False" />
                    <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Save" Visible="false" style="height: 29px" />
                    <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="Back" />
                </td>
            </tr>
        </table>

        <div class="content-wrapper">
            <div class="comments-section">
                <asp:Label ID="Label16" runat="server" Text="COMMENTS"></asp:Label>
                <div style="border: 1px solid black; padding: 10px; height: 200px; overflow-y: scroll;">            
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%#Eval("username")%>'></asp:Label>
                            <asp:Label ID="Label6" runat="server" Text='<%#Eval("time")%>'></asp:Label>
                            <br />
                            <div runat="server" innerText='<%#Eval("comment")%>' style="color:seagreen"></div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="comment-box">
                <asp:Label ID="Label8" runat="server" Text="Comment:"></asp:Label>
                    <asp:TextBox ID="TextBox3" runat="server" Height="38px" Width="144px"></asp:TextBox>
                    <asp:Button ID="Button3" runat="server" OnClick="Button1_Click" Text="Submit" />
                </div>
            </div>
            <div class="interested-users-section">
                <asp:Label ID="Label13" runat="server" Text="INTERESTED USERS"></asp:Label>
                <div style="border: 1px solid black; padding: 10px; height: 200px; overflow-y: scroll;">
                    <asp:Repeater ID="Repeater2" runat="server">
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%#Eval("username")%>'></asp:Label>
                            <br />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

