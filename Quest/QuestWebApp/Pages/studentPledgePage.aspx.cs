using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
   public partial class studentPledgePage : System.Web.UI.Page
   {
      OracleConnection connectionString = new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString); // Connection String.

      protected void Page_Load(object sender, EventArgs e)
      {

      }

      protected void btnNoCheat_Click(object sender, EventArgs e)
      {
         OracleCommand cmdPledgeCheck = new OracleCommand(@"
DECLARE
  pledge_signature varchar(300);
  actual_name      varchar(300);
  approval         number (1);
BEGIN
  SELECT f_name || ' ' || l_name into actual_name
    FROM end_user
   WHERE user_id = :session_id;
  IF actual_name = :pledge_signature then
     :approval := 1;
  ELSE
     approval := 0;
  END IF;
END;",
                          new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString));
         cmdPledgeCheck.Parameters.AddWithValue("pledge_signature", txtbxUsersName.Text);
         cmdPledgeCheck.Parameters.AddWithValue("session_id", 18);
         cmdPledgeCheck.Parameters.AddWithValue("approval", OleDbType.Integer).Direction = System.Data.ParameterDirection.Output;


         cmdPledgeCheck.Connection.Open();
         cmdPledgeCheck.ExecuteNonQuery();

         if (int.Parse(Convert.ToString(cmdPledgeCheck.Parameters["approval"].Value)) == 1)
         {
            btnNoCheat.Text = "SUCCESS";
            Session["TestTakenID"] = 115;
            Response.Redirect("~/Pages/gradeOverview.aspx");
         }

         cmdPledgeCheck.Connection.Close();
      }
   }
}