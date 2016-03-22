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
            if (!this.IsPostBack)
            {
                
                //DataTable dt = new DataTable();
                //dt.Columns.AddRange(new DataColumn[4] { new DataColumn("ID"), new DataColumn("Name"), new DataColumn("Link"), new DataColumn("Status") });
                //dt.Rows.Add(1, "Savan", "MSOSL", "Carpenter");
                //dt.Rows.Add(2, "Rupesh", "KLOSJ", "Programmer");
                //dt.Rows.Add(3, "Rahul", "JSKL", "Mechanic");
                //GridView1.DataSource = dt;
                
                //GridView1.DataBind();
                //Attribute to show the Plus Minus Button.
                //GridView1.HeaderRow.Cells[0].Attributes["data-title"] = "ID";
                ////Attribute to hide column in Phone.
                //GridView1.HeaderRow.Cells[2].Attributes["data-title"] = "Name";
                //GridView1.HeaderRow.Cells[3].Attributes["data-title"] = "Link";
                //GridView1.HeaderRow.Cells[4].Attributes["data-title"] = "Status";
                
                //Adds THEAD and TBODY to GridView.
                //GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
                 GVUser.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
}
        

        protected void GVUser_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        //protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)

        //    {
        //        TableCellCollection cell = e.Row.Cells;
        //        cell[0].Attributes.Add("data-title", "ID");
        //        cell[1].Attributes.Add("data-title", "Name");
        //        cell[2].Attributes.Add("data-title", "Link");
        //        cell[3].Attributes.Add("data-title", "Status");
        //    }
        //}

        protected void GVUser_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCellCollection cell = e.Row.Cells;
                cell[0].Attributes.Add("data-title", "EMAIL");
                cell[1].Attributes.Add("data-title", "FIRSTNAME");
                cell[2].Attributes.Add("data-title", "LASTNAME");
                cell[3].Attributes.Add("data-title", "PASSWORD");
                cell[4].Attributes.Add("data-title", "CLASSIFICATION");
            }
        }
    }
}