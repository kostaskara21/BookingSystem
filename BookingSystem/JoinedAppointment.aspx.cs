using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net.NetworkInformation;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookingSystem
{
    public partial class JoinedAppointment : System.Web.UI.Page
    {
        DataSet ds = new DataSet();
        NpgsqlDataAdapter sda = new NpgsqlDataAdapter();
        DataSet ds2 = new DataSet();
        NpgsqlDataAdapter sda2 = new NpgsqlDataAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            Appointments appointments = (Appointments)Session["appointments"];
            Label3.Text = appointments.id.ToString();
            show();
            showDetails();
            showIntersted();
            creatorver();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var cs = "Host=localhost;Username=postgres;Password=2002;Database=AgendaDB1";
            var con = new NpgsqlConnection(cs);
            con.Open();
            Appointments appointments = (Appointments)Session["appointments"];
            int idappointment = appointments.id;
            string username = (String)Session["username"];
            string comment = TextBox3.Text;
            string time = DateTime.Now.ToString();
            string sql = "INSERT INTO COMMENT(username,comment,time,idappointment) VALUES ( '" + username + "','" + comment + "','" + time + "','" + idappointment + "')";
            var cmd = new NpgsqlCommand(sql, con);
            NpgsqlDataReader reader = cmd.ExecuteReader();
            con.Close();
            Response.Redirect("JoinedAppointment");
        }

        protected void show()
        {
            var cs = "Host=localhost;Username=postgres;Password=2002;Database=AgendaDB1";
            var con = new NpgsqlConnection(cs);
            con.Open();
            Appointments appointments = (Appointments)Session["appointments"];
            int idappointment = appointments.id;
            string sql = "SELECT * FROM COMMENT WHERE IDAPPOINTMENT='" + idappointment + "' ORDER BY TIME DESC";
            var cmd = new NpgsqlCommand(sql, con);
            sda.SelectCommand = cmd;
            sda.Fill(ds, "comment");
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
            con.Close();
            

        }
        protected void showIntersted()
        {
            var cs = "Host=localhost;Username=postgres;Password=2002;Database=AgendaDB1";
            var con = new NpgsqlConnection(cs);
            con.Open();
            Appointments appointments = (Appointments)Session["appointments"];
            int idappointment = appointments.id;
            string sql = "SELECT DISTINCT users.username FROM users JOIN appointment_has_users ON users.id_user=appointment_has_users.iduser WHERE appointment_has_users.idappointment='" + idappointment + "'";
            var cmd = new NpgsqlCommand(sql, con);
            sda2.SelectCommand = cmd;
            sda2.Fill(ds2, "username");
            Repeater2.DataSource = ds2;
            Repeater2.DataBind();
            con.Close();

        }

        protected void showDetails()

        {
            var cs = "Host=localhost;Username=postgres;Password=2002;Database=AgendaDB1";
            var con = new NpgsqlConnection(cs);
            con.Open();
            Appointments appointments = (Appointments)Session["appointments"];
            int idappointment = appointments.id;
            string sql = "SELECT NAME,DATE,TIME FROM APPOINTMENT WHERE ID='" + idappointment + "'";
            var cmd = new NpgsqlCommand(sql, con);
            NpgsqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                DateTime dateValue = Convert.ToDateTime(reader["date"]);
                string formattedDate = dateValue.ToString("dd/MM/yyyy");
                Label1.Text = reader["name"].ToString();
                Label10.Text = formattedDate;
                Label12.Text= reader["time"].ToString();
                
            }
            con.Close();    
        }
        protected void creatorver()
        {
            var cs = "Host=localhost;Username=postgres;Password=2002;Database=AgendaDB1";
            var con = new NpgsqlConnection(cs);
            Appointments appointments = (Appointments)Session["appointments"];
            int idappointment = appointments.id;
            string username = (String)Session["username"];
            con.Open();
            string sql = "SELECT FROM appointment WHERE creator = '" + username + "'AND id= '" + idappointment + "'";
            var cmd = new NpgsqlCommand(sql, con);
            NpgsqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {

                // show edit button
                Button5.Visible = true;

            }
            con.Close();
        }

            protected void Button4_Click(object sender, EventArgs e)
        {
            var cs = "Host=localhost;Username=postgres;Password=2002;Database=AgendaDB1";
            var con = new NpgsqlConnection(cs);
            Appointments appointments = (Appointments)Session["appointments"];
            int idappointment = appointments.id;
            string nameappointment = appointments.name;
            string username = (String)Session["username"];
            con.Open();
            string sql = "SELECT FROM appointment WHERE creator = '" + username + "'AND id= '" + idappointment + "'";
            var cmd = new NpgsqlCommand(sql, con);
            NpgsqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                var con6 = new NpgsqlConnection(cs);
                con6.Open();
                string sql6 = "INSERT INTO NOTIFICATIONS(iduser,appointment,message) SELECT iduser ,'" + nameappointment + "','Has been deleted' FROM appointment_has_users WHERE appointment_has_users.idappointment='" + idappointment + "'";
                using (var cmd6 = new NpgsqlCommand(sql6, con6))
                {
                    // Adding parameters to prevent SQL injection and properly handle the input values
                    cmd6.Parameters.AddWithValue("appointment", nameappointment);

                    // ExecuteNonQuery is used for executing commands that do not return any results
                    int rowsAffected = cmd6.ExecuteNonQuery();
                    Console.WriteLine($"{rowsAffected} rows were inserted.");
                }

                con6.Close();
                var con2 = new NpgsqlConnection(cs);
                con2.Open();
                string sql2 = "DELETE FROM appointment_has_users where idappointment='" + idappointment + "'";
                var cmd2 = new NpgsqlCommand(sql2, con2);
                NpgsqlDataReader reader2 = cmd2.ExecuteReader();
                con2.Close();
                var con3 = new NpgsqlConnection(cs);
                con3.Open();
                string sql3 = "DELETE FROM comment where idappointment='" + idappointment + "'";
                var cmd3 = new NpgsqlCommand(sql3, con3);
                NpgsqlDataReader reader3 = cmd3.ExecuteReader();
                con3.Close();
                var con4 = new NpgsqlConnection(cs);
                con4.Open();
                string sql4 = "DELETE FROM appointment where id='" + idappointment + "'";
                var cmd4 = new NpgsqlCommand(sql4, con4);
                NpgsqlDataReader reader4 = cmd4.ExecuteReader();
                con4.Close();
                string mesg1 = "Meeting DELETED";
                string script1 = $"<script>alert('{mesg1}'); window.location='Menu';</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "AlertRedirect", script1, false);

            }
            else
            {
                
                var con5 = new NpgsqlConnection(cs);
                con5.Open();
                string sql5 = "DELETE FROM appointment_has_users USING users, appointment WHERE appointment_has_users.iduser = users.id_user AND appointment_has_users.idappointment = appointment.id AND users.username = '" + username + "' AND appointment.id = '" + idappointment + "'; ";
                var cmd5 = new NpgsqlCommand(sql5, con5);
                NpgsqlDataReader reader5 = cmd5.ExecuteReader();
                con5.Close();
                string mesg = "Meeting DELETED";
                string script = $"<script>alert('{mesg}'); window.location='Menu';</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "AlertRedirect", script, false);
            }
            con.Close();







        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Label1.Visible = false;
            TextBox16.Visible = true;
            TextBox16.Text = Label1.Text;

            Label10.Visible = false;
            TextBox10.Visible = true;
            DateTime dateValue = DateTime.ParseExact(Label10.Text, "dd/MM/yyyy", null);
            TextBox10.Text = dateValue.ToString("yyyy-MM-dd");

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
            Appointments appointments = (Appointments)Session["appointments"];
            int idappointment = appointments.id;
            // Update the labels with the text from the textboxes
            Label1.Text = TextBox16.Text;
            Label10.Text = TextBox10.Text;
            Label12.Text = TextBox12.Text;
            Label15.Text = TextBox15.Text;

            var cs = "Host=localhost;Username=postgres;Password=2002;Database=AgendaDB1";
            var con = new NpgsqlConnection(cs);
            con.Open();
            string sql = "UPDATE appointment SET Date = '" + TextBox10.Text + "', Time ='" + TextBox12.Text + "', Duration = '" + TextBox15.Text + "',Name='" + TextBox16.Text + "' WHERE id = '" + idappointment + "'";
            var cmd = new NpgsqlCommand(sql, con);
            NpgsqlDataReader reader = cmd.ExecuteReader();
            con.Close();
            string nameappointment = appointments.name;
            var con6 = new NpgsqlConnection(cs);
            con6.Open();
            string sql6 = "INSERT INTO NOTIFICATIONS(iduser,appointment,message) SELECT iduser ,'" + nameappointment + "','Has been edited' FROM appointment_has_users WHERE appointment_has_users.idappointment='" + idappointment + "'";
            using (var cmd6 = new NpgsqlCommand(sql6, con6))
            {
                // Adding parameters to prevent SQL injection and properly handle the input values
                cmd6.Parameters.AddWithValue("appointment", nameappointment);

                // ExecuteNonQuery is used for executing commands that do not return any results
                int rowsAffected = cmd6.ExecuteNonQuery();
                Console.WriteLine($"{rowsAffected} rows were inserted.");
            }

            con6.Close();
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
            Response.Redirect("JoinAppointment");
        }
    }
}