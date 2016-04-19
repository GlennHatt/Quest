using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QuestWebApp.App_Code;
using System.Data.SqlClient;
using System.Data.OracleClient;
using System.Configuration;

namespace QuestWebApp.Pages
{
   public partial class teacherDashboard : System.Web.UI.Page
   {
        OracleConnection connectionString = new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString); // Connection String.

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Session["UserID"] =
                //    1;

                //if (Session["UserID"] == null)
                //    Session["UserID"] = 1;

                string testNumber = "0";
                string currentUser = "1";

                OracleCommand cmdGradeTests = new OracleCommand(@"
SELECT Count(DISTINCT test_taken_id) as test_count
  FROM test_taken t
       JOIN enrollment e USING (enrollment_id)
       JOIN section    s USING (section_id)
       JOIN question_taken qt USING (test_taken_id)
       JOIN question_taken_essay tte USING (question_taken_id)
 WHERE s.teacher_id = :p_TeacherID
   AND graded = 'N'", connectionString);
                cmdGradeTests.Parameters.AddWithValue("p_TeacherID", currentUser);

                cmdGradeTests.Connection.Open();
                OracleDataReader reader = cmdGradeTests.ExecuteReader();
                try
                {
                    while (reader.Read())
                    {
                        testNumber = reader.GetValue(0).ToString();
                    }
                }
                finally
                {
                    reader.Close();
                }
                cmdGradeTests.Connection.Close();

                lblTestsToGrade.Text = testNumber;
            }
        }

        protected void lvTeacherTests_ItemCommand1(object sender, ListViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "lvGradeTestLnkBtnClick":
                    Session["TestID"] = e.CommandArgument;
                    Response.Redirect("~/Pages/teacherTestReview.aspx");
                    break;
            }
        }
    }
}