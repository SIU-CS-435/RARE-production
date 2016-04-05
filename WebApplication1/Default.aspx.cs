using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LogIn(object sender, EventArgs e)
        {
            //    if (IsValid)
            //    {
            // Validate the user password
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();

            // To disable password failures to trigger lockout, change to shouldLockout: true
            var result = signinManager.PasswordSignIn(Email.Text, Password.Text, RememberMe.Checked, shouldLockout: true);
            switch (result)
            {
                case SignInStatus.Success:
                    if (Page.IsValid)
                    {
                        IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                        break;
                    }
                    FailureText.Text = "Captcha failure";
                    ErrorMessage.Visible = true;
                    break;
                case SignInStatus.LockedOut:
                    recaptcha.Visible = true;
                    break;
                case SignInStatus.RequiresVerification:
                    Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}",
                                                    Request.QueryString["ReturnUrl"],
                                                    RememberMe.Checked),
                                      true);
                    break;
                case SignInStatus.Failure:
                default:
                    FailureText.Text = "Login failure";
                    ErrorMessage.Visible = true;
                    break;
            }
            //  }

        }
        protected void btnSubmit_Click(object sender, EventArgs args)
        {
            if (Page.IsValid)
            {
                lblResult.Text = "You Got It!";
                lblResult.ForeColor = System.Drawing.Color.Green;
            }
            else {
                lblResult.Text = "Incorrect";
                lblResult.ForeColor = System.Drawing.Color.Blue;
            }
        }

    }
}