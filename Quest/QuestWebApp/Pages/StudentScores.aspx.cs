using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QuestWebApp.App_Code;

namespace QuestWebApp.Pages
{
   public partial class studentScores : System.Web.UI.Page
   {
      protected void Page_Load(object sender, EventArgs e)
      {
            Session["UserID"] = "1";
         //try
         //{
         //   if (Session["userClassification"] == null)
         //      throw new NullReferenceException();
         //   if ((char)Session["userClassification"] != 'S')
         //   {
         //      utilities util = new utilities();
         //      util.checkAuthentication(1, (char)Session["userClassification"], (char)Session["neededClassification"]);
         //   }
         //} catch (NullReferenceException)
         //{
         //   Response.Redirect("~/Pages/login.aspx");
         //}
      }

        protected void ddlStudentClasses_SelectedIndexChanged(object sender, EventArgs e)
        {
            lstTestInfo.DataBind();
            //studentAverageGrade.DataBind();
        }
    }
}