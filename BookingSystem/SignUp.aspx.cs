using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Npgsql;

namespace BookingSystem
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        

        }

        
        protected void Button1_Click(object sender, EventArgs e)
        {
            var cs = "Host=localhost;Username=postgres;Password=2002;Database=AgendaDB";
            var con = new NpgsqlConnection(cs);
            con.Open();
            string username = TextBox3.Text;
            string password = TextBox5.Text;
            string email = TextBox4.Text;
            string fname = TextBox1.Text;
            string lname = TextBox2.Text;
            string sql = "INSERT INTO USERS(username,password,email,firstName,surname) VALUES ('"+username+"','"+password+"', '"+email+"','"+fname+"','"+lname+"')";
            var cmd = new NpgsqlCommand(sql, con);
            NpgsqlDataReader reader = cmd.ExecuteReader();
            con.Close();
            Response.Redirect("Menu.aspx");
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}