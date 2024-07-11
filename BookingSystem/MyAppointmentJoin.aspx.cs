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
    public partial class MyAppointmentJoin : System.Web.UI.Page
    {
        DataSet ds = new DataSet();
        NpgsqlDataAdapter sda = new NpgsqlDataAdapter();
        DataSet ds2 = new DataSet();
        NpgsqlDataAdapter sda2 = new NpgsqlDataAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showDetails();
                show();
                showIntersted();
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var cs = "Host=localhost;Username=postgres;Password=test123;Database=AgendaDB1";
            var con = new NpgsqlConnection(cs);
            con.Open();
            int idappointment = int.Parse(Request.QueryString["idappointment"]);
            string username = (String)Session["username"];
            string comment = TextBox3.Text;
            string time = DateTime.Now.ToString();
            string sql = "INSERT INTO COMMENT(username,comment,time,idappointment) VALUES ( '" + username + "','" + comment + "','" + time + "','" + idappointment + "')";
            var cmd = new NpgsqlCommand(sql, con);
            NpgsqlDataReader reader = cmd.ExecuteReader();
            con.Close();
            Response.Redirect("MyAppointmentJoin.aspx?idappointment="+ idappointment);

        }

        protected void showDetails()
        {
            var cs = "Host=localhost;Username=postgres;Password=test123;Database=AgendaDB1";
            var con = new NpgsqlConnection(cs);
            con.Open();

            int idappointment = int.Parse(Request.QueryString["idappointment"]);
            string sql = "SELECT name,date,time FROM APPOINTMENT WHERE ID='" + idappointment + "'";
            var cmd = new NpgsqlCommand(sql, con);
            cmd.Parameters.AddWithValue("id", idappointment);
            NpgsqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                Label3.Text = idappointment.ToString();
                DateTime dateValue = Convert.ToDateTime(reader["date"]);
                string formattedDate = dateValue.ToString("dd/MM/yyyy");
                Label1.Text = reader["name"].ToString();
                Label10.Text = formattedDate;
                Label12.Text = reader["time"].ToString();
            }
            con.Close();
        }

        protected void show()
        {
            var cs = "Host=localhost;Username=postgres;Password=test123;Database=AgendaDB1";
            var con = new NpgsqlConnection(cs);
            con.Open();
            int idappointment = int.Parse(Request.QueryString["idappointment"]);
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
            int idappointment = int.Parse(Request.QueryString["idappointment"]);
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
            var cs = "Host=localhost;Username=postgres;Password=test123;Database=AgendaDB1";
            var con = new NpgsqlConnection(cs);
            int idappointment = int.Parse(Request.QueryString["idappointment"]);
            string username = (String)Session["username"];
            con.Open();
            string sql = "SELECT FROM appointment WHERE creator = '" + username + "'AND id= '" + idappointment + "'";
            var cmd = new NpgsqlCommand(sql, con);
            NpgsqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {

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
    }
}
