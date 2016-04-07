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

namespace QuestWebApp.Pages
{
   public partial class takingTestTest : System.Web.UI.Page
   {
      OracleConnection connectionString = new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString); // Connection String.

      protected void Page_Load(object sender, EventArgs e)
      {
         if (!IsPostBack)
         {
            if (Session["TestID"] == null)
            {
               Session["TestID"] = 1;
               Session["UserID"] = 1;
            }

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
                  lblTimeLimit.Text = reader.GetValue(0).ToString();
               }
            }
            finally
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
         int TestTakenID;
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

         TestTakenID = Convert.ToInt32(cmdGradeQuestion.Parameters["v_TestTakenID"].Value);

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
                  cmdGradeQuestion.Parameters.AddWithValue("p_TestTakenID", TestTakenID);
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
                  cmdGradeQuestion.Parameters.AddWithValue("p_TestTakenID", TestTakenID);
                  cmdGradeQuestion.Parameters.AddWithValue("p_QuestionID", questionID);
                  cmdGradeQuestion.Parameters.AddWithValue("p_ChoiceID", ((RadioButtonList)item.FindControl("rblMCAnswer")).SelectedValue);

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
                  cmdGradeQuestion.Parameters.AddWithValue("p_TestTakenID", TestTakenID);
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
                  cmdGradeQuestion.Parameters.AddWithValue("p_TestTakenID", TestTakenID);
                  cmdGradeQuestion.Parameters.AddWithValue("p_QuestionID", questionID);
                  cmdGradeQuestion.Parameters.AddWithValue("p_Answer", ((RadioButtonList)item.FindControl("rblTFAnswer")).SelectedValue);

                  cmdGradeQuestion.Connection.Open();
                  cmdGradeQuestion.ExecuteNonQuery();
                  cmdGradeQuestion.Connection.Close();
                  break;
            }
         }

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
      }
   }
}