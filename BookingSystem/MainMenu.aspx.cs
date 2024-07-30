using System;
using Npgsql;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Text;
using Microsoft.Ajax.Utilities;


namespace BookingSystem
{
    public partial class MainMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

           
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            var cs = "Host=localhost;Username=postgres;Password=2002;Database=AgendaDB1";
            var con = new NpgsqlConnection(cs);
            con.Open();
            string username = TextBox1.Text;
            string password = GenerateSHA256Hash(TextBox2.Text);
            string sql = "SELECT FROM USERS WHERE username = '"+username+"'AND password = '"+password+"'";
            var cmd = new NpgsqlCommand(sql, con);
            NpgsqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {   
                User user = new User();
                user.username = username;
                Session["username"] = user.username;
                
                Response.Redirect("Menu");
            }
            else
            {
                string mesg = "Invalid username or password";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + mesg + "');", true);
            }
            con.Close();

        }
        public static string ByteArrayToString(byte[] ba)
        {
            StringBuilder hex = new StringBuilder(ba.Length);
            foreach (byte b in ba)
                hex.AppendFormat("{0:x2}", b);
            return hex.ToString();
        }
        public String GenerateSHA256Hash(String input)
        {
            var sha256 = System.Security.Cryptography.SHA256.Create();
            byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(input));

            return ByteArrayToString(bytes);

        }
    }

   
}