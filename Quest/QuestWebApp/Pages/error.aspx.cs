using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
   public partial class error : System.Web.UI.Page
   {
      protected void Page_Load(object sender, EventArgs e)
      {

      }

      protected void btnTaketest_Click(object sender, EventArgs e)
      {
         //Needs to have the correct redirect (preferably to go back to the previous page)
         //Response.Redirect("Request.UrlReferrer.ToString()");
      }
   }
}