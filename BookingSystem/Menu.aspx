<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="BookingSystem.Menu" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu</title>
    <link rel="stylesheet" href="Menu.css">
</head>
<body style=" background-image: url(background.gif);">
    <div class="sidebar">
        <h2>Menu</h2>
        <ul>
            <li><a href="MakeAppointment.aspx">Make Appointment</a></li>
            <li><a href="JoinAppointment.aspx">Join Meeting</a></li>
            <li><a href="">View My Appointment</a></li>
        </ul>
    </div>

    <div class="content">
        <h1>Welcome to the BookMeeting</h1>
        <p>Select an option from the menu to get started.</p>
    </div>
</body>
</html>
