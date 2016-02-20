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
      /* public enum PasswordScore
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
                if (password.Length < 4)
                    return PasswordScore.VeryWeak;

                if (password.Length >= 8)
                    score++;
                if (password.Length >= 12)
                    score++;
                if (Regex.Match(password, @"/\d+/", RegexOptions.ECMAScript).Success)
                    score++;
                if (Regex.Match(password, @"/[a-z]/", RegexOptions.ECMAScript).Success &&
                  Regex.Match(password, @"/[A-Z]/", RegexOptions.ECMAScript).Success)
                    score++;
                if (Regex.Match(password, @"/.[!,@,#,$,%,^,&,*,?,_,~,-,£,(,)]/", RegexOptions.ECMAScript).Success)
                    score++;

                return (PasswordScore)score;
            }
        }
        */

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddTeacher_Click(object sender, EventArgs e)
        {
            if (txtbxTeacherFirstName.Text == String.Empty)
                txtbxTeacherFirstName.BorderColor = Color.Red;
            if (txtbxTeacherLastName.Text == String.Empty)
                txtbxTeacherLastName.BorderColor = Color.Red;
            if (txtbxTeacherEmail.Text == String.Empty)
                txtbxTeacherEmail.BorderColor = Color.Red;
            //if (txtbxTeacherPassword.Text == String.Empty)
                //txtbxTeacherPassword.BorderColor = Color.Red;
            if (txtbxTeacherConfirmPassword.Text == String.Empty)
                txtbxTeacherConfirmPassword.BorderColor = Color.Red;



            // TODO: Regular Expressions -----------------------------------------

            // END REGX

            sqlTeacher.Insert();
        }

        protected void btnAddStudent_Click(object sender, EventArgs e)
        {
            /*
                        txtbxStudentFirstName.Text
                        txtbxStudentLastName.Text
                        txtbxStudentEmail.Text
                        txtbxStudentPassword.Text
                        txtbxStudentConfirmPassword.Text
            */
            sqlStudent.Insert();
        }

        protected void btnAddClass_Click(object sender, EventArgs e)
        {
            /*
                        txtbxClassTitle.Text =
                        txtbxCourseNumber.Text =
            */
        }

        protected void txtbxTeacherPassword_TextChanged(object sender, EventArgs e)
        {
            /*PasswordScore passwordStrengthScore = PasswordAdvisor.CheckStrength(txtbxTeacherPassword.Text);

            switch (passwordStrengthScore)
            {
                case PasswordScore.Blank:
                case PasswordScore.VeryWeak:
                case PasswordScore.Weak:
                    lblPassword.Text = "Too Weak Lorenzo";
                    // Show an error message to the user
                    break;
                case PasswordScore.Medium:
                case PasswordScore.Strong:
                case PasswordScore.VeryStrong:
                    lblPassword.Text = "Good password (obviously not Lorenzo)";
                    // Password deemed strong enough, allow user to be added to database etc
                    break;
            }*/
        }
    }
}