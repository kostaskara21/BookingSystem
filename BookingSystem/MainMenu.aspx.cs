using System;
using Npgsql;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;


namespace BookingSystem
{
    public partial class MainMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var cs = "Host=localhost;Username=postgres;Password=2002;Database=AgendaDB";
            var con = new NpgsqlConnection(cs);
            con.Open();
            string username = TextBox1.Text;
            string password = TextBox2.Text;
            string sql = "SELECT FROM USERS WHERE username = '"+username+"'AND password = '"+password+"'";
            var cmd = new NpgsqlCommand(sql, con);
            NpgsqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                Response.Redirect("Menu");
            }
            else
            {
                string mesg = "Invalid username or password";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + mesg + "');", true);
            }
            con.Close();

        }
    }

   
}