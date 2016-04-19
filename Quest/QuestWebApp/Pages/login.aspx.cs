using QuestWebApp.App_Code;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Data.OracleClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages // a comment
{
   public partial class login : System.Web.UI.Page
   {
      OracleConnection connectionString = new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString); // Connection String.
      string userPermissionLevel;

      utilities util = new utilities();
      protected void Page_Load(object sender, EventArgs e)
      {

      }

      protected void loginButton_Click(object sender, EventArgs e)
      {
         // Database connection with login function
         // Returning a user_id and get a user_type ATS

         try
         {
            OracleCommand cmdLogin = new OracleCommand(@"
BEGIN
   :v_UserID := end_users.logon(
    p_Username => :p_Username,
    p_Password => :p_Password);
END;",
                         new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString));
            cmdLogin.Parameters.AddWithValue("p_Username", username.Text);
            cmdLogin.Parameters.AddWithValue("p_Password", util.CalculateHash(password.Text));
            cmdLogin.Parameters.AddWithValue("v_UserID", OleDbType.Integer).Direction = System.Data.ParameterDirection.Output;


            cmdLogin.Connection.Open();
            cmdLogin.ExecuteNonQuery();

            Session["UserID"] = Convert.ToString(cmdLogin.Parameters["v_UserID"].Value);

            cmdLogin.Connection.Close();

            OracleCommand cmdGetPermission = new OracleCommand(@"
SELECT permission_level
  FROM end_user
 WHERE user_id = :p_UserID", connectionString);
            cmdGetPermission.Parameters.AddWithValue("p_UserID", Session["UserID"]);

            cmdGetPermission.Connection.Open();
            OracleDataReader reader = cmdGetPermission.ExecuteReader();
            try
            {
               while (reader.Read())
               {
                  userPermissionLevel = reader.GetValue(0).ToString();
               }
            } finally
            {
               reader.Close();
            }
            cmdGetPermission.Connection.Close();
         } catch
         {
            answer.Text = "Incorrect username and/or password";
                answer.ForeColor = System.Drawing.Color.Red;
         }
         //All passwords are placholders that should be replaces with the passwords stored in the database
         switch (userPermissionLevel)
         {
            case "A":
               Session["userClassification"] = 'A';
               Response.Redirect("AdminDashboard.aspx");
               break;
            case "T":
               Session["userClassification"] = 'T';
               Response.Redirect("TeacherDashboard.aspx");
               break;
            case "S": // Placeholder for student username
               Session["userClassification"] = 'S';
               Response.Redirect("StudentDashboard.aspx");
               break;
               //default:
               //        answer.Text = "Incorrect username and/or password";
               //    break;
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
         Response.Redirect("~/Pages/AboutUsPage.aspx");
      }

      protected void btnbackToLogin_Click(object sender, EventArgs e)
      {
            Response.Redirect("~/Pages/forgotPassword.aspx");

        }
    }
}