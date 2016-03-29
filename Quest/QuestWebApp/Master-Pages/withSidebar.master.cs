using System;
using QuestWebApp.App_Code;
using QuestWebApp;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Master_Pages
{
    public partial class withSidebar : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        // Use the utilities page to nullify classification values 
        protected void logout_onclick(Object sender, EventArgs e)
        {
            utilities util = new utilities();
            Session["userClassification"]   = null;
            Session["neededClassification"] = null;
            util.checkAuthentication(null, null, null);
        }

        protected void home_onclick(Object sender, EventArgs e)
        {
            utilities util = new utilities();
            util.checkAuthentication(1, (char)Session["userClassification"], (char)Session["neededClassification"]);
        }

        protected void settings_onclick(Object sender, EventArgs e)
        {
            settingsUtilities setUtil = new settingsUtilities();
            setUtil.check_settings((char)Session["userClassification"]);
        }
    }
}