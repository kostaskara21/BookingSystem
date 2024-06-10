using System;
using Npgsql;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace BookingSystem
{
    public partial class MainMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var cs = "Host=localhost;Username=postgres;Password=2002;Database=AgendaDB";
            var con = new NpgsqlConnection(cs);
            con.Open();
        }
    }

   
}