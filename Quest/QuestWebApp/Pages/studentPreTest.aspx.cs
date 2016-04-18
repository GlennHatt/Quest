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
    public partial class studentPreTest : System.Web.UI.Page
    {
        OracleConnection connectionString = new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString); // Connection String.

        protected void Page_Load(object sender, EventArgs e)
        {
            string timeLimit = "";
            OracleCommand cmdTimeLimit = new OracleCommand(@"
SELECT time_limit
  FROM test
 WHERE test_id = :TestID", connectionString);
            cmdTimeLimit.Parameters.AddWithValue("TestID", Session["TestID"]);

            cmdTimeLimit.Connection.Open();
            OracleDataReader reader = cmdTimeLimit.ExecuteReader();
            try
            {
                while (reader.Read())
                {
                    timeLimit = reader.GetValue(0).ToString();
                }
            }
            finally
            {
                reader.Close();
            }
            cmdTimeLimit.Connection.Close();

            lblTimeLimit.Text = timeLimit;
        }
             protected void btnNotReady_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/studentDashboard.aspx");
        }

        protected void btnReady_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/studentTestTaking.aspx");
        }
    }
    }
