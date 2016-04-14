using System;
using System.Web;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuestWebApp.App_Code
{
   public class settingsUtilities
   {
      public void check_settings(char? actualClassification)
      {
         switch (actualClassification)
         {
            case 'A':
               HttpContext.Current.Response.Redirect("adminSettings.aspx");
               break;
            case 'T':
               HttpContext.Current.Response.Redirect("TeacherSettings.aspx");
               break;
            case 'S':
               HttpContext.Current.Response.Redirect("StudentSettings.aspx");
               break;
            default:
               HttpContext.Current.Response.Redirect("login.aspx");
               break;
         }
      }
   }
}
