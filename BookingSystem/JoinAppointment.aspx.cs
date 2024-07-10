using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookingSystem
{
    public partial class JoinAppointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            var cs = "Host=localhost;Username=postgres;Password=test123;Database=AgendaDB1";
            var con = new NpgsqlConnection(cs);
            con.Open();
            int idappointment = int.Parse(TextBox1.Text);
            string username = (String)Session["username"];
            string sql = "SELECT ID FROM APPOINTMENT WHERE ID = '" + idappointment + "' ";
            var cmd = new NpgsqlCommand(sql, con);
            NpgsqlDataReader reader = cmd.ExecuteReader();
            
            if (reader.Read())
            {
                con.Close();
                con.Open();
                string sql2 = "INSERT INTO APPOINTMENT_HAS_USERS(idappointment,iduser) VALUES('" + idappointment + "',(SELECT id_user FROM USERS WHERE username ='" + username + "'))";
                var cmd2 = new NpgsqlCommand(sql2, con);
                NpgsqlDataReader reader2 = cmd2.ExecuteReader();
                Appointments appointments = new Appointments();
                appointments.id = idappointment;
                Session["appointments"] = appointments;
                Response.Redirect("JoinedAppointment"); 
                con.Close();
            }
            else
            {
                string mesg = "Invalid appointment id";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + mesg + "');", true);
            }
            

        }

        
    }
}