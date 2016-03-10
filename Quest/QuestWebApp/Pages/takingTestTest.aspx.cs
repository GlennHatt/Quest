using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OracleClient;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
    public partial class takingTestTest : System.Web.UI.Page
    {
        //string ConnectionString = System.Configuration.ConfigurationSettings.AppSettings["ConnectionString"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            // TODO: Session variable for test ID needed here
            int test_id = 1;
        }

        protected void btnSubmitTest_Click(object sender, EventArgs e)
        {
            string TFAnswer;

            foreach(ListViewItem question in lvTest.Items)
            {
                if (((RadioButton)question.FindControl("rdbTrue")).Checked == true)
                    TFAnswer = "T";
                else
                    TFAnswer = "F";

                OracleCommand cmdAddTFQuestion = new OracleCommand(@"

BEGIN
   questions_true_false.grade_question(
    p_TestTakenID   => :p_TestTakenID,
    p_QuestionID    => :p_QuestionID,
    p_StudentAnswer => :p_Answer);
END;",
             new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString));
                cmdAddTFQuestion.Parameters.AddWithValue("p_TestTakenID", 1);
                cmdAddTFQuestion.Parameters.AddWithValue("p_QuestionID", ((Label)question.FindControl("Label1")).Text);
                cmdAddTFQuestion.Parameters.AddWithValue("p_Answer", TFAnswer);

                cmdAddTFQuestion.Connection.Open();
                cmdAddTFQuestion.ExecuteNonQuery();

                cmdAddTFQuestion.Connection.Close();
                /* txtTestAnswer.Text += "/" + ((Label)question.FindControl("Label1")).Text + ", ";
                 if (((RadioButton)question.FindControl("rdbTrue")).Checked == true)
                     txtTestAnswer.Text += "T";
                 else
                     txtTestAnswer.Text += "F"; */
            }
        }

    }
}