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
    public partial class adminUser : System.Web.UI.Page
    {
        bool showUpdate;
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
            if (Session["showUpdate"] != null)
                showUpdate = (bool)Session["showUpdate"];
            else
                showUpdate = false;


            if (showUpdate == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
            "toastr_message",
            "toastr.success('The student&apos;s information has been updated', 'Success!')", true);
                Session["showUpdate"] = null;
                showUpdate = false;

            }


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

                // Assign proper button color based on active or inactive
                LinkButton activeButton = (LinkButton)cell[9].Controls[1];
                System.Diagnostics.Debug.WriteLine(activeButton.Text);
                if (string.Equals(activeButton.Text, "INACTIVE", StringComparison.CurrentCultureIgnoreCase))
                {
                    activeButton.BackColor = System.Drawing.Color.Red;
                }
                else
                    activeButton.BackColor = System.Drawing.Color.Green;


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
            LinkButton btn = (LinkButton)sender;

            //Get the row that contains this button
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;


            LinkButton btnactive = (LinkButton)sender;

            if (btn.Text == "Active")
            {
                btn.Text = "Inactive";
                btn.BackColor = System.Drawing.Color.Red;
                OracleCommand cmdDeactivateUser = new OracleCommand(@"
                BEGIN
                    end_user.deactivate(
                    p_EndUserID => :p_EndUserID);
                END;",
                 new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString));
                cmdDeactivateUser.Parameters.AddWithValue("p_EndUserID", GVUser.DataKeys[gvr.RowIndex].Value);

                cmdDeactivateUser.Connection.Open();
                cmdDeactivateUser.ExecuteNonQuery();

                cmdDeactivateUser.Connection.Close();

            }
            else
            {
                btn.Text = "Active";
                btn.BackColor = System.Drawing.Color.Green;
                OracleCommand cmdActivateUser = new OracleCommand(@"
                BEGIN
                    end_user.deactivate(
                    p_EndUserID => :p_EndUserID);
                END;",
                        new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString));
                cmdActivateUser.Parameters.AddWithValue("p_EndUserID", GVUser.DataKeys[gvr.RowIndex].Value);

                cmdActivateUser.Connection.Open();
                cmdActivateUser.ExecuteNonQuery();

                cmdActivateUser.Connection.Close();

            }

            //GVUser.DataBind();
        }

        protected void GVUser_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "edit":
                    GVUser.HeaderRow.TableSection = TableRowSection.TableHeader;
                    break;
                case "active":
                    //LinkButton btn = ((LinkButton)((GridView)sender).Rows[int.Parse(e.CommandSource.ToString())].FindControl("activeButton"));
                    LinkButton btn = ((LinkButton)e.CommandSource);

                    //Get the row that contains this button
                    //GridViewRow gvr = (GridViewRow)btn.NamingContainer;


                    //LinkButton btnactive = (LinkButton)sender;

                    if (btn.Text == "Active")
                    {
                        btn.Text = "Inactive";
                        btn.BackColor = System.Drawing.Color.Red;
                        OracleCommand cmdDeactivateUser = new OracleCommand(@"
                BEGIN
                    end_users.deactivate(
                    p_EndUserID => :p_EndUserID);
                END;",
                         new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString));
                        cmdDeactivateUser.Parameters.AddWithValue("p_EndUserID", e.CommandArgument);

                        cmdDeactivateUser.Connection.Open();
                        cmdDeactivateUser.ExecuteNonQuery();

                        cmdDeactivateUser.Connection.Close();

                    }
                    else
                    {
                        btn.Text = "Active";
                        btn.BackColor = System.Drawing.Color.Green;
                        OracleCommand cmdActivateUser = new OracleCommand(@"
                BEGIN
                    end_users.activate(
                    p_EndUserID => :p_EndUserID);
                END;",
                                new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString));
                        cmdActivateUser.Parameters.AddWithValue("p_EndUserID", e.CommandArgument);

                        cmdActivateUser.Connection.Open();
                        cmdActivateUser.ExecuteNonQuery();

                        cmdActivateUser.Connection.Close();

                    }

                    //GVUser.DataBind();
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
            }
            else
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
            showUpdate = true;
            Session["showUpdate"] = true;
            Response.Redirect(Request.RawUrl); // to ensure message always shows up
            Console.WriteLine("test");
            // Response.Redirect(Request.RawUrl);
        }

        protected void GVUser_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void lnkUpdate_Click(object sender, EventArgs e)
        {
            showUpdate = true;
            Session["showUpdate"] = true;
            Response.Redirect(Request.RawUrl); // to ensure message always shows up
        }

        protected void GVUser_RowCommand1(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}