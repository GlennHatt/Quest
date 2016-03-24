using System;
using System.Security.Cryptography;
using System.Text;
using System.Collections.Generic;
using System.Web;

namespace QuestWebApp.App_Code
{
    public class utilities
    {
        public void checkAuthentication(int? id, char? actualClassification, char? neededClassification)
        {
            if (id == null)
            {
                HttpContext.Current.Response.Redirect("login.aspx"); // Redirect to login page
            }
            else
            {
                if (actualClassification != neededClassification)
                {
                    switch (actualClassification)
                    {
                        case 'A':
                            // If it is student reditrect to admin, otherwise do nothing
                            if (neededClassification == 'S')
                                HttpContext.Current.Response.Redirect("adminDashboard.aspx");
                            // Access to both admin and teacher dashboard
                            break;
                        case 'T':
                            // Access to only teacher dashboard
                            HttpContext.Current.Response.Redirect("TeacherDashboard.aspx");
                            break;
                        case 'S':
                            HttpContext.Current.Response.Redirect("StudentDashboard.aspx");
                            // Access to only student dashboard
                            break;
                        default:
                            // Redirect to Login page
                            HttpContext.Current.Response.Redirect("login.aspx");
                            break;
                    }
                }
                else if (actualClassification == neededClassification) // If classifications match
                {
                    switch (actualClassification)
                    {
                        case 'A':
                            HttpContext.Current.Response.Redirect("adminDashboard.aspx");
                            break;
                        case 'T':
                            HttpContext.Current.Response.Redirect("TeacherDashboard.aspx");
                            break;
                        case 'S':
                            HttpContext.Current.Response.Redirect("StudentDashboard.aspx");
                            break;
                        default:
                            HttpContext.Current.Response.Redirect("login.aspx");
                            break;
                    }
                }
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