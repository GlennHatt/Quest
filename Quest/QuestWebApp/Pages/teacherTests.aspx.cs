using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
   public partial class teacherTests : System.Web.UI.Page
   {
      // Global Variables

      string typeTest; // The tests type 
      protected void Page_Load(object sender, EventArgs e)
      {
         hideCards();
         if (!IsPostBack)
         {
            if (Session["UserID"] == null)
            {
               Session["UserID"] = 20;
            }
         }
      }

      protected void ddlClassSelect_SelectedIndexChanged(object sender, EventArgs e)
      {
         //ddlStudentsSelect.DataBind();
         rblTypeTest.SelectedIndex = -1;
         lvLiveTests.DataBind();
         lvPastTests.DataBind();
         lstDraftTests.DataBind();

      }

      protected void rblTypeTest_SelectedIndexChanged(object sender, EventArgs e)
      {
         typeTest = rblTypeTest.SelectedValue.ToString();
         switch (typeTest)
         {
            case "P":
               lvPastTests.Visible = true;
               break;
            case "L":
               lvLiveTests.Visible = true;
               break;
            case "D":
               lstDraftTests.Visible = true;
               break;
         }
      }
      public void hideCards()
      {
         lvLiveTests.Visible = false;
         lvPastTests.Visible = false;
         lstDraftTests.Visible = false;
      }

      protected void lstDraftTests_ItemCommand(object sender, ListViewCommandEventArgs e)
      {
         switch(e.CommandName)
         {
            case "EditTest":
               Session["Test_ID"] = e.CommandArgument;
               Response.Redirect("~/Pages/teacherQuestionCreation.aspx");
               break;
         }
      }

        protected void lstPastTests_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "ViewTest":
                    Session["Test_ID"] = e.CommandArgument;
                    Response.Redirect("~/Pages/teacherTestReview.aspx");
                    break;
            }
        }

        protected void lstLiveTests_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "EditTest":
                    Session["TestID"] = e.CommandArgument;
                    Response.Redirect("~/Pages/teacherTestReview.aspx");
                    break;
            }
        }
    }
}