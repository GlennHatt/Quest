﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
   public partial class adminSettings : System.Web.UI.Page
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
         } finally
         {
            reader.Close();
         }
         cmdEmailActive.Connection.Close();

         // show or hide the activate email box
         if (studentEmailEnabled == "true")
         {
            cdDisable.Visible = true;
         } else
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
         currentUser = "38";
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
            cmdChangePassword.Parameters.AddWithValue("typed_password", txtOldPassword.Text);
            cmdChangePassword.Parameters.AddWithValue("p_EndUserID", currentUser);
            // ^--- needs to be changed to session when login is up
            cmdChangePassword.Parameters.AddWithValue("p_Password", txtbxTeacherConfirmPassword.Text);


            cmdChangePassword.Connection.Open();
            cmdChangePassword.ExecuteNonQuery();
            cmdChangePassword.Connection.Close();
            txtbxTeacherPassword.Text = txtbxTeacherConfirmPassword.Text = txtOldPassword.Text = string.Empty;

            showPasswordUpdated = true;
            Session["showPasswordUpdated"] = true;
            Response.Redirect(Request.RawUrl); // to ensure message always shows up
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
            insertEmail();
            Session["showEnableEmail"] = true;
            Response.Redirect(Request.RawUrl); // to ensure message always shows up
            
            //Response.Redirect(Request.RawUrl);
        }


      protected void insertEmail()
      {
            // This has to be finished later
            OracleCommand cmdEmailInsert = new OracleCommand(@"
BEGIN
  end_users.addEmail(
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
            cmdEmailInsert.ExecuteNonQuery();
            cmdEmailInsert.Connection.Close();
            Response.Redirect(Request.RawUrl);
        }


    }
}