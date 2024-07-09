﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JoinedAppointment.aspx.cs" Inherits="BookingSystem.JoinedAppointment" %>


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
        .table, th, td {
            border-collapse: collapse;
            border: 1px solid black;
        }
        .mytable {
            clear: both;
        }
        .auto-style1 {
            width: 15px;
        }
        .auto-style2 {
            height: 293px;
            overflow-y: scroll;
            height: 170px;
            width: 250px;
        }
        .left-table {
            float: left;
            width: 45%;
        }
        .right-table {
            float: right;
            width: 45%;
        }
        .clearfix::after {
            content: "";
            clear: both;
            display: table;
        }
        .auto-style3 {
            float: left;
            width: 44%;
        }
        .auto-style5 {
            clear: both;
            width: 29%;
            height: 214px;
        }
        .auto-style6 {
            clear: both;
            width: 30%;
            height: 214px;
        }
    </style>
</head>
<body style="background-image: url(bgappointment.png);">
    <form id="form1" runat="server">
        <div class="main">
            <h1>Welcome to the <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h1>
        </div>

        <p>
            <asp:Label ID="Label2" runat="server" Text="Meeting ID: "></asp:Label>
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        </p>

        <p>
            <hr></hr>
        </p>
            
        <div class="clearfix">
            <div class="auto-style3">
                <table class="auto-style6" style="border: 1px solid black;">
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <div class="auto-style2">
                                <asp:Repeater ID="Repeater1" runat="server">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%#Eval("username")%>'></asp:Label>
                                        <asp:Label ID="Label6" runat="server" Text='<%#Eval("time")%>'></asp:Label>
                                        <br />
                                        <div runat="server" innerText='<%#Eval("comment")%>'></div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                </table>
            </div>
            <div class="right-table">
                <table class="auto-style5" style="border: 1px solid black;">
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <div class="auto-style2">
                                <!-- Add content or another Repeater here if needed -->
                                <asp:Repeater ID="Repeater2" runat="server">
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%#Eval("username")%>'></asp:Label>
                                        <asp:Label ID="Label8" runat="server" Text='<%#Eval("time")%>'></asp:Label>
                                        <br />
                                        <div runat="server" innerText='<%#Eval("comment")%>'></div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                </table>
            </div>
        </div>

        <asp:Label ID="Label8" runat="server" Text="Comment:"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox3" runat="server" Height="38px" Width="144px"></asp:TextBox>
        <asp:Button ID="Button3" runat="server" OnClick="Button1_Click" Text="Submit" />

        <p>&nbsp;</p>
        <p>&nbsp;</p>
    </form>
</body>
</html>

