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
   public partial class teacherSettings : System.Web.UI.Page
   {
      OracleConnection connectionString = new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString); // Connection String.
      string studentEmailEnabled = "false";
      string currentUser;
        bool showEnableEmail,
                  showPasswordUpdated,
            showDisableEmail;
        protected void Page_Load(object sender, EventArgs e)
      {

            // toast notifications 
            if (Session["showEnableEmail"] != null)
                showEnableEmail = (bool)Session["showEnableEmail"];
            else
                showEnableEmail = false;

            if (Session["showPasswordUpdated"] != null)
                showPasswordUpdated = (bool)Session["showPasswordUpdated"];
            else
                showPasswordUpdated = false;
            if (Session["showDisableEmail"] != null)
                showDisableEmail = (bool)Session["showDisableEmail"];
            else
                showDisableEmail = false;


            if (showEnableEmail == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                "toastr_message",
                "toastr.success('Email Has Been Enabled', 'Success!')", true);
                Session["showEnableEmail"] = null;
                showEnableEmail = false;
            }

            if (showPasswordUpdated == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                "toastr_message",
                "toastr.success('Password Has Been Updated', 'Success!')", true);
                Session["showPasswordUpdated"] = null;
                showPasswordUpdated = false;
            }

            if (showDisableEmail == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                "toastr_message",
                "toastr.success('Email Has Been Disabled', 'Success!')", true);
                Session["showDisableEmail"] = null;
                showDisableEmail = false;
            }
            
            currentUser = Session["UserID"].ToString(); // comment this out when we use login functionality
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
         } finally
         {
            reader.Close();
         }
         cmdEmailActive.Connection.Close();

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
         utilities util = new utilities();
            showPasswordUpdated = true;
            Session["showPasswordUpdated"] = true;
            Response.Redirect(Request.RawUrl); // to ensure message always shows up

            currentUser = Session["UserID"].ToString();
            // ^--- needs to be changed to session when login is up

            OracleCommand cmdChangePassword = new OracleCommand(@"
DECLARE
  currentPassword varchar2 (100);
BEGIN
  SELECT password INTO currentPassword
    FROM end_user
   WHERE user_id = :currentUser;
  IF currentPassword = :typed_password THEN
    end_users.changePassword
      (p_EndUserID => :p_EndUserID, 
       p_Password  => :p_Password);
  END IF;
END;",
                            connectionString);
        cmdChangePassword.Parameters.AddWithValue("currentUser", currentUser);
        // ^--- needs to be changed to session when login is up
        cmdChangePassword.Parameters.AddWithValue("typed_password", util.CalculateHash(txtOldPassword.Text));
        cmdChangePassword.Parameters.AddWithValue("p_EndUserID", currentUser);
        // ^--- needs to be changed to session when login is up
        cmdChangePassword.Parameters.AddWithValue("p_Password", util.CalculateHash(txtbxTeacherConfirmPassword.Text));


        cmdChangePassword.Connection.Open();
        cmdChangePassword.ExecuteNonQuery();
        cmdChangePassword.Connection.Close();
        txtbxTeacherPassword.Text = txtbxTeacherConfirmPassword.Text = txtOldPassword.Text = string.Empty;
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
            showDisableEmail = true;
            Session["showDisableEmail"] = true;
            Response.Redirect(Request.RawUrl); // to ensure message always shows up
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
            showEnableEmail = true;
            Session["showEnableEmail"] = true;
            Response.Redirect(Request.RawUrl); // to ensure message always shows up
        }
   }
}