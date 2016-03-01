﻿using System;
using System.Security.Cryptography;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
    public partial class loginTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            // All passwords are placholders that should be replaces with the passwords stored in the database
            switch (username.Text)
            {
                case "admin": // Placeholder for admin username
                    if (password.Text == "password")
                    {
                        Session["classification"] = 'A';
                        Response.Redirect("adminDashboard.aspx");
                    }
                    else
                        answer.Text = "Incorrect username and/or password";
                    break;
                case "teacher": // Placeholder for teacher username
                    if (password.Text == "password")
                    {
                        Session["classification"] = 'T';
                        Response.Redirect("TeacherDashboard.aspx");
                    }
                    else
                        answer.Text = "Incorrect username and/or password";
                    break;
                case "student": // Placeholder for student username
                    if (password.Text == "password")
                    {
                        Session["classification"] = 'S';
                        Response.Redirect("StudentDashboard.aspx");
                    }
                    else
                        answer.Text = "Incorrect username and/or password";
                    break;
                default:
                    answer.Text = "Incorrect username and/or password";
                    break;
            }
        }

        public string CalculateHash(string passwordInput) // Hashes the string that is passed into it
        {
            MD5 hashed_algorithm = System.Security.Cryptography.MD5.Create();
            byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(passwordInput);
            byte[] hash = hashed_algorithm.ComputeHash(inputBytes);

            StringBuilder hashedValue = new StringBuilder();

            for (int i = 0; i < hash.Length; i++)
            {
                hashedValue.Append(hash[i].ToString("X2"));
            }

            return hashedValue.ToString();
        }

        protected void discoverButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AboutUsPage.aspx");
        }
    }
}