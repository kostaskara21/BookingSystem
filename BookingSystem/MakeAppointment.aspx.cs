using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace BookingSystem
{
    public partial class MakeAppointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            


        }
        


        protected void Button1_Click(object sender, EventArgs e)
        {

            var cs = "Host=localhost;Username=postgres;Password=test123;Database=AgendaDB1";
            var con = new NpgsqlConnection(cs);
            con.Open();
            string username = (String)Session["username"];
            int id = MyMethod();
            string name = TextBox2.Text;
            string time = TextBox3.Text;
            string duration = TextBox4.Text;
            string date = TextBox1.Text;
            string sql = "INSERT INTO APPOINTMENT(id,time,duration,date,name) VALUES ( '"+ id +"','" + time + "','" + duration + "','" + date + "','" + name + "')";

            
            var cmd = new NpgsqlCommand(sql, con);
            NpgsqlDataReader reader = cmd.ExecuteReader();
            con.Close();

            con.Open();
            string sql2 = "INSERT INTO APPOINTMENT_HAS_USERS(idappointment,iduser) VALUES('" + id + "',(SELECT id_user FROM USERS WHERE username ='" + username + "'))";
            var cmd2 = new NpgsqlCommand(sql2, con);
            NpgsqlDataReader reader2 = cmd2.ExecuteReader();
            con.Close();
            
           
            Appointments appointments = new Appointments();
            appointments.time = time;
            appointments.duration = duration;
            appointments.date = date;
            appointments.name = name;
            appointments.id = id;
            Session["appointment"] = appointments;
            Response.Redirect("Appointment");


        }

        public int MyMethod()
        {
            Random r = new Random();
            int id = r.Next(100000, 999999);
            var cs = "Host=localhost;Username=postgres;Password=test123;Database=AgendaDB1";
            var con = new NpgsqlConnection(cs);
            con.Open();
            while (true)
            {
                string sql = "SELECT id from appointment where id = '" + id + "' ";
                var cmd = new NpgsqlCommand(sql, con);
                NpgsqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                  id = r.Next(100000, 999999);
                }else { return id;}
                
            }
        }
    }
   
}