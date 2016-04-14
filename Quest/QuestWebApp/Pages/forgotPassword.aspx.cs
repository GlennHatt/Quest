using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
   public partial class forgotPassword : System.Web.UI.Page
   {
      bool showMessage;
      protected void Page_Load(object sender, EventArgs e)
      {
         if (Session["showMessage"] != null)
            showMessage = (bool)Session["showMessage"];
         else
            showMessage = false;

         if (showMessage == true)
         {
            Page.ClientScript.RegisterStartupScript(this.GetType(),
            "toastr_message",
            "toastr.success('Message has been sent', 'Success!')", true);
            Session["showMessage"] = false;
         }
      }

      protected void btnSendMessage_Click(object sender, EventArgs e)
      {
         sendEmail();
         showMessage = true;
         Session["showMessage"] = true;
         Response.Redirect(Request.RawUrl); // to ensure message always shows up
      }

      protected void sendEmail()
      {
         SmtpClient smtpClient = new SmtpClient("students.pcci.edu", 25);

         smtpClient.Credentials = new System.Net.NetworkCredential("studentnet\\" + txtbxStudentID.Text, "password");
         smtpClient.UseDefaultCredentials = true;
         smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
         smtpClient.EnableSsl = true;

         MailMessage mail = new MailMessage();

         //Setting From , To and CC
         mail.From = new MailAddress(txtbxStudentEmail.Text, txtbxStudentID.Text);
         //mail.To.Add(new MailAddress("ryan8440@gmail.com"));
         mail.Subject = txtbxStudentLogin.Text + "password reset";
         mail.Body = txtbxMessageBody.Value;


         // Accepts all certificates
         ServicePointManager.ServerCertificateValidationCallback =
         delegate (object s, X509Certificate certificate,
          X509Chain chain, SslPolicyErrors sslPolicyErrors)
         { return true; };


         smtpClient.Send(mail);
      }

      protected void btnbackToLogin_Click(object sender, EventArgs e)
      {
         Response.Redirect("login.aspx");
      }
   }
}