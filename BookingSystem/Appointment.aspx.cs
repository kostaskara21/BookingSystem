using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
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

        protected void Page_Load(object sender, EventArgs e)
        {
            Appointments appointmentdetails = (Appointments)Session["appointment"];
            Label1.Text = appointmentdetails.name;
            Label3.Text = appointmentdetails.id.ToString();
            show();
            


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var cs = "Host=localhost;Username=postgres;Password=test123;Database=AgendaDB1";
            var con = new NpgsqlConnection(cs);
            con.Open();
            Appointments appointmentdetails = (Appointments)Session["appointment"];
            int idappointment = appointmentdetails.id;
            string username = (String)Session["username"];
            string comment = TextBox1.Text;
            string time = DateTime.Now.ToString(); 
            string sql = "INSERT INTO COMMENT(username,comment,time,idappointment) VALUES ( '" + username + "','" + comment + "','" + time + "','" + idappointment + "')";
            var cmd = new NpgsqlCommand(sql, con);
            NpgsqlDataReader reader = cmd.ExecuteReader();
            con.Close();
            Response.Redirect("Appointment");
        }
        protected void show()
        {
            var cs = "Host=localhost;Username=postgres;Password=test123;Database=AgendaDB1";
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

    }
}