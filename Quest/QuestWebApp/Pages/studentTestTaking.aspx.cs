﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OracleClient;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QuestWebApp.App_Code;
using System.Web.UI.HtmlControls;
using System.Web.Services;

namespace QuestWebApp.Pages
{
   public partial class studentTestTaking : System.Web.UI.Page
   {
      bool cardsLarge;
      int questionCount = 0;
      List<bool> testProgress = new List<bool>();
      OracleConnection connectionString = new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString); // Connection String.

      protected void Page_Load(object sender, EventArgs e)
      {
         int timerTime = 0;
         if (!IsPostBack)
         {
            if (Session["TestID"] == null)
            {
               Session["TestID"] = 23;
               Session["UserID"] = 1;
            }

            if (Session["cardsLarge"] == null)
               Session["cardsLarge"] = false;

            OracleCommand cmdGetTime = new OracleCommand(@"
SELECT time_limit
  FROM test
 WHERE test_id = :p_TestID", connectionString);
            cmdGetTime.Parameters.AddWithValue("p_TestID", Session["TestID"]);

            cmdGetTime.Connection.Open();
            OracleDataReader reader = cmdGetTime.ExecuteReader();
            try
            {
               while (reader.Read())
               {
                  timerTime = Convert.ToInt32(reader.GetValue(0));
                  lblTimeLimit.Text = timerTime.ToString();
               }
            } finally
            {
               reader.Close();
            }
            cmdGetTime.Connection.Close();
         }


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
         string questionID;
         string questionType;
         OracleCommand cmdGradeQuestion;

         cmdGradeQuestion = new OracleCommand(@"
BEGIN
    :v_TestTakenID := TESTS_TAKEN.add(
    p_StudentID => :p_StudentID,
    p_TestID    => :p_TestID);
END;", connectionString);
         cmdGradeQuestion.Parameters.AddWithValue("v_TestTakenID", OracleType.Int32).Direction = System.Data.ParameterDirection.Output;
         cmdGradeQuestion.Parameters.AddWithValue("p_StudentID", Session["UserID"]);
         cmdGradeQuestion.Parameters.AddWithValue("p_TestID", Session["TestID"]);

         cmdGradeQuestion.Connection.Open();
         cmdGradeQuestion.ExecuteNonQuery();

         Session["TestTakenID"] = Convert.ToInt32(cmdGradeQuestion.Parameters["v_TestTakenID"].Value);

         cmdGradeQuestion.Connection.Close();

         foreach (ListViewItem item in lstQuestions.Items)
         {
            questionID = ((HiddenField)item.FindControl("hdnQuestionID")).Value;
            questionType = ((HiddenField)item.FindControl("hdnQuestionType")).Value;

            switch (questionType)
            {
               case "E":
                  cmdGradeQuestion = new OracleCommand(@"
BEGIN
    QUESTIONS_ESSAY.grade_question(
    p_TestTakenID => :p_TestTakenID,
    p_QuestionID  => :p_QuestionID,
    p_Essay       => :p_Essay);
END;", connectionString);
                  cmdGradeQuestion.Parameters.AddWithValue("p_TestTakenID", Session["TestTakenID"]);
                  cmdGradeQuestion.Parameters.AddWithValue("p_QuestionID", questionID);
                  cmdGradeQuestion.Parameters.AddWithValue("p_Essay", ((TextBox)item.FindControl("txtEAnswer")).Text);

                  cmdGradeQuestion.Connection.Open();
                  cmdGradeQuestion.ExecuteNonQuery();
                  cmdGradeQuestion.Connection.Close();
                  break;
               case "M":
                  break;
               case "MC":
                  cmdGradeQuestion = new OracleCommand(@"
BEGIN
    QUESTIONS_MULTIPLE_CHOICE.grade_question(
    p_TestTakenID   => :p_TestTakenID,
    p_QuestionID    => :p_QuestionID,
    p_StudentAnswer => :p_ChoiceID);
END;", connectionString);
                  cmdGradeQuestion.Parameters.AddWithValue("p_TestTakenID", Session["TestTakenID"]);
                  cmdGradeQuestion.Parameters.AddWithValue("p_QuestionID", questionID);
                  cmdGradeQuestion.Parameters.AddWithValue("p_ChoiceID", ((RadioButtonList)item.FindControl("rblMCAnswer")).SelectedItem.Value);

                  cmdGradeQuestion.Connection.Open();
                  cmdGradeQuestion.ExecuteNonQuery();
                  cmdGradeQuestion.Connection.Close();
                  break;
               case "SA":
                  cmdGradeQuestion = new OracleCommand(@"
BEGIN
    QUESTIONS_SHORT_ANSWER.grade_question(
    p_TestTakenID   => :p_TestTakenID,
    p_QuestionID    => :p_QuestionID,
    p_StudentAnswer => :p_Answer);
END;", connectionString);
                  cmdGradeQuestion.Parameters.AddWithValue("p_TestTakenID", Session["TestTakenID"]);
                  cmdGradeQuestion.Parameters.AddWithValue("p_QuestionID", questionID);
                  cmdGradeQuestion.Parameters.AddWithValue("p_Answer", ((TextBox)item.FindControl("txtSAAnswer")).Text);

                  cmdGradeQuestion.Connection.Open();
                  cmdGradeQuestion.ExecuteNonQuery();
                  cmdGradeQuestion.Connection.Close();
                  break;
               case "TF":
                  cmdGradeQuestion = new OracleCommand(@"
BEGIN
    QUESTIONS_TRUE_FALSE.grade_question(
    p_TestTakenID => :p_TestTakenID,
    p_QuestionID  => :p_QuestionID,
    p_StudentAnswer => :p_Answer);
END;", connectionString);
                  cmdGradeQuestion.Parameters.AddWithValue("p_TestTakenID", Session["TestTakenID"]);
                  cmdGradeQuestion.Parameters.AddWithValue("p_QuestionID", questionID);
                  cmdGradeQuestion.Parameters.AddWithValue("p_Answer", ((RadioButtonList)item.FindControl("rblTFAnswer")).SelectedValue);

                  cmdGradeQuestion.Connection.Open();
                  cmdGradeQuestion.ExecuteNonQuery();
                  cmdGradeQuestion.Connection.Close();
                  break;
            }
         }

         cmdGradeQuestion = new OracleCommand(@"
BEGIN
    TESTS_TAKEN.updateGrade(p_TestTakenID => :p_TestTakenID);
END;", connectionString);
         cmdGradeQuestion.Parameters.AddWithValue("p_TestTakenID", Session["TestTakenID"]);

         cmdGradeQuestion.Connection.Open();
         cmdGradeQuestion.ExecuteNonQuery();
         cmdGradeQuestion.Connection.Close();

         Response.Redirect("pledgePage.aspx");

      }

      protected void lstQuestions_ItemDataBound(object sender, ListViewItemEventArgs e)
      {
         switch (((HiddenField)e.Item.FindControl("hdnQuestionType")).Value)
         {
            case "E":
               e.Item.FindControl("divMC").Visible = false;
               e.Item.FindControl("divSA").Visible = false;
               e.Item.FindControl("divTF").Visible = false;
               ((TextBox)e.Item.FindControl("txtEAnswer")).Attributes.Add("onchange", "questionChanged(" + ((Label)e.Item.FindControl("lblQuestionNum")).Text + ")");
               break;
            case "M":
               e.Item.FindControl("divE").Visible = false;
               e.Item.FindControl("divMC").Visible = false;
               e.Item.FindControl("divSA").Visible = false;
               e.Item.FindControl("divTF").Visible = false;
               break;
            case "MC":
               e.Item.FindControl("divE").Visible = false;
               e.Item.FindControl("divSA").Visible = false;
               e.Item.FindControl("divTF").Visible = false;
               break;
            case "SA":
               e.Item.FindControl("divE").Visible = false;
               e.Item.FindControl("divMC").Visible = false;
               e.Item.FindControl("divTF").Visible = false;
               break;
            case "TF":
               e.Item.FindControl("divE").Visible = false;
               e.Item.FindControl("divMC").Visible = false;
               e.Item.FindControl("divSA").Visible = false;
               break;
         }
         if (Session["cardsLarge"].ToString() == "true")
         {
            ((HtmlContainerControl)e.Item.FindControl("questionCard")).Attributes["class"] = "mdl-cell mdl-cell--12-col";
            //Session["cardsLarge"] = "false";
            btnLarge.Enabled = false;
            btnLarge.Attributes.Add("disabled", "true");
         } else
         {
            ((HtmlContainerControl)e.Item.FindControl("questionCard")).Attributes["class"] = "mdl-cell mdl-cell--6-col";
            //Session["cardsLarge"] = "true";
            btnSmall.Enabled = false;
            btnSmall.Attributes.Add("disabled", "true");
         }
         questionCount++;
      }

      protected void myTest_Click(object sender, EventArgs e)
      {

      }

      protected void btnSmall_Click(object sender, EventArgs e)
      {
         Session["cardsLarge"] = "false";
         Response.Redirect(Request.RawUrl);
         cardsLarge = false;
         btnLarge.Enabled = true;
         btnSmall.Enabled = false;

         btnLarge.Attributes.Add("disabled", "false");
         btnSmall.Attributes.Add("disabled", "true");
      }

      protected void btnLarge_Click(object sender, EventArgs e)
      {
         Session["cardsLarge"] = "true";
         Response.Redirect(Request.RawUrl);
         cardsLarge = true;
         btnLarge.Enabled = false;
         btnSmall.Enabled = true;
         btnLarge.Attributes.Add("disabled", "true");
         btnSmall.Attributes.Add("disabled", "false");
      }

      public void saveTest()
      {
         btnSubmitTest.Text = "it's working";
      }

      protected void btnSaveTest_Click(object sender, EventArgs e)
      {

      }

      protected void questionChanged(object sender, EventArgs e)
      {
         //ListViewItemEventArgs viewItems = (ListViewItemEventArgs)e;

         //Label questionNumLabel = (Label)viewItems.Item.FindControl("lblQuestionNum");
         //testProgress[(Convert.ToInt32(questionNumLabel.Text)) - 1] = true;

         //Page.ClientScript.RegisterStartupScript(this.GetType(), "setProgress", "setProgress()", true);
         //btnSaveTest.Text = "reached";
      }
   }
}