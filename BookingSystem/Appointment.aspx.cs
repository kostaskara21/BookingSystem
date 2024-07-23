using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace BookingSystem
{
    public partial class Appointment : System.Web.UI.Page
    {
        DataSet ds = new DataSet();
        NpgsqlDataAdapter sda = new NpgsqlDataAdapter();
        DataSet ds2 = new DataSet();
        NpgsqlDataAdapter sda2 = new NpgsqlDataAdapter();

        protected void Page_Load(object sender, EventArgs e)
        {
 


            Appointments appointmentdetails = (Appointments)Session["appointment"];
            Label1.Text = appointmentdetails.name;
            Label3.Text = appointmentdetails.id.ToString();
            Label10.Text= appointmentdetails.date.ToString();
            Label12.Text= appointmentdetails.time.ToString();
            Label15.Text= appointmentdetails.duration.ToString();
            show();
            


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var cs = "Host=localhost;Username=postgres;Password=2002;Database=AgendaDB1";
            var con = new NpgsqlConnection(cs);
            con.Open();
            Appointments appointmentdetails = (Appointments)Session["appointment"];
            int idappointment = appointmentdetails.id;
            string username = (String)Session["username"];
            string comment = TextBox3.Text;
            string time = DateTime.Now.ToString(); 
            string sql = "INSERT INTO COMMENT(username,comment,time,idappointment) VALUES ( '" + username + "','" + comment + "','" + time + "','" + idappointment + "')";
            var cmd = new NpgsqlCommand(sql, con);
            NpgsqlDataReader reader = cmd.ExecuteReader();
            con.Close();
            Response.Redirect("Appointment");
        }
        protected void show()
        {
            var cs = "Host=localhost;Username=postgres;Password=2002;Database=AgendaDB1";
            var con = new NpgsqlConnection(cs);
            con.Open();
            Appointments appointmentdetails = (Appointments)Session["appointment"];
            int idappointment = appointmentdetails.id;

            string sql = "SELECT * FROM COMMENT WHERE IDAPPOINTMENT='"+idappointment+"' ORDER BY TIME DESC";
            var cmd = new NpgsqlCommand(sql,con);
            sda.SelectCommand = cmd;
            sda.Fill(ds, "comment");
            Repeater1.DataSource = ds;
            Repeater1.DataBind();   
        }

        protected void showIntersted()
        {
            var cs = "Host=localhost;Username=postgres;Password=2002;Database=AgendaDB1";
            var con = new NpgsqlConnection(cs);
            con.Open();
            Appointments appointmentdetails = (Appointments)Session["appointment"];
            int idappointment = appointmentdetails.id;
            string sql = "SELECT DISTINCT users.username FROM users JOIN appointment_has_users ON users.id_user=appointment_has_users.iduser WHERE appointment_has_users.idappointment='" + idappointment + "'";
            var cmd = new NpgsqlCommand(sql, con);
            sda2.SelectCommand = cmd;
            sda2.Fill(ds2, "username");
            Repeater2.DataSource = ds2;
            Repeater2.DataBind();
            con.Close();

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            
            var cs = "Host=localhost;Username=postgres;Password=2002;Database=AgendaDB1";
            var con = new NpgsqlConnection(cs);
            Appointments appointmentdetails = (Appointments)Session["appointment"];
            int idappointment = appointmentdetails.id;
            con.Open();
            string sql = "DELETE FROM appointment_has_users where idappointment='" + idappointment + "'";
            var cmd = new NpgsqlCommand(sql, con);
            NpgsqlDataReader reader = cmd.ExecuteReader();
            con.Close();
            var con2 = new NpgsqlConnection(cs);
            con2.Open();
            string sql2 = "DELETE FROM comment where idappointment='" + idappointment + "'";
            var cmd2 = new NpgsqlCommand(sql2, con2);
            NpgsqlDataReader reader2 = cmd2.ExecuteReader();
            con2.Close();
            var con3 = new NpgsqlConnection(cs);
            con3.Open();
            string sql3 = "DELETE FROM appointment where id='" + idappointment + "'";
            var cmd3 = new NpgsqlCommand(sql3, con3);
            NpgsqlDataReader reader3 = cmd3.ExecuteReader();
            con3.Close();
            string mesg = "Meeting DELETED";
            string script = $"<script>alert('{mesg}'); window.location='Menu';</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "AlertRedirect", script, false);


        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Label1.Visible = false;
            TextBox16.Visible = true;
            TextBox16.Text = Label1.Text;

            Label10.Visible = false;
            TextBox10.Visible = true;
            TextBox10.Text = Label10.Text;

            Label12.Visible = false;
            TextBox12.Visible = true;
            TextBox12.Text = Label12.Text;

            Label15.Visible = false;
            TextBox15.Visible = true;
            TextBox15.Text = Label15.Text;

            // Show the save button and hide the edit button
            Button5.Visible = false;
            Button6.Visible = true;
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Appointments appointmentdetails = (Appointments)Session["appointment"];
            int idappointment = appointmentdetails.id;
            // Update the labels with the text from the textboxes
            Label1.Text = TextBox16.Text;
            Label10.Text = TextBox10.Text;
            Label12.Text = TextBox12.Text;
            Label15.Text = TextBox15.Text;
            
            var cs = "Host=localhost;Username=postgres;Password=2002;Database=AgendaDB1";
            var con = new NpgsqlConnection(cs);
            con.Open();
            string sql = "UPDATE appointment SET Date = '"+TextBox10.Text+"', Time ='"+TextBox12.Text+"', Duration = '"+TextBox15.Text+"', Name='"+TextBox16.Text+"' WHERE id = '"+idappointment+"'";
            var cmd = new NpgsqlCommand(sql, con);
            NpgsqlDataReader reader = cmd.ExecuteReader();
            con.Close();
            // Hide the textboxes and show the labels
            TextBox16.Visible = false;
            Label1.Visible = true;

            TextBox10.Visible = false;
            Label10.Visible = true;

            TextBox12.Visible = false;
            Label12.Visible = true;

            TextBox15.Visible = false;
            Label15.Visible = true;

            // Show the edit button and hide the save button
            Button5.Visible = true;
            Button6.Visible = false;
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("MakeAppointment");
        }


    }


}