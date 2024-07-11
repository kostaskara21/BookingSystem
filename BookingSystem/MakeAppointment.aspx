<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MakeAppointment.aspx.cs" Inherits="BookingSystem.MakeAppointment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Appointment Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('appointmentbg.jpg');
        }
        .form-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .center{
            line-height: 1.5;
            display: inline-block;
            vertical-align: middle;
        }
        .center{
            display: block;
            margin-bottom: 5px;
        }
        </style>
</head>
<body> 
    <form id="form1" runat="server">

        <h1 style="color:cornflowerblue;"> CREATE YOUR APPOINTMENT</h1>
        
       
        <div class="center">
            <label for="meeting-name">Name of the Meeting:</label>
            <asp:TextBox type="text" ID="TextBox2" runat="server"></asp:TextBox>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </div>
        <div class="center">
            <label for="meeting-time">Time:</label>
            <asp:TextBox type="time" ID="TextBox3" runat="server"></asp:TextBox>
        </div>
        <div class="center">
            <label for="meeting-duration">Duration (in hours):</label>
            <asp:TextBox type="number" ID="TextBox4" runat="server"></asp:TextBox>
        </div>
        <div class="center">
            <label for="meeting-date">Date:</label>&nbsp;
            <asp:TextBox type="date" ID="TextBox1" runat="server"></asp:TextBox>
        </div>
        <div class="center">
            <asp:Button ID="Button1" runat="server" Text="Submit" Width="152px" Height="31px" OnClick="Button1_Click" />
        </div>
</div>
    </form>
        
    </form>
</body>
</html>
