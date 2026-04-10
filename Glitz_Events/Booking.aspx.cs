using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Glitz_Events
{
    public partial class Booking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if user is logged in using the correct session variable
                if (Session["UserAuthenticated"] != null && (bool)Session["UserAuthenticated"] && Session["UserId"] != null)
                {
                    int userId = Convert.ToInt32(Session["UserId"]);
                    LoadUserDetails(userId);

                    // Update UI for logged in user
                    btnAuth.Text = "LOGOUT";
                    btnRegister.Visible = false;
                    lblUserWelcome.Visible = true;

                    if (Session["UserName"] != null)
                    {
                        lblUserWelcome.Text = $"Welcome, {Session["UserName"]}!";
                    }
                }
                else
                {
                    // Redirect to login if not authenticated
                    Response.Redirect("Login.aspx");
                }
            }
        }

        private void LoadUserDetails(int userId)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["EventsConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT FirstName, LastName, Email, PhoneNumber FROM users WHERE UserId = @UserId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserId", userId);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        // Display user information
                        lblUserName.Text = $"{reader["FirstName"]} {reader["LastName"]}";
                        lblUserEmail.Text = reader["Email"].ToString();
                        lblUserPhone.Text = reader["PhoneNumber"].ToString();
                        pnlUserInfo.Visible = true;
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    ShowMessage("Error loading user details: " + ex.Message, false);
                }
            }
        }

        protected void btnSubmitBooking_Click(object sender, EventArgs e)
        {
            if (Page.IsValid && Session["UserId"] != null)
            {
                try
                {
                    int userId = Convert.ToInt32(Session["UserId"]);

                    // Save booking to database
                    if (SaveBooking(userId))
                    {
                        ShowMessage("Your booking has been submitted successfully! We'll contact you shortly to confirm details.", true);
                        ClearForm();
                    }
                    else
                    {
                        ShowMessage("Booking submission failed. Please try again later.", false);
                    }
                }
                catch (Exception ex)
                {
                    // More detailed error message
                    ShowMessage("An error occurred during booking: " + ex.Message +
                               ". Please check if the Bookings table exists in the database.", false);
                }
            }
        }

        private bool SaveBooking(int userId)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["EventsConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // First check if the Bookings table exists
                string checkTableQuery = "SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Bookings'";
                SqlCommand checkCmd = new SqlCommand(checkTableQuery, conn);

                conn.Open();
                int tableExists = (int)checkCmd.ExecuteScalar();

                if (tableExists == 0)
                {
                    // Table doesn't exist
                    throw new Exception("The Bookings table does not exist in the database.");
                }

                string query = @"INSERT INTO Bookings 
                                (UserId, EventType, StartDate, EndDate, EventTime, ColorTheme, GuestCount, 
                                 Address, SpecialRequests, BookingDate) 
                                VALUES 
                                (@UserId, @EventType, @StartDate, @EndDate, @EventTime, @ColorTheme, @GuestCount, 
                                 @Address, @SpecialRequests, GETDATE())";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.Parameters.AddWithValue("@EventType", ddlEventType.SelectedValue);
                cmd.Parameters.AddWithValue("@StartDate", Convert.ToDateTime(txtStartDate.Text));
                cmd.Parameters.AddWithValue("@EndDate", Convert.ToDateTime(txtEndDate.Text));
                cmd.Parameters.AddWithValue("@EventTime", TimeSpan.Parse(txtEventTime.Text));
                cmd.Parameters.AddWithValue("@ColorTheme", ddlColorTheme.SelectedValue);
                cmd.Parameters.AddWithValue("@GuestCount", Convert.ToInt32(txtGuestCount.Text));
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@SpecialRequests",
                    string.IsNullOrEmpty(txtSpecialRequests.Text) ? (object)DBNull.Value : txtSpecialRequests.Text);

                int rowsAffected = cmd.ExecuteNonQuery();

                return rowsAffected > 0;
            }
        }

        protected void btnAuth_Click(object sender, EventArgs e)
        {
            if (Session["UserAuthenticated"] != null && (bool)Session["UserAuthenticated"])
            {
                // User is logged in, so log them out
                Session.Clear();
                Session.Abandon();
                Response.Redirect("HomePage.aspx");
            }
            else
            {
                // User is not logged in, redirect to login page
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        private void ShowMessage(string message, bool isSuccess)
        {
            pnlMessage.Visible = true;
            litMessage.Text = message;
            pnlMessage.CssClass = isSuccess ? "message success" : "message error";
        }

        private void ClearForm()
        {
            ddlEventType.SelectedIndex = 0;
            txtStartDate.Text = "";
            txtEndDate.Text = "";
            txtEventTime.Text = "";
            ddlColorTheme.SelectedIndex = 0;
            txtGuestCount.Text = "";
            txtAddress.Text = "";
            txtSpecialRequests.Text = "";
        }
    }
}