using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace QuestWebApp.Pages
{
    public partial class AdminUser : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
             GVUser.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void GVUser_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCellCollection cell = e.Row.Cells;
                cell[0].Attributes.Add("data-title", "E-mail");
                cell[1].Attributes.Add("data-title", "First Name");
                cell[2].Attributes.Add("data-title", "Last Name");
                cell[3].Attributes.Add("data-title", "Password");
                cell[4].Attributes.Add("data-title", "Classification");
                cell[5].Attributes.Add("data-title", "Status");
            }
        }

        protected void active_Click(object sender, EventArgs e)
        {
           // activeButton
        }
    }
}