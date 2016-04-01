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
      OracleConnection connectionString = new OracleConnection(ConfigurationManager.ConnectionStrings["GlennLocalHost"].ConnectionString); // Connection String.
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
         } else
         {
            questionType = rblAddType.SelectedValue;
            Page.MaintainScrollPositionOnPostBack = true;
         }
      }

      protected void rblAddType_SelectedIndexChanged(object sender, EventArgs e)
      {
         questionType = rblAddType.SelectedValue.ToString();
         OracleCommand cmdAddQuestion;
         if (Session["QuestionID"] == null)
         {
            cmdAddQuestion = new OracleCommand(@"
 BEGIN
   :v_QuestionID := QUESTIONS.add(
     p_TestID => :p_TestID,
     p_Weight => :p_Weight,
     P_Type   => :p_Type);
 END;",
            connectionString); cmdAddQuestion.Parameters.AddWithValue("p_TestID", Session["Test_ID"]);
            cmdAddQuestion.Parameters.AddWithValue("p_Weight", txtAddWeight.Text);
            cmdAddQuestion.Parameters.AddWithValue("p_Type", questionType);
            cmdAddQuestion.Parameters.AddWithValue("v_QuestionID", OracleType.Int32).Direction = System.Data.ParameterDirection.Output;
            cmdAddQuestion.Connection.Open();
            cmdAddQuestion.ExecuteNonQuery();

            Session["QuestionID"] = Convert.ToInt32(cmdAddQuestion.Parameters["v_QuestionID"].Value);

            cmdAddQuestion.Connection.Close();
         } else
         {
            cmdAddQuestion = new OracleCommand(@"
 BEGIN
   QUESTIONS.change(
     p_QuestionID  => :p_QuestionID,
     p_TestID      => :p_TestID,
     p_Weight      => :p_Weight,
     P_Type        => :p_Type);
 END;",
            connectionString);
            cmdAddQuestion.Parameters.AddWithValue("p_QuestionID", Session["QuestionID"]);
            cmdAddQuestion.Parameters.AddWithValue("p_TestID", Session["Test_ID"]);
            cmdAddQuestion.Parameters.AddWithValue("p_Weight", txtAddWeight.Text);
            cmdAddQuestion.Parameters.AddWithValue("p_Type", questionType);

            cmdAddQuestion.Connection.Open();
            cmdAddQuestion.ExecuteNonQuery();
            cmdAddQuestion.Connection.Close();
         }

         hideInputs();
         switch (questionType)
         {
            case "E":
               tblAddEssay.Visible = true;
               break;
            case "M":
               tblMatchingSection.Visible = true;
               grdAddMatchingQuestion.Visible = true;
               break;
            case "MC":
               tblAddMultipleChoice.Visible = true;
               grdMultipleChoiceBody.Visible = true;
               break;
            case "SA":
               tblAddShortAnswer.Visible = true;
               break;
            case "TF":
               tblAddTrueFalse.Visible = true;
               rblAddTFAnswer.Visible = true;
               break;
         }
         btnAddQuestion.Visible = true;
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
               cmdAddQuestion.Parameters.AddWithValue("p_QuestionText", lblAddEssayText.Text);
               break;
            case "M":
               cmdAddQuestion = new OracleCommand(@"
 BEGIN
   QUESTIONS_MATCHING.add(
    p_QuestionID   => :p_QuestionID,
    p_QuestionText => :p_QuestionText);
 END;",
               connectionString);
               cmdAddQuestion.Parameters.AddWithValue("p_QuestionID", Session["QuestionID"]);
               cmdAddQuestion.Parameters.AddWithValue("p_QuestionText", txtAddMatchingText.Text);
               break;
            case "MC":

               cmdAddQuestion = new OracleCommand(@"
 BEGIN
   QUESTIONS_MULTIPLE_CHOICE.add(
     p_QuestionID   => :p_QuestionID,
     P_ChoiceID     => :p_ChoiceID,
     p_QuestionText => :p_QuestionText);
 END;",
               connectionString);
               cmdAddQuestion.Parameters.AddWithValue("p_QuestionID", Session["QuestionID"]);
               cmdAddQuestion.Parameters.AddWithValue("P_ChoiceID", Session["ChoiceID"]);
               cmdAddQuestion.Parameters.AddWithValue("p_QuestionText", txtAddMultipleChoiceQuestion.Text);
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
               cmdAddQuestion.Parameters.AddWithValue("P_Answer", txtAnswerText.Text);
               cmdAddQuestion.Parameters.AddWithValue("P_AfterText", txtAfterText.Text);
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
               cmdAddQuestion.Parameters.AddWithValue("p_QuestionText", txtAddTFQuestion.Text);
               cmdAddQuestion.Parameters.AddWithValue("p_Answer", rblAddTFAnswer.SelectedValue);
               break;
         }

         cmdAddQuestion.Connection.Open();
         cmdAddQuestion.ExecuteNonQuery();
         cmdAddQuestion.Connection.Close();

         rblAddType.SelectedIndex = -1;
         hideInputs();
         Session["QuestionID"] = null;
      }

      protected void btnAddMultipleChoice_Click(object sender, EventArgs e)
      {
         OracleCommand cmdAddQuestion = new OracleCommand(@"
BEGIN
  QUESTIONS_MATCHING_BODY.add(
    p_QuestionID   => :p_QuestionID,
    p_QuestionText => :p_QuestionText,
    P_Answer       => :p_Answer);
END;",
         connectionString);
         cmdAddQuestion.Parameters.AddWithValue("p_QuestionID", Session["QuestionID"]);
         cmdAddQuestion.Parameters.AddWithValue("p_QuestionText", txtAddMatchingQuestion.Text);
         cmdAddQuestion.Parameters.AddWithValue("p_Answer", txtAddMatchingAnswer.Text);


         cmdAddQuestion.Connection.Open();
         cmdAddQuestion.ExecuteNonQuery();

         if (chkMultipleChoiceAnswer.Checked)
         {
            Session["ChoiceID"] = Convert.ToInt32(cmdAddQuestion.Parameters["v_ChoiceID"].Value);
         }

         cmdAddQuestion.Connection.Close();

         grdAddMatchingQuestion.DataBind();
         txtAddMatchingAnswer.Text = string.Empty;
         txtAddMatchingQuestion.Text = string.Empty;
      }

      protected void btnNewMultipleChoice_Click(object sender, EventArgs e)
      {
         OracleCommand cmdAddQuestion = new OracleCommand(@"
BEGIN
  :v_ChoiceID := QUESTIONS_MULTIPLE_CHOICE_BODY.add(
    p_QuestionID => :p_QuestionID,
    p_ChoiceText => :p_ChoiceText);
END;",
         connectionString);
         cmdAddQuestion.Parameters.AddWithValue("p_QuestionID", Session["QuestionID"]);
         cmdAddQuestion.Parameters.AddWithValue("p_ChoiceText", txtMultipleChoiceBody.Text);
         cmdAddQuestion.Parameters.AddWithValue("v_ChoiceID", OracleType.Int32).Direction = System.Data.ParameterDirection.Output;


         cmdAddQuestion.Connection.Open();
         cmdAddQuestion.ExecuteNonQuery();

         if (chkMultipleChoiceAnswer.Checked)
         {
            Session["ChoiceID"] = Convert.ToInt32(cmdAddQuestion.Parameters["v_ChoiceID"].Value);
         }

         cmdAddQuestion.Connection.Close();

         grdMultipleChoiceBody.DataBind();
         txtMultipleChoiceBody.Text = string.Empty;
         chkMultipleChoiceAnswer.Checked = false;
      }

      protected void hideInputs()
      {
         tblAddEssay.Visible = false;
         tblAddMultipleChoice.Visible = false;
         tblAddShortAnswer.Visible = false;
         tblAddTrueFalse.Visible = false;
         tblMatchingSection.Visible = false;
         grdAddMatchingQuestion.Visible = false;
         grdMultipleChoiceBody.Visible = false;
         btnAddQuestion.Visible = false;

         // Matching Section
         tblMatchingSection.Visible = false;
         grdAddMatchingQuestion.Visible = false;
      }

      protected void lstQuestionDisplay_ItemUpdating(object sender, ListViewUpdateEventArgs e)
      {
         ListView lstView = (ListView)sender;
         int questionID = Convert.ToInt32(((HiddenField)lstView.Items[e.ItemIndex].FindControl("hdnEditQuestionID")).Value);
         string questionType = ((HiddenField)lstView.Items[e.ItemIndex].FindControl("hdnEditQuestionType")).Value;
         TextBox weight = (TextBox)lstView.EditItem.FindControl("txtEditWeight");
         TextBox testOrder = (TextBox)lstView.EditItem.FindControl("txtEditTestOrder");
         OracleCommand cmdEditQuestion = new OracleCommand();

         switch (questionType)
         {
            case "E":
               cmdEditQuestion = new OracleCommand(@"
BEGIN
  QUESTIONS.change(
    p_QuestionID => :p_QuestionID,
    p_TestOrder  => :p_TestOrder,
    p_Weight     => :p_Weight);

  QUESTIONS_ESSAY.change(
    p_QuestionID   => :p_QuestionID,
    p_QuestionText => :p_QuestionText);
END;", connectionString);
               cmdEditQuestion.Parameters.AddWithValue("p_QuestionID", questionID);
               cmdEditQuestion.Parameters.AddWithValue("p_TestOrder", testOrder.Text);
               cmdEditQuestion.Parameters.AddWithValue("p_Weight", weight.Text);
               cmdEditQuestion.Parameters.AddWithValue("p_QuestionText", ((TextBox)lstView.EditItem.FindControl("txtEditEQuestion")).Text);
               break;
            case "M":
               cmdEditQuestion = new OracleCommand(@"
BEGIN
  QUESTIONS.change(
    p_QuestionID => :p_QuestionID,
    p_TestOrder  => :p_TestOrder,
    p_Weight     => :p_Weight);

  QUESTIONS_MATCHING.change(
    p_QuestionID   => :p_QuestionID,
    p_QuestionText => :p_QuestionText);
END;", connectionString);
               cmdEditQuestion.Parameters.AddWithValue("p_QuestionID", questionID);
               cmdEditQuestion.Parameters.AddWithValue("p_TestOrder", testOrder.Text);
               cmdEditQuestion.Parameters.AddWithValue("p_Weight", weight.Text);
               cmdEditQuestion.Parameters.AddWithValue("p_QuestionText", ((TextBox)lstView.EditItem.FindControl("txtEditMQuestion")).Text);
               break;
            case "TF":
               cmdEditQuestion = new OracleCommand(@"
BEGIN
  QUESTIONS.change(
    p_QuestionID => :p_QuestionID,
    p_TestOrder  => :p_TestOrder,
    p_Weight     => :p_Weight);

  QUESTIONS_TRUE_FALSE.change(
    p_QuestionID   => :p_QuestionID,
    p_QuestionText => :p_QuestionText,
    P_Answer       => :p_Answer);
END;", connectionString);
               cmdEditQuestion.Parameters.AddWithValue("p_QuestionID", questionID);
               cmdEditQuestion.Parameters.AddWithValue("p_TestOrder", testOrder.Text);
               cmdEditQuestion.Parameters.AddWithValue("p_Weight", weight.Text);
               cmdEditQuestion.Parameters.AddWithValue("p_QuestionText", ((TextBox)lstView.EditItem.FindControl("txtEditTFQuestion")).Text);
               cmdEditQuestion.Parameters.AddWithValue("p_Answer", ((DropDownList)lstView.EditItem.FindControl("ddlEditTFAnswer")).SelectedValue);
               break;
         }

         cmdEditQuestion.Connection.Open();
         cmdEditQuestion.ExecuteNonQuery();
         cmdEditQuestion.Connection.Close();

         e.Cancel = true;
         lstView.EditIndex = -1;
         lstView.DataBind();
      }

      protected void grdEditMQuestion_RowCommand(object sender, GridViewCommandEventArgs e)
      {
         ListView lstView = lstQuestionDisplay;
         GridView grdView = (GridView)sender;
         SqlDataSource sqlSource = (SqlDataSource)lstView.EditItem.FindControl("sqlEditMQuestion");
         switch (e.CommandName)
         {
            case "Add":
               OracleCommand cmdEditQuestion = new OracleCommand(@"
 BEGIN
     QUESTIONS_MATCHING_BODY.add(
     p_QuestionID   => :p_QuestionID,
     p_QuestionText => :p_QuestionText,
     P_Answer       => :p_Answer);
 END;", connectionString);
               cmdEditQuestion.Parameters.AddWithValue("p_QuestionID", Convert.ToInt32(((HiddenField)lstView.Items[lstView.EditIndex].FindControl("hdnEditQuestionID")).Value));
               cmdEditQuestion.Parameters.AddWithValue("p_QuestionText", ((TextBox)grdView.FooterRow.FindControl("txtInsEditMQuestion")).Text);
               cmdEditQuestion.Parameters.AddWithValue("p_Answer", ((TextBox)grdView.FooterRow.FindControl("txtInsEditMAnswer")).Text);

               cmdEditQuestion.Connection.Open();
               cmdEditQuestion.ExecuteNonQuery();
               cmdEditQuestion.Connection.Close();
               grdView.DataBind();

               break;
         }
      }
   }
}