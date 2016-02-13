﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace QuestWebApp.Pages
{
    public partial class TestCreation : System.Web.UI.Page
    {

        // Question counter
        public int questionCounter;

        // Universal Question
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

        // Multiple Choice question
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

        // Multiple Choice options
        public struct MultipleChoiceChoice
        {
            public int    questionId;
            public char   letter;
            public string choiceText;

            public MultipleChoiceChoice(int newQuestionId, char newLetter, string newChoiceText)
            {
                questionId = newQuestionId;
                letter     = newLetter;
                choiceText = newChoiceText;
            }
        }

        // True False question
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

        // Short Answer question
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

        // Matching section
        public struct Matching
        {
            public int questionId;
            public string sectionTitle;

            public Matching(int newQuestionId, string newSectionTitle)
            {
                questionId   = newQuestionId;
                sectionTitle = newSectionTitle;
            }
        }

        // Matching options
        public struct MatchingQuestions
        {
            public int questionId;
            public string question;
            public string answer;

            public MatchingQuestions(int newQuestionId, string newQuestion, string newAnswer)
            {
                questionId = newQuestionId;
                question   = newQuestion;
                answer     = newAnswer;
            }
        }

        // Essay question
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

        }

        // Checks which question is selected
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

        // Saves question to test
        protected void btnSaveQuestion_Click(object sender, EventArgs e)
        {

            // Multiple choice question checked and saved
            if(rblChooseQuestion.SelectedValue == "Multiple Choice")
                if(txtMCQuestion.Text != String.Empty)
                    if (txtMC1.Text != String.Empty || txtMC2.Text != String.Empty || txtMC3.Text != String.Empty || txtMC4.Text != String.Empty)
                    {
                        txtTest.Text += "\r\n" + ddlPointValue.SelectedValue.ToString() + txtMCQuestion.Text;
                        if(rdbMC1.Checked == true)
                        {
                            //multipleChoiceAnswer = "1" + txtMC1.Text + " 0" + txtMC2.Text + " 0" + txtMC3.Text + " 0" + txtMC4.Text;
                        }
                        else if (rdbMC2.Checked == true)
                        {
                            //multipleChoiceAnswer = "0" + txtMC1.Text + " 1" + txtMC2.Text + " 0" + txtMC3.Text + " 0" + txtMC4.Text;
                        }
                        else if (rdbMC3.Checked == true)
                        {
                            //multipleChoiceAnswer = "0" + txtMC1.Text + " 0" + txtMC2.Text + " 1" + txtMC3.Text + " 0" + txtMC4.Text;
                        }
                        else
                        {
                            //multipleChoiceAnswer = "0" + txtMC1.Text + " 0" + txtMC2.Text + " 0" + txtMC3.Text + " 1" + txtMC4.Text;
                        }
                    }

            // True False Question checked and saved
            if(rblChooseQuestion.SelectedValue == "True False")
                if(txtTFQuestion.Text != String.Empty)
                {
                    Question newQuestion = new Question(2,Int32.Parse(ddlPointValue.SelectedValue), "True/False");
                    TrueFalse newTFQuestion = new TrueFalse(2, txtTFQuestion.Text, rblTrueFalse.SelectedValue.ToString());
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

            // Matching question checked and saved
            if(rblChooseQuestion.SelectedValue == "Matching")
            {
                if (txtSectionName.Text != String.Empty)
                {
                    Question newQuestion = new Question(4, Int32.Parse(ddlPointValue.SelectedValue), "Matching");
                    Matching newMatching = new Matching(4, txtSectionName.Text);
                    if (txtMQuestion1.Text != String.Empty && txtMAnswer1.Text != String.Empty)
                    {
                        MatchingQuestions newChoice1 = new MatchingQuestions(4, txtMQuestion1.Text, txtMAnswer1.Text);
                    }
                    if (txtMQuestion2.Text != String.Empty && txtMAnswer2.Text != String.Empty)
                    {
                        MatchingQuestions newChoice2 = new MatchingQuestions(4, txtMQuestion2.Text, txtMAnswer2.Text);
                    }
                    if (txtMQuestion3.Text != String.Empty && txtMAnswer3.Text != String.Empty)
                    {
                        MatchingQuestions newChoice3 = new MatchingQuestions(4, txtMQuestion3.Text, txtMAnswer3.Text);
                    }
                    if (txtMQuestion4.Text != String.Empty && txtMAnswer4.Text != String.Empty)
                    {
                        MatchingQuestions newChoice4 = new MatchingQuestions(4, txtMQuestion4.Text, txtMAnswer4.Text);
                    }
                }
            }

            // Essay question checked and saved
            if (rblChooseQuestion.SelectedValue == "Essay")
                if (txtEQuestion.Text != String.Empty)
                {
                    Question newQuestion = new Question(5, Int32.Parse(ddlPointValue.SelectedValue), "Essay");
                    Essay newEssayQuestion = new Essay(5, txtEQuestion.Text);
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

        // Tentative way to make prerequisites for test
        protected void btnCheckChoices_Click(object sender, EventArgs e)
        {
            if (btnCheckChoices.Text == "Review Choices")
            {
                lblCheckChoices.Text = txtTestName.Text + " will be given on " + cldrTestDay.SelectedDate.ToShortDateString()
                                     + " to class " + ddlSectionId.SelectedItem.ToString() + " with a time limit of "
                                     + ddlTimeLimit.SelectedItem.ToString() + ".";
                btnCheckChoices.Text = "Confirm?";
            }
            else if (btnCheckChoices.Text == "Confirm?")
            {
                btnCheckChoices.Text = "Saved!";
            }
        }
    }
}