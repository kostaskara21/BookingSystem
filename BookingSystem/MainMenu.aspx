<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainMenu.aspx.cs" Inherits="BookingSystem.MainMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	
    <title>Main Menu Page</title>
</head>
<body style="background-color:	#00BFFF">
    <form id="form1" runat="server">
       
        
       
        <asp:Panel    runat="server" Height="38px" style="margin-bottom: 5px;background-color:#0000FF;">
            <asp:Image  src="obj\Pictures\BookingSymbol.png" runat="server" Height="37px" Width="54px" />
        </asp:Panel>
       
        <br /><br />
        
        
       <center>
           <div ><font face = "Comic sans MS" size =" 5">Welcome To BookMeeting</font>  </div>
           
        <div>
            <!-- Label for Sign Up/Sign In -->
            <center style="height: 159px">
                <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
            <asp:Label  runat="server" ><font face = "Comic sans MS" size =" 5">Please Sign Up/Sign In</font>  </asp:Label>
            <br /><br /><br />

            <asp:Label ID="Label1" runat="server" Text="Label">User Name</asp:Label>&nbsp&nbsp&nbsp&nbsp<asp:TextBox  ID="TextBox1" runat="server"></asp:TextBox>
            <br /><br />
            <asp:Label ID="Label2" runat="server" Text="Label">Password</asp:Label>&nbsp&nbsp&nbsp&nbsp<asp:TextBox  ID="TextBox2" runat="server"></asp:TextBox>
                <br /><br /><br />
                <asp:Button ID="Button1" runat="server" Text="Sign In" />
                 <br /><br />
                <asp:Label ID="Label3" runat="server" Text="Label">Dont have account? Press <a href="SignUP.aspx">Here</a> to make one </asp:Label>
        </div>
       </center>


        
       
        <asp:Panel ID="Panel1" runat="server" Height="306px" style="margin-left: 500px;margin-right: 500px; margin-top: 1px; background-color:aqua;">
            
        </asp:Panel>
        


        
       
    </form>
</body>
</html>


