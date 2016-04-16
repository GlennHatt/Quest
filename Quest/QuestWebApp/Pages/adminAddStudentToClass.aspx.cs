using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
   public partial class adminAddStudentToClass : System.Web.UI.Page
   {
        bool showAddStudent,
           showdeleteStudent;
        OracleConnection connectionString = new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString); // Connection String.

      protected void Page_Load(object sender, EventArgs e)
      {
            // toast notifications 
            if (Session["showAddStudent"] != null)
                showAddStudent = (bool)Session["showAddStudent"];
            else
                showAddStudent = false;

            if (Session["showdeleteStudent"] != null)
                showdeleteStudent = (bool)Session["showdeleteStudent"];
            else
                showdeleteStudent = false;

            if (showAddStudent == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                "toastr_message",
                "toastr.success('A Student Has Been Added To a Class', 'Success!')", true);
                Session["showAddStudent"] = null;
                showAddStudent = false;
            }

            if (showdeleteStudent == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                "toastr_message",
                "toastr.success('A Student Has Been Deleted From a Class', 'Success!')", true);
                Session["showdeleteStudent"] = null;
                showdeleteStudent = false;
            }

            //gvCurrentStudents.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

      protected void ddlClassSelect_SelectedIndexChanged(object sender, EventArgs e)
      {
         if (ddlClassSelect.SelectedIndex == 0)
            ddlStudentsSelect.Enabled = false;
         else
            ddlStudentsSelect.Enabled = true;

         ddlStudentsSelect.DataBind();
      }

      protected void btnStudenttoClass_Click(object sender, EventArgs e)
      {
         OracleCommand cmdAddEnrollee = new OracleCommand(@"
DECLARE
    v_dummy pls_integer;
BEGIN
   v_dummy := enrollments.add(
    p_StudentID => :p_StudentID,
    p_SectionID => :p_SectionID);
END;",
          new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString));
         cmdAddEnrollee.Parameters.AddWithValue("p_StudentID", ddlStudentsSelect.SelectedValue);
         cmdAddEnrollee.Parameters.AddWithValue("p_SectionID", ddlClassSelect.SelectedValue);

         cmdAddEnrollee.Connection.Open();
         cmdAddEnrollee.ExecuteNonQuery();

         cmdAddEnrollee.Connection.Close();
         ddlStudentsSelect.DataBind();
         gvCurrentStudents.DataBind();

            showAddStudent = true;
            Session["showAddStudent"] = true;
            Response.Redirect(Request.RawUrl); // to ensure message always shows up
        }

      protected void gvCurrentStudents_RowDeleted(object sender, GridViewDeletedEventArgs e)
      {
         ddlStudentsSelect.DataBind();
            showdeleteStudent = true;
            Session["showdeleteStudent"] = true;
            Response.Redirect(Request.RawUrl); // to ensure message always shows up
        }

        protected void gvCurrentStudents_PreRender(object sender, EventArgs e)
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

        protected void gvCurrentStudents_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCellCollection cell = e.Row.Cells;
                GridViewRow row = e.Row;

                //row.Attributes.Add("class", "header");
                cell[0].Attributes.Add("data-title", "Delete");
                cell[1].Attributes.Add("data-title", "Enrollment ID");
                cell[2].Attributes.Add("data-title", "Students Enrolled");
            }
            }
    }
}