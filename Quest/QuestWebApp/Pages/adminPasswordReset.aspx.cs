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
   public partial class adminPasswordReset : System.Web.UI.Page
   {
        bool showPasswordUpdated,
            showFailPasswordUpdated;

        OracleConnection connectionString = new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString); // Connection String.

      protected void Page_Load(object sender, EventArgs e)
      {
         cardUpdatePassword.Visible = false;

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
                "toastr.error('That username already exists', 'Failed!')", true);
                Session["showFailAddUserNameMessage"] = null;
                showFailPasswordUpdated = false;
            }
        }

      protected void ddlClassSelect_SelectedIndexChanged1(object sender, EventArgs e)
      {
        if (ddlClassSelect.SelectedIndex == 0)
        {
              cardUpdatePassword.Visible = false;
        }
        else
        {
            cardUpdatePassword.Visible = true;
            txtbxTeacherPassword.Text = txtbxTeacherConfirmPassword.Text = string.Empty;
        }
         
      }

      protected void updatePassword_Click(object sender, EventArgs e)
      {
         if (txtbxTeacherConfirmPassword.Text == txtbxTeacherPassword.Text)
            {
                utilities util = new utilities();
                OracleCommand cmdChangePassword = new OracleCommand(@"
BEGIN
  end_users.changePassword
    (p_EndUserID => :p_EndUserID, 
     p_Password  => :p_Password);
END;",
                              new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString));
                cmdChangePassword.Parameters.AddWithValue("p_EndUserID", ddlClassSelect.SelectedValue);
                cmdChangePassword.Parameters.AddWithValue("p_Password", util.CalculateHash(txtbxTeacherConfirmPassword.Text));


                cmdChangePassword.Connection.Open();
                cmdChangePassword.ExecuteNonQuery();
                cmdChangePassword.Connection.Close();
                txtbxTeacherPassword.Text = txtbxTeacherConfirmPassword.Text = string.Empty;
                showPasswordUpdated = true;
                Session["showPasswordUpdated"] = true;
                Response.Redirect(Request.RawUrl); // to ensure message always shows up
            }
          else
            {
                // PUT THE TOASTER IN HERE
                cardUpdatePassword.Visible = true;
                showFailPasswordUpdated = true;
                Session["showFailPasswordUpdated"] = true;
                Response.Redirect(Request.RawUrl); // to ensure message always shows up
            }
        }
   }
}