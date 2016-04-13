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
        protected void Page_Load(object sender, EventArgs e)
        {
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

        }
    }
}