﻿using System;
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
        protected void logout_onlcick(object sender, EventArgs e)
        {
            utilities util = new utilities();
            util.checkAuthentication(null, null, null);
        }
    }
}