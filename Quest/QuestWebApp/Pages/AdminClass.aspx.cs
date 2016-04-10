using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.OracleClient;
using System.Web.UI.WebControls;
using QuestWebApp.App_Code;
using System.Configuration;

namespace QuestWebApp.Pages
{
    public partial class AdminClass : System.Web.UI.Page
    {
        OracleConnection connectionString = new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString); // Connection String.


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
                        sortBy = "code";
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
    }
}