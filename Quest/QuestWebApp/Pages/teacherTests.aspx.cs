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
                    Session["UserID"] = 1;
                }
            }
        }

        protected void ddlClassSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlStudentsSelect.DataBind();
        }

        protected void rblTypeTest_SelectedIndexChanged(object sender, EventArgs e)
        {
            typeTest = rblTypeTest.SelectedValue.ToString();
            switch (typeTest)
            {
                case "P":
                    cardPastTest.Visible = true;
                    break;
                case "L":
                    cardLiveTest.Visible = true;
                    break;
                case "D":
                    cardPendingTest.Visible = true;
                    break;
            }
        }
        public void hideCards()
        {
            cardLiveTest.Visible = false;
            cardPastTest.Visible = false;
            cardPendingTest.Visible = false;
        }
    }
}