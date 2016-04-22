using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
   public partial class adminHelp : System.Web.UI.Page
   {
      protected void Page_Load(object sender, EventArgs e)
      {

      }
        protected void btnPDF_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Assets/User Manual/The User Manual (1).pdf");
        }
    }
}