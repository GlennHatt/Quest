using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
    public partial class studentPreTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
             protected void btnNotReady_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/studentDashboard.aspx");
        }

        protected void btnReady_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/studentTestTaking.aspx");
        }
    }
    }
