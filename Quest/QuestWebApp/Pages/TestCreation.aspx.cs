using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace QuestWebApp.Pages
{
    public partial class TestCreation : System.Web.UI.Page
    {
        // List for all questions in test

        // Question counter
        public int questionCounter;

        // Universal Question structure
        public struct Question
        {
            public int    questionId;
            public int    pointValue;
            public string questionType;

            public Question(int newQuestionId, int newPointValue, string newQuestionType)
            {
                questionId = newQuestionId;
                pointValue = newPointValue;
                questionType = newQuestionType;
            }
        }

        // Multiple Choice structure (partial)
        public struct MultipleChoice
        {
            public int    questionId;
            public string question;
            public string answer;

            public MultipleChoice(int newQuestionId, string newQuestion, string newAnswer)
            {
                questionId = newQuestionId;
                question   = newQuestion;
                answer     = newAnswer;
            }
        }

        //TODO: Finish multiple choices for Multiple Choice

        // True False structure
        public struct TrueFalse
        {
            public int    questionId;
            public string question;
            public string answer;

            public TrueFalse(int newQuestionId, string newQuestion, string newAnswer)
            {
                questionId = newQuestionId;
                question   = newQuestion;
                answer     = newAnswer;
            }
        }

        // Short Answer structure
        public struct ShortAnswer
        {
            public int    questionId;
            public string beforeText;
            public string answer;
            public string afterText;

            public ShortAnswer(int newQuestionId, string newBeforeText, string newAnswer, string newAfterText)
            {
                questionId = newQuestionId;
                beforeText = newBeforeText;
                answer     = newAnswer;
                afterText  = newAfterText;
            }
        }

        // TODO: Make matching structure

        // Essay structure
        public struct Essay
        {
            public int    questionId;
            public string question;

            public Essay(int newQuestionId, string newQuestion)
            {
                questionId = newQuestionId;
                question = newQuestion;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            questionCounter = 0;
        }

        // Acknowledges which question type was chosen
        protected void btnChooseQuestion_Click(object sender, EventArgs e)
        {
            switch (rblChooseQuestion.SelectedValue)
            {
                case "Multiple Choice":
                    lblWarning.Text = "Multiple Choice";
                    break;
                case "True False":
                    lblWarning.Text = "True False";
                    break;
                case "Short Answer":
                    lblWarning.Text = "Short Answer";
                    break;
                case "Matching":
                    lblWarning.Text = "Matching";
                    break;
                case "Essay":
                    lblWarning.Text = "Essay";
                    break;
                default:
                    lblWarning.Text = "Please select a question type";
                    break;
            }
        }

        protected void btnSaveQuestion_Click(object sender, EventArgs e)
        {
            string multipleChoiceAnswer;
            // Multiple choice question checked and saved
            if(rblChooseQuestion.SelectedValue == "Multiple Choice")
                if(txtMCQuestion.Text != String.Empty)
                    if (txtMC1.Text != String.Empty || txtMC2.Text != String.Empty || txtMC3.Text != String.Empty || txtMC4.Text != String.Empty)
                    {
                        txtTest.Text += "\r\n" + ddlPointValue.SelectedValue.ToString() + txtMCQuestion.Text;
                        if(rdbMC1.Checked == true)
                        {
                            multipleChoiceAnswer = "1" + txtMC1.Text + " 0" + txtMC2.Text + " 0" + txtMC3.Text + " 0" + txtMC4.Text;
                        }
                        else if (rdbMC2.Checked == true)
                        {
                            multipleChoiceAnswer = "0" + txtMC1.Text + " 1" + txtMC2.Text + " 0" + txtMC3.Text + " 0" + txtMC4.Text;
                        }
                        else if (rdbMC3.Checked == true)
                        {
                            multipleChoiceAnswer = "0" + txtMC1.Text + " 0" + txtMC2.Text + " 1" + txtMC3.Text + " 0" + txtMC4.Text;
                        }
                        else
                        {
                            multipleChoiceAnswer = "0" + txtMC1.Text + " 0" + txtMC2.Text + " 0" + txtMC3.Text + " 1" + txtMC4.Text;
                        }
                    }

            // True False Question checked and saved
            if(rblChooseQuestion.SelectedValue == "True False")
                if(txtTFQuestion.Text != String.Empty)
                {
                    Question newQuestion = new Question(questionCounter, Int32.Parse(ddlPointValue.SelectedValue), "True/False");
                    //questionList.Add(newQuestion);
                    questionCounter++;
                    txtTest.Text = questionCounter.ToString();
                }

            // Fill in the Blank question checked and saved
            if (rblChooseQuestion.SelectedValue == "Short Answer")
                if (txtFBAnswer.Text != String.Empty)
                {
                    Question newQuestion = new Question(1, Int32.Parse(ddlPointValue.SelectedValue), "Short Answer");
                    if (txtFBStatementBegin.Text != String.Empty && txtFBStatementEnd.Text != String.Empty)
                    {
                        txtTest.Text += "\r\n" + ddlPointValue.SelectedValue.ToString() + txtFBStatementBegin.Text + txtFBAnswer.Text + txtFBStatementEnd.Text;
                    }
                    else if(txtFBStatementBegin.Text != String.Empty)
                    {
                        txtTest.Text += "\r\n" + ddlPointValue.SelectedValue.ToString() + txtFBStatementBegin.Text + txtFBAnswer.Text;
                    }
                    else
                    {
                        txtTest.Text += "\r\n" + ddlPointValue.SelectedValue.ToString() + txtFBAnswer.Text + txtFBStatementEnd.Text;
                    }
                }

            // TODO Matching question checked and saved

            // Essay question checked and saved
            if (rblChooseQuestion.SelectedValue == "Essay")
                if (txtEQuestion.Text != String.Empty)
                {
                    Question newQuestion = new Question(1, Int32.Parse(ddlPointValue.SelectedValue), "Essay");
                    txtTest.Text += "\r\n" + ddlPointValue.Text + txtEQuestion.Text;
                }
        }

        protected void displayQuestions_Click(object sender, EventArgs e)
        {
          /*
            for(int i = 0; i <= questionList.Count; i++)
            {
                txtTest.Text = questionList.Count.ToString();
                //txtTest.Text += "\n" + questionList[i].questionId + " " + questionList[i].pointValue + " " + questionList[i].questionType;
            } 
          */
        }
    }
}