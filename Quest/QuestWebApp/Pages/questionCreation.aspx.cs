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
    public partial class questionCreation : System.Web.UI.Page
    {
        // Global Veriables
        int QuestionID; // ID of the current question.

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Test_ID"] == null)
            {
                Session["Test_ID"] = "1";
            }
        }

        protected void btnAddQuestion_Click(object sender, EventArgs e)
        {
            string questionType;
            OracleConnection connectionString = new OracleConnection(ConfigurationManager.ConnectionStrings["GlennLocalHost"].ConnectionString);

            questionType = rblAddType.SelectedValue.ToString();

            OracleCommand cmdAddQuestion = new OracleCommand(@"
BEGIN
  :v_QuestionID := QUESTIONS.add(
    p_TestID => :p_TestID,
    p_Weight => :p_Weight,
    P_Type   => :p_Type);
END;",
            connectionString);
            cmdAddQuestion.Parameters.AddWithValue("p_TestID", Session["Test_ID"]);
            cmdAddQuestion.Parameters.AddWithValue("p_Weight", txtAddWeight.Text);
            cmdAddQuestion.Parameters.AddWithValue("p_Type", questionType);
            cmdAddQuestion.Parameters.AddWithValue("v_QuestionID", OracleType.Int32).Direction = System.Data.ParameterDirection.Output;

            cmdAddQuestion.Connection.Open();
            cmdAddQuestion.ExecuteNonQuery();

            QuestionID = Convert.ToInt32(cmdAddQuestion.Parameters["v_QuestionID"].Value);

            cmdAddQuestion.Connection.Close();
            
            switch (questionType)
            {
                case "E":
                    cmdAddQuestion = new OracleCommand(@"
BEGIN
  QUESTIONS_ESSAY.add(
    p_QuestionID   => :p_QuestionID,
    p_QuestionText => :p_QuestionText);
END;",
                    connectionString);
                    cmdAddQuestion.Parameters.AddWithValue("p_QuestionID",   QuestionID);
                    cmdAddQuestion.Parameters.AddWithValue("p_QuestionText", txtAddQuestionText.Text);
                    break;
                case "SA":
                    cmdAddQuestion = new OracleCommand(@"
BEGIN
  QUESTIONS_SHORT_ANSWER.add(
    p_QuestionID => :P_QuestionID,
    p_BeforeText => :P_BeforeText,
    p_AfterText  => :P_AfterText,
    P_Answer     => :P_Answer);
END;",
                    connectionString);
                    cmdAddQuestion.Parameters.AddWithValue("p_QuestionID", QuestionID);
                    cmdAddQuestion.Parameters.AddWithValue("P_BeforeText", txtBeforeText.Text);
                    cmdAddQuestion.Parameters.AddWithValue("P_Answer",     txtAnswerText.Text);
                    cmdAddQuestion.Parameters.AddWithValue("P_AfterText",  txtAfterText.Text);
                    break;
                case "TF":
                    cmdAddQuestion = new OracleCommand(@"
BEGIN
  QUESTIONS_TRUE_FALSE.add(
    p_QuestionID   => :p_QuestionID,
    p_QuestionText => :p_QuestionText,
    P_Answer       => :p_Answer);
END;",
                    connectionString);
                    cmdAddQuestion.Parameters.AddWithValue("p_QuestionID",   QuestionID);
                    cmdAddQuestion.Parameters.AddWithValue("p_QuestionText", txtAddQuestionText.Text);
                    cmdAddQuestion.Parameters.AddWithValue("p_Answer",       rblAddTFAnswer.SelectedValue);
                    break;
            }

            cmdAddQuestion.Connection.Open();
            cmdAddQuestion.ExecuteNonQuery();
            cmdAddQuestion.Connection.Close();

        }

        protected void rblAddType_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}