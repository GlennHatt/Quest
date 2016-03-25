using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace QuestWebApp.Pages
{
    public partial class AdminClass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                GVClass.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void GVClass_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCellCollection cell = e.Row.Cells;
                cell[0].Attributes.Add("data-title", "Code");
                cell[1].Attributes.Add("data-title", "Title");
                cell[2].Attributes.Add("data-title", "Section Number");
                cell[3].Attributes.Add("data-title", "Last Name");
                cell[4].Attributes.Add("data-title", "Delete");
            }
        }

        protected void btnDeleteClick(object sender, EventArgs e)
        {
            
        }
    }
}