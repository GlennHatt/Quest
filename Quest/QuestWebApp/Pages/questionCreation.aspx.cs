using System;
using System.Collections;
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
        OracleConnection connectionString = new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString); // Connection String.
        ArrayList choices;
        string questionType;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Test_ID"] == null)
                {
                    Session["Test_ID"] = "1";
                }

                hideInputs();
            }
            else
            {
                questionType = rblAddType.SelectedValue;
            }
        }

        protected void btnAddQuestion_Click(object sender, EventArgs e)
        {
            OracleCommand cmdAddQuestion = new OracleCommand();

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
                    cmdAddQuestion.Parameters.AddWithValue("p_QuestionID", Session["QuestionID"]);
                    cmdAddQuestion.Parameters.AddWithValue("p_QuestionText", txtAddQuestionText.Text);
                    break;
                case "M":
                    break;
                case "MC":
                    cmdAddQuestion = new OracleCommand(@"
BEGIN
  :v_ChoiceID := QUESTIONS_MULTIPLE_CHOICE.add(
    p_QuestionID QUESTIONS.t_QuestionID,
    p_ChoiceText t_ChoiceText);
END;",
                    connectionString);

                    cmdAddQuestion = new OracleCommand(@"
BEGIN
  QUESTIONS_MULTIPLE_CHOICE.add(
    p_QuestionID   QUESTIONS.t_QuestionID,
    P_ChoiceID     QUESTIONS_MULTIPLE_CHOICE_BODY.t_ChoiceID,
    p_QuestionText t_QuestionText);
END;",
                    connectionString);
                    cmdAddQuestion.Parameters.AddWithValue("p_QuestionID", Session["QuestionID"]);
                    cmdAddQuestion.Parameters.AddWithValue("P_ChoiceID", QuestionID);
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
                    cmdAddQuestion.Parameters.AddWithValue("p_QuestionID", Session["QuestionID"]);
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
                    cmdAddQuestion.Parameters.AddWithValue("p_QuestionID", Session["QuestionID"]);
                    cmdAddQuestion.Parameters.AddWithValue("p_QuestionText", txtAddQuestionText.Text);
                    cmdAddQuestion.Parameters.AddWithValue("p_Answer",       rblAddTFAnswer.SelectedValue);
                    break;
            }

            cmdAddQuestion.Connection.Open();
            cmdAddQuestion.ExecuteNonQuery();
            cmdAddQuestion.Connection.Close();

            rblAddType.SelectedIndex = -1;
            hideInputs();
        }

        protected void rblAddType_SelectedIndexChanged(object sender, EventArgs e)
        {
            questionType = rblAddType.SelectedValue.ToString();

            OracleCommand cmdAddQuestion = new OracleCommand(@"
BEGIN
  :v_QuestionID := QUESTIONS.add(
    p_TestID => :p_TestID,
    p_Weight => :p_Weight,
    P_Type   => :p_Type);
END;",
            connectionString);
            cmdAddQuestion.Parameters.AddWithValue("p_TestID",     Session["Test_ID"]);
            cmdAddQuestion.Parameters.AddWithValue("p_Weight",     txtAddWeight.Text);
            cmdAddQuestion.Parameters.AddWithValue("p_Type",       questionType);
            cmdAddQuestion.Parameters.AddWithValue("v_QuestionID", OracleType.Int32).Direction = System.Data.ParameterDirection.Output;

            cmdAddQuestion.Connection.Open();
            cmdAddQuestion.ExecuteNonQuery();

            Session["QuestionID"] = Convert.ToInt32(cmdAddQuestion.Parameters["v_QuestionID"].Value);

            cmdAddQuestion.Connection.Close();

            hideInputs();
            switch (questionType)
            {
                case  "E":
                    lblAddQuestionText.Visible = true;
                    txtAddQuestionText.Visible = true;
                    break;
                case  "M":
                    break;
                case "MC":
                    lblAddQuestionText.Visible = true;
                    txtAddQuestionText.Visible = true;
                    lblMultipleChoiceBody.Visible = true;
                    grdMultipleChoiceBody.Visible = true;
                    break;
                case "SA":
                    lblBeforeText.Visible = true;
                    txtBeforeText.Visible = true;
                    lblAnswerText.Visible = true;
                    txtAnswerText.Visible = true;
                    lblAfterText.Visible = true;
                    txtAfterText.Visible = true;
                    break;
                case "TF":
                    lblAddQuestionText.Visible = true;
                    txtAddQuestionText.Visible = true;
                    lblAddAnswer.Visible = true;
                    rblAddTFAnswer.Visible = true;
                    break;
            }
            btnAddQuestion.Visible = true;
        }

        protected void btnNewMultipleChoice_Click(object sender, EventArgs e)
        {
            if (choices == null)
                choices = new ArrayList();
            choices.Add(new multipleChocieBody());
            grdMultipleChoiceBody.DataSource = choices;
            grdMultipleChoiceBody.DataBind();
            //rptMultipleChoiceBody.Items[]
        }

        protected void hideInputs()
        {
            lblAddQuestionText.Visible = false;
            txtAddQuestionText.Visible = false;
            lblAddAnswer.Visible       = false;
            rblAddTFAnswer.Visible     = false;
            lblBeforeText.Visible      = false;
            txtBeforeText.Visible      = false;
            lblAnswerText.Visible      = false;
            txtAnswerText.Visible      = false;
            lblAfterText.Visible       = false;
            txtAfterText.Visible       = false;
            lblMultipleChoiceBody.Visible = false;
            btnNewMultipleChoice.Visible  = false;
            btnAddQuestion.Visible        = false;
        }
    }

    public class multipleChocieBody
    {
        string choiceText { get; set; } // The text of the choice.
    }
}