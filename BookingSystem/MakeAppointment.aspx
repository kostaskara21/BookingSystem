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
        }
        .form-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <div class="form-group">
            <label for="appointment-id">Appointment ID:</label>
            <input type="text" id="appointment-id" name="appointment_id" required>
        </div>
        <div class="form-group">
            <label for="meeting-name">Name of the Meeting:</label>
            <input type="text" id="meeting-name" name="meeting_name" required>
        </div>
        <div class="form-group">
            <label for="meeting-time">Time:</label>
            <input type="time" id="meeting-time" name="meeting_time" required>
        </div>
        <div class="form-group">
            <label for="meeting-duration">Duration (in hours):</label>
            <input type="number" id="meeting-duration" name="meeting_duration" min="0" step="0.5" required>
        </div>
        <div class="form-group">
            <label for="meeting-date">Date:</label>
            <input type="date" id="meeting-date" name="meeting_date" required>
        </div>
        <div class="form-group">
            <asp:Button ID="Button1" runat="server" Text="Submit" />
        </div>
    </form>
</div>
    </form>
</body>
</html>
