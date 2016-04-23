﻿using QuestWebApp.App_Code;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
    public partial class adminDashboard : System.Web.UI.Page
    {
        bool showAddUserMessage,
              showAddClassMessage,
              showAddSectionMessage,
              showFailAddClassMessage,
              showFailAddSectionMessage,
              showFailAddUserNameMessage;
        //Label userName;

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

            Response.Cache.SetNoStore();

            // toast notifications 
            if (Session["showAddUserMessage"] != null)
                showAddUserMessage = (bool)Session["showAddUserMessage"];
            else
                showAddUserMessage = false;

            if (Session["showAddClassMessage"] != null)
                showAddClassMessage = (bool)Session["showAddClassMessage"];
            else
                showAddClassMessage = false;

            if (Session["showAddSectionMessage"] != null)
                showAddSectionMessage = (bool)Session["showAddSectionMessage"];
            else
                showAddSectionMessage = false;

            if (Session["showFailAddClassMessage"] != null)
                showFailAddClassMessage = (bool)Session["showFailAddClassMessage"];
            else
                showFailAddClassMessage = false;

            if (Session["showFailAddSectionMessage"] != null)
                showFailAddSectionMessage = (bool)Session["showFailAddSectionMessage"];
            else
                showFailAddSectionMessage = false;

            if (Session["showFailAddUserNameMessage"] != null)
                showFailAddUserNameMessage = (bool)Session["showFailAddUserNameMessage"];
            else
                showFailAddUserNameMessage = false;

            if (showAddUserMessage == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                "toastr_message",
                "toastr.success('User has been added', 'Success!')", true);
                Session["showAddUserMessage"] = null;
                showAddUserMessage = false;
            }

            if (showAddClassMessage == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                "toastr_message",
                "toastr.success('Class has been added', 'Success!')", true);
                Session["showAddClassMessage"] = null;
                showAddClassMessage = false;
            }

            if (showAddSectionMessage == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                "toastr_message",
                "toastr.success('Section has been added', 'Success!')", true);
                Session["showAddSectionMessage"] = null;
                showAddSectionMessage = false;
            }

            if (showFailAddClassMessage == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                "toastr_message",
                "toastr.error('That class has already been added', 'Failed!')", true);
                Session["showFailAddClassMessage"] = null;
                showFailAddClassMessage = false;
            }

            if (showFailAddSectionMessage == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                "toastr_message",
                "toastr.error('That section already exists this semester', 'Failed!')", true);
                Session["showFailAddSectionMessage"] = null;
                showFailAddSectionMessage = false;
            }

            if (showFailAddUserNameMessage == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                "toastr_message",
                "toastr.error('That username already exists', 'Failed!')", true);
                Session["showFailAddUserNameMessage"] = null;
                showFailAddUserNameMessage = false;
            }

            if (currentMonth >= 8 && ddlSemester.Items.Count == 0)
            {
                ddlSemester.Items.Add(new ListItem("Fall " + currentYear));
                ddlSemester.Items.Add(new ListItem("Spring " + (currentYear + 1)));
                ddlSemester.Items.Add(new ListItem("Fall " + (currentYear + 1)));
                ddlSemester.Items.Add(new ListItem("Spring " + (currentYear + 2)));
                ddlSemester.Items.Add(new ListItem("Fall " + (currentYear + 2)));
            }
            else if (ddlSemester.Items.Count == 0)
            {
                ddlSemester.Items.Add(new ListItem("Spring " + currentYear));
                ddlSemester.Items.Add(new ListItem("Fall " + currentYear));
                ddlSemester.Items.Add(new ListItem("Spring " + (currentYear + 1)));
                ddlSemester.Items.Add(new ListItem("Fall " + (currentYear + 1)));
                ddlSemester.Items.Add(new ListItem("Spring " + (currentYear + 2)));
            }

            // Reset the sizing buttons on page refresh
            ScriptManager.RegisterStartupScript(Page, GetType(), "fixSizingButtons", "<script>pageResetSmall('btnResizeUserSm', 'btnResizeClassSm', 'btnResizeSectionSm');</script>", false);
            ScriptManager.RegisterStartupScript(Page, GetType(), "fixSizingButtonsLrg", "<script>pageResetLarge('btnResizeUserLrg', 'btnResizeClassLrg', 'btnResizeSectionLrg');</script> ", false);
        }

        protected void btnAddClass_Click(object sender, EventArgs e)
        {
            int errorCount = 0;

            // RUNNING INTO ISSUES
            Regex r = new Regex(valCourseNumRegex.ValidationExpression);


            if (txtbxClassTitle.Text == String.Empty)
            {
                txtbxClassTitle.BorderColor = Color.Red;
                errorCount++;
            }

            // TODO: Validate course number

            Match m = r.Match(txtbxCourseNumber.Text);
            if (!m.Success)
            {
                txtbxCourseNumber.BorderColor = Color.Red;
                errorCount++;
            }

            if (errorCount == 0)
            {
                try
                {
                    sqlClass.Insert();
                    clearClassFields();
                    ddlCourses.DataBind();
                    // toast
                    showAddUserMessage = true;
                    Session["showAddClassMessage"] = true;
                    Response.Redirect(Request.RawUrl); // to ensure message always shows up
                }
                catch
                {
                    clearClassFields();
                    showFailAddClassMessage = true;
                    Session["showFailAddClassMessage"] = true;
                    Response.Redirect(Request.RawUrl); // to ensure message always shows up
                }
            }
        }

        protected void btnAddSection_Click(object sender, EventArgs e)
        {
            int errorCount = 0;

            if (ddlCourses.SelectedIndex == 0)
            {
                ddlCourses.BorderColor = Color.Red;
                errorCount++;
            }

            if (ddlTeacher.SelectedIndex == 0)
            {
                ddlTeacher.BorderColor = Color.Red;
                errorCount++;
            }

            if (errorCount == 0)
            {
                try
                {
                    sqlSection.Insert();
                    showAddSectionMessage = true;
                    Session["showAddSectionMessage"] = true;
                    Response.Redirect(Request.RawUrl); // to ensure message always shows up
                }
                catch
                {
                    showFailAddSectionMessage = true;
                    Session["showFailAddSectionMessage"] = true;
                    Response.Redirect(Request.RawUrl); // to ensure message always shows up
                }
            }
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            //string passwordStrength;
            int errorCount = 0;

            //lblWarning.Text = string.Empty;

            if (txtbxTeacherFirstName.Text == String.Empty)
            {
                txtbxTeacherFirstName.BorderColor = Color.Red;
                errorCount++;
            }
            if (txtbxTeacherLastName.Text == String.Empty)
            {
                txtbxTeacherLastName.BorderColor = Color.Red;
                errorCount++;
            }
            if (txtbxTeacherEmail.Text == String.Empty)
            {
                txtbxTeacherEmail.BorderColor = Color.Red;
                errorCount++;
            }

            if (string.IsNullOrEmpty(ddlUserSelect.SelectedValue))
            {
                ddlUserSelect.BorderColor = Color.Red;
                errorCount++;
            }

            if (errorCount == 0)
            {
                try
                {
                    utilities util = new utilities();
                    txtbxTeacherPassword.Text = util.CalculateHash(txtbxTeacherPassword.Text);
                    sqlTeacher.Insert();
                    clearUserFields();
                    ddlTeacher.DataBind();
                    // Toast
                    showAddUserMessage = true;
                    Session["showAddUserMessage"] = true;
                    Response.Redirect(Request.RawUrl); // to ensure message always shows up
                }
                catch
                {
                    showFailAddUserNameMessage = true;
                    Session["showFailAddUserNameMessage"] = true;
                    Response.Redirect(Request.RawUrl); // to ensure message always shows up
                }
            }
        }
    }
}