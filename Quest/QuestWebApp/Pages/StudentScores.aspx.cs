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
   public partial class studentScores : System.Web.UI.Page
   {
        OracleConnection connectionString = new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString); // Connection String.


        protected void Page_Load(object sender, EventArgs e)
      {

            string classGrade = "";
            OracleCommand cmdClassGrade = new OracleCommand(@"
SELECT COALESCE(CAST(ROUND((SUM(qt.points_earned)/SUM(DISTINCT t.possible_points))*100, 2) as varchar(200)), 'No Grades Yet') as class_grade
                   FROM test t
                         JOIN test_taken     tt USING (test_id)
                         JOIN question_taken qt USING (test_taken_id)
                         JOIN enrollment e  USING (enrollment_id)
                         JOIN section    s  ON (s.section_id = e.section_id)
                         JOIN class      c  USING (class_id)
                         JOIN end_user   eu   ON (s.teacher_id = eu.user_id)
                   WHERE student_id   = :UserID 
                     AND s.section_id = :SectionID", connectionString);
            cmdClassGrade.Parameters.AddWithValue("UserID", Session["UserID"]);
            cmdClassGrade.Parameters.AddWithValue("SectionID", ddlStudentClasses.SelectedValue);

            cmdClassGrade.Connection.Open();
            OracleDataReader reader = cmdClassGrade.ExecuteReader();
            try
            {
                while (reader.Read())
                {
                    classGrade = reader.GetValue(0).ToString();
                }
            }
            finally
            {
                reader.Close();
            }
            cmdClassGrade.Connection.Close();

            lbltestAverage.Text = classGrade;
        }

        protected void ddlStudentClasses_SelectedIndexChanged(object sender, EventArgs e)
        {
            lstTestInfo.DataBind();
            lbltestAverage.DataBind();
        }
    }
}