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
using System.Web.UI.HtmlControls;
using System.Web.Services;

namespace QuestWebApp.Pages
{
   public partial class studentTestTaking : System.Web.UI.Page
   {
      bool cardsLarge;
      public string time;
      int questionCount = 0;
      List<bool> testProgress = new List<bool>();
      OracleConnection connectionString = new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString); // Connection String.

      protected void Page_Load(object sender, EventArgs e)
      {
         int timerTime = 0;
         Session["TestID"] = 31;
         Session["UserID"] = 1;
         if (!IsPostBack)
         {
            if (Session["TestID"] == null)
            {
               Session["TestID"] = 31;
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

            restoreTest();
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
         OracleCommand cmdGradeQuestion;

         saveTest();
         
         // There is no TestTakenID session
         cmdGradeQuestion = new OracleCommand(@"
BEGIN
    TESTS_TAKEN.updateGrade(p_TestTakenID => :p_TestTakenID);
END;", connectionString);
         cmdGradeQuestion.Parameters.AddWithValue("p_TestTakenID", Session["TestTakenID"]);

         cmdGradeQuestion.Connection.Open();
         cmdGradeQuestion.ExecuteNonQuery();
         cmdGradeQuestion.Connection.Close();

         Response.Redirect("~/Pages/studentPledgePage.aspx");

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
               ((RadioButtonList)e.Item.FindControl("rblMCAnswer")).Attributes.Add("onchange", "questionChanged(" + ((Label)e.Item.FindControl("lblQuestionNum")).Text + ")");
               break;
            case "SA":
               e.Item.FindControl("divE").Visible = false;
               e.Item.FindControl("divMC").Visible = false;
               e.Item.FindControl("divTF").Visible = false;
               ((TextBox)e.Item.FindControl("txtSAAnswer")).Attributes.Add("onchange", "questionChanged(" + ((Label)e.Item.FindControl("lblQuestionNum")).Text + ")");
               break;
            case "TF":
               e.Item.FindControl("divE").Visible = false;
               e.Item.FindControl("divMC").Visible = false;
               e.Item.FindControl("divSA").Visible = false;
               ((RadioButtonList)e.Item.FindControl("rblTFAnswer")).Attributes.Add("onchange", "questionChanged(" + ((Label)e.Item.FindControl("lblQuestionNum")).Text + ")");
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
            hdnQuestionTotal.Value = questionCount.ToString();
      }

      protected void myTest_Click(object sender, EventArgs e)
      {

      }

      protected void btnSmall_Click(object sender, EventArgs e)
      {
         saveTest();
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
         saveTest();
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
         string questionID;
         string questionType;
         OracleCommand cmdGradeQuestion = new OracleCommand();


         if (Session["testTakenID"] == null)
         {
            cmdGradeQuestion = new OracleCommand(@"
BEGIN
    :v_TestTakenID := TESTS_TAKEN.add(
    p_StudentID => :p_StudentID,
    p_TestID    => :p_TestID,
    p_TimeLeft  => :p_TimeLeft);
END;", connectionString);
            cmdGradeQuestion.Parameters.AddWithValue("p_StudentID", Session["UserID"]);
            cmdGradeQuestion.Parameters.AddWithValue("p_TestID", Session["TestID"]);
            cmdGradeQuestion.Parameters.AddWithValue("p_TimeLeft", String.Empty);
            cmdGradeQuestion.Parameters.AddWithValue("v_TestTakenID", OracleType.Int32).Direction = System.Data.ParameterDirection.Output;

            cmdGradeQuestion.Connection.Open();
            cmdGradeQuestion.ExecuteNonQuery();

            Session["testTakenID"] = Convert.ToInt32(cmdGradeQuestion.Parameters["v_TestTakenID"].Value);

            cmdGradeQuestion.Connection.Close();
         }

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
                  cmdGradeQuestion.Parameters.AddWithValue("p_TestTakenID", Session["testTakenID"]);
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
                  cmdGradeQuestion.Parameters.AddWithValue("p_TestTakenID", Session["testTakenID"]);
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
                  cmdGradeQuestion.Parameters.AddWithValue("p_TestTakenID", Session["testTakenID"]);
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
                  cmdGradeQuestion.Parameters.AddWithValue("p_TestTakenID", Session["testTakenID"]);
                  cmdGradeQuestion.Parameters.AddWithValue("p_QuestionID", questionID);
                  cmdGradeQuestion.Parameters.AddWithValue("p_Answer", ((RadioButtonList)item.FindControl("rblTFAnswer")).SelectedValue);

                  cmdGradeQuestion.Connection.Open();
                  cmdGradeQuestion.ExecuteNonQuery();
                  cmdGradeQuestion.Connection.Close();
                  break;
            }
         }
      }

      protected void btnSaveTest_Click(object sender, EventArgs e)
      {
         saveTest();
         Response.Redirect("~/Pages/StudentDashboard.aspx");
      }

      protected void questionChanged(object sender, EventArgs e)
      {
         //ListViewItemEventArgs viewItems = (ListViewItemEventArgs)e;

         //Label questionNumLabel = (Label)viewItems.Item.FindControl("lblQuestionNum");
         //testProgress[(Convert.ToInt32(questionNumLabel.Text)) - 1] = true;

         //Page.ClientScript.RegisterStartupScript(this.GetType(), "setProgress", "setProgress()", true);
         //btnSaveTest.Text = "reached";
      }

      protected void restoreTest()
      {
         OracleCommand cmdRestoreTest = new OracleCommand();

         cmdRestoreTest = new OracleCommand(@"
  SELECT test_taken_id 
    FROM test_taken
         JOIN enrollment USING (enrollment_id)
   WHERE test_id    = :p_TestID
     AND student_id = :p_StudentID", connectionString);
         cmdRestoreTest.Parameters.AddWithValue("p_StudentID", Session["UserID"]);
         cmdRestoreTest.Parameters.AddWithValue("p_TestID", Session["TestID"]);

         cmdRestoreTest.Connection.Open();
         OracleDataReader reader = cmdRestoreTest.ExecuteReader();

         if (reader.Read())
         {
            Session["testTakenID"] = int.Parse(reader.GetValue(0).ToString());
         }
         cmdRestoreTest.Connection.Close();
      }
   }
}