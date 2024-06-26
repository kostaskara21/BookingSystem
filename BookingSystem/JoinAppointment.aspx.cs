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
            var cs = "Host=localhost;Username=postgres;Password=2002;Database=AgendaDB1";
            var con = new NpgsqlConnection(cs);
            con.Open();
        }

        
    }
}