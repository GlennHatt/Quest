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
   public partial class gradeOverview : System.Web.UI.Page
   {
        OracleConnection connectionString = new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString); // Connection String.


        protected void Page_Load(object sender, EventArgs e)
        {
            Session["TestTakenID"] = "114";

            string testGrade = "";

            OracleCommand cmdTestGrade = new OracleCommand(@"
SELECT grade
  FROM test_taken
 WHERE test_taken_id = :sessionTestTakenID", connectionString);
            cmdTestGrade.Parameters.AddWithValue("sessionTestTakenID", Session["TestTakenID"]);

            cmdTestGrade.Connection.Open();
            OracleDataReader reader = cmdTestGrade.ExecuteReader();
            try
            {
                while (reader.Read())
                {
                    testGrade = reader.GetValue(0).ToString();
                }
            }
            finally
            {
                reader.Close();
            }
            cmdTestGrade.Connection.Close();
            lblYourGrade.Text += testGrade;
        }

      protected void btnRedirect_Click(object sender, EventArgs e)
      {
         Response.Redirect("~/Pages/studentDashboard.aspx");
      }
   }
}