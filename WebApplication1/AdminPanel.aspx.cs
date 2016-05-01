using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        public string userid = HttpContext.Current.User.Identity.Name;

        protected void Page_Load(object sender, EventArgs e)
        {
            // If not logged in, redirect to Login Page
            if (userid.Equals(""))
                Response.Redirect("/Account/Login.aspx", true);

        }
        protected void GridView2_RowDeleting(Object sender, GridViewDeleteEventArgs e)
        {
            TableCell Email = GridView2.Rows[e.RowIndex].Cells[1];
            var myMessage = new SendGrid.SendGridMessage();
            myMessage.AddTo(Email.Text);
            myMessage.From = new MailAddress("allison.campbell282@gmail.com", "ToDoTaskList");
            myMessage.Subject = "ToDoTaskList Account Removal!";
            myMessage.Text = "Your account has been removed from ToDoTaskList. Sorry to see you go...";

            var transportWeb = new SendGrid.Web("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");
            transportWeb.DeliverAsync(myMessage);
        }
    }
}