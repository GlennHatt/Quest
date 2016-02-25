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

        }

        // Insert user into database
        protected void btnAddTeacher_Click(object sender, EventArgs e)
        {
            if (txtbxTeacherFirstName.Text == String.Empty)
                txtbxTeacherFirstName.BorderColor = Color.Red;
            if (txtbxTeacherLastName.Text == String.Empty)
                txtbxTeacherLastName.BorderColor = Color.Red;
            if (txtbxTeacherEmail.Text == String.Empty)
                txtbxTeacherEmail.BorderColor = Color.Red;
            if (txtbxTeacherPassword.Text == txtbxTeacherConfirmPassword.Text)
            {
                txtbxTeacherPassword.Text = PasswordAdvisor.CheckStrength(txtbxTeacherConfirmPassword.Text).ToString();
            }
            else
            {
                txtbxTeacherConfirmPassword.BorderColor = txtbxTeacherPassword.BorderColor = Color.Red;
            }

            if (string.IsNullOrEmpty(ddlUserSelect.SelectedValue))
            {
                lblUserError.Text = "Select User Type";
            }
            else
            {
                sqlTeacher.Insert();
                clearUserFields();
            }
        }

        // Insert class into database
        protected void btnAddClass_Click(object sender, EventArgs e)
        {
            sqlClass.Insert();
            clearClassFields();
        }
    }
}