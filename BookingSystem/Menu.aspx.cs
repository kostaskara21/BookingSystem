using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;


namespace BookingSystem
{
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
      
                if (Session["username"] == null)
                {
                Response.Redirect("MainMenu"); 
                }
            notification();



            /*string mesg = "Invalid username or password";
        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + mesg + "');", true);*/





        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            FormsAuthentication.SignOut();
            Response.Redirect("MainMenu");

        }

        protected void notification()
        {

            var cs = "Host=localhost;Username=postgres;Password=2002;Database=AgendaDB1";
            var con = new NpgsqlConnection(cs);
            string username = (String)Session["username"];
            con.Open();
            string sql = "SELECT n.appointment, n.message FROM notifications n JOIN users u ON n.iduser = u.id_user WHERE u.username = '" + username + "'";
            var cmd = new NpgsqlCommand(sql, con);
            NpgsqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                string notiapp = reader["appointment"].ToString();
                string mesg = reader["message"].ToString();
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + notiapp + " " + mesg + "');", true);
            }
            con.Close();

        }
    }
}