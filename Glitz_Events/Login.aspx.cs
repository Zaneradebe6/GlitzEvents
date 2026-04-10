using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI;

namespace Glitz_Events
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Redirect if already logged in
            if (Session["UserAuthenticated"] != null && (bool)Session["UserAuthenticated"])
            {
                RedirectBasedOnRole();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string email = txtEmail.Text.Trim();
                    string password = txtPassword.Text.Trim();

                    // Authenticate user
                    if (AuthenticateUser(email, password))
                    {
                        // Redirect based on role
                        RedirectBasedOnRole();
                    }
                    else
                    {
                        ShowMessage("Invalid email or password. Please try again.", false);
                    }
                }
                catch (Exception ex)
                {
                    ShowMessage("An error occurred during login: " + ex.Message, false);
                }
            }
        }

        private bool AuthenticateUser(string email, string password)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["EventsConnectionString"].ConnectionString;
            string hashedPassword = HashPassword(password);

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT UserId, FirstName, LastName, IsAdmin FROM users WHERE Email = @Email AND Password = @Password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", hashedPassword);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    // Store user information in session
                    Session["UserId"] = reader["UserId"].ToString();
                    Session["UserName"] = $"{reader["FirstName"]} {reader["LastName"]}";
                    Session["IsAdmin"] = reader["IsAdmin"].ToString();
                    Session["UserAuthenticated"] = true; // Add this line

                    reader.Close();
                    return true;
                }

                reader.Close();
                return false;
            }
        }

        private string HashPassword(string password)
        {
            // Use the same hashing method as in registration
            return FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");
        }

        private void RedirectBasedOnRole()
        {
            if (Session["IsAdmin"] != null && Convert.ToBoolean(Session["IsAdmin"]))
            {
                // Redirect to admin dashboard
                Response.Redirect("AdminDashboard.aspx");
            }
            else
            {
                // Redirect to home page for regular users
                Response.Redirect("HomePage.aspx");
            }
        }

        private void ShowMessage(string message, bool isSuccess)
        {
            pnlMessage.Visible = true;
            litMessage.Text = message;
            pnlMessage.CssClass = isSuccess ? "message success" : "message error";
        }
    }
}