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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            // All passwords are placholders that should be replaces with the passwords stored in the database

            string classification = "";

            switch (username.Text)
            {
                case "admin": // Placeholder for admin username
                    if (password.Text == "khury") 
                    {
                        answer.Text = "Login Admin";
                        Session.Add(classification, "A"); // Stores classification in a session variable
                        //classification = 'A'; 
                        Response.Redirect("http://localhost:52416/Pages/adminDashboard.aspx");
                    }
                    else
                        answer.Text = "Incorrect username and/or password";
                    break;
                case "teacher": // Placeholder for teacher username
                    if (password.Text == "khury")
                    {
                        answer.Text = "Login Teacher";
                        Session.Add(classification, "T"); // Stores classification in a session variable 
                        //classification = 'T'; 
                        Response.Redirect("http://localhost:52416/Pages/TeacherDashboard.aspx");
                    }
                    else
                        answer.Text = "Incorrect username and/or password";
                    break;
                case "student": // Placeholder for student username
                    if (password.Text == "khury")
                    {
                        answer.Text = "Login Student";
                        Session.Add(classification, "S"); // Stores classification in a session variable
                        //classification = 'S';  
                        Response.Redirect("http://localhost:52416/Pages/StudentDashboard.aspx");
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
    }
}