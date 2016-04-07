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

        protected void Page_Load(object sender, EventArgs e)
        {
            cdDisable.Visible = false;
            cdEnable.Visible = false;
            OracleCommand cmdEmailActive = new OracleCommand(@"
SELECT receive_email
  FROM end_user
 WHERE user_id = :p_UserID", connectionString);
            cmdEmailActive.Parameters.AddWithValue("p_UserID", "17"/*Session["p_StudentID"]*/);

            cmdEmailActive.Connection.Open();
            OracleDataReader reader = cmdEmailActive.ExecuteReader(); // replace reader with execute non-query
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

            cdEnable.Visible = false;
            cdDisable.Visible = true;
        }

        protected void btnDisable_Click(object sender, EventArgs e)
        {
            cdDisable.Visible = false;
            cdEnable.Visible = true;
        }

        protected void clickUpdatePassword(object sender, EventArgs e)
        {

        }
    }
}