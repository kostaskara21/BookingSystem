<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="BookingSystem.Menu" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu</title>
    <link rel="stylesheet" href="Menu.css"> <!-- Link to your Menu.css file for additional styling -->
    <style>
        body {
            margin: 0; /* Remove default body margin */
            font-family: Arial, sans-serif; /* Example font family */
            background-image: url('background.png'); /* Adjust path to your background image */
            background-size: cover; /* Ensure the background covers the entire viewport */
            background-position: center; /* Center the background image */
            background-repeat: no-repeat; 
            height: 100vh; 

        }
        .sidebar {
            height: 100%;
            width: 250px; /* Fixed width for sidebar */
            position: fixed;
            top: 0;
            left: 0;
            background-color: #333; /* Dark background color for sidebar */
            overflow-y: auto; /* Allow sidebar to scroll if content exceeds height */
            padding-top: 20px;
        }
        .sidebar h2 {
            color: white;
            text-align: center;
            margin-bottom: 20px; /* Add some bottom margin to the heading */
        }
        .sidebar ul {
            list-style-type: none;
            padding: 0;
            text-align: center;
        }
        .sidebar li {
            padding: 10px 0; /* Padding for list items */
        }
        .sidebar li a {
            text-decoration: none;
            font-size: 18px;
            color: #ddd; /* Light text color for links */
            display: block;
            padding: 10px 20px; /* Padding for links */
            transition: 0.3s; /* Smooth transition for hover effects */
        }
        .sidebar li a:hover {
            background-color: #555; /* Dark background on hover */
            color: white; /* Light text on hover */
        }
        .content {
            margin-left: 300px; /* Adjust to match sidebar width */
            padding: 10px;
        }
        .content h1 {
            color: black;
            text-align: center;
        }
        .content p {
            color: black;
            text-align: center;
            margin-top: 20px; /* Add some top margin to the paragraph */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar">
            <h2>Menu</h2>
            <ul>
                <li><a href="MakeAppointment.aspx">Make Appointment</a></li>
                <li><a href="JoinAppointment.aspx">Join Meeting</a></li>
                <li><a href="MyAppointment.aspx">View My Appointment</a></li>
            </ul>
        </div>

        <div class="content">
            <h1>Welcome to BookMeeting</h1>
            <p>Select an option from the menu to get started.</p>
        </div>
    </form>
</body>
</html>
