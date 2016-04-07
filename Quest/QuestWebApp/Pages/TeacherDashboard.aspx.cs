using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QuestWebApp.App_Code;

namespace QuestWebApp.Pages
{
    public partial class TeacherDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["neededClassification"] = 'T';

            try
            {
                if (Session["userClassification"] == null)
                    throw new NullReferenceException();
                if ((char)Session["userClassification"] != 'T' && (char)Session["userClassification"] != 'A')
                {
                    utilities util = new utilities();
                    util.checkAuthentication(1, (char)Session["userClassification"], (char)Session["neededClassification"]);
                }
            }
            catch (NullReferenceException)
            {
                Response.Redirect("login.aspx");
            }
            if ((char)Session["userClassification"] != 'A')
                Session["userClassification"] = 'T';
        }
    }
}