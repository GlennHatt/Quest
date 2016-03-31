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
            GVClass.HeaderRow.TableSection = TableRowSection.TableHeader;
                
        }

        protected void GVClass_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCellCollection cell = e.Row.Cells;
                cell[0].Attributes.Add("data-title", "Code");
                cell[1].Attributes.Add("data-title", "Title");
                cell[2].Attributes.Add("data-title", "Section Number");
                cell[3].Attributes.Add("data-title", "Last Name");
                cell[4].Attributes.Add("data-title", "Delete");
            }
        }

        protected void btnDone(object sender, EventArgs e)
        {
            //Get the button that raised the event
            Button btn = (Button)sender;

            //Get the row that contains this button
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            /*OracleCommand cmdDeleteClass = new OracleCommand(@"
BEGIN
   classes.delete(
    p_ClassID   => :p_ClassID);
END;",
             new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString));
            cmdAddTFQuestion.Parameters.AddWithValue("p_ClassID", ((Label)question.FindControl("Label1")).Text);
            //CLASS ID -----------------------------------^

            cmdAddTFQuestion.Connection.Open();
            cmdAddTFQuestion.ExecuteNonQuery();

            cmdAddTFQuestion.Connection.Close();*/
        }
    }
}