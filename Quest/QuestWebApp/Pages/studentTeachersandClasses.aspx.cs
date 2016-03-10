using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
    public partial class studentTeachersandClasses : System.Web.UI.Page
    {
        bool showMessage;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["showMessage"] != null)
                showMessage = (bool)Session["showMessage"];
            else
                showMessage = false;



            // showMessage = Convert.ToBoolean(ViewState["showMessage"]);
            if (showMessage == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_options", "toastr.options.positionClass = toast-bottom-right");
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                "toastr_message",
                "toastr.success('Message has been sent', 'Success!')", true);
                Session["showMessage"] = false;
            }
            //Page.ClientScript.RegisterStartupScript(this.GetType(),
            //    "toastr_message", "toastr.error('There was an error', 'Error')", true);
        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {

        }

        protected void demoshowtoast_Click(object sender, EventArgs e)
        {
            showMessage = true;
            Session["showMessage"] = true;
            demoshowtoast.Text = "win!";
            //ViewState["showMessage"] = true;
            //this.ShowToastr("Hello world!", "Hello");
            Response.Redirect(Request.RawUrl); // to ensure message always shows up
            
        }


        //public static void ShowToastr(this Page page, string message, string title, string type = "info")
        //{
        //    page.ClientScript.RegisterStartupScript(page.GetType(), "toastr_message",
        //          String.Format("toastr.{0}('{1}', '{2}');", type.ToLower(), message, title), addScriptTags: true);
        //}

    }
}