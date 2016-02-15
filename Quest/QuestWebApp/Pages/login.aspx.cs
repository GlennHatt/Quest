using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            //string admin   = "admin";
            //string teacher = "teacher";
            //string student = "student";

            
            switch (username.Text)
            {
                case "admin":
                    if (password.Text == "khury")
                        answer.Text = "Login Admin";
                    break;
                case "teacher":
                    if (password.Text == "khury")
                        answer.Text = "Login Teacher";
                    break;
                case "student":
                    if (password.Text == "khury")
                        answer.Text = "Login Student";
                    break;
                default:
                    answer.Text = "Incorrect username and/or password";
                    break;
            }

            //if (username.Text == "yousef" && password.Text == "khury")
                //answer.Text = "Login";
           // else
                //answer.Text = "Incorrect username and/or password";
        }
    }
}