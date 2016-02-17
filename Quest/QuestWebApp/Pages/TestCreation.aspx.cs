using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


// Universal Question
public struct Question
{
    public int questionId;
    public int pointValue;
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
    public int questionId;
    public string question;
    public string answer;

    public MultipleChoice(int newQuestionId, string newQuestion, string newAnswer)
    {
        questionId = newQuestionId;
        question = newQuestion;
        answer = newAnswer;
    }
}

// Multiple Choice options
public struct MultipleChoiceChoice
{
    public int questionId;
    public char letter;
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
    public int questionId;
    public string question;
    public string answer;

    public TrueFalse(int newQuestionId, string newQuestion, string newAnswer)
    {
        questionId = newQuestionId;
        question = newQuestion;
        answer = newAnswer;
    }
}

// Short Answer question
public struct ShortAnswer
{
    public int questionId;
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
        questionId = newQuestionId;
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
        question = newQuestion;
        answer = newAnswer;
    }
}

// Essay question
public struct Essay
{
    public int questionId;
    public string question;

    public Essay(int newQuestionId, string newQuestion)
    {
        questionId = newQuestionId;
        question = newQuestion;
    }
}

namespace QuestWebApp.Pages
{
    public partial class TestCreation : System.Web.UI.Page
    {
        // Tentative question counter
        public static int questionCounter = 0;

        //Dynamic list of questions
        public static List<Question> questionList = new List<Question>();

        protected void Page_Load(object sender, EventArgs e)
        {
            //divErrorMessage.InnerHtml = "<asp:Label ID=\"lblMultiChoice\" runat=\"server\" Text=\"Multiple Choice\"></asp:Label><br /><asp:Label ID=\"lblMCQuestion\" runat=\"server\" Text=\"Question: \"></asp:Label><asp:TextBox ID=\"txtMCQuestion\" runat=\"server\" Width=\"200px\"></asp:TextBox><br /><asp:Label ID=\"lblMCAnswers\" runat=\"server\" Text=\"Choices:\"></asp:Label><br /><asp:RadioButton ID=\"rdbMC1\" runat=\"server\" GroupName =\"MutlipleChoice\" Checked=\"True\"/><asp:TextBox ID=\"txtMC1\" runat=\"server\"></asp:TextBox><br /><asp:RadioButton ID=\"rdbMC2\" runat=\"server\" GroupName =\"MutlipleChoice\"/><asp:TextBox ID=\"txtMC2\" runat=\"server\"></asp:TextBox><br /><asp:RadioButton ID=\"rdbMC3\" runat=\"server\" GroupName =\"MutlipleChoice\"/><asp:TextBox ID=\"txtMC3\" runat=\"server\"></asp:TextBox><br /><asp:RadioButton ID=\"rdbMC4\" runat=\"server\" GroupName =\"MutlipleChoice\"/><asp:TextBox ID=\"txtMC4\" runat=\"server\"></asp:TextBox>";
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
            questionCounter++;
            //divErrorMessage.InnerHtml = "<asp:Label ID=\"lblMultiChoice\" runat=\"server\" Text=\"Multiple Choice\"></asp:Label><br /><asp:Label ID=\"lblMCQuestion\" runat=\"server\" Text=\"Question: \"></asp:Label><asp:TextBox ID=\"txtMCQuestion\" runat=\"server\" Width=\"200px\"></asp:TextBox><br /><asp:Label ID=\"lblMCAnswers\" runat=\"server\" Text=\"Choices:\"></asp:Label><br /><asp:RadioButton ID=\"rdbMC1\" runat=\"server\" GroupName =\"MutlipleChoice\" Checked=\"True\"/><asp:TextBox ID=\"txtMC1\" runat=\"server\"></asp:TextBox><br /><asp:RadioButton ID=\"rdbMC2\" runat=\"server\" GroupName =\"MutlipleChoice\"/><asp:TextBox ID=\"txtMC2\" runat=\"server\"></asp:TextBox><br /><asp:RadioButton ID=\"rdbMC3\" runat=\"server\" GroupName =\"MutlipleChoice\"/><asp:TextBox ID=\"txtMC3\" runat=\"server\"></asp:TextBox><br /><asp:RadioButton ID=\"rdbMC4\" runat=\"server\" GroupName =\"MutlipleChoice\"/><asp:TextBox ID=\"txtMC4\" runat=\"server\"></asp:TextBox>";
            divErrorMessage.InnerHtml = "<div id=\""+questionCounter+"\" runat=\"server\">";
            divErrorMessage.Controls.Add(
                new TextBox()
                {
                    ID = "plzwork" + questionCounter.ToString()
                });


        }

        // Saves question to test
        protected void btnSaveQuestion_Click(object sender, EventArgs e)
        {

            // Multiple choice question checked and saved
            if(rblChooseQuestion.SelectedValue == "Multiple Choice")
                if(txtMCQuestion.Text != String.Empty)
                    if (txtMC1.Text != String.Empty || txtMC2.Text != String.Empty || txtMC3.Text != String.Empty || txtMC4.Text != String.Empty)
                    {
                        Question newQuestion = new Question(questionCounter, Int32.Parse(ddlPointValue.SelectedValue), "Multiple Choice");

                        if(rdbMC1.Checked == true)
                        {
                            MultipleChoice newMCQuestion = new MultipleChoice(questionCounter, txtMCQuestion.Text, "A");
                        }
                        else if (rdbMC2.Checked == true)
                        {
                            MultipleChoice newMCQuestion = new MultipleChoice(questionCounter, txtMCQuestion.Text, "B");
                        }
                        else if (rdbMC3.Checked == true)
                        {
                            MultipleChoice newMCQuestion = new MultipleChoice(questionCounter, txtMCQuestion.Text, "C");
                        }
                        else
                        {
                            MultipleChoice newMCQuestion = new MultipleChoice(questionCounter, txtMCQuestion.Text, "D");
                        }

                        MultipleChoiceChoice MCOption1 = new MultipleChoiceChoice(questionCounter, 'A', txtMC1.Text);
                        MultipleChoiceChoice MCOption2 = new MultipleChoiceChoice(questionCounter, 'A', txtMC2.Text);
                        MultipleChoiceChoice MCOption3 = new MultipleChoiceChoice(questionCounter, 'A', txtMC3.Text);
                        MultipleChoiceChoice MCOption4 = new MultipleChoiceChoice(questionCounter, 'A', txtMC4.Text);

                        questionList.Add(newQuestion);
                    }

            // True False Question checked and saved
            if(rblChooseQuestion.SelectedValue == "True False")
                if(txtTFQuestion.Text != String.Empty)
                {
                    Question newQuestion = new Question(questionCounter,Int32.Parse(ddlPointValue.SelectedValue), "True/False");
                    TrueFalse newTFQuestion = new TrueFalse(questionCounter, txtTFQuestion.Text, rblTrueFalse.SelectedValue.ToString());
                    questionList.Add(newQuestion);
                }

            // Fill in the Blank question checked and saved
            if (rblChooseQuestion.SelectedValue == "Short Answer")
                if (txtFBAnswer.Text != String.Empty)
                {
                    Question newQuestion = new Question(questionCounter, Int32.Parse(ddlPointValue.SelectedValue), "Short Answer");
                    if (txtFBStatementBegin.Text != String.Empty && txtFBStatementEnd.Text != String.Empty)
                    {
                        ShortAnswer newSAQuestion = new ShortAnswer(questionCounter, txtFBStatementBegin.Text, txtFBAnswer.Text, txtFBStatementEnd.Text);
                    }
                    else if(txtFBStatementBegin.Text != String.Empty)
                    {
                        ShortAnswer newSAQuestion = new ShortAnswer(questionCounter, String.Empty, txtFBAnswer.Text, txtFBStatementEnd.Text);
                    }
                    else
                    {
                        ShortAnswer newSAQuestion = new ShortAnswer(questionCounter, txtFBStatementBegin.Text, txtFBAnswer.Text, String.Empty);
                    }
                    questionList.Add(newQuestion);
                }

            // Matching question checked and saved
            if(rblChooseQuestion.SelectedValue == "Matching")
            {
                if (txtSectionName.Text != String.Empty)
                {
                    Question newQuestion = new Question(questionCounter, Int32.Parse(ddlPointValue.SelectedValue), "Matching");
                    Matching newMatching = new Matching(questionCounter, txtSectionName.Text);
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
                    questionList.Add(newQuestion);
                }
            }

            // Essay question checked and saved
            if (rblChooseQuestion.SelectedValue == "Essay")
                if (txtEQuestion.Text != String.Empty)
                {
                    Question newQuestion = new Question(questionCounter, Int32.Parse(ddlPointValue.SelectedValue), "Essay");
                    Essay newEssayQuestion = new Essay(questionCounter, txtEQuestion.Text);
                    questionList.Add(newQuestion);
                }

            // tentative way to have unique questionIds
            questionCounter++;
        }

        protected void displayQuestions_Click(object sender, EventArgs e)
        {
            for(int i = 0; i < questionList.Count; i++)
            {
                txtTest.Text += "\n" + questionList[i].questionId + " " + questionList[i].pointValue + " " + questionList[i].questionType;
            } 
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