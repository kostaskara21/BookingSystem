<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JoinAppointment.aspx.cs" Inherits="BookingSystem.JoinAppointment" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Join Meeting</title>
    <style>
        body {
            background-size: cover; 
            background-repeat: no-repeat; 
            background-position: center; 
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 120vh;
            background-color: #f0f0f0;
            margin: 0;
            background-image: url('appointmentjoin.jpg');
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .container h1 {
            margin-bottom: 20px;
        }
        .container input[type="text"] {
            padding: 10px;
            margin-bottom: 0px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-left: 0px;
        }
        .container button {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            background-color: #28a745;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }
        .container button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>
            Join Meeting(Give Meeting ID)</h1>
        &nbsp;<asp:TextBox ID="TextBox1" runat="server" Height="16px" Width="919px"></asp:TextBox>
        <asp:Button style="background-color:green" ID="Button1" runat="server" Text="Join" Width="70px" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="Back" OnClick="Button2_Click" Width="70px" /> 
    </div>

   
    </form>

   
</body>
</html>