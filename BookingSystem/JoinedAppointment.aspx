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

    <style>
      table,th,td {border-collapse: collapse; border: 1px solid black;}
      .mytable {clear: both;}
      .mysortdiv {float:right;}
        .auto-style1 {
            width: 15px;
        }
        .auto-style2 {
            float: right;
            height: 362px;
        }
    </style>
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
        <p >
            &nbsp;&nbsp;&nbsp;
               



            <hr>
            </hr>
            
        <div class="auto-style2">
                    

        </p>
 

           
            <table class="mytable" style="width: 22%; height: 214px; border: 1px solid black; clear: both; ">
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td>

             <div style="Overflow-y:scroll; height:170px; width:250px;">
            <asp:Repeater  ID="Repeater1" runat="server">
           
            <ItemTemplate>
                <asp:Label  ID="Label5" runat="server" Text='<%#Eval("username")%>'></asp:Label>
                <asp:Label  ID="Label6" runat="server" Text='<%#Eval("time")%>'></asp:Label>
                <br />
                <div runat="server" innerText='<%#Eval("comment")%>'></div>

            </ItemTemplate>
              
                 </asp:Repeater> 
                    </td>
                     </div>


                    <td>&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
            </table>
        <asp:Label ID="Label8" runat="server" Text="Comment:"></asp:Label>
            

            <br />
            <asp:TextBox ID="TextBox3" runat="server" Height="38px" Width="144px"></asp:TextBox>
            <asp:Button ID="Button3" runat="server" OnClick="Button1_Click" Text="Submit" />
        </div>     



        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>



    </form>
</body>
</html>
