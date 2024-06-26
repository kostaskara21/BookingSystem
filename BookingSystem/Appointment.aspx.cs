using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookingSystem
{
    public partial class Appointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Appointments appointmentdetails = (Appointments)Session["appointment"];
            Label1.Text = appointmentdetails.name;
            Label3.Text = appointmentdetails.id.ToString();
            
        }

    }
}