using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
    public partial class studentSettings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnable_Click(object sender, EventArgs e)
        {

            cdEnable.Visible = false;
            cdDisable.Visible = true;
        }

        protected void btnDisable_Click(object sender, EventArgs e)
        {
            cdDisable.Visible = false;
            cdEnable.Visible = true;
        }
    }
}