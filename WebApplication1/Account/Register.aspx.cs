using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using WebApplication1.Models;
using System.Net.Mail;

namespace WebApplication1.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);
            if (result.Succeeded)
            {
                // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                var myMessage = new SendGrid.SendGridMessage();
                myMessage.AddTo(Email.Text);
                myMessage.From = new MailAddress("allison.campbell282@gmail.com", "ToDoTaskList");
                myMessage.Subject = "Welcome to ToDoTaskList!";
                myMessage.Text = "ToDoTaskList is an iterative tasklist that helps you seize the day.";

                var transportWeb = new SendGrid.Web("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");
                transportWeb.DeliverAsync(myMessage);
                signInManager.SignIn( user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else 
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}