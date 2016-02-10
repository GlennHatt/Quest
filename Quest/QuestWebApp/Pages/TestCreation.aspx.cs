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

        // partial structure for multiple choice questions (partial)
        public struct MultipleChoice
        {
            public int    questionId;
            public int    pointValue;
            public string question;
            public string answer;

            public MultipleChoice(int newQuestionId, int newPointValue, string newQuestion, string newAnswer)
            {
                questionId = newQuestionId;
                pointValue = newPointValue;
                question   = newQuestion;
                answer     = newAnswer;
            }
        }

        //TODO: Finish multiple choices for Multiple Choice

        // structure for true/false questions with unique constructor
        public struct TrueFalse
        {
            public int    questionId;
            public int    pointValue;
            public string question;
            public string answer;

            public TrueFalse(int newQuestionId, int newPointValue, string newQuestion, string newAnswer)
            {
                questionId = newQuestionId;
                pointValue = newPointValue;
                question   = newQuestion;
                answer     = newAnswer;
            }
        }

        // structure for short answer question with unique constructor
        public struct ShortAnswer
        {
            public int    questionId;
            public int    pointValue;
            public string beforeText;
            public string answer;
            public string afterText;

            public ShortAnswer(int newQuestionId, int newPointValue, string newBeforeText, string newAnswer, string newAfterText)
            {
                questionId = newQuestionId;
                pointValue = newPointValue;
                beforeText = newBeforeText;
                answer = newAnswer;
                afterText = newAfterText;
            }
        }

        // TODO: Make matching structure

        // structure for essay questions with unique constructor
        public struct Essay
        {
            public int    questionId;
            public int    pointValue;
            public string question;

            public Essay(int newQuestionId, int newPointValue, string newQuestion)
            {
                questionId = newQuestionId;
                pointValue = newPointValue;
                question = newQuestion;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

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
                case "Fill in the Blank":
                    lblWarning.Text = "Fill in the Blank";
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
                        MultipleChoice newQuestion = new MultipleChoice(1, Int32.Parse(ddlPointValue.SelectedValue), txtMCQuestion.Text, multipleChoiceAnswer);
                        txtTest.Text += "\r\n " + newQuestion.questionId + " " + newQuestion.pointValue + " " + newQuestion.question + " " + newQuestion.answer; 

                    }

            // True False Question checked and saved
            if(rblChooseQuestion.SelectedValue == "True False")
                if(txtTFQuestion.Text != String.Empty)
                {
                    // Right now, this is the question that prints off from the structure created
                    TrueFalse newQuestion = new TrueFalse(1, Int32.Parse(ddlPointValue.SelectedValue), txtTFQuestion.Text, rblTrueFalse.SelectedValue);
                    txtTest.Text += "\r\n " + newQuestion.pointValue + " " + newQuestion.pointValue + " " + newQuestion.question;
                    if(rblTrueFalse.SelectedValue == "True")
                    {
                        txtTest.Text += " " + newQuestion.answer;
                    }
                    else
                    {
                        txtTest.Text += " " + newQuestion.answer;
                    }
                }

            // Fill in the Blank question checked and saved
            if (rblChooseQuestion.SelectedValue == "Fill in the Blank")
                if (txtFBAnswer.Text != String.Empty)
                {
                    
                    if (txtFBStatementBegin.Text != String.Empty && txtFBStatementEnd.Text != String.Empty)
                    {
                        txtTest.Text += "\r\n" + ddlPointValue.SelectedValue.ToString() + txtFBStatementBegin.Text + txtFBAnswer.Text + txtFBStatementEnd.Text;
                        ShortAnswer newQuestion = new ShortAnswer(1, Int32.Parse(ddlPointValue.SelectedValue), txtFBStatementBegin.Text, txtFBAnswer.Text, txtFBStatementEnd.Text);
                    }
                    else if(txtFBStatementBegin.Text != String.Empty)
                    {
                        txtTest.Text += "\r\n" + ddlPointValue.SelectedValue.ToString() + txtFBStatementBegin.Text + txtFBAnswer.Text;
                        ShortAnswer newQuestion = new ShortAnswer(1, Int32.Parse(ddlPointValue.SelectedValue), txtFBStatementBegin.Text, txtFBAnswer.Text, String.Empty);
                    }
                    else
                    {
                        txtTest.Text += "\r\n" + ddlPointValue.SelectedValue.ToString() + txtFBAnswer.Text + txtFBStatementEnd.Text;
                        ShortAnswer newQuestion = new ShortAnswer(1, Int32.Parse(ddlPointValue.SelectedValue), String.Empty, txtFBAnswer.Text, txtFBStatementEnd.Text);
                    }
                }

            // TODO Matching question checked and saved
            //if (rblChooseQuestion.SelectedValue == "Matching")
            //   if

            // Essay question checked and saved
            if (rblChooseQuestion.SelectedValue == "Essay")
                if (txtEQuestion.Text != String.Empty)
                {
                    Essay newQuestion = new Essay(1, Int32.Parse(ddlPointValue.SelectedValue), txtEQuestion.Text);
                    txtTest.Text += "\r\n" + ddlPointValue.Text + txtEQuestion.Text;
                }
        }
    }
}