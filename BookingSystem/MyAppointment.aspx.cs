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
    public partial class MyAppointments : System.Web.UI.Page
    {
        DataSet ds = new DataSet();
        NpgsqlDataAdapter sda = new NpgsqlDataAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showAppointment();
            }

        }

        protected void showAppointment()
        {
            var cs = "Host=localhost;Username=postgres;Password=2002;Database=AgendaDB1";
            var con = new NpgsqlConnection(cs);
            con.Open();
            string username = (String)Session["username"];
            string sql = "SELECT DISTINCT appointment.id,appointment.name FROM appointment JOIN appointment_has_users ON appointment.id=appointment_has_users.idappointment JOIN users ON users.id_user = appointment_has_users.iduser WHERE users.username='"+username+"'";
            var cmd = new NpgsqlCommand(sql, con);
            NpgsqlDataReader reader = cmd.ExecuteReader();
            var dataSource = new List<Item>();
            while (reader.Read())
            {
                int appointmentId = (int)reader["id"];
                string appointmentName = (String)reader["name"];
                    dataSource.Add(new Item
                    {
                        Name = appointmentName,
                        Url = $"MyAppointmentJoin.aspx?idappointment={appointmentId}"
                    });
                
            }
                
           
            Repeater1.DataSource = dataSource;
            Repeater1.DataBind();
            con.Close();


        }
        public class Item
        {
            public string Name { get; set; }
            public string Url { get; set; }
        }
    }
}
