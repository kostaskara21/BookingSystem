<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainMenu.aspx.cs" Inherits="BookingSystem.MainMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	
    <title>Main Menu Page</title>
</head>
<body style="background-image:url('signinBg.jpg')">
    <form id="form1" runat="server">
       
        
       
        
       
        <br /><br />
        
        
       <center>
           <div>
              <font style="color:white" face = "Comic sans MS" size =" 5">Welcome To DuckAgenda</font>
           </div>
           
        <div>
            <!-- Label for Sign Up/Sign In -->
            <center style="height: 159px">
                <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
            <asp:Label  runat="server" ><font style="color:white" face = "Comic sans MS" size =" 5">Please Sign Up/Sign In</font>  </asp:Label>
            <br /><br /><br />

            <asp:Label style="color:white" ID="Label1" runat="server" Text="Label">Username</asp:Label>&nbsp&nbsp&nbsp&nbsp<asp:TextBox  ID="TextBox1" runat="server"></asp:TextBox>
            <br /><br />
            <asp:Label style="color:white" ID="Label2" runat="server" Text="Label">Password</asp:Label>&nbsp&nbsp&nbsp&nbsp<asp:TextBox  ID="TextBox2" TextMode="Password" runat="server" ></asp:TextBox>
                <br /><br /><br />
                <asp:Button ID="Button1" runat="server" Text="Sign In" OnClick="Button1_Click" />
                 <br /><br />
                <asp:Label style="color:white" ID="Label3" runat="server" Text="Label">Don't have account? Press <a href="SignUP.aspx">Here</a> to make one </asp:Label>
        </div>
       </center>


        
       
        <asp:Panel ID="Panel1" runat="server" Height="306px" style="margin-left: 500px;margin-right: 500px; margin-top: 1px;">
            
        </asp:Panel>
        


        
       
    </form>
</body>
</html>


