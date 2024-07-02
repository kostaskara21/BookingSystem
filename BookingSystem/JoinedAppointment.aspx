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
            &nbsp;&nbsp;&nbsp;
            
            <asp:Repeater ID="Repeater1" runat="server">
           
            <ItemTemplate>
                <asp:Label ID="Label5" runat="server" Text='<%#Eval("username")%>'></asp:Label>
                <asp:Label ID="Label6" runat="server" Text='<%#Eval("time")%>'></asp:Label>
                <br />
                <div runat="server" innerText='<%#Eval("comment")%>'></div>



            </ItemTemplate>
                 </asp:Repeater>
            
        </p>
 
        <asp:Label ID="Label4" runat="server" Text="Comment:"></asp:Label>
        <p>
            <asp:TextBox ID="TextBox1" runat="server" Height="93px" Width="255px"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
        </p>
    </form>
</body>
</html>
