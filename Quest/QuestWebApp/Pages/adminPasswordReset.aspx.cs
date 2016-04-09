using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
    public partial class adminPasswordReset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cardUpdatePassword.Visible = false;
        }

        protected void ddlClassSelect_SelectedIndexChanged1(object sender, EventArgs e)
        {
            cardUpdatePassword.Visible = true;
        }
    }
}