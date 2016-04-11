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
         Session["UserID"] = 1;
            displayGreeting();
            //testAlertTemplate.Visible = true;

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

      private void lstStudentTests_ItemCommand(object sender, ListViewCommandEventArgs e)
      {
         switch (e.CommandName)
         {
            case "lstStudentTestsLnkBtnClick":
               Session["TestID"] = e.CommandArgument;
               Response.Redirect("takingTestTest");
               break;
         }
      }
    }


}