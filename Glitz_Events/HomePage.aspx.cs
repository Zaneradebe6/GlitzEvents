using System;
using System.Web;
using System.Web.UI;

namespace Glitz_Events
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if user is authenticated
                if (Session["UserAuthenticated"] != null && (bool)Session["UserAuthenticated"])
                {
                    // Update UI for logged in user
                    btn_auth.Text = "LOGOUT";
                    btn_register.Visible = false;
                    userWelcome.Style["display"] = "inline";

                    if (Session["UserName"] != null)
                    {
                        usernamePlaceholder.InnerText = Session["UserName"].ToString();
                    }
                }
                else
                {
                    // Update UI for logged out user
                    btn_auth.Text = "LOGIN";
                    btn_register.Visible = true;
                    userWelcome.Style["display"] = "none";
                }
            }
        }

        protected void btn_auth_Click(object sender, EventArgs e)
        {
            if (Session["UserAuthenticated"] != null && (bool)Session["UserAuthenticated"])
            {
                // User is logged in, so log them out
                Session.Clear();
                Session.Abandon();

                // Clear authentication cookie if using forms authentication
                if (Request.Cookies["ASP.NET_SessionId"] != null)
                {
                    Response.Cookies["ASP.NET_SessionId"].Value = string.Empty;
                    Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddMonths(-20);
                }

                Response.Redirect("HomePage.aspx");
            }
            else
            {
                // User is not logged in, redirect to login page
                Response.Redirect("Login.aspx");
            }
        }

        protected void btn_register_Click(object sender, EventArgs e)
        {
            // Redirect to registration page
            Response.Redirect("Register.aspx");
        }

        protected void btn_plan_event_Click(object sender, EventArgs e)
        {
            if (Session["UserAuthenticated"] != null && (bool)Session["UserAuthenticated"])
            {
                // User is authenticated, redirect to booking page
                Response.Redirect("Booking.aspx");
            }
            else
            {
                // User is not authenticated, show login modal
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowLoginModal", "showLoginModal();", true);
            }
        }

        protected void btn_portfolio_Click(object sender, EventArgs e)
        {
            // Redirect to portfolio page
            Response.Redirect("Portfolio.aspx");
        }
    }
}