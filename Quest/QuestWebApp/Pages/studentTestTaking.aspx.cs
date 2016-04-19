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
  SELECT test_taken_id 
    FROM test_taken
         JOIN enrollment USING (enrollment_id)
   WHERE test_id    = :p_TestID
     AND student_id = :p_StudentID", connectionString);
            cmdGetTime.Parameters.AddWithValue("p_StudentID", Session["UserID"]);
            cmdGetTime.Parameters.AddWithValue("p_TestID", Session["TestID"]);

            cmdGetTime.Connection.Open();
            OracleDataReader reader = cmdGetTime.ExecuteReader();
            try
            {
               if (reader.Read())
               {
                  try
                  {
                     Session["testTakenID"] = int.Parse(reader.GetValue(0).ToString());
                  }
                  catch
                  {
                     Session["testTakenID"] = null;
                  }
               }
            }
            finally
            {
               reader.Close();
            }
            cmdGetTime.Connection.Close();

            if (Session["testTakenID"] == null)
            {
               cmdGetTime = new OracleCommand(@"
SELECT time_limit
  FROM test
 WHERE test_id = :p_TestID", connectionString);
               cmdGetTime.Parameters.AddWithValue("p_TestID", Session["TestID"]);

               cmdGetTime.Connection.Open();
               reader = cmdGetTime.ExecuteReader();
               try
               {
                  while (reader.Read())
                  {
                     timerTime = reader.GetInt32(0);

                     lblTimeLimit.Text = timerTime.ToString();
                  }
               }
               finally
               {
                  reader.Close();
               }
               cmdGetTime.Connection.Close();
            }
            else
            {
               cmdGetTime = new OracleCommand(@"
SELECT time_limit, time_left
  FROM test
       JOIN test_taken USING (test_id)
 WHERE test_taken_id = :p_TestTakenID", connectionString);
               cmdGetTime.Parameters.AddWithValue("p_TestTakenID", Session["testTakenID"]);

               cmdGetTime.Connection.Open();
               reader = cmdGetTime.ExecuteReader();
               try
               {
                  while (reader.Read())
                  {
                     DateTime elapsed = Convert.ToDateTime(reader.GetValue(1));
                     int ellaspedTime = Convert.ToInt32(elapsed.Minute);

                     if (elapsed.Hour > 0)
                        ellaspedTime += 60;

                     timerTime = Convert.ToInt32(reader.GetValue(0).ToString()) - ellaspedTime;
                     Session["ellaspedTime"] = ellaspedTime;


                     lblTimeLimit.Text = timerTime.ToString();
                  }
               }
               finally
               {
                  reader.Close();
               }
               cmdGetTime.Connection.Close();
            }
            Session["StartTime"] = DateTime.Now.ToString();
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
         DateTime startTime = Convert.ToDateTime(Session["StartTime"].ToString());
         DateTime currentTime = DateTime.Now;
         int ellapsedTime = 0;
         string hour;

         if (Session["ellaspedTime"] != null)
            ellapsedTime = Convert.ToInt32(Session["ellaspedTime"]);

         if (ellapsedTime < 60)
         {
            hour = "0";// Convert.ToString(Convert.ToUInt32(currentTime.Hour) - Convert.ToUInt32(startTime.Hour) - 1);
         }
         else
         {
            hour = "0";//Convert.ToString(Convert.ToUInt32(currentTime.Hour) - Convert.ToUInt32(startTime.Hour));
         }
         
         string minute = Convert.ToString(Convert.ToUInt32(currentTime.Minute) - Convert.ToUInt32(startTime.Minute) + ellapsedTime);
         string second = "0";// Convert.ToString(Convert.ToUInt32(currentTime.Second) - Convert.ToUInt32(startTime.Second));
         //currentTime.Subtract(Convert.ToDateTime(Session["StartTime"].ToString()));
         string remainingTime = hour + ":" + minute + ":" + second;


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
            cmdGradeQuestion.Parameters.AddWithValue("p_TimeLeft", remainingTime);
            cmdGradeQuestion.Parameters.AddWithValue("v_TestTakenID", OracleType.Int32).Direction = System.Data.ParameterDirection.Output;

            cmdGradeQuestion.Connection.Open();
            cmdGradeQuestion.ExecuteNonQuery();

            Session["testTakenID"] = Convert.ToInt32(cmdGradeQuestion.Parameters["v_TestTakenID"].Value);

            cmdGradeQuestion.Connection.Close();
         }
         else
         {
            cmdGradeQuestion = new OracleCommand(@"
BEGIN
  TESTS_TAKEN.change(
    p_TestTakenID => :p_TestTakenID,
    p_TimeLeft    => :p_TimeLeft);
END;", connectionString);
            cmdGradeQuestion.Parameters.AddWithValue("p_TestTakenID", Session["testTakenID"]);
            cmdGradeQuestion.Parameters.AddWithValue("p_TimeLeft", remainingTime);

            cmdGradeQuestion.Connection.Open();
            cmdGradeQuestion.ExecuteNonQuery();
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
         string questionID;
         string questionType;
         String progressBar = String.Empty;
         string progressElement = string.Empty;

         if (Session["testTakenID"] != null)
         {
            foreach (ListViewItem item in lstQuestions.Items)
            {
               questionID = ((HiddenField)item.FindControl("hdnQuestionID")).Value;
               questionType = ((HiddenField)item.FindControl("hdnQuestionType")).Value;

               switch (questionType)
               {
                  case "E":
                     cmdRestoreTest = new OracleCommand(@"
SELECT essay
  FROM question_taken_essay
       JOIN question_taken USING (question_taken_id)
 WHERE test_taken_id = :p_TestTakenID
       AND question_id = :p_QuestionID", connectionString);
                     cmdRestoreTest.Parameters.AddWithValue("p_TestTakenID", Session["testTakenID"]);
                     cmdRestoreTest.Parameters.AddWithValue("p_QuestionID", questionID);
                     cmdRestoreTest.Connection.Open();
                     OracleDataReader reader = cmdRestoreTest.ExecuteReader();
                     try
                     {
                        if (reader.Read())
                        {
                           ((TextBox)item.FindControl("txtEAnswer")).Text = reader.GetValue(0).ToString();

                           if (reader.GetValue(0).ToString() == null)
                              progressElement = "false,";
                           else
                              progressElement = "true,";
                        }
                     }
                     finally
                     {
                        reader.Close();
                     }
                     cmdRestoreTest.Connection.Close();
                     break;
                  case "MC":
                     cmdRestoreTest = new OracleCommand(@"
SELECT student_choice
  FROM question_taken_multiple_choice
       JOIN question_taken q USING (question_taken_id)
 WHERE test_taken_id = :p_TestTakenID
       AND q.question_id = :p_QuestionID", connectionString);
                     cmdRestoreTest.Parameters.AddWithValue("p_TestTakenID", Session["testTakenID"]);
                     cmdRestoreTest.Parameters.AddWithValue("p_QuestionID", questionID);
                     cmdRestoreTest.Connection.Open();
                     reader = cmdRestoreTest.ExecuteReader();
                     try
                     {
                        if (reader.Read())
                        {
                           ((RadioButtonList)item.FindControl("rblMCAnswer")).SelectedValue = reader.GetValue(0).ToString();

                           if (reader.GetValue(0).ToString() == null)
                              progressElement = "false,";
                           else
                              progressElement = "true,";
                        }
                     }
                     finally
                     {
                        reader.Close();
                     }
                     cmdRestoreTest.Connection.Close();
                     break;
                  case "SA":
                     cmdRestoreTest = new OracleCommand(@"
SELECT answer
  FROM question_taken_short_answer
       JOIN question_taken USING (question_taken_id)
 WHERE test_taken_id = :p_TestTakenID
       AND question_id = :p_QuestionID", connectionString);
                     cmdRestoreTest.Parameters.AddWithValue("p_TestTakenID", Session["testTakenID"]);
                     cmdRestoreTest.Parameters.AddWithValue("p_QuestionID", questionID);
                     cmdRestoreTest.Connection.Open();
                     reader = cmdRestoreTest.ExecuteReader();
                     try
                     {
                        if (reader.Read())
                        {
                           ((TextBox)item.FindControl("txtSAAnswer")).Text = reader.GetValue(0).ToString();


                           if (reader.GetValue(0).ToString() == null)
                              progressElement = "false,";
                           else
                              progressElement = "true,";
                        }
                     }
                     finally
                     {
                        reader.Close();
                     }
                     cmdRestoreTest.Connection.Close();
                     break;
                  case "TF":
                     cmdRestoreTest = new OracleCommand(@"
SELECT points_earned, answer
  FROM question_taken
       JOIN question_true_false USING (question_id)
 WHERE test_taken_id = :p_TestTakenID
       AND question_id = :p_QuestionID", connectionString);
                     cmdRestoreTest.Parameters.AddWithValue("p_TestTakenID", Session["testTakenID"]);
                     cmdRestoreTest.Parameters.AddWithValue("p_QuestionID", questionID);
                     cmdRestoreTest.Connection.Open();
                     reader = cmdRestoreTest.ExecuteReader();
                     try
                     {
                        // This code will cause an restored test with unanswer TF to be set to F. There isn't much I can do about it at this point.
                        if (reader.Read())
                        {
                           if (reader.GetValue(0).ToString() == "0")
                           {
                              if (reader.GetValue(1).ToString() == "T")
                                 ((RadioButtonList)item.FindControl("rblTFAnswer")).SelectedValue = "F";
                              else
                                 ((RadioButtonList)item.FindControl("rblTFAnswer")).SelectedValue = "T";
                           }
                           else
                              ((RadioButtonList)item.FindControl("rblTFAnswer")).SelectedValue = reader.GetValue(1).ToString();

                           progressElement = "true,";
                        }
                     }
                     finally
                     {
                        reader.Close();
                     }
                     cmdRestoreTest.Connection.Close();
                     break;
               }

               progressBar += progressElement;
            }
            // This is what you want Ryan.
            lblProgressBar.Text = progressBar;
         }
      }

      protected void lstQuestions_DataBound(object sender, EventArgs e)
      {
         restoreTest();
      }
   }
}