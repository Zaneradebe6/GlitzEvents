<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Glitz_Events.AdminDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Glitz Events</title>
    <style>
        /* ===== GLOBAL STYLES ===== */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Georgia', serif;
            background: linear-gradient(135deg, #f5f5f5 0%, #e8e8e8 100%);
            min-height: 100vh;
            color: #2c2c2c;
            line-height: 1.6;
        }

        /* ===== HEADER STYLES ===== */
        .header {
            background: rgba(255, 255, 255, 0.95);
            padding: 20px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .logo {
            display: flex;
            align-items: center;
            font-size: 24px;
            font-weight: bold;
            color: #2c2c2c;
            cursor: pointer;
        }

        .logo-symbol {
            font-size: 28px;
            margin-right: 15px;
            font-style: italic;
        }

        .nav {
            display: flex;
            gap: 40px;
            align-items: center;
        }

            .nav a {
                text-decoration: none;
                color: #2c2c2c;
                font-weight: 500;
                font-size: 16px;
                transition: color 0.3s ease;
                text-transform: uppercase;
            }

                .nav a:hover {
                    color: #8B4513;
                }

                .nav a.active {
                    color: #8B4513;
                    font-weight: 600;
                }

        .auth-buttons {
            display: flex;
            gap: 20px;
            align-items: center;
        }

        .login-btn {
            color: #2c2c2c;
            text-decoration: none;
            font-weight: 500;
            text-transform: uppercase;
            background: none;
            border: none;
            cursor: pointer;
            font-family: 'Georgia', serif;
            font-size: 16px;
            padding: 10px 15px;
        }

        .register-btn {
            background: #2c2c2c;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            font-weight: 500;
            transition: background 0.3s ease;
            text-transform: uppercase;
            border: none;
            cursor: pointer;
            font-family: 'Georgia', serif;
            font-size: 16px;
        }

            .register-btn:hover {
                background: #8B4513;
            }

        .moon-toggle {
            background: none;
            border: none;
            font-size: 20px;
            cursor: pointer;
            margin-right: 20px;
        }

        .user-welcome {
            margin-right: 15px;
            color: #2c2c2c;
            font-weight: 500;
        }

        /* ===== ADMIN DASHBOARD STYLES ===== */
        .admin-container {
            padding: 30px 50px;
            max-width: 1400px;
            margin: 0 auto;
        }

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .dashboard-title {
            font-size: 32px;
            color: #2c2c2c;
            font-weight: 400;
        }

        .admin-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .stat-value {
            font-size: 36px;
            font-weight: bold;
            color: #8B4513;
            margin-bottom: 10px;
        }

        .stat-label {
            font-size: 16px;
            color: #666;
        }

        .admin-section {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .section-title {
            font-size: 24px;
            color: #2c2c2c;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #8B4513;
        }

        .filters {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }

        .filter-group {
            display: flex;
            flex-direction: column;
            min-width: 200px;
        }

        .filter-label {
            font-weight: 500;
            margin-bottom: 5px;
            color: #2c2c2c;
        }

        .filter-input, .filter-dropdown {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-family: 'Georgia', serif;
            font-size: 16px;
        }

        .btn-filter {
            background: #2c2c2c;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-family: 'Georgia', serif;
            font-size: 16px;
            align-self: flex-end;
            margin-top: 25px;
        }

            .btn-filter:hover {
                background: #8B4513;
            }

        .gridview-container {
            overflow-x: auto;
            margin-top: 20px;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
        }

            .gridview th {
                background-color: #2c2c2c;
                color: white;
                padding: 12px;
                text-align: left;
            }

            .gridview td {
                padding: 12px;
                border-bottom: 1px solid #ddd;
            }

            .gridview tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            .gridview tr:hover {
                background-color: #f1f1f1;
            }

        .action-buttons {
            display: flex;
            gap: 10px;
        }

        .btn-edit {
            background: #8B4513;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-family: 'Georgia', serif;
            font-size: 14px;
        }

        .btn-delete {
            background: #dc3545;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-family: 'Georgia', serif;
            font-size: 14px;
        }

        .btn-view {
            background: #2c2c2c;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-family: 'Georgia', serif;
            font-size: 14px;
        }

        .message {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            text-align: center;
        }

        .success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        /* ===== FOOTER STYLES ===== */
        .footer {
            background: linear-gradient(135deg, #1a1a1a 0%, #2c2c2c 100%);
            color: white;
            padding: 60px 50px 30px;
            margin-top: 40px;
        }

        .footer-container {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 1fr;
            gap: 50px;
        }

        .footer-logo {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
            cursor: pointer;
        }

            .footer-logo .logo-text {
                font-style: italic;
            }

        .footer-description {
            color: #ccc;
            line-height: 1.6;
            margin-bottom: 25px;
        }

        .contact-info p {
            margin-bottom: 10px;
            color: #ccc;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .footer-column h4 {
            font-size: 18px;
            margin-bottom: 20px;
            color: #D4AF37;
            font-weight: 500;
        }

        .footer-column ul {
            list-style: none;
        }

            .footer-column ul li {
                margin-bottom: 12px;
            }

                .footer-column ul li a {
                    color: #ccc;
                    text-decoration: none;
                    transition: color 0.3s ease;
                    display: block;
                }

                    .footer-column ul li a:hover {
                        color: #D4AF37;
                    }

        .footer-bottom {
            border-top: 1px solid #444;
            margin-top: 40px;
            padding-top: 20px;
            text-align: center;
            color: #999;
        }

        /* ===== RESPONSIVE STYLES ===== */
        @media (max-width: 1024px) {
            .admin-container {
                padding: 20px 30px;
            }

            .admin-stats {
                grid-template-columns: repeat(2, 1fr);
            }

            .footer-container {
                grid-template-columns: 1fr 1fr;
            }
        }

        @media (max-width: 768px) {
            .header {
                padding: 15px 20px;
                flex-wrap: wrap;
            }

            .nav {
                gap: 20px;
                flex-wrap: wrap;
                justify-content: center;
                margin: 15px 0;
            }

            .admin-stats {
                grid-template-columns: 1fr;
            }

            .filters {
                flex-direction: column;
            }

            .footer {
                padding: 40px 20px 20px;
            }

            .footer-container {
                grid-template-columns: 1fr;
                gap: 30px;
            }
        }

        /* ===== DARK MODE STYLES ===== */
        body.dark-mode {
            background: linear-gradient(135deg, #2c2c2c 0%, #1a1a1a 100%);
            color: #fff;
        }

        body.dark-mode .header {
            background: rgba(44, 44, 44, 0.95);
        }

        body.dark-mode .nav a,
        body.dark-mode .login-btn,
        body.dark-mode .user-welcome {
            color: #fff;
        }

        body.dark-mode .admin-section,
        body.dark-mode .stat-card {
            background: #333;
            color: #fff;
        }

        body.dark-mode .section-title,
        body.dark-mode .stat-label,
        body.dark-mode .filter-label {
            color: #fff;
        }

        body.dark-mode .filter-input,
        body.dark-mode .filter-dropdown {
            background: #444;
            color: #fff;
            border-color: #555;
        }

        body.dark-mode .gridview th {
            background-color: #8B4513;
        }

        body.dark-mode .gridview td {
            border-color: #555;
        }

        body.dark-mode .gridview tr:nth-child(even) {
            background-color: #3a3a3a;
        }

        body.dark-mode .gridview tr:hover {
            background-color: #4a4a4a;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header class="header">
            <div class="logo" onclick="redirectToHomePage()">
                <span class="logo-symbol">GLITZ EVENTS</span>
            </div>
            
            <nav class="nav">
                <a href="HomePage.aspx">HOME</a>
                <a href="AdminDashboard.aspx" class="active">DASHBOARD</a>
                <a href="Services.aspx">SERVICES</a>
                <a href="Portfolio.aspx">PORTFOLIO</a>
                <a href="About.aspx">ABOUT</a>
            </nav>
            
            <div class="auth-buttons">
                <button type="button" class="moon-toggle">🌙</button>
                <asp:Label ID="lblUserWelcome" runat="server" CssClass="user-welcome"></asp:Label>
                <asp:LinkButton ID="btnLogout" runat="server" CssClass="login-btn" OnClick="btnLogout_Click">LOGOUT</asp:LinkButton>
            </div>
        </header>

        <div class="admin-container">
            <div class="dashboard-header">
                <h1 class="dashboard-title">Admin Dashboard</h1>
                <asp:Label ID="lblLastUpdate" runat="server" Text=""></asp:Label>
            </div>
            
            <asp:Panel ID="pnlMessage" runat="server" CssClass="message" Visible="false">
                <asp:Literal ID="litMessage" runat="server"></asp:Literal>
            </asp:Panel>
            
            <div class="admin-stats">
                <div class="stat-card">
                    <div class="stat-value"><asp:Label ID="lblTotalUsers" runat="server" Text="0"></asp:Label></div>
                    <div class="stat-label">Total Users</div>
                </div>
                <div class="stat-card">
                    <div class="stat-value"><asp:Label ID="lblTotalBookings" runat="server" Text="0"></asp:Label></div>
                    <div class="stat-label">Total Bookings</div>
                </div>
                <div class="stat-card">
                    <div class="stat-value"><asp:Label ID="lblPendingBookings" runat="server" Text="0"></asp:Label></div>
                    <div class="stat-label">Pending Bookings</div>
                </div>
                <div class="stat-card">
                    <div class="stat-value"><asp:Label ID="lblConfirmedBookings" runat="server" Text="0"></asp:Label></div>
                    <div class="stat-label">Confirmed Bookings</div>
                </div>
            </div>
            
            <div class="admin-section">
                <h2 class="section-title">User Management</h2>
                
                <div class="filters">
                    <div class="filter-group">
                        <label class="filter-label">Search Users</label>
                        <asp:TextBox ID="txtUserSearch" runat="server" CssClass="filter-input" placeholder="Search by name or email"></asp:TextBox>
                    </div>
                    <div class="filter-group">
                        <label class="filter-label">User Role</label>
                        <asp:DropDownList ID="ddlUserRole" runat="server" CssClass="filter-dropdown">
                            <asp:ListItem Value="" Text="All Users"></asp:ListItem>
                            <asp:ListItem Value="Admin" Text="Admins"></asp:ListItem>
                            <asp:ListItem Value="User" Text="Regular Users"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <asp:Button ID="btnFilterUsers" runat="server" Text="Filter" CssClass="btn-filter" OnClick="btnFilterUsers_Click" />
                </div>
                
                <div class="gridview-container">
                    <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" CssClass="gridview"
                        DataKeyNames="UserId" OnRowDeleting="gvUsers_RowDeleting" OnRowEditing="gvUsers_RowEditing" 
                        OnRowUpdating="gvUsers_RowUpdating" OnRowCancelingEdit="gvUsers_RowCancelingEdit">
                        <Columns>
                            <asp:BoundField DataField="UserId" HeaderText="ID" ReadOnly="True" />
                            <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                            <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:TemplateField HeaderText="Phone">
                                <ItemTemplate>
                                    <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("PhoneNumber") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("PhoneNumber") %>' CssClass="filter-input"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Admin">
                                <ItemTemplate>
                                    <asp:Label ID="lblIsAdmin" runat="server" Text='<%# (bool)Eval("IsAdmin") ? "Yes" : "No" %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="chkIsAdmin" runat="server" Checked='<%# Bind("IsAdmin") %>' />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="DateCreated" HeaderText="Registered" DataFormatString="{0:MM/dd/yyyy}" ReadOnly="True" />
                            <asp:CommandField ShowEditButton="True" ButtonType="Button" EditText="Edit" UpdateText="Update" CancelText="Cancel" 
                                ControlStyle-CssClass="btn-edit" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" CssClass="btn-delete" 
                                        OnClientClick="return confirm('Are you sure you want to delete this user?');" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            
            <div class="admin-section">
                <h2 class="section-title">Booking Management</h2>
                
                <div class="filters">
                    <div class="filter-group">
                        <label class="filter-label">Event Type</label>
                        <asp:DropDownList ID="ddlBookingEventType" runat="server" CssClass="filter-dropdown">
                            <asp:ListItem Value="" Text="All Events"></asp:ListItem>
                            <asp:ListItem Value="Wedding" Text="Wedding"></asp:ListItem>
                            <asp:ListItem Value="Corporate" Text="Corporate"></asp:ListItem>
                            <asp:ListItem Value="Birthday" Text="Birthday"></asp:ListItem>
                            <asp:ListItem Value="Graduation" Text="Graduation"></asp:ListItem>
                            <asp:ListItem Value="Anniversary" Text="Anniversary"></asp:ListItem>
                            <asp:ListItem Value="Other" Text="Other"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="filter-group">
                        <label class="filter-label">Status</label>
                        <asp:DropDownList ID="ddlBookingStatus" runat="server" CssClass="filter-dropdown">
                            <asp:ListItem Value="" Text="All Statuses"></asp:ListItem>
                            <asp:ListItem Value="Pending" Text="Pending"></asp:ListItem>
                            <asp:ListItem Value="Confirmed" Text="Confirmed"></asp:ListItem>
                            <asp:ListItem Value="Completed" Text="Completed"></asp:ListItem>
                            <asp:ListItem Value="Cancelled" Text="Cancelled"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="filter-group">
                        <label class="filter-label">Date Range</label>
                        <asp:TextBox ID="txtStartDate" runat="server" CssClass="filter-input" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="filter-group">
                        <label class="filter-label">To</label>
                        <asp:TextBox ID="txtEndDate" runat="server" CssClass="filter-input" TextMode="Date"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnFilterBookings" runat="server" Text="Filter" CssClass="btn-filter" OnClick="btnFilterBookings_Click" />
                </div>
                
                <div class="gridview-container">
                    <asp:GridView ID="gvBookings" runat="server" AutoGenerateColumns="False" CssClass="gridview"
                        DataKeyNames="BookingId" OnRowDeleting="gvBookings_RowDeleting" OnRowEditing="gvBookings_RowEditing" 
                        OnRowUpdating="gvBookings_RowUpdating" OnRowCancelingEdit="gvBookings_RowCancelingEdit">
                        <Columns>
                            <asp:BoundField DataField="BookingId" HeaderText="ID" ReadOnly="True" />
                            <asp:BoundField DataField="CustomerName" HeaderText="Customer" ReadOnly="True" />
                            <asp:BoundField DataField="EventType" HeaderText="Event Type" />
                            <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:MM/dd/yyyy}" ReadOnly="True" />
                            <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:MM/dd/yyyy}" ReadOnly="True" />
                            <asp:BoundField DataField="GuestCount" HeaderText="Guests" ReadOnly="True" />
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="filter-dropdown" SelectedValue='<%# Bind("Status") %>'>
                                        <asp:ListItem Value="Pending">Pending</asp:ListItem>
                                        <asp:ListItem Value="Confirmed">Confirmed</asp:ListItem>
                                        <asp:ListItem Value="Completed">Completed</asp:ListItem>
                                        <asp:ListItem Value="Cancelled">Cancelled</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="BookingDate" HeaderText="Booked On" DataFormatString="{0:MM/dd/yyyy}" ReadOnly="True" />
                            <asp:CommandField ShowEditButton="True" ButtonType="Button" EditText="Edit" UpdateText="Update" CancelText="Cancel" 
                                ControlStyle-CssClass="btn-edit" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnViewBooking" runat="server" Text="View" CssClass="btn-view" 
                                        OnClick="btnViewBooking_Click" />
                                    <asp:Button ID="btnDeleteBooking" runat="server" CommandName="Delete" Text="Delete" CssClass="btn-delete" 
                                        OnClientClick="return confirm('Are you sure you want to delete this booking?');" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <footer class="footer">
            <div class="footer-container">
                <div class="footer-column">
                    <div class="footer-logo" onclick="redirectToHomePage()">
                        <span class="logo-text">GLITZ EVENTS</span>
                    </div>
                    <p class="footer-description">
                        Turning moments into memories.
                    </p>
                    <div class="contact-info">
                        <p>📧 info@glitzevents.co.za</p>
                        <p>📞 +27 123 456 7890</p>
                        <p>📍 Vanderbijlpark, Gauteng, South Africa</p>
                    </div>
                </div>
                
                <div class="footer-column">
                    <h4>Services</h4>
                    <ul>
                        <li><a href="Services.aspx#wedding">Wedding Planning</a></li>
                        <li><a href="Services.aspx#corporate">Corporate Events</a></li>
                        <li><a href="Services.aspx#luxury">Birthday Celebrations</a></li>
                        <li><a href="Services.aspx#coordination">Graduation Parties</a></li>
                    </ul>
                </div>
                
                <div class="footer-column">
                    <h4>Company</h4>
                    <ul>
                        <li><a href="About.aspx">About Us</a></li>
                        <li><a href="Portfolio.aspx">Portfolio</a></li>
                        <li><a href="Testimonials.aspx">Testimonials</a></li>
                        <li><a href="Contact.aspx">Contact</a></li>
                    </ul>
                </div>
                
                <div class="footer-column">
                    <h4>Legal</h4>
                    <ul>
                        <li><a href="Legal.aspx#privacy">Privacy Policy</a></li>
                        <li><a href="Legal.aspx#terms">Terms of Service</a></li>
                        <li><a href="Legal.aspx#cookies">Cookie Policy</a></li>
                    </ul>
                </div>
            </div>
            
            <div class="footer-bottom">
                <p>&copy; 2025 Glitz Events. All rights reserved. | Turning moments into memories since 2014.</p>
            </div>
        </footer>
    </form>

    <script>
        // Function to redirect to home page
        function redirectToHomePage() {
            window.location.href = "HomePage.aspx";
        }

        // Dark mode toggle
        const moonToggle = document.querySelector('.moon-toggle');
        let isDarkMode = localStorage.getItem('darkMode') === 'true';

        function applyDarkMode() {
            if (isDarkMode) {
                document.body.classList.add('dark-mode');
                document.querySelector('.header').classList.add('dark-mode');
                moonToggle.textContent = '☀️';
            } else {
                document.body.classList.remove('dark-mode');
                document.querySelector('.header').classList.remove('dark-mode');
                moonToggle.textContent = '🌙';
            }
        }

        // Apply saved dark mode preference on load
        applyDarkMode();

        moonToggle.addEventListener('click', () => {
            isDarkMode = !isDarkMode;
            localStorage.setItem('darkMode', isDarkMode);
            applyDarkMode();
        });

        // Smooth hover effects
        document.querySelectorAll('a, button').forEach(element => {
            element.addEventListener('mouseenter', () => {
                element.style.transform = 'translateY(-2px)';
                element.style.transition = 'transform 0.3s ease';
            });

            element.addEventListener('mouseleave', () => {
                element.style.transform = 'translateY(0)';
            });
        });

        // Set default date range for filters
        window.onload = function() {
            // Set end date to today
            const today = new Date().toISOString().split('T')[0];
            
            // Set start date to 30 days ago
            const thirtyDaysAgo = new Date();
            thirtyDaysAgo.setDate(thirtyDaysAgo.getDate() - 30);
            const thirtyDaysAgoFormatted = thirtyDaysAgo.toISOString().split('T')[0];
            
            // Set the date inputs if they exist
            const startDateInput = document.getElementById('<%= txtStartDate.ClientID %>');
            const endDateInput = document.getElementById('<%= txtEndDate.ClientID %>');
            
            if (startDateInput && !startDateInput.value) {
                startDateInput.value = thirtyDaysAgoFormatted;
            }
            if (endDateInput && !endDateInput.value) {
                endDateInput.value = today;
            }
        };
    </script>
</body>
</html>