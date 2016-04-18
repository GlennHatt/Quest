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
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnCheat_Click(object sender, EventArgs e)
        {
            Session["cheated_status"] = "1";
            OracleCommand cmdCheated = new OracleCommand(@"
BEGIN
  tests_taken.cheated(p_TestTakenID => :p_TestTakenID);
END;",
                             new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString));
            cmdCheated.Parameters.AddWithValue("p_TestTakenID", Session["TestTakenID"]);


            cmdCheated.Connection.Open();
            cmdCheated.ExecuteNonQuery();

            Response.Redirect("~/Pages/studentGradeOverview.aspx");

            cmdCheated.Connection.Close();
        }

        protected void btnNoCheat_Click(object sender, EventArgs e)
        {
            Session["cheated_status"] = null;
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
            cmdPledgeCheck.Parameters.AddWithValue("session_id", Session["UserID"]);
            cmdPledgeCheck.Parameters.AddWithValue("approval", OleDbType.Integer).Direction = System.Data.ParameterDirection.Output;


            cmdPledgeCheck.Connection.Open();
            cmdPledgeCheck.ExecuteNonQuery();

            if (int.Parse(Convert.ToString(cmdPledgeCheck.Parameters["approval"].Value)) == 1)
            {
                btnNoCheat.Text = "SUCCESS";
                Session["TestTakenID"] = 115;
                Response.Redirect("~/Pages/studentGradeOverview.aspx");
            }

            cmdPledgeCheck.Connection.Close();
        }
    }
}