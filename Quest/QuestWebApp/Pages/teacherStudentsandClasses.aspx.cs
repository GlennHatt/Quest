using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QuestWebApp.App_Code;

namespace QuestWebApp.Pages
{
    public partial class teacherStudentsandClasses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["userClassification"] == null)
                    throw new NullReferenceException();
                if ((char)Session["userClassification"] != 'T' && (char)Session["userClassification"] != 'A')
                {
                    utilities util = new utilities();
                    util.checkAuthentication(1, (char)Session["userClassification"], (char)Session["neededClassification"]);
                }
            }
            catch (NullReferenceException)
            {
                Response.Redirect("login.aspx");
            }

            //if (!this.IsPostBack)
            //{
               // gvStudents.HeaderRow.TableSection = TableRowSection.TableHeader;
                
            //}
        }

        //protected void gvStudents_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        TableCellCollection cell = e.Row.Cells;
        //        cell[0].Attributes.Add("data-title", "Full Name");
        //        cell[1].Attributes.Add("data-title", "E-mail");
        //    }
        //}

        protected void ddlUserSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvStudents.DataBind();
        }
    }
}