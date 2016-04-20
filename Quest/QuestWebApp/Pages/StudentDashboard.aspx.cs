using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
   public partial class studentDashboard : System.Web.UI.Page
   {
      bool isTest = false; // If there is a pending test, change to true

      protected void Page_Load(object sender, EventArgs e)
      {
         
         //Session["UserID"] = 1;
         displayGreeting();
         //testAlertTemplate.Visible = true;

         if (isTest == false)
         {
            noTestMessage.Visible = true;
            cardAllCaughtUp.Visible = false;
         } else
         {
            noTestMessage.Visible = false;
            cardAllCaughtUp.Visible = true;
         }

      }

      private void displayGreeting()
      {
         if (DateTime.Now.Hour < 12)
         {
            lblStudentGreeting.Text = "Good Morning";
         } else if (DateTime.Now.Hour < 17)
         {
            lblStudentGreeting.Text = "Good Afternoon";
         } else
         {
            lblStudentGreeting.Text = "Good Evening";
         }
      }


      protected void lstStudentTests_ItemCommand1(object sender, ListViewCommandEventArgs e)
      {
            switch (e.CommandName)
         {
            case "lstStudentTestsLnkBtnClick":
               Session["TestID"] = e.CommandArgument;
                    Response.Redirect("~/Pages/studentPreTest.aspx");
               break;
         }
      }
   }
}