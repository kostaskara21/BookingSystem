using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
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

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var cs = "Host=localhost;Username=postgres;Password=test123;Database=AgendaDB1";
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
            var cs = "Host=localhost;Username=postgres;Password=test123;Database=AgendaDB1";
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
            var cs = "Host=localhost;Username=postgres;Password=test123;Database=AgendaDB1";
            var con = new NpgsqlConnection(cs);
            con.Open();
            Appointments appointments = (Appointments)Session["appointments"];
            int idappointment = appointments.id;

            string sql = "SELECT users.username FROM users JOIN appointment_has_users ON users.id_user=appointment_has_users.iduser WHERE appointment_has_users.idappointment='"+ idappointment + "'";
            var cmd = new NpgsqlCommand(sql, con);
            sda2.SelectCommand = cmd;
            sda2.Fill(ds2, "username");
            Repeater2.DataSource = ds2;
            Repeater2.DataBind();
            con.Close();

        }

        protected void showDetails()

        {
            var cs = "Host=localhost;Username=postgres;Password=test123;Database=AgendaDB1";
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
        }

    }
}