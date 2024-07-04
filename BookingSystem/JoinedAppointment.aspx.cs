using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            Appointments appointments = (Appointments)Session["appointments"];
            Label3.Text = appointments.id.ToString();
            show();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var cs = "Host=localhost;Username=postgres;Password=test123;Database=AgendaDB1";
            var con = new NpgsqlConnection(cs);
            con.Open();
            Appointments appointments = (Appointments)Session["appointments"];
            int idappointment = appointments.id;
            string username = (String)Session["username"];
            string comment = TextBox1.Text;
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
            con.Open();
            string sql2 = "SELECT NAME FROM APPOINTMENT WHERE ID='" + idappointment + "'";
            var cmd2 = new NpgsqlCommand(sql2, con);
            NpgsqlDataReader reader = cmd2.ExecuteReader();
            while (reader.Read())
            {
                Label1.Text = reader["name"].ToString();
            }

        }
    }
}