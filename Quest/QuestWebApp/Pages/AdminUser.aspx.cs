using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using QuestWebApp.App_Code;

namespace QuestWebApp.Pages
{
    public partial class AdminUser : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            this.MaintainScrollPositionOnPostBack = true;
            try
            {
                if (Session["userClassification"] == null)
                    throw new NullReferenceException();
                if ((char)Session["userClassification"] != 'A')
                {
                    utilities util = new utilities();
                    util.checkAuthentication(1, (char)Session["userClassification"], (char)Session["neededClassification"]);
                }
            }
            catch (NullReferenceException)
            {
                Response.Redirect("login.aspx");
            }

            GVUser.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
    

        protected void GVUser_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCellCollection cell = e.Row.Cells;
                GridViewRow row = e.Row;

                row.Attributes.Add("class", "header");

                cell[0].Attributes.Add("data-title", "Edit User");
                cell[1].Attributes.Add("data-title", "E-mail");
                cell[2].Attributes.Add("data-title", "E-mail Password");
                cell[3].Attributes.Add("data-title", "Username");
                cell[4].Attributes.Add("data-title", "First Name");
                cell[5].Attributes.Add("data-title", "Last Name");
                cell[6].Attributes.Add("data-title", "Password");
                cell[7].Attributes.Add("data-title", "Classification");

                
            }

            //if (e.Row.RowType == DataControlRowType.Header)
            //{
            //    TableCellCollection cell = e.Row.Cells;
            //    cell[0].Attributes.Add("class", "header");
            //    cell[1].Attributes.Add("class", "header");
            //    cell[2].Attributes.Add("class", "header");
            //    cell[3].Attributes.Add("class", "header");
            //    cell[4].Attributes.Add("class", "header");
            //    cell[5].Attributes.Add("class", "header");
            //    cell[6].Attributes.Add("class", "header");
            //    cell[7].Attributes.Add("class", "header");

            //}
        }

        protected void active_Click(object sender, EventArgs e)
        {
            LinkButton btnactive = (LinkButton)sender;
            if (btnactive.Text == "Active")
            {
                btnactive.Text = "Inactive";
                btnactive.BackColor = System.Drawing.Color.Red;
            }

            else
            {
                btnactive.Text = "Active";
                btnactive.BackColor = System.Drawing.Color.Green;
            }
        }

        protected void GVUser_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "edit":
                    GVUser.HeaderRow.TableSection = TableRowSection.TableHeader;
                    break;
            }
        }

        protected void grdEventsAvailable_PreRender1(object sender, EventArgs e)
        {
            GridView grdView = (GridView)sender;
            if (grdView.Rows.Count > 0)
            {
                //This replaces <td> with <th> and adds the scope attribute
                grdView.UseAccessibleHeader = true;

                //This will add the <thead> and <tbody> elements
                grdView.HeaderRow.TableSection = TableRowSection.TableHeader;

                //This adds the <tfoot> element. 
                //Remove if you don't have a footer row
                grdView.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }
    }
}
