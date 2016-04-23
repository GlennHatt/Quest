using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
   public partial class adminClass : System.Web.UI.Page
   {
        bool showdeleteStudent,
            showUpdate,
            showFailSectionDelete,
            showFailSectionUpdate;

      OracleConnection connectionString = new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString);
      protected void Page_Load(object sender, EventArgs e)
      {
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

            if (Session["showFailSectionUpdate"] != null)
                showFailSectionUpdate = (bool)Session["showFailSectionUpdate"];
            else
                showFailSectionUpdate = false;

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

            if (showFailSectionUpdate == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                "toastr_message",
               "toastr.error('Cannot update section with duplicate values', 'Fail!')", true);
                Session["showFailSectionUpdate"] = null;
                showFailSectionUpdate = false;
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
END;", new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString));
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

      protected void GVClass_RowCommand(object sender, GridViewCommandEventArgs e)
      {
         switch (e.CommandArgument.ToString())
         {
            case "Update":
               try
               {
                  sqlAdminClasses.Update();
               }
               catch
               {
                  // Put the fail toats in here Ryan.
               }
               break;
         }
      }

      protected void GVClass_DataBound(object sender, EventArgs e)
      {
         foreach (GridViewRow row in GVClass.Rows)
         {
            int section_id = int.Parse(((HiddenField)row.FindControl("hdnSectionID")).Value);
            int children = 0;


            OracleCommand cmdFindChild = new OracleCommand(@"
BEGIN
  SELECT NVL(SUM(section_id), -1) INTO :v_HasChild
    FROM section
         JOIN enrollment USING (section_id)
   WHERE section_id = :p_SectionID;
END;", connectionString);
            cmdFindChild.Parameters.AddWithValue("p_SectionID", int.Parse(((HiddenField)row.FindControl("hdnSectionID")).Value));
            cmdFindChild.Parameters.AddWithValue("v_HasChild", OracleType.Int32).Direction = System.Data.ParameterDirection.Output;

            cmdFindChild.Connection.Open();
            cmdFindChild.ExecuteNonQuery();

            children = Convert.ToInt32(cmdFindChild.Parameters["v_HasChild"].Value);

            if (Convert.ToInt32(cmdFindChild.Parameters["v_HasChild"].Value) != -1)
            {
               ((HtmlGenericControl)row.FindControl("myButton")).Attributes.Remove("onclick");
               HtmlGenericControl btnFront = ((HtmlGenericControl)row.FindControl("btnFront"));

               btnFront.Disabled = true;
               btnFront.Attributes.Add("style", "background-color:gray;");
            }

            cmdFindChild.Connection.Close();
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