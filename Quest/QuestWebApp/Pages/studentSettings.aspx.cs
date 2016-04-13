using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QuestWebApp.App_Code;
using System.Data.OracleClient;
using System.Configuration;

namespace QuestWebApp.Pages
{
    public partial class studentSettings : System.Web.UI.Page
    {
        OracleConnection connectionString = new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString); // Connection String.
        string studentEmailEnabled = "false";
        string currentUser;

        protected void Page_Load(object sender, EventArgs e)
        {
            //currentUser = Session["p_StudentID"].ToString();
            currentUser = "17"; // comment this out when we use login functionality
            cdDisable.Visible = false;
            cdEnable.Visible = false;
            OracleCommand cmdEmailActive = new OracleCommand(@"
SELECT receive_email
  FROM end_user
 WHERE user_id = :p_UserID", connectionString);
            cmdEmailActive.Parameters.AddWithValue("p_UserID", currentUser);

            cmdEmailActive.Connection.Open();
            OracleDataReader reader = cmdEmailActive.ExecuteReader();
            try
            {
                while (reader.Read())
                {
                    studentEmailEnabled = reader.GetValue(0).ToString();
                }
            }
            finally
            {
                reader.Close();
            }
            cmdEmailActive.Connection.Close();

            // show or hide the activate email box
            if (studentEmailEnabled == "true")
            {
                cdDisable.Visible = true;
            }
            else
                cdEnable.Visible = true;
        }

        protected void btnEnable_Click(object sender, EventArgs e)
        {

            enableEmail();
        }

        protected void btnDisable_Click(object sender, EventArgs e)
        {
            disableEmail();
        }

        protected void clickUpdatePassword(object sender, EventArgs e)
        {
            OracleCommand cmdChangePassword = new OracleCommand(@"
BEGIN
  end_users.changePassword
    (:p_EndUserID, :p_Password);
END;",
                             new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString));
            cmdChangePassword.Parameters.AddWithValue("p_EndUserID", Session["UserID"]);
            cmdChangePassword.Parameters.AddWithValue("p_Password", txtbxTeacherConfirmPassword.Text);


            cmdChangePassword.Connection.Open();
            cmdChangePassword.ExecuteNonQuery();
            cmdChangePassword.Connection.Close();
            txtbxTeacherPassword.Text = txtbxTeacherConfirmPassword.Text = string.Empty;
        }

        protected void disableEmail()
        {
            OracleCommand cmdEmailDisable = new OracleCommand(@"
BEGIN
    END_USERS.deactivateEmail(
    p_EndUserID => :p_EndUserID);
END;", connectionString);
            cmdEmailDisable.Parameters.AddWithValue("p_EndUserID", currentUser);
            cmdEmailDisable.Connection.Open();
            cmdEmailDisable.ExecuteNonQuery(); 
            cmdEmailDisable.Connection.Close();
            Response.Redirect(Request.RawUrl);
        }

        protected void enableEmail()
        {
            OracleCommand cmdEmailEnable = new OracleCommand(@"
BEGIN
    END_USERS.activateEmail(
    p_EndUserID => :p_EndUserID);
END;", connectionString);
            cmdEmailEnable.Parameters.AddWithValue("p_EndUserID", currentUser);
            cmdEmailEnable.Connection.Open();
            cmdEmailEnable.ExecuteNonQuery();
            cmdEmailEnable.Connection.Close();
            Response.Redirect(Request.RawUrl);
        }


        protected void insertEmail()
        {
            // This has to be finished later
            OracleCommand cmdEmailInsert = new OracleCommand(@"
BEGIN
    END_USERS.addEmail(
    p_EndUserID     => :p_EndUserID,
    p_Email         => :p_Email,
    p_EmailUsername => :p_EmailUsername, 
    p_EmailPassword => :p_EmailPassword);
END;", connectionString);
            cmdEmailInsert.Parameters.AddWithValue("p_EndUserID", currentUser);
            cmdEmailInsert.Parameters.AddWithValue("p_Email", tbemail.Text);
            cmdEmailInsert.Parameters.AddWithValue("p_EmailUsername", tbStudentLogin.Text);
            cmdEmailInsert.Parameters.AddWithValue("p_EmailPassword", tbpassword.Text);
            cmdEmailInsert.Connection.Open();
            cmdEmailInsert.ExecuteNonQuery(); ;
            cmdEmailInsert.Connection.Close();
            Response.Redirect(Request.RawUrl);
        }

    }
}