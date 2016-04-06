using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QuestWebApp.App_Code;

namespace QuestWebApp.Pages
{
    public partial class teacherSettings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["userClassification"] == null)
                    throw new NullReferenceException();
                if ((char)Session["userClassification"] != 'T' && (char)Session["userClassification"] != 'A')
                {
                    settingsUtilities setUtil = new settingsUtilities();
                    setUtil.check_settings((char)Session["userClassification"]);
                }
            }
            catch (NullReferenceException)
            {
                Response.Redirect("login.aspx");
            }
        }
        protected void btnEnable_Click(object sender, EventArgs e)
        {

            cdEnable.Visible = false;
            cdDisable.Visible = true;
        }

        protected void btnDisable_Click(object sender, EventArgs e)
        {
            cdDisable.Visible = false;
            cdEnable.Visible = true;
        }

        protected void clickUpdatePassword(object sender, EventArgs e)
        {

        }
    }
}