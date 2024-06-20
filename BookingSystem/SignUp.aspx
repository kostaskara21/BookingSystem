<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="BookingSystem.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    
</head>
<body style=" background-image: url(background.png);"; >
    

     <!--Form for Sign Up-->
    <form id="form1" runat="server">
        <center>
            
        <div style="margin-top:300px; margin-right:500px;margin-left:500px; border: 2px solid black; background-color:#ffffff ">
            <h4 style="font-size:xx-large">Sign Up</h4>
            <br />  
            <!-- Label for Name-->
            <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>&nbsp&nbsp
            <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            <br /><br />

            <!-- Label for Surname-->
            <asp:Label ID="Label2" runat="server" Text="Surname"></asp:Label>&nbsp&nbsp
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br /><br />

             <!-- Label for Username-->
             <asp:Label ID="Label3" runat="server" Text="Username"></asp:Label>&nbsp&nbsp
             <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
             <br /><br />

             <!-- Label for Email-->
             <asp:Label ID="Label4" runat="server" Text="Email"></asp:Label>&nbsp&nbsp
             <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br /><br />

             <!-- Label for Password-->
            <asp:Label ID="Label5" runat="server" Text="Password"></asp:Label>&nbsp&nbsp
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br /><br />
            <asp:Button  ID="Button1" runat="server" Text="Sign Up" OnClick="Button1_Click" />
            <br /><br />
            </center>

        </div>
    </form>


</body>
</html>
