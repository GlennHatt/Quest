﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
   public partial class studentPledgePage : System.Web.UI.Page
   {
      protected void Page_Load(object sender, EventArgs e)
      {

      }
      protected void btnCheat_Click(object sender, EventArgs e)
      {
         Session["cheated_status"] = "1";
         OracleCommand cmdCheated = new OracleCommand(@"
BEGIN
  tests_taken.cheated(p_TestTakenID => :p_TestTakenID,
                      p_Cheated     => :P_Cheated);
END;",
         new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString));
         cmdCheated.Parameters.AddWithValue("p_TestTakenID", Session["TestTakenID"]);
         cmdCheated.Parameters.AddWithValue("P_Cheated", "Y");


         cmdCheated.Connection.Open();
         cmdCheated.ExecuteNonQuery();
         cmdCheated.Connection.Close();

         Session["testTakingID"] = null;
         Response.Redirect("~/Pages/studentGradeOverview.aspx");
      }

      protected void btnNoCheat_Click(object sender, EventArgs e)
      {
         Session["cheated_status"] = null;
         OracleCommand cmdPledgeCheck = new OracleCommand(@"
DECLARE
  pledge_signature varchar(300);
  actual_name      varchar(300);
  approval         number (1);
BEGIN
  SELECT f_name || ' ' || l_name into actual_name
    FROM end_user
   WHERE user_id = :session_id;
  IF UPPER(actual_name) = UPPER(:pledge_signature) then
     :approval := 1;
  ELSE
     approval := 0;
  END IF;
END;",
                          new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString));
         cmdPledgeCheck.Parameters.AddWithValue("pledge_signature", txtbxUsersName.Text);
         cmdPledgeCheck.Parameters.AddWithValue("session_id", Session["UserID"]);
         cmdPledgeCheck.Parameters.AddWithValue("approval", OleDbType.Integer).Direction = System.Data.ParameterDirection.Output;


         cmdPledgeCheck.Connection.Open();
         cmdPledgeCheck.ExecuteNonQuery();
         int approval = int.Parse(Convert.ToString(cmdPledgeCheck.Parameters["approval"].Value));
         cmdPledgeCheck.Connection.Close();

         if (approval == 1)
         {
            OracleCommand cmdCheated = new OracleCommand(@"
BEGIN
  tests_taken.cheated(p_TestTakenID => :p_TestTakenID,
                      p_Cheated     => :P_Cheated);
END;",
         new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString));
            cmdCheated.Parameters.AddWithValue("p_TestTakenID", Session["TestTakenID"]);
            cmdCheated.Parameters.AddWithValue("P_Cheated", "N");


            cmdCheated.Connection.Open();
            cmdCheated.ExecuteNonQuery();
            cmdCheated.Connection.Close();

            Session["testTakingID"] = null;
            Response.Redirect("~/Pages/studentGradeOverview.aspx");
         }
      }
   }
}