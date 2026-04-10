using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI;

namespace Glitz_Events
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    // Check if email already exists
                    if (IsEmailExists(txtEmail.Text.Trim()))
                    {
                        ShowMessage("This email address is already registered. Please use a different email or try logging in.", false);
                        return;
                    }

                    // Hash the password
                    string hashedPassword = HashPassword(txtPassword.Text.Trim());

                    // Save to database and get the new user ID
                    int newUserId = SaveUser(
                        txtFirstName.Text.Trim(),
                        txtLastName.Text.Trim(),
                        txtEmail.Text.Trim(),
                        txtPhone.Text.Trim(),
                        hashedPassword
                    );

                    if (newUserId > 0)
                    {
                        // Auto-login the user after registration
                        Session["UserId"] = newUserId;
                        Session["UserName"] = $"{txtFirstName.Text.Trim()} {txtLastName.Text.Trim()}";
                        Session["IsAdmin"] = false; // New users are not admins by default
                        Session["UserAuthenticated"] = true;

                        ShowMessage("Registration successful! You are now logged in.", true);
                        ClearForm();

                        // Redirect to homepage after a brief delay
                        Response.AddHeader("REFRESH", "2;URL=HomePage.aspx");
                    }
                    else
                    {
                        ShowMessage("Registration failed. Please try again later.", false);
                    }
                }
                catch (Exception ex)
                {
                    ShowMessage("An error occurred during registration: " + ex.Message, false);
                }
            }
        }

        private bool IsEmailExists(string email)
        {
            // Use the correct connection string name from your Web.config
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["EventsConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM users WHERE Email = @Email";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);

                conn.Open();
                int count = (int)cmd.ExecuteScalar();

                return count > 0;
            }
        }

        private string HashPassword(string password)
        {
            // Use ASP.NET Membership provider to hash the password securely
            return FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");
        }

        private int SaveUser(string firstName, string lastName, string email, string phone, string password)
        {
            // Use the correct connection string name from your Web.config
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["EventsConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"INSERT INTO users 
                                (FirstName, LastName, Email, PhoneNumber, Password) 
                                OUTPUT INSERTED.UserId
                                VALUES 
                                (@FirstName, @LastName, @Email, @PhoneNumber, @Password)";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@FirstName", firstName);
                cmd.Parameters.AddWithValue("@LastName", lastName);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@PhoneNumber", string.IsNullOrEmpty(phone) ? (object)DBNull.Value : phone);
                cmd.Parameters.AddWithValue("@Password", password);

                conn.Open();
                int newUserId = (int)cmd.ExecuteScalar();

                return newUserId;
            }
        }

        private void ShowMessage(string message, bool isSuccess)
        {
            pnlMessage.Visible = true;
            litMessage.Text = message;
            pnlMessage.CssClass = isSuccess ? "message success" : "message error";
        }

        private void ClearForm()
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
        }
    }
}