using System;
using QuestWebApp.App_Code;
using QuestWebApp;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;
using System.Configuration;

namespace QuestWebApp.Master_Pages
{
   public partial class withSidebar : System.Web.UI.MasterPage
   {
      OracleConnection connectionString = new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString); // Connection String.


      protected void Page_Load(object sender, EventArgs e)
      {

         if (Session["Username"] == null)
         {
            OracleCommand cmdShowGreeting = new OracleCommand(@"
SELECT f_name
  FROM end_user
 WHERE user_id = :p_UserID", connectionString);
            cmdShowGreeting.Parameters.AddWithValue("p_UserID", Session["UserID"]);

            cmdShowGreeting.Connection.Open();
            OracleDataReader reader = cmdShowGreeting.ExecuteReader();
            try
            {
               while (reader.Read())
               {
                  txtGreeting.Text = reader.GetValue(0).ToString();
               }
            } finally
            {
               reader.Close();
            }
            cmdShowGreeting.Connection.Close();
         }
      }

      // Use the utilities page to nullify classification values 
      protected void logout_onclick(Object sender, EventArgs e)
      {
         utilities util = new utilities();
         Session["userClassification"] = null;
         Session["neededClassification"] = null;
         util.checkAuthentication(null, null, null);
      }

      //protected void home_onclick(Object sender, EventArgs e)
      //{
      //   utilities util = new utilities();
      //   util.checkAuthentication(1, (char?)Session["userClassification"], (char?)Session["neededClassification"]);
      //}

      protected void settings_onclick(Object sender, EventArgs e)
      {
         settingsUtilities setUtil = new settingsUtilities();
         setUtil.check_settings((char?)Session["userClassification"]);
      }
   }
}