using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
    public partial class StudentDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            displayGreeting();
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