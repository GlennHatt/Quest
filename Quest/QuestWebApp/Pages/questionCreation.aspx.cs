using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
    public partial class questionCreation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Test_ID"] == null)
            {
                Session["Test_ID"] = "1";
            }
        }

        protected void btnAddQuestion_Click(object sender, EventArgs e)
        {
            sqlAddQuestion.Insert();
        }

        protected void rblAddType_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}