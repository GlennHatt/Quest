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
            // Multiple choice question checked and saved
            if(rblChooseQuestion.SelectedValue == "Multiple Choice")
                if(txtMCQuestion.Text != String.Empty)
                    if (txtMC1.Text != String.Empty || txtMC2.Text != String.Empty || txtMC3.Text != String.Empty || txtMC4.Text != String.Empty)
                    {
                        txtTest.Text += "\r\n" + ddlPointValue.SelectedValue.ToString() + txtMCQuestion.Text;
                        if(rdbMC1.Checked == true)
                        {
                            txtTest.Text += "1" + txtMC1.Text + "0" + txtMC2.Text + "0" + txtMC3.Text + "0" + txtMC4.Text;
                        }
                        else if (rdbMC2.Checked == true)
                        {
                            txtTest.Text += "0" + txtMC1.Text + "1" + txtMC2.Text + "0" + txtMC3.Text + "0" + txtMC4.Text;
                        }
                        else if (rdbMC3.Checked == true)
                        {
                            txtTest.Text += "0" + txtMC1.Text + "0" + txtMC2.Text + "1" + txtMC3.Text + "0" + txtMC4.Text;
                        }
                        else
                        {
                            txtTest.Text += "0" + txtMC1.Text + "0" + txtMC2.Text + "0" + txtMC3.Text + "1" + txtMC4.Text;
                        }
                    }

            // True False Question checked and saved
            if(rblChooseQuestion.SelectedValue == "True False")
                if(txtTFQuestion.Text != String.Empty)
                {
                    txtTest.Text += "\r\n" + ddlPointValue.SelectedValue.ToString() + txtTFQuestion.Text;
                    if(rblTrueFalse.SelectedValue == "True")
                    {
                        txtTest.Text += " " + rblTrueFalse.SelectedValue;
                    }
                    else
                    {
                        txtTest.Text += " " + rblTrueFalse.SelectedValue;
                    }
                }

            // Fill in the Blank question checked and saved
            if (rblChooseQuestion.SelectedValue == "Fill in the Blank")
                if (txtFBAnswer.Text != String.Empty)
                {
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
                    txtTest.Text += "\r\n" + ddlPointValue.SelectedValue.ToString() + txtEQuestion.Text;
                }
        }
    }
}