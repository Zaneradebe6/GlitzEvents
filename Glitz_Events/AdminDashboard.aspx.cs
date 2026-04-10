using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Glitz_Events
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is admin
            if (Session["UserAuthenticated"] == null || !(bool)Session["UserAuthenticated"] ||
                Session["IsAdmin"] == null || !Convert.ToBoolean(Session["IsAdmin"]))
            {
                Response.Redirect("HomePage.aspx");
            }

            if (!IsPostBack)
            {
                lblUserWelcome.Text = $"Welcome, {Session["UserName"]}! (Admin)";
                lblLastUpdate.Text = $"Last updated: {DateTime.Now.ToString("MM/dd/yyyy HH:mm")}";

                LoadStatistics();
                LoadUsers();
                LoadBookings();
            }
        }

        private void LoadStatistics()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["EventsConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
               
                string userQuery = "SELECT COUNT(*) FROM users";
                SqlCommand userCmd = new SqlCommand(userQuery, conn);
                conn.Open();
                lblTotalUsers.Text = userCmd.ExecuteScalar().ToString();

               
                string bookingQuery = "SELECT COUNT(*) FROM Bookings";
                SqlCommand bookingCmd = new SqlCommand(bookingQuery, conn);
                lblTotalBookings.Text = bookingCmd.ExecuteScalar().ToString();

               
                string pendingQuery = "SELECT COUNT(*) FROM Bookings WHERE Status = 'Pending'";
                SqlCommand pendingCmd = new SqlCommand(pendingQuery, conn);
                lblPendingBookings.Text = pendingCmd.ExecuteScalar().ToString();

                
                string confirmedQuery = "SELECT COUNT(*) FROM Bookings WHERE Status = 'Confirmed'";
                SqlCommand confirmedCmd = new SqlCommand(confirmedQuery, conn);
                lblConfirmedBookings.Text = confirmedCmd.ExecuteScalar().ToString();
            }
        }

        private void LoadUsers()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["EventsConnectionString"].ConnectionString;
            string query = "SELECT UserId, FirstName, LastName, Email, PhoneNumber, IsAdmin, DateCreated FROM users";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvUsers.DataSource = dt;
                gvUsers.DataBind();
            }
        }

        private void LoadBookings()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["EventsConnectionString"].ConnectionString;
            string query = @"SELECT b.BookingId, u.FirstName + ' ' + u.LastName as CustomerName, b.EventType, 
                            b.StartDate, b.EndDate, b.GuestCount, b.Status, b.BookingDate 
                            FROM Bookings b INNER JOIN users u ON b.UserId = u.UserId";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvBookings.DataSource = dt;
                gvBookings.DataBind();
            }
        }

        protected void btnFilterUsers_Click(object sender, EventArgs e)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["EventsConnectionString"].ConnectionString;
            string query = "SELECT UserId, FirstName, LastName, Email, PhoneNumber, IsAdmin, DateCreated FROM users WHERE 1=1";

            if (!string.IsNullOrEmpty(txtUserSearch.Text))
            {
                query += " AND (FirstName LIKE @Search OR LastName LIKE @Search OR Email LIKE @Search)";
            }

            if (!string.IsNullOrEmpty(ddlUserRole.SelectedValue))
            {
                query += " AND IsAdmin = @IsAdmin";
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);

                if (!string.IsNullOrEmpty(txtUserSearch.Text))
                {
                    cmd.Parameters.AddWithValue("@Search", "%" + txtUserSearch.Text + "%");
                }

                if (!string.IsNullOrEmpty(ddlUserRole.SelectedValue))
                {
                    cmd.Parameters.AddWithValue("@IsAdmin", ddlUserRole.SelectedValue == "Admin");
                }

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvUsers.DataSource = dt;
                gvUsers.DataBind();
            }
        }

        protected void btnFilterBookings_Click(object sender, EventArgs e)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["EventsConnectionString"].ConnectionString;
            string query = @"SELECT b.BookingId, u.FirstName + ' ' + u.LastName as CustomerName, b.EventType, 
                            b.StartDate, b.EndDate, b.GuestCount, b.Status, b.BookingDate 
                            FROM Bookings b INNER JOIN users u ON b.UserId = u.UserId WHERE 1=1";

            if (!string.IsNullOrEmpty(ddlBookingEventType.SelectedValue))
            {
                query += " AND b.EventType = @EventType";
            }

            if (!string.IsNullOrEmpty(ddlBookingStatus.SelectedValue))
            {
                query += " AND b.Status = @Status";
            }

            if (!string.IsNullOrEmpty(txtStartDate.Text))
            {
                query += " AND b.BookingDate >= @StartDate";
            }

            if (!string.IsNullOrEmpty(txtEndDate.Text))
            {
                query += " AND b.BookingDate <= @EndDate";
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);

                if (!string.IsNullOrEmpty(ddlBookingEventType.SelectedValue))
                {
                    cmd.Parameters.AddWithValue("@EventType", ddlBookingEventType.SelectedValue);
                }

                if (!string.IsNullOrEmpty(ddlBookingStatus.SelectedValue))
                {
                    cmd.Parameters.AddWithValue("@Status", ddlBookingStatus.SelectedValue);
                }

                if (!string.IsNullOrEmpty(txtStartDate.Text))
                {
                    cmd.Parameters.AddWithValue("@StartDate", Convert.ToDateTime(txtStartDate.Text));
                }

                if (!string.IsNullOrEmpty(txtEndDate.Text))
                {
                    cmd.Parameters.AddWithValue("@EndDate", Convert.ToDateTime(txtEndDate.Text).AddDays(1));
                }

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvBookings.DataSource = dt;
                gvBookings.DataBind();
            }
        }

        protected void gvUsers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvUsers.EditIndex = e.NewEditIndex;
            LoadUsers();
        }

        protected void gvUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["EventsConnectionString"].ConnectionString;
            int userId = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);

            TextBox txtPhone = (TextBox)gvUsers.Rows[e.RowIndex].FindControl("txtPhone");
            CheckBox chkIsAdmin = (CheckBox)gvUsers.Rows[e.RowIndex].FindControl("chkIsAdmin");

            string query = "UPDATE users SET PhoneNumber = @PhoneNumber, IsAdmin = @IsAdmin WHERE UserId = @UserId";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhone.Text);
                cmd.Parameters.AddWithValue("@IsAdmin", chkIsAdmin.Checked);
                cmd.Parameters.AddWithValue("@UserId", userId);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            gvUsers.EditIndex = -1;
            LoadUsers();
            ShowMessage("User updated successfully!", true);
        }

        protected void gvUsers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvUsers.EditIndex = -1;
            LoadUsers();
        }

        protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["EventsConnectionString"].ConnectionString;
            int userId = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);

            string query = "DELETE FROM users WHERE UserId = @UserId";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserId", userId);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            LoadUsers();
            LoadStatistics(); 
            ShowMessage("User deleted successfully!", true);
        }

        protected void gvBookings_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvBookings.EditIndex = e.NewEditIndex;
            LoadBookings();
        }

        protected void gvBookings_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["EventsConnectionString"].ConnectionString;
            int bookingId = Convert.ToInt32(gvBookings.DataKeys[e.RowIndex].Value);

            DropDownList ddlStatus = (DropDownList)gvBookings.Rows[e.RowIndex].FindControl("ddlStatus");

            string query = "UPDATE Bookings SET Status = @Status WHERE BookingId = @BookingId";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@BookingId", bookingId);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            gvBookings.EditIndex = -1;
            LoadBookings();
            LoadStatistics();
            ShowMessage("Booking updated successfully!", true);
        }

        protected void gvBookings_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvBookings.EditIndex = -1;
            LoadBookings();
        }

        protected void gvBookings_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["EventsConnectionString"].ConnectionString;
            int bookingId = Convert.ToInt32(gvBookings.DataKeys[e.RowIndex].Value);

            string query = "DELETE FROM Bookings WHERE BookingId = @BookingId";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@BookingId", bookingId);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            LoadBookings();
            LoadStatistics();
            ShowMessage("Booking deleted successfully!", true);
        }

        protected void btnViewBooking_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int bookingId = Convert.ToInt32(gvBookings.DataKeys[row.RowIndex].Value);

            
            ShowMessage($"Viewing details for booking ID: {bookingId}", true);
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("HomePage.aspx");
        }

        private void ShowMessage(string message, bool isSuccess)
        {
            pnlMessage.Visible = true;
            litMessage.Text = message;
            pnlMessage.CssClass = isSuccess ? "message success" : "message error";
        }
    }
}