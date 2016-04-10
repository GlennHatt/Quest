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

        protected void btnSortUsers_Click(object sender, EventArgs e)
        {
            {
                SortDirection direction;
                string sortBy = null;

                if (ddlSortDirection.SelectedIndex == 0)
                {
                    direction = SortDirection.Ascending;
                }
                else
                    direction = SortDirection.Descending;

                switch (ddlSortBy.SelectedIndex)
                {
                    case 0:
                        sortBy = "email";
                        break;
                    case 1:
                        sortBy = "full_name";
                        break;
                }

                gvStudents.Sort(sortBy, direction);
            }
        }
    }
}
