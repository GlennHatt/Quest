using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
    public partial class adminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int currentMonth = DateTime.Now.Month;
            int currentYear = DateTime.Now.Year;

            if(currentMonth >= 8)
            {
                ddlSemester.Items.Add(new ListItem("Semester:"));
                ddlSemester.Items.Add(new ListItem("Fall " + currentYear));
                ddlSemester.Items.Add(new ListItem("Spring " + (currentYear + 1)));
                ddlSemester.Items.Add(new ListItem("Fall " + (currentYear + 1)));
                ddlSemester.Items.Add(new ListItem("Spring " + (currentYear + 2)));
                ddlSemester.Items.Add(new ListItem("Fall " + (currentYear + 2)));
            }
            else
            {
                ddlSemester.Items.Add(new ListItem("Semester:"));
                ddlSemester.Items.Add(new ListItem("Spring " + currentYear));
                ddlSemester.Items.Add(new ListItem("Fall " + currentYear));
                ddlSemester.Items.Add(new ListItem("Spring " + (currentYear + 1)));
                ddlSemester.Items.Add(new ListItem("Fall " + (currentYear + 1)));
                ddlSemester.Items.Add(new ListItem("Spring " + (currentYear + 2)));
            }

            ddlSemester.Items.Add(new ListItem());
        }

    }
}