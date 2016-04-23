﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
   public partial class adminClass : System.Web.UI.Page
   {
        bool showdeleteStudent,
            showUpdate,
            showFailSectionDelete;
      protected void Page_Load(object sender, EventArgs e)
      {
         // SECURITY DISABLED FOR TESTING -----
         /*try
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
         } */
         GVClass.HeaderRow.TableSection = TableRowSection.TableHeader;
            if (Session["showdeleteStudent"] != null)
                showdeleteStudent = (bool)Session["showdeleteStudent"];
            else
                showdeleteStudent = false;

            if (Session["showUpdate"] != null)
                showUpdate = (bool)Session["showUpdate"];
            else
                showUpdate = false;

            if (Session["showFailSectionDelete"] != null)
                showFailSectionDelete = (bool)Session["showFailSectionDelete"];
            else
                showFailSectionDelete = false;

            if (showdeleteStudent == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                "toastr_message",
                "toastr.success('A Class Has Been Deleted', 'Success!')", true);
                Session["showdeleteStudent"] = null;
                showdeleteStudent = false;
            }
            if (showUpdate == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                "toastr_message",
                "toastr.success('The Class Information Has Been Updated', 'Success!')", true);
                Session["showUpdate"] = null;
                showUpdate = false;
            }

            if (showFailSectionDelete == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                "toastr_message",
               "toastr.error('Cannot Delete A Section With Students', 'Fail!')", true);
                Session["showFailSectionDelete"] = null;
                showFailSectionDelete = false;
            }
        }

      protected void GVClass_RowDataBound(object sender, GridViewRowEventArgs e)
      {
         if (e.Row.RowType == DataControlRowType.DataRow)
         {
            TableCellCollection cell = e.Row.Cells;
            cell[0].Attributes.Add("data-title", "Edit");
            cell[1].Attributes.Add("data-title", "Code");
            cell[2].Attributes.Add("data-title", "Title");
            cell[3].Attributes.Add("data-title", "Section Number");
            cell[4].Attributes.Add("data-title", "Last Name");
            cell[5].Attributes.Add("data-title", "Delete");
         }
      }

      protected void btnDone(object sender, EventArgs e)
      {
         //Get the button that raised the event
         LinkButton btn = (LinkButton)sender;

         //Get the row that contains this button
         GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            try
            {

                OracleCommand cmdDeleteClass = new OracleCommand(@"
BEGIN
   sections.delete(
    p_SectionID => :p_SectionID);
END;",
                 new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString));
                cmdDeleteClass.Parameters.AddWithValue("p_SectionID", GVClass.DataKeys[gvr.RowIndex].Value);

                cmdDeleteClass.Connection.Open();
                cmdDeleteClass.ExecuteNonQuery();

                cmdDeleteClass.Connection.Close();
                GVClass.DataBind();

                showdeleteStudent = true;
                Session["showdeleteStudent"] = true;
                Response.Redirect(Request.RawUrl); // to ensure message always shows up
            }
            catch
            {
                showFailSectionDelete = true;
                Session["showFailSectionDelete"] = true;
                Response.Redirect(Request.RawUrl);
            }
        }

      protected void btnSortUsers_Click(object sender, EventArgs e)
      {
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
                  sortBy = "CODE_TITLE";
                  break;
               case 1:
                  sortBy = "title";
                  break;
               case 2:
                  sortBy = "full_name";
                  break;
            }

            GVClass.Sort(sortBy, direction);
         }
      }

        protected void GVClass_PreRender(object sender, EventArgs e)
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

        protected void GVClass_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            showUpdate = true;
            Session["showUpdate"] = true;
            Response.Redirect(Request.RawUrl); // to ensure message always shows up
        }
    }
}