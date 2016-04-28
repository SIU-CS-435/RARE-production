using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using WebApplication1.Models;

namespace WebApplication1.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register";
            // Enable this once you have account confirmation enabled for password reset functionality
            // ForgotPasswordHyperLink.NavigateUrl = "Forgot";
            // OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
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
        protected void Login1_LoginError(object sender, EventArgs e)
        {
            if (Session["time"] == null)
            {
                int time = 1;
                Session["time"] = time;
                Response.Write("Wrong times: 1");
            }
            else
            {
                int time = (int)Session["time"];

                Session["time"] = time + 1;
                Response.Write("Wrong times: " + time.ToString());
                if (time >= 3)
                {
                    Response.Redirect("/Account/Lockout");
                }
            }
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