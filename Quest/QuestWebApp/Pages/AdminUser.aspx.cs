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
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[10] { new DataColumn("Id"), new DataColumn("Name"), new DataColumn("Company"), new DataColumn("t"), new DataColumn("k"), new DataColumn("o"), new DataColumn("te"), new DataColumn("ka"), new DataColumn("ee"), new DataColumn("aa") });
                dt.Rows.Add(1, "Savan", "MSOSL", 23);
                dt.Rows.Add(2, "Rupesh", "KLOSJ", 25);
                dt.Rows.Add(3, "Rahul", "JSKL", 26);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                //Attribute to show the Plus Minus Button.
                GridView1.HeaderRow.Cells[0].Attributes["data -class"] = "expand";
                //Attribute to hide column in Phone.
                GridView1.HeaderRow.Cells[2].Attributes["data - hide"] = "phone";
                GridView1.HeaderRow.Cells[3].Attributes["data - hide"] = "phone";
                //Adds THEAD and TBODY to GridView.
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
}
        

        protected void GVUser_SelectedIndexChanged(object sender, EventArgs e)
        {
         
        }
    }
}