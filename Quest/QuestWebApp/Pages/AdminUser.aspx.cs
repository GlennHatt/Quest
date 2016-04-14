using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
   public partial class adminUser : System.Web.UI.Page
   {
      protected void Page_Load(object sender, EventArgs e)
      {
         this.MaintainScrollPositionOnPostBack = true;
         //try
         //{
         //    if (Session["userClassification"] == null)
         //        throw new NullReferenceException();
         //    if ((char)Session["userClassification"] != 'A')
         //    {
         //        utilities util = new utilities();
         //        util.checkAuthentication(1, (char)Session["userClassification"], (char)Session["neededClassification"]);
         //    }
         //}
         //catch (NullReferenceException)
         //{
         //    Response.Redirect("login.aspx");
         //}

         GVUser.HeaderRow.TableSection = TableRowSection.TableHeader;
         //ddlSortDirection.SelectedIndex = 0;
      }


      protected void GVUser_RowDataBound(object sender, GridViewRowEventArgs e)
      {
         if (e.Row.RowType == DataControlRowType.DataRow)
         {
            TableCellCollection cell = e.Row.Cells;
            GridViewRow row = e.Row;

            //row.Attributes.Add("class", "header");
            cell[0].Attributes.Add("data-title", row.Cells[3].Text + ", " + row.Cells[2].Text);
            cell[0].Attributes.Add("class", "header");
            cell[1].Attributes.Add("data-title", "Edit User");
            cell[2].Attributes.Add("data-title", "First Name");
            cell[3].Attributes.Add("data-title", "Last Name");
            cell[4].Attributes.Add("data-title", "E-mail");
            cell[5].Attributes.Add("data-title", "E-mail Password");
            cell[6].Attributes.Add("data-title", "Username");
            cell[7].Attributes.Add("data-title", "Password");
            cell[8].Attributes.Add("data-title", "Classification");

            //Initially hide rows
            //cell[1].Attributes.Add("style", "display:none;");
            // cell[2].Attributes.Add("style", "display:none;");
            // cell[3].Attributes.Add("style", "display:none;");
            // cell[4].Attributes.Add("style", "display:none;");
            // cell[5].Attributes.Add("style", "display:none;");
            // cell[6].Attributes.Add("style", "display:none;");
            // cell[7].Attributes.Add("style", "display:none;");
            // cell[8].Attributes.Add("style", "display:none;");
            // cell[9].Attributes.Add("style", "display:none;"); 


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
         } else
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

      protected void LinkButton1_Click(object sender, EventArgs e)
      {
         GVUser.Sort("f_name", SortDirection.Ascending);


      }

      protected void btnSortUsers_Click(object sender, EventArgs e)
      {
         SortDirection direction;
         string sortBy = null;

         if (ddlSortDirection.SelectedIndex == 0)
         {
            direction = SortDirection.Ascending;
         } else
            direction = SortDirection.Descending;

         switch (ddlSortBy.SelectedIndex)
         {
            case 0:
               sortBy = "f_name";
               break;
            case 1:
               sortBy = "l_name";
               break;
            case 2:
               sortBy = "email";
               break;
            case 3:
               sortBy = "username";
               break;
            case 4:
               sortBy = "permission_level";
               break;
         }

         GVUser.Sort(sortBy, direction);
      }

      protected void GVUser_RowUpdated(object sender, GridViewUpdatedEventArgs e)
      {
         Response.Redirect(Request.RawUrl);
      }

      protected void GVUser_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
      {
         Response.Redirect(Request.RawUrl);
      }
   }
}