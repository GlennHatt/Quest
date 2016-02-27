using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Text.RegularExpressions;

namespace QuestWebApp.Pages
{
    public partial class adminDashboard : System.Web.UI.Page
    {

        // Work in progress ------------------------------------
        public enum PasswordScore
        {
            Blank = 0,
            VeryWeak = 1,
            Weak = 2,
            Medium = 3,
            Strong = 4,
            VeryStrong = 5
        }
        
        public class PasswordAdvisor
        {
            public static PasswordScore CheckStrength(string password)
            {
                int score = 0;

                if (password.Length < 1)
                    return PasswordScore.Blank;
                if (password.Length >= 6)
                    score++;
                if (password.Length >= 10)
                    score++;
                if (Regex.Match(password, @"[A-Z]", RegexOptions.ECMAScript).Success)
                    score++;
                if (Regex.Match(password, @"[a-z]", RegexOptions.ECMAScript).Success)
                    score++;
                if (Regex.Match(password, @"[!,@,#,$,%,^,&,*,?,_,~,-,£,(,)]", RegexOptions.ECMAScript).Success)
                    score++;

                return (PasswordScore)score;
            }
        }

        // Clear fields after user addition
        void clearUserFields()
        {
            txtbxTeacherFirstName.Text = txtbxTeacherLastName.Text = txtbxTeacherEmail.Text = 
            txtbxTeacherPassword.Text = txtbxTeacherConfirmPassword.Text = String.Empty;
            txtbxTeacherFirstName.BorderColor = txtbxTeacherLastName.BorderColor = txtbxTeacherEmail.BorderColor =
            txtbxTeacherPassword.BorderColor = txtbxTeacherConfirmPassword.BorderColor = Color.LightGray;

        }

        // Clear fields after class addition
        void clearClassFields()
        {
            txtbxClassTitle.Text = txtbxCourseNumber.Text = String.Empty;
            txtbxClassTitle.BorderColor = txtbxCourseNumber.BorderColor =Color.LightGray;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Insert user into database
        protected void btnAddTeacher_Click(object sender, EventArgs e)
        {
            string passwordStrength;
            int errorCount = 0;

            lblWarning.Text = string.Empty;

            if (txtbxTeacherFirstName.Text == String.Empty)
            {
                lblWarning.Text += "First name empty;";
                txtbxTeacherFirstName.BorderColor = Color.Red;
                errorCount++;
            }
            if (txtbxTeacherLastName.Text == String.Empty)
            {
                lblWarning.Text += " Last name empty;";
                txtbxTeacherLastName.BorderColor = Color.Red;
                errorCount++;
            }
            if (txtbxTeacherEmail.Text == String.Empty)
            {
                lblWarning.Text += " Email empty;";
                txtbxTeacherEmail.BorderColor = Color.Red;
                errorCount++;
            }
            if (txtbxTeacherPassword.Text == String.Empty && txtbxTeacherConfirmPassword.Text == String.Empty)
            {
                lblWarning.Text += " Password empty;";
                txtbxTeacherConfirmPassword.BorderColor = txtbxTeacherPassword.BorderColor = Color.Red;
                errorCount++;
            }
            else if (txtbxTeacherPassword.Text == txtbxTeacherConfirmPassword.Text)
            {
                passwordStrength = PasswordAdvisor.CheckStrength(txtbxTeacherConfirmPassword.Text).ToString();

                if(passwordStrength == "Weak" || passwordStrength == "VeryWeak")
                {
                    txtbxTeacherPassword.BorderColor = txtbxStudentConfirmPassword.BorderColor = Color.Red;
                    lblWarning.Text = " Password is " + passwordStrength + ";";
                    errorCount++;
                }
            }
            else
            {
                txtbxTeacherConfirmPassword.BorderColor = txtbxTeacherPassword.BorderColor = Color.Red;
                lblWarning.Text = " Passwords are not identical;";
                txtbxTeacherPassword.BorderColor = txtbxStudentConfirmPassword.BorderColor = Color.Red;
                errorCount++;
            }

            if (string.IsNullOrEmpty(ddlUserSelect.SelectedValue))
            {
                ddlUserSelect.BorderColor = Color.Red;
                lblWarning.Text += " Select User Type";
                errorCount++;
            }
            
            if(errorCount == 0)
            {
                sqlTeacher.Insert();
                clearUserFields();
            }
        }

        // Insert class into database
        protected void btnAddClass_Click(object sender, EventArgs e)
        {
            int errorCount = 0;

            if(txtbxClassTitle.Text == String.Empty)
            {
                txtbxClassTitle.BorderColor = Color.Red;
                lblWarning.Text += " Enter Class Title;";
                errorCount++;
            }

            // TODO: Validate course number

            if(txtbxCourseNumber.Text == String.Empty)
            {
                txtbxCourseNumber.BorderColor = Color.Red;
                lblWarning.Text += " Enter Course Number";
                errorCount++;
            }

            if (errorCount == 0)
            {
                sqlClass.Insert();
                clearClassFields();
            }
        }
    }
}