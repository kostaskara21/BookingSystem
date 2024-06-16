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
            
            var cs = "Host=localhost;Username=postgres;Password=test123;Database=Agenda";
            var con = new NpgsqlConnection(cs);
            con.Open();
            int id = MyMethod();
            string name = TextBox2.Text;
            string time = TextBox3.Text;
            string duration = TextBox4.Text;
            string date = TextBox1.Text;
            string sql = "INSERT INTO APPOINTMENT(id,time,duration,date,name) VALUES ( '"+ id +"','" + time + "','" + duration + "','" + date + "','" + name + "')";
            var cmd = new NpgsqlCommand(sql, con);
            NpgsqlDataReader reader = cmd.ExecuteReader();
            con.Close();


        }

        public int MyMethod()
        {
            Random r = new Random();
            int id = r.Next(100000, 999999);
            var cs = "Host=localhost;Username=postgres;Password=test123;Database=Agenda";
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