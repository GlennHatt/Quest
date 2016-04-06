using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OracleClient;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QuestWebApp.App_Code;

namespace QuestWebApp.Pages
{
    public partial class takingTestTest : System.Web.UI.Page
    {
        OracleConnection connectionString = new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString); // Connection String.

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["userClassification"] == null)
                    throw new NullReferenceException();
                if ((char)Session["userClassification"] != 'S')
                {
                    utilities util = new utilities();
                    util.checkAuthentication(1, (char)Session["userClassification"], (char)Session["neededClassification"]);
                }
            }
            catch (NullReferenceException)
            {
                Response.Redirect("login.aspx");
            }

            // TODO: Session variable for test ID needed here
            int test_id = 1;

            
        }

        /*protected void OnLayoutCreated(object sender, EventArgs e)
        {
            foreach (ListViewItem question in lvMultipleChoiceQuestions.Items)
            {
                lblMCIdentity.Text += ((Label)lvMultipleChoiceQuestions.FindControl("lblMCQuestion")).Text + " ";
            }
        }*/

        protected void btnSubmitTest_Click(object sender, EventArgs e)
        {
            int noAnswerCounter = 0;
            string TFAnswer;
            string SAAnswer;

            foreach(ListViewItem question in lvTFQuestions.Items)
            {
                if (((RadioButton)question.FindControl("rdbTrue")).Checked == true)
                {
                    TFAnswer = "T";
                }
                else if (((RadioButton)question.FindControl("rdbFalse")).Checked == true)
                {
                    TFAnswer = "F";
                }
                else
                {
                    noAnswerCounter++;
                    TFAnswer = "N";
                }

                    OracleCommand cmdAddTFQuestion = new OracleCommand(@"
BEGIN
    questions_true_false.grade_question(
    p_TestTakenID   => :p_TestTakenID,
    p_QuestionID    => :p_QuestionID,
    p_StudentAnswer => :p_Answer);
END;", connectionString);
                    cmdAddTFQuestion.Parameters.AddWithValue("p_TestTakenID", 1);
                    cmdAddTFQuestion.Parameters.AddWithValue("p_QuestionID", ((Label)question.FindControl("Label1")).Text);
                    cmdAddTFQuestion.Parameters.AddWithValue("p_Answer", TFAnswer);

                    cmdAddTFQuestion.Connection.Open();
                    cmdAddTFQuestion.ExecuteNonQuery();

                    cmdAddTFQuestion.Connection.Close();
            }
            
// GRADE QUESTION NOT UP YET FOR ANY UNDER HERE
            foreach(ListViewItem question in lvEssayQuestions.Items)
            {
                OracleCommand cmdAddEQuestion = new OracleCommand(@"
BEGIN
   questions_essay.grade_question(
    p_TestTakenID   => :p_TestTakenID,
    p_QuestionID    => :p_QuestionID);
END;",
             new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString));
                
                //TODO: need to worry about the test_id when needed ----v
                cmdAddEQuestion.Parameters.AddWithValue("p_TestTakenID", 1);
                cmdAddEQuestion.Parameters.AddWithValue("p_QuestionID", ((Label)question.FindControl("Label1")).Text);

                cmdAddEQuestion.Connection.Open();
                cmdAddEQuestion.ExecuteNonQuery();

                cmdAddEQuestion.Connection.Close();
            }

            foreach(ListViewItem question in lvShortAnswerQuestions.Items)
            {
                SAAnswer = ((TextBox)question.FindControl("TextBox1")).Text;

                OracleCommand cmdAddSAQuestion = new OracleCommand(@"
BEGIN
   questions_short_answer.grade_question(
    p_TestTakenID   => :p_TestTakenID,
    p_QuestionID    => :p_QuestionID);
END;",
             new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString));
                cmdAddSAQuestion.Parameters.AddWithValue("p_TestTakenID", 1);
                cmdAddSAQuestion.Parameters.AddWithValue("p_QuestionID", ((Label)question.FindControl("Label1")).Text);
                cmdAddSAQuestion.Parameters.AddWithValue("p_Answer", SAAnswer);

                cmdAddSAQuestion.Connection.Open();
                cmdAddSAQuestion.ExecuteNonQuery();

                cmdAddSAQuestion.Connection.Close();
            }

        }
            

        protected void lvMatchingQuestions_ItemCreated(object sender, ListViewItemEventArgs e)
        {
            
            OracleCommand cmdAddTFQuestion = new OracleCommand(@"
select question_id quest_id, question_matching_body.question_text matching_question, question_matching_body.answer matching_answer
from   question_matching_body
       JOIN question USING (question_id)
       JOIN question_matching USING (question_id)
where  question.test_id = 1", connectionString);

            cmdAddTFQuestion.Connection.Open();
            OracleDataReader reader = cmdAddTFQuestion.ExecuteReader();
            try
            {

                while (reader.Read())
                {
                    //reader.GetValue(0);
                }
            }
            finally
            {
                reader.Close();
            }

            cmdAddTFQuestion.Connection.Close();
        }
    }
}