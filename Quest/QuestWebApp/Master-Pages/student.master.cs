﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Master_Pages
{
   public partial class student : System.Web.UI.MasterPage
   {
      protected void Page_Load(object sender, EventArgs e)
      {
         /* SECURITY DISABLED FOR TESTING
            Session["neededClassification"] = 'S';

            try
            {
                if (Session["userClassification"] == null)
                    throw new NullReferenceException();
                if ((char)Session["userClassification"] != 'S')
                {
                    utilities util = new utilities();
                    util.checkAuthentication(1, (char)Session["userClassification"], (char)Session["neededClassification"]);
                }
            }
            catch (NullReferenceException)
            {
                Response.Redirect("login.aspx");
            }
            */
      }
   }
}