using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QuestWebApp.App_Code;

namespace QuestWebApp.Pages
{
    public partial class StudentDashboard : System.Web.UI.Page
    {

        bool isTest = false; // If there is a pending test, change to true

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["neededClassification"] = 'S';

            try
            {
                if (Session["userClassification"] == null)
                    throw new NullReferenceException();
                if ((char)Session["userClassification"] != 'S')
                {
                    utilities util = new utilities();
                    util.checkAuthentication(1, (char)Session["userClassification"], (char)Session["neededClassification"]);
                }
            }
            catch (NullReferenceException)
            {
                Response.Redirect("login.aspx");
            }

            displayGreeting();
            testAlertTemplate.Visible = true;

            if (isTest == false)
                noTestMessage.Visible = true;
            else
                noTestMessage.Visible = false;

        }

        private void displayGreeting()
        {
            if(DateTime.Now.Hour < 12)
{
                lblStudentGreeting.Text = "Good Morning";
            }
                else if (DateTime.Now.Hour < 17)
            {
                lblStudentGreeting.Text = "Good Afternoon";
            }
            else
            {
                lblStudentGreeting.Text = "Good Evening";
            }
        }
    }


}