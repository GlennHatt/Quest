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
   public partial class teacherQuestionCreation : System.Web.UI.Page
   {
        // Global Variables
        bool showAddedQuestion;
      
      string questionType; // The questions type, should be 'E', 'M', 'MC', 'SA', or 'TF'.
      OracleConnection connectionString = new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString);

      /***********************************************************************/
      /*                              Page Load                              */
      /***********************************************************************/
      protected void Page_Load(object sender, EventArgs e)
      {
         if (!IsPostBack)
         {
            if (Session["Test_ID"] == null)
            {
               Response.Redirect("~/Pages/teacherTestCreation.aspx");
            }

            Session["QuestionID"] = null; // Destroy stale session variables.
            hideInputs();
         } else
         {
            questionType = rblAddType.SelectedValue;
         }
            if (Session["showAddedQuestion"] != null)
                showAddedQuestion = (bool)Session["showAddedQuestion"];
            else
                showAddedQuestion = false;

            if (showAddedQuestion == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                "toastr_message",
                "toastr.success('A Question Has Been Added', 'Success!')", true);
                Session["showAddedQuestion"] = null;
                showAddedQuestion = false;
            }
        }

      /***********************************************************************/
      /*                              Functionality                          */
      /***********************************************************************/
      protected void hideInputs()
      {
         tblAddEssay.Visible = false;
         cardEssay.Visible = false;
         tblAddMultipleChoice.Visible = false;
         cardMultipleChoice.Visible = false;
         tblAddShortAnswer.Visible = false;
         cardShortAnswer.Visible = false;
         tblAddTrueFalse.Visible = false;
         cardTrueFalse.Visible = false;
         tblMatchingSection.Visible = false;
         cardMatching.Visible = false;
         grdAddMatchingQuestion.Visible = false;
         cardAddedMatching.Visible = false;
         grdMultipleChoiceBody.Visible = false;
         cardAddedMultiple.Visible = false;
         btnAddQuestion.Visible = false;
         cardMultipleChoiceChoice.Visible = false;

         // Matching Section
         tblMatchingSection.Visible = false;
         grdAddMatchingQuestion.Visible = false;

            // Weight
            cardPoints.Visible = false;
      }

      /***********************************************************************/
      /*                              Events                                 */
      /***********************************************************************/

      /****************************/
      /* Question Creation Events */
      /****************************/
      protected void rblAddType_SelectedIndexChanged(object sender, EventArgs e)
      {
            hideInputs();
         switch (questionType)
         {
            case "E":
               tblAddEssay.Visible = true;
               cardEssay.Visible = true;
               break;
            case "M":
               tblMatchingSection.Visible = true;
               grdAddMatchingQuestion.Visible = true;
               cardMatching.Visible = true;
               break;
            case "MC":
               tblAddMultipleChoice.Visible = true;
               grdMultipleChoiceBody.Visible = true;
               cardMultipleChoice.Visible = true;
               break;
            case "SA":
               tblAddShortAnswer.Visible = true;
               cardShortAnswer.Visible = true;
               break;
            case "TF":
               tblAddTrueFalse.Visible = true;
               rblAddTFAnswer.Visible = true;
               cardTrueFalse.Visible = true;
               break;
         }
            cardPoints.Visible = true;
         btnAddQuestion.Visible = true;
      }

      protected void btnAddMatchingQuestion_Click(object sender, EventArgs e)
      {
         cardAddedMatching.Visible = true;
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
         cmdAddQuestion.Connection.Close();

         grdAddMatchingQuestion.DataBind();
         txtAddMatchingAnswer.Text = string.Empty;
         txtAddMatchingQuestion.Text = string.Empty;
      }

      protected void btnNewMultipleChoice_Click(object sender, EventArgs e)
      {
         cardAddedMultiple.Visible = true;
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
            OracleCommand cmdChangeChoice = new OracleCommand(@"
 BEGIN
   QUESTIONS_MULTIPLE_CHOICE.change_answer(
    p_QuestionID => :p_QuestionID,
    p_ChoiceID   => :p_ChoiceID);
 END;",
               connectionString);
                cmdChangeChoice.Parameters.AddWithValue("p_QuestionID", Session["QuestionID"]);
                cmdChangeChoice.Parameters.AddWithValue("p_ChoiceID", Session["ChoiceID"]);
                cmdChangeChoice.ExecuteNonQuery();
                cmdChangeChoice.Connection.Close();
                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            }

            cmdAddQuestion.Connection.Close();
            grdMultipleChoiceBody.Visible = true;
         grdMultipleChoiceBody.DataBind();
         txtMultipleChoiceBody.Text = string.Empty;
         chkMultipleChoiceAnswer.Checked = false;
      }

      protected void btnAddQuestion_Click(object sender, EventArgs e)
      {
            //showAddedQuestion = true;
            //Session["showAddedQuestion"] = true;
            //Response.Redirect(Request.RawUrl); // to ensure message always shows up

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
                connectionString);
                cmdAddQuestion.Parameters.AddWithValue("p_TestID", Session["Test_ID"]);
                cmdAddQuestion.Parameters.AddWithValue("p_Weight", txtAddWeight.Text);
                cmdAddQuestion.Parameters.AddWithValue("p_Type", questionType);
                cmdAddQuestion.Parameters.AddWithValue("v_QuestionID", OracleType.Int32).Direction = System.Data.ParameterDirection.Output;
                cmdAddQuestion.Connection.Open();
                cmdAddQuestion.ExecuteNonQuery();

                Session["QuestionID"] = Convert.ToInt32(cmdAddQuestion.Parameters["v_QuestionID"].Value);

                cmdAddQuestion.Connection.Close();
            }
            else
            {
                cmdAddQuestion = new OracleCommand(@"
 BEGIN
   QUESTIONS.change(
     p_QuestionID  => :p_QuestionID,
     p_Weight      => :p_Weight,
     p_Type        => :p_Type,
     p_TestOrder   => :p_TestOrder);
 END;",
                connectionString);
                cmdAddQuestion.Parameters.AddWithValue("p_QuestionID", Session["QuestionID"]);
                cmdAddQuestion.Parameters.AddWithValue("p_Weight", txtAddWeight.Text);
                cmdAddQuestion.Parameters.AddWithValue("p_Type", questionType);
                cmdAddQuestion.Parameters.AddWithValue("p_TestOrder", "1");

                cmdAddQuestion.Connection.Open();
                cmdAddQuestion.ExecuteNonQuery();
                cmdAddQuestion.Connection.Close();
            }

            hideInputs();
            OracleCommand cmdAddQuestionType = new OracleCommand();

         switch (questionType)
         {
            case "E":
                    cmdAddQuestionType = new OracleCommand(@"
 BEGIN
   QUESTIONS_ESSAY.add(
     p_QuestionID   => :p_QuestionID,
     p_QuestionText => :p_QuestionText);
 END;",
               connectionString);
                    cmdAddQuestionType.Parameters.AddWithValue("p_QuestionID", Session["QuestionID"]);
                    cmdAddQuestionType.Parameters.AddWithValue("p_QuestionText", txtAddEssayText.Text);
               break;
            case "M":
                    cmdAddQuestionType = new OracleCommand(@"
 BEGIN
   QUESTIONS_MATCHING.add(
    p_QuestionID   => :p_QuestionID,
    p_QuestionText => :p_QuestionText);
 END;",
               connectionString);
                    cmdAddQuestionType.Parameters.AddWithValue("p_QuestionID", Session["QuestionID"]);
                    cmdAddQuestionType.Parameters.AddWithValue("p_QuestionText", txtAddMatchingText.Text);
                    cardMultipleChoiceChoice.Visible = true;
               break;
            case "MC":

                    cmdAddQuestionType = new OracleCommand(@"
 BEGIN
   QUESTIONS_MULTIPLE_CHOICE.add(
     p_QuestionID   => :p_QuestionID,
     P_ChoiceID     => null,
     p_QuestionText => :p_QuestionText);
 END;",
               connectionString);
                    cmdAddQuestionType.Parameters.AddWithValue("p_QuestionID", Session["QuestionID"]);
                    //cmdAddQuestionType.Parameters.AddWithValue("P_ChoiceID", Session["ChoiceID"]);
                    cmdAddQuestionType.Parameters.AddWithValue("p_QuestionText", txtAddMultipleChoiceQuestion.Text);
                    cardMultipleChoiceChoice.Visible = true;
                    // This is where multiple choice questions pop up
               break;
            case "SA":
                    cmdAddQuestionType = new OracleCommand(@"
 BEGIN
   QUESTIONS_SHORT_ANSWER.add(
     p_QuestionID => :P_QuestionID,
     p_BeforeText => :P_BeforeText,
     p_AfterText  => :P_AfterText,
     P_Answer     => :P_Answer);
 END;",
               connectionString);
                    cmdAddQuestionType.Parameters.AddWithValue("p_QuestionID", Session["QuestionID"]);
                    cmdAddQuestionType.Parameters.AddWithValue("P_BeforeText", txtBeforeText.Text);
                    cmdAddQuestionType.Parameters.AddWithValue("P_Answer", txtAnswerText.Text);
                    cmdAddQuestionType.Parameters.AddWithValue("P_AfterText", txtAfterText.Text);
               break;
            case "TF":
                    cmdAddQuestionType = new OracleCommand(@"
 BEGIN
   QUESTIONS_TRUE_FALSE.add(
     p_QuestionID   => :p_QuestionID,
     p_QuestionText => :p_QuestionText,
     P_Answer       => :p_Answer);
 END;",
               connectionString);
                    cmdAddQuestionType.Parameters.AddWithValue("p_QuestionID", Session["QuestionID"]);
                    cmdAddQuestionType.Parameters.AddWithValue("p_QuestionText", txtAddTFQuestion.Text);
                    cmdAddQuestionType.Parameters.AddWithValue("p_Answer", rblAddTFAnswer.SelectedValue);
               break;
         }

            cmdAddQuestionType.Connection.Open();
            cmdAddQuestionType.ExecuteNonQuery();
            cmdAddQuestionType.Connection.Close();

         lstQuestionDisplay.DataBind();

         rblAddType.SelectedIndex = -1;
        if (questionType != "MC")
        {
            hideInputs();
            Session["QuestionID"] = null;
        }
      }

      /**************************/
      /* Question Update Events */
      /**************************/
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
    p_Weight     => :p_Weight,
    p_Type       => :p_Type);

  QUESTIONS_ESSAY.change(
    p_QuestionID   => :p_QuestionID,
    p_QuestionText => :p_QuestionText);
END;", connectionString);
               cmdEditQuestion.Parameters.AddWithValue("p_QuestionID", questionID);
               cmdEditQuestion.Parameters.AddWithValue("p_TestOrder", testOrder.Text);
               cmdEditQuestion.Parameters.AddWithValue("p_Weight", weight.Text);
               cmdEditQuestion.Parameters.AddWithValue("p_Type", ((HiddenField)lstView.EditItem.FindControl("hdnEditQuestionType")).Value);
               cmdEditQuestion.Parameters.AddWithValue("p_QuestionText", ((TextBox)lstView.EditItem.FindControl("txtEditEQuestion")).Text);
               break;
            case "M":
               cmdEditQuestion = new OracleCommand(@"
BEGIN
  QUESTIONS.change(
    p_QuestionID => :p_QuestionID,
    p_TestOrder  => :p_TestOrder,
    p_Weight     => :p_Weight,
    p_Type       => :p_Type);

  QUESTIONS_MATCHING.change(
    p_QuestionID   => :p_QuestionID,
    p_QuestionText => :p_QuestionText);
END;", connectionString);
               cmdEditQuestion.Parameters.AddWithValue("p_QuestionID", questionID);
               cmdEditQuestion.Parameters.AddWithValue("p_TestOrder", testOrder.Text);
               cmdEditQuestion.Parameters.AddWithValue("p_Weight", weight.Text);
               cmdEditQuestion.Parameters.AddWithValue("p_Type", ((HiddenField)lstView.EditItem.FindControl("hdnEditQuestionType")).Value);
               cmdEditQuestion.Parameters.AddWithValue("p_QuestionText", ((TextBox)lstView.EditItem.FindControl("txtEditMQuestion")).Text);
               break;
            case "MC":
               cmdEditQuestion = new OracleCommand(@"
BEGIN
  QUESTIONS.change(
    p_QuestionID => :p_QuestionID,
    p_TestOrder  => :p_TestOrder,
    p_Weight     => :p_Weight,
    p_Type       => :p_Type);

  QUESTIONS_MULTIPLE_CHOICE.change(
    p_QuestionID   => :p_QuestionID,
    p_QuestionText => :p_QuestionText);
END;", connectionString);
               cmdEditQuestion.Parameters.AddWithValue("p_QuestionID", questionID);
               cmdEditQuestion.Parameters.AddWithValue("p_TestOrder", testOrder.Text);
               cmdEditQuestion.Parameters.AddWithValue("p_Weight", weight.Text);
               cmdEditQuestion.Parameters.AddWithValue("p_Type", ((HiddenField)lstView.EditItem.FindControl("hdnEditQuestionType")).Value);
               cmdEditQuestion.Parameters.AddWithValue("p_QuestionText", ((TextBox)lstView.EditItem.FindControl("txtEditMQuestion")).Text);
               break;
            case "SA":
               cmdEditQuestion = new OracleCommand(@"
BEGIN
  QUESTIONS.change(
    p_QuestionID => :p_QuestionID,
    p_TestOrder  => :p_TestOrder,
    p_Weight     => :p_Weight,
    p_Type       => :p_Type);

  QUESTIONS_SHORT_ANSWER.change(
    p_QuestionID   => :p_QuestionID,
    p_BeforeText   => :p_BeforeText,
    p_AfterText    => :p_AfterText,
    p_Answer       => :p_Answer);
END;", connectionString);
               cmdEditQuestion.Parameters.AddWithValue("p_QuestionID", questionID);
               cmdEditQuestion.Parameters.AddWithValue("p_TestOrder", testOrder.Text);
               cmdEditQuestion.Parameters.AddWithValue("p_Weight", weight.Text);
               cmdEditQuestion.Parameters.AddWithValue("p_Type", ((HiddenField)lstView.EditItem.FindControl("hdnEditQuestionType")).Value);
               cmdEditQuestion.Parameters.AddWithValue("p_BeforeText", ((TextBox)lstView.EditItem.FindControl("txtEditSABeforeText")).Text);
               cmdEditQuestion.Parameters.AddWithValue("p_AfterText", ((TextBox)lstView.EditItem.FindControl("txtEditSAAfterText")).Text);
               cmdEditQuestion.Parameters.AddWithValue("p_Answer", ((TextBox)lstView.EditItem.FindControl("txtEditSAAnswerText")).Text);

               break;
            case "TF":
               cmdEditQuestion = new OracleCommand(@"
BEGIN
  QUESTIONS.change(
    p_QuestionID => :p_QuestionID,
    p_TestOrder  => :p_TestOrder,
    p_Weight     => :p_Weight,
    p_Type       => :p_Type);

  QUESTIONS_TRUE_FALSE.change(
    p_QuestionID   => :p_QuestionID,
    p_QuestionText => :p_QuestionText,
    P_Answer       => :p_Answer);
END;", connectionString);
               cmdEditQuestion.Parameters.AddWithValue("p_QuestionID", questionID);
               cmdEditQuestion.Parameters.AddWithValue("p_TestOrder", testOrder.Text);
               cmdEditQuestion.Parameters.AddWithValue("p_Weight", weight.Text);
               cmdEditQuestion.Parameters.AddWithValue("p_Type", ((HiddenField)lstView.EditItem.FindControl("hdnEditQuestionType")).Value);
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

      protected void grdEditMChoice_RowCommand(object sender, GridViewCommandEventArgs e)
      {
         OracleCommand cmdMCEdit = new OracleCommand();
         ListView lstView = lstQuestionDisplay;
         GridView grdSender = (GridView)sender;


         switch (e.CommandName)
         {
            case "add":
               cmdMCEdit = new OracleCommand(@"
BEGIN
  :v_ChoiceID := QUESTIONS_MULTIPLE_CHOICE_BODY.add(
    p_QuestionID => :p_QuestionID,
    p_ChoiceText => :p_ChoiceText);
END;", connectionString);
               cmdMCEdit.Parameters.AddWithValue("p_QuestionID", Convert.ToInt32(((HiddenField)lstView.Items[lstView.EditIndex].FindControl("hdnEditQuestionID")).Value));
               cmdMCEdit.Parameters.AddWithValue("p_ChoiceText", ((TextBox)grdSender.FooterRow.FindControl("txtEditMCAddChoiceText")).Text);
               cmdMCEdit.Parameters.AddWithValue("v_ChoiceID", OracleType.Int32).Direction = System.Data.ParameterDirection.Output;

               cmdMCEdit.Connection.Open();
               cmdMCEdit.ExecuteNonQuery();

               string choiceID = cmdMCEdit.Parameters["v_ChoiceID"].Value.ToString();

               cmdMCEdit.Connection.Close();

               if (((DropDownList)grdSender.FooterRow.FindControl("ddlEditMCAddAnswer")).SelectedValue == "Y")
               {

                  cmdMCEdit = new OracleCommand(@"
BEGIN
  QUESTIONS_MULTIPLE_CHOICE.change_answer(
    p_QuestionID => :p_QuestionID,
    p_ChoiceID   => :p_ChoiceID);
END;", connectionString);
                  cmdMCEdit.Parameters.AddWithValue("p_QuestionID", Convert.ToInt32(((HiddenField)lstView.Items[lstView.EditIndex].FindControl("hdnEditQuestionID")).Value));
                  cmdMCEdit.Parameters.AddWithValue("p_ChoiceID", choiceID);

                  cmdMCEdit.Connection.Open();
                  cmdMCEdit.ExecuteNonQuery();
                  cmdMCEdit.Connection.Close();
               }
               break;
            case "update":
               cmdMCEdit = new OracleCommand(@"
BEGIN
  QUESTIONS_MULTIPLE_CHOICE_BODY.change(
    p_ChoiceID   => :p_ChoiceID,
    p_ChoiceText => :p_ChoiceText,
    p_SetOrder   => :p_SetOrder);
END;", connectionString);
               cmdMCEdit.Parameters.AddWithValue("p_ChoiceID", ((HiddenField)grdSender.Rows[grdSender.EditIndex].FindControl("hdnEditMCChoiceID")).Value);
               cmdMCEdit.Parameters.AddWithValue("p_ChoiceText", ((TextBox)grdSender.Rows[grdSender.EditIndex].FindControl("txtEditMCEditChoiceText")).Text);
               cmdMCEdit.Parameters.AddWithValue("p_SetOrder", ((TextBox)grdSender.Rows[grdSender.EditIndex].FindControl("txtEditMCEditSetOrder")).Text);

               cmdMCEdit.Connection.Open();
               cmdMCEdit.ExecuteNonQuery();
               cmdMCEdit.Connection.Close();

               if (((DropDownList)grdSender.FooterRow.FindControl("ddlEditMCAddAnswer")).SelectedValue == "Y")
               {

                  cmdMCEdit = new OracleCommand(@"
BEGIN
  QUESTIONS_MULTIPLE_CHOICE.change_answer(
    p_QuestionID => :p_QuestionID,
    p_ChoiceID   => :p_ChoiceID);
END;", connectionString);
                  cmdMCEdit.Parameters.AddWithValue("p_QuestionID", Convert.ToInt32(((HiddenField)lstView.Items[lstView.EditIndex].FindControl("hdnEditQuestionID")).Value));
                  cmdMCEdit.Parameters.AddWithValue("p_ChoiceID", ((HiddenField)grdSender.Rows[grdSender.EditIndex].FindControl("hdnEditMCChoiceID")).Value);

                  cmdMCEdit.Connection.Open();
                  cmdMCEdit.ExecuteNonQuery();
                  cmdMCEdit.Connection.Close();
               }

               grdSender.EditIndex = -1;
               //e.handled = true;
               break;
         }
         grdSender.DataBind();
      }

      protected void lstQuestionDisplay_ItemEditing(object sender, ListViewEditEventArgs e)
      {
         //string questionType = ((HiddenField)lstQuestionDisplay.Items[e.NewEditIndex].FindControl("hdnEditQuestionType")).Value;

         //switch (questionType)
         //{
         //    case "E":
         //        ((Label)lstQuestionDisplay.EditItem.FindControl("lblDispSAAnswer")).Visible = false;
         //        ((Label)lstQuestionDisplay.EditItem.FindControl("lblSAAnswer")).Visible = false;
         //        break;
         //    case "M":
         //        break;
         //    case "MC":
         //        break;
         //    case "SA":
         //        break;
         //    case "TF":
         //        break;
         //}
      }

      protected void lstQuestionDisplay_ItemDataBound(object sender, ListViewItemEventArgs e)
      {
         // the 3 questions
         //essay 
         // matching 
         // multiple choice 
         string questionType = "NA";


         if (lstQuestionDisplay.EditIndex != e.Item.DataItemIndex)
            questionType = ((HiddenField)e.Item.FindControl("hdnQuestionType")).Value;

         switch (questionType)
         {
            case "E":
               //((Table)e.Item.FindControl("tblMQuestion")).Visible = false;
               (e.Item.FindControl("tblSAQuestion")).Visible = false;
               break;
            case "M":
               (e.Item.FindControl("tblSAQuestion")).Visible = false;
               break;
            case "MC":
               //((Table)e.Item.FindControl("tblMQuestion")).Visible = false;
               (e.Item.FindControl("tblSAQuestion")).Visible = false;
               break;
            case "SA":
               //((Table)e.Item.FindControl("tblMQuestion")).Visible = false;
               break;
            case "TF":
               //((Table)e.Item.FindControl("tblMQuestion")).Visible = false;
               (e.Item.FindControl("tblSAQuestion")).Visible = false;
               break;
         }
      }

        protected void btnSaveMCBody_Click(object sender, EventArgs e)
        {
            hideInputs();
            Session["QuestionID"] = null;
        }

        protected void grdDispMQuestion_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCellCollection cell = e.Row.Cells;
                GridViewRow row = e.Row;

                //row.Attributes.Add("class", "header");
                cell[0].Attributes.Add("data-title", "Question");
                cell[1].Attributes.Add("data-title", "Answer");
            }
        }

        protected void grdMChoice_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCellCollection cell = e.Row.Cells;
                GridViewRow row = e.Row;

                //row.Attributes.Add("class", "header");
                cell[0].Attributes.Add("data-title", "Answer");
                cell[1].Attributes.Add("data-title", "Choice");
                cell[2].Attributes.Add("data-title", "Set Order");
            }
        }

        protected void grdEditMChoice_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCellCollection cell = e.Row.Cells;
                GridViewRow row = e.Row;

                cell[0].Attributes.Add("data-title", "Edit/Delete");
                cell[1].Attributes.Add("data-title", "Answer");
                cell[2].Attributes.Add("data-title", "Text");
                cell[3].Attributes.Add("data-title", "Set Order");
            }
        }

        protected void grdMultipleChoiceBody_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCellCollection cell = e.Row.Cells;
                GridViewRow row = e.Row;

                cell[0].Attributes.Add("data-title", "Question");
                cell[1].Attributes.Add("data-title", "Text");
                cell[2].Attributes.Add("data-title", "Set Order");
            }
        }

        protected void finishTest_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/teacherDashboard.aspx");
        }




        //protected void btnPointValue_Click(object sender, EventArgs e)
        //{
        //    cardQuestionType.Visible = true;
        //}
    }
}