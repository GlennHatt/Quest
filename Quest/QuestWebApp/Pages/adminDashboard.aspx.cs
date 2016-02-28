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
        }

        // Clear fields after class addition
        void clearClassFields()
        {
            txtbxClassTitle.Text = txtbxCourseNumber.Text = String.Empty;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            int currentMonth = DateTime.Now.Month;
            int currentYear = DateTime.Now.Year;

            lblFnameError.Visible = false;
            lblLnameError.Visible = false;
            lblEmailError.Visible = false;
            lblPassError.Visible = false;
            lblConfirmPassError.Visible = false;
            lblPassWeak.Visible = false;
            lblUserTypeError.Visible = false;
            lblClassNumError.Visible = false;
            lblClasstitleError.Visible = false;
            lblSemesterError.Visible = false;
            lblSectionError.Visible = false;
            lblAddSectionCourseError.Visible = false;
            lblTeacherError.Visible = false;
            
            
              if (currentMonth >= 8)
            {
                ddlSemester.Items.Add(new ListItem("Semester:"));
                ddlSemester.Items.Add(new ListItem("Fall " + currentYear));
                ddlSemester.Items.Add(new ListItem("Spring " + (currentYear + 1)));
                ddlSemester.Items.Add(new ListItem("Fall " + (currentYear + 1)));
                ddlSemester.Items.Add(new ListItem("Spring " + (currentYear + 2)));
                ddlSemester.Items.Add(new ListItem("Fall " + (currentYear + 2)));
            }
            else
            {
                ddlSemester.Items.Add(new ListItem("Semester:"));
                ddlSemester.Items.Add(new ListItem("Spring " + currentYear));
                ddlSemester.Items.Add(new ListItem("Fall " + currentYear));
                ddlSemester.Items.Add(new ListItem("Spring " + (currentYear + 1)));
                ddlSemester.Items.Add(new ListItem("Fall " + (currentYear + 1)));
                ddlSemester.Items.Add(new ListItem("Spring " + (currentYear + 2)));
            }


        }

        // Insert user into database
        protected void btnAddTeacher_Click(object sender, EventArgs e)
        {
            string passwordStrength;
            int errorCount = 0;

            lblWarning.Text = string.Empty;

            if (txtbxTeacherFirstName.Text == String.Empty)
            {
                //lblWarning.Text += "First name empty;";
                txtbxTeacherFirstName.BorderColor = Color.Red;
                errorCount++;
                lblFnameError.Visible = true;
            }
            if (txtbxTeacherLastName.Text == String.Empty)
            {
                //lblWarning.Text += " Last name empty;";
                txtbxTeacherLastName.BorderColor = Color.Red;
                errorCount++;
                lblLnameError.Visible = true;
            }
            if (txtbxTeacherEmail.Text == String.Empty)
            {
                //lblWarning.Text += " Email empty;";
                txtbxTeacherEmail.BorderColor = Color.Red;
                errorCount++;
                lblEmailError.Visible = true;
            }
            if (txtbxTeacherPassword.Text == String.Empty && txtbxTeacherConfirmPassword.Text == String.Empty)
            {
               // lblWarning.Text += " Password empty;";
                txtbxTeacherConfirmPassword.BorderColor = txtbxTeacherPassword.BorderColor = Color.Red;
                errorCount++;
                lblPassError.Visible = true;
            }
            else if (txtbxTeacherPassword.Text == txtbxTeacherConfirmPassword.Text)
            {
                passwordStrength = PasswordAdvisor.CheckStrength(txtbxTeacherConfirmPassword.Text).ToString();

                if(passwordStrength == "Weak" || passwordStrength == "VeryWeak")
                {
                    //txtbxTeacherPassword.BorderColor = txtbxStudentConfirmPassword.BorderColor = Color.Red;
                    lblPassWeak.Visible = true;
                    //lblWarning.Text = " Password is " + passwordStrength + ";";
                    errorCount++;
                }
            }
            else
            {
                txtbxTeacherConfirmPassword.BorderColor = txtbxTeacherPassword.BorderColor = Color.Red;
                //lblWarning.Text = " Passwords are not identical;";
                lblConfirmPassError.Visible = true;
                //txtbxTeacherPassword.BorderColor = txtbxStudentConfirmPassword.BorderColor = Color.Red;
                errorCount++;
            }

            if (string.IsNullOrEmpty(ddlUserSelect.SelectedValue))
            {
                ddlUserSelect.BorderColor = Color.Red;
               // lblWarning.Text += " Select User Type";
                errorCount++;
                lblUserTypeError.Visible = true;
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
                //lblWarning.Text += " Enter Class Title;";
                errorCount++;
                lblClasstitleError.Visible = true;
            }

            // TODO: Validate course number

            if(txtbxCourseNumber.Text == String.Empty)
            {
                txtbxCourseNumber.BorderColor = Color.Red;
                //lblWarning.Text += " Enter Course Number";
                lblClassNumError.Visible = true;
                errorCount++;
            }

            if (errorCount == 0)
            {
                sqlClass.Insert();
                clearClassFields();
            }
        }

        protected void btnAddSection_Click(object sender, EventArgs e)
        {
            int errorCount = 0;

            if(ddlSemester.SelectedIndex == 0)
            {
                ddlSemester.BorderColor = Color.Red;
                lblSemesterError.Visible = true;
                errorCount++;
            }

            if(ddlSection.SelectedIndex == 0)
            {
                ddlSection.BorderColor = Color.Red;
                lblSectionError.Visible = true;
                errorCount++;
            }

            if(ddlCourses.SelectedIndex == 0)
            {
                ddlCourses.BorderColor = Color.Red;
                lblAddSectionCourseError.Visible = true;
                errorCount++;
            }

            if(ddlTeacher.SelectedIndex == 0)
            {
                ddlTeacher.BorderColor = Color.Red;
                lblTeacherError.Visible = true;
                errorCount++;
            }
        }
    }
}