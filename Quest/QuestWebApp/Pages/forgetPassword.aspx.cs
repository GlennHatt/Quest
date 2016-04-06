using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
    public partial class forgetPassword : System.Web.UI.Page
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
            //SmtpClient smtpClient = new SmtpClient("students.pcci.edu", 25);
            //int number;

            //if(!int.TryParse(txtbxStudentID.Text, out number)
            //{
            //    //throw new ar
            //}

            //smtpClient.Credentials = new System.Net.NetworkCredential("studentnet\\" + studentEmailUsername, studentEmailPassword);
            //smtpClient.UseDefaultCredentials = true;
            //smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            //smtpClient.EnableSsl = true;

            //MailMessage mail = new MailMessage();

            ////Setting From , To and CC
            //mail.From = new MailAddress(studentEmailAddress, studentName);
            //mail.To.Add(new MailAddress("ryan8440@gmail.com"));
            //mail.Subject = txtbxMessageSubject.Text;
            //mail.Body = txtbxMessageBody.Value;


            //// Accepts all certificates
            //ServicePointManager.ServerCertificateValidationCallback =
            //delegate (object s, X509Certificate certificate,
            // X509Chain chain, SslPolicyErrors sslPolicyErrors)
            //{ return true; };


            //smtpClient.Send(mail);
        }
    }
}