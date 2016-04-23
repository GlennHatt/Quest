using QuestWebApp.App_Code;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
   public partial class studentSettings : System.Web.UI.Page
   {
        OracleConnection connectionString = new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString); // Connection String.
        string currentUser;
        bool showPasswordUpdated,
            showFailPasswordUpdated;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["showPasswordUpdated"] != null)
                showPasswordUpdated = (bool)Session["showPasswordUpdated"];
            else
                showPasswordUpdated = false;

            if (Session["showFailPasswordUpdated"] != null)
                showFailPasswordUpdated = (bool)Session["showFailPasswordUpdated"];
            else
                showFailPasswordUpdated = false;

            if (showPasswordUpdated == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                "toastr_message",
                "toastr.success('Password Has Been Updated', 'Success!')", true);
                Session["showPasswordUpdated"] = null;
                showPasswordUpdated = false;
            }
            if (showFailPasswordUpdated == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                "toastr_message",
               "toastr.error('Your Old Password Does Not Match', 'Fail!')", true);
                Session["showFailPasswordUpdated"] = null;
                showFailPasswordUpdated = false;
            }

            currentUser = Session["UserID"].ToString();
        }

        protected void clickUpdatePassword(object sender, EventArgs e)
        {
            string oldPassword = string.Empty;
            utilities util = new utilities();

            OracleCommand checkOldPassword = new OracleCommand(@"
SELECT password
  FROM end_user
 WHERE user_id = :p_UserID", connectionString);
            checkOldPassword.Parameters.AddWithValue("p_UserID", Session["UserID"]);

            checkOldPassword.Connection.Open();
            OracleDataReader reader = checkOldPassword.ExecuteReader();
            try
            {
                while (reader.Read())
                {
                    oldPassword = reader.GetValue(0).ToString();
                }
            }
            finally
            {
                reader.Close();
            }
            checkOldPassword.Connection.Close();
            txtOldPassword.Text = util.CalculateHash(txtOldPassword.Text);

            if (txtOldPassword.Text == oldPassword)
            {
                // to ensure message always shows up

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
                cmdChangePassword.Parameters.AddWithValue("typed_password", txtOldPassword.Text);
                cmdChangePassword.Parameters.AddWithValue("p_EndUserID", currentUser);
                // ^--- needs to be changed to session when login is up
                cmdChangePassword.Parameters.AddWithValue("p_Password", util.CalculateHash(txtbxTeacherConfirmPassword.Text));


                cmdChangePassword.Connection.Open();
                cmdChangePassword.ExecuteNonQuery();
                cmdChangePassword.Connection.Close();
                txtbxTeacherPassword.Text = txtbxTeacherConfirmPassword.Text = txtOldPassword.Text = string.Empty;
                showPasswordUpdated = true;
                Session["showPasswordUpdated"] = true;
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                showFailPasswordUpdated = true;
                Session["showFailPasswordUpdated"] = true;
                Response.Redirect(Request.RawUrl);
            }
        }
    }
}