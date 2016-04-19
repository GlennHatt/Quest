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
      OracleConnection connectionString = new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString); // Connection String.

      protected void Page_Load(object sender, EventArgs e)
      {
         cardUpdatePassword.Visible = false;
      }

      protected void ddlClassSelect_SelectedIndexChanged1(object sender, EventArgs e)
      {
         cardUpdatePassword.Visible = true;
         txtbxTeacherPassword.Text = txtbxTeacherConfirmPassword.Text = string.Empty;
      }

      protected void updatePassword_Click(object sender, EventArgs e)
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
      }
   }
}