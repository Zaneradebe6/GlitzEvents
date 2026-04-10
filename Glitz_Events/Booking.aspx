<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="Glitz_Events.Booking" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Event - Glitz Events</title>
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
            display: flex;
            flex-direction: column;
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

        /* ===== BOOKING FORM STYLES ===== */
        .booking-container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            flex: 1;
            padding: 50px 20px;
        }

        .booking-form {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 700px;
        }

        .form-title {
            text-align: center;
            font-size: 32px;
            margin-bottom: 30px;
            color: #2c2c2c;
            font-weight: 400;
        }

        .user-info {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 25px;
            border-left: 4px solid #8B4513;
        }

        .user-info-title {
            font-weight: 600;
            margin-bottom: 10px;
            color: #8B4513;
        }

        .user-details {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
        }

        .user-detail {
            margin-bottom: 8px;
        }

        .user-detail-label {
            font-weight: 500;
            color: #2c2c2c;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #2c2c2c;
        }

        .form-input, .form-dropdown, .form-textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-family: 'Georgia', serif;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

            .form-input:focus, .form-dropdown:focus, .form-textarea:focus {
                border-color: #8B4513;
                outline: none;
            }

        .form-textarea {
            min-height: 100px;
            resize: vertical;
        }

        .form-row {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }

            .form-row .form-group {
                flex: 1;
                margin-bottom: 0;
                min-width: 200px;
            }

        .btn-submit {
            background: #2c2c2c;
            color: white;
            padding: 15px;
            border: none;
            border-radius: 5px;
            width: 100%;
            font-family: 'Georgia', serif;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.3s ease;
            text-transform: uppercase;
        }

            .btn-submit:hover {
                background: #8B4513;
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

        .validation-error {
            color: #dc3545;
            font-size: 14px;
            margin-top: 5px;
            display: block;
        }

        /* ===== FOOTER STYLES ===== */
        .footer {
            background: linear-gradient(135deg, #1a1a1a 0%, #2c2c2c 100%);
            color: white;
            padding: 60px 50px 30px;
            margin-top: auto;
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

            .booking-form {
                padding: 30px 20px;
            }

            .form-title {
                font-size: 28px;
            }

            .form-row {
                flex-direction: column;
                gap: 0;
            }

            .user-details {
                grid-template-columns: 1fr;
            }

            .footer {
                padding: 40px 20px 20px;
            }

            .footer-container {
                grid-template-columns: 1fr;
                gap: 30px;
            }
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
                <a href="Services.aspx">SERVICES</a>
                <a href="Portfolio.aspx">PORTFOLIO</a>
                <a href="About.aspx">ABOUT</a>
                <a href="Contact.aspx">CONTACT</a>
            </nav>
            
            <div class="auth-buttons">
                <button type="button" class="moon-toggle">🌙</button>
                <asp:Label ID="lblUserWelcome" runat="server" CssClass="user-welcome" Visible="false"></asp:Label>
                
                <!-- Login/Logout Button -->
                <asp:LinkButton ID="btnAuth" runat="server" CssClass="login-btn" OnClick="btnAuth_Click">
                    LOGIN
                </asp:LinkButton>
                
                <!-- Register Button -->
                <asp:LinkButton ID="btnRegister" runat="server" CssClass="register-btn" OnClick="btnRegister_Click" Visible="false">
                    REGISTER
                </asp:LinkButton>
            </div>
        </header>

        <div class="booking-container">
            <div class="booking-form">
                <h2 class="form-title">Book Your Event</h2>
                
                <asp:Panel ID="pnlMessage" runat="server" CssClass="message" Visible="false">
                    <asp:Literal ID="litMessage" runat="server"></asp:Literal>
                </asp:Panel>
                
                <asp:Panel ID="pnlUserInfo" runat="server" CssClass="user-info" Visible="false">
                    <div class="user-info-title">Your Information</div>
                    <div class="user-details">
                        <div class="user-detail">
                            <span class="user-detail-label">Name:</span>
                            <asp:Label ID="lblUserName" runat="server"></asp:Label>
                        </div>
                        <div class="user-detail">
                            <span class="user-detail-label">Email:</span>
                            <asp:Label ID="lblUserEmail" runat="server"></asp:Label>
                        </div>
                        <div class="user-detail">
                            <span class="user-detail-label">Phone:</span>
                            <asp:Label ID="lblUserPhone" runat="server"></asp:Label>
                        </div>
                        <div class="user-detail">
                            <span class="user-detail-label">Need to update your info?</span>
                            <a href="Profile.aspx">Edit Profile</a>
                        </div>
                    </div>
                </asp:Panel>
                
                <div class="form-group">
                    <label class="form-label" for="ddlEventType">Event Type</label>
                    <asp:DropDownList ID="ddlEventType" runat="server" CssClass="form-dropdown">
                        <asp:ListItem Value="" Text="Select Event Type"></asp:ListItem>
                        <asp:ListItem Value="Wedding" Text="Wedding"></asp:ListItem>
                        <asp:ListItem Value="Corporate" Text="Corporate Event"></asp:ListItem>
                        <asp:ListItem Value="Birthday" Text="Birthday Celebration"></asp:ListItem>
                        <asp:ListItem Value="Graduation" Text="Graduation Party"></asp:ListItem>
                        <asp:ListItem Value="Anniversary" Text="Anniversary"></asp:ListItem>
                        <asp:ListItem Value="Other" Text="Other"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvEventType" runat="server" ControlToValidate="ddlEventType" 
                        ErrorMessage="Event type is required" Display="Dynamic" CssClass="validation-error" InitialValue=""></asp:RequiredFieldValidator>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label" for="txtStartDate">Start Date</label>
                        <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-input" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ControlToValidate="txtStartDate" 
                            ErrorMessage="Start date is required" Display="Dynamic" CssClass="validation-error"></asp:RequiredFieldValidator>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="txtEndDate">End Date</label>
                        <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-input" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" ControlToValidate="txtEndDate" 
                            ErrorMessage="End date is required" Display="Dynamic" CssClass="validation-error"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvEndDate" runat="server" ControlToValidate="txtEndDate" 
                            ControlToCompare="txtStartDate" Operator="GreaterThanEqual" Type="Date" 
                            ErrorMessage="End date must be after start date" Display="Dynamic" CssClass="validation-error"></asp:CompareValidator>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="form-label" for="txtEventTime">Event Time</label>
                    <asp:TextBox ID="txtEventTime" runat="server" CssClass="form-input" TextMode="Time"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEventTime" runat="server" ControlToValidate="txtEventTime" 
                        ErrorMessage="Event time is required" Display="Dynamic" CssClass="validation-error"></asp:RequiredFieldValidator>
                </div>
                
                <div class="form-group">
                    <label class="form-label" for="ddlColorTheme">Color Theme</label>
                    <asp:DropDownList ID="ddlColorTheme" runat="server" CssClass="form-dropdown">
                        <asp:ListItem Value="" Text="Select Color Theme"></asp:ListItem>
                        <asp:ListItem Value="Elegant White & Gold" Text="Elegant White & Gold"></asp:ListItem>
                        <asp:ListItem Value="Classic Black & White" Text="Classic Black & White"></asp:ListItem>
                        <asp:ListItem Value="Vibrant Rainbow" Text="Vibrant Rainbow"></asp:ListItem>
                        <asp:ListItem Value="Pastel Dreams" Text="Pastel Dreams"></asp:ListItem>
                        <asp:ListItem Value="Autumn Warmth" Text="Autumn Warmth"></asp:ListItem>
                        <asp:ListItem Value="Winter Wonderland" Text="Winter Wonderland"></asp:ListItem>
                        <asp:ListItem Value="Custom" Text="Custom (Specify in notes)"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvColorTheme" runat="server" ControlToValidate="ddlColorTheme" 
                        ErrorMessage="Color theme is required" Display="Dynamic" CssClass="validation-error" InitialValue=""></asp:RequiredFieldValidator>
                </div>
                
                <div class="form-group">
                    <label class="form-label" for="txtGuestCount">Number of Guests</label>
                    <asp:TextBox ID="txtGuestCount" runat="server" CssClass="form-input" TextMode="Number" min="1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvGuestCount" runat="server" ControlToValidate="txtGuestCount" 
                        ErrorMessage="Guest count is required" Display="Dynamic" CssClass="validation-error"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="rvGuestCount" runat="server" ControlToValidate="txtGuestCount" 
                        Type="Integer" MinimumValue="1" MaximumValue="1000" 
                        ErrorMessage="Please enter a valid number of guests (1-1000)" Display="Dynamic" CssClass="validation-error"></asp:RangeValidator>
                </div>
                
                <div class="form-group">
                    <label class="form-label" for="txtAddress">Event Address</label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-textarea" placeholder="Enter the event address" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" 
                        ErrorMessage="Address is required" Display="Dynamic" CssClass="validation-error"></asp:RequiredFieldValidator>
                </div>
                
                <div class="form-group">
                    <label class="form-label" for="txtSpecialRequests">Special Requests</label>
                    <asp:TextBox ID="txtSpecialRequests" runat="server" CssClass="form-textarea" placeholder="Any special requests or requirements" TextMode="MultiLine"></asp:TextBox>
                </div>
                
                <asp:Button ID="btnSubmitBooking" runat="server" Text="SUBMIT BOOKING" CssClass="btn-submit" OnClick="btnSubmitBooking_Click" />
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
                document.body.style.background = 'linear-gradient(135deg, #2c2c2c 0%, #1a1a1a 100%)';
                document.body.style.color = '#fff';
                document.querySelector('.header').style.background = 'rgba(44, 44, 44, 0.95)';
                document.querySelector('.booking-form').style.background = '#333';
                document.querySelector('.booking-form').style.color = '#fff';
                moonToggle.textContent = '☀️';

                // Update all text colors for dark mode
                document.querySelectorAll('.form-label, .form-input, .form-dropdown, .form-textarea, .user-info').forEach(el => {
                    el.style.color = '#fff';
                });
            } else {
                document.body.style.background = 'linear-gradient(135deg, #f5f5f5 0%, #e8e8e8 100%)';
                document.body.style.color = '#2c2c2c';
                document.querySelector('.header').style.background = 'rgba(255, 255, 255, 0.95)';
                document.querySelector('.booking-form').style.background = 'white';
                document.querySelector('.booking-form').style.color = '#2c2c2c';
                moonToggle.textContent = '🌙';

                // Revert text colors for light mode
                document.querySelectorAll('.form-label').forEach(el => {
                    el.style.color = '#2c2c2c';
                });
                document.querySelectorAll('.form-input, .form-dropdown, .form-textarea').forEach(el => {
                    el.style.color = '#2c2c2c';
                });
            }
        }

        // Apply saved dark mode preference on load
        applyDarkMode();

        moonToggle.addEventListener('click', () => {
            isDarkMode = !isDarkMode;
            localStorage.setItem('darkMode', isDarkMode);
            applyDarkMode();
        });

        // Set minimum date to today
        window.onload = function () {
            const today = new Date().toISOString().split('T')[0];
            document.getElementById('<%= txtStartDate.ClientID %>').setAttribute('min', today);
            document.getElementById('<%= txtEndDate.ClientID %>').setAttribute('min', today);
        };

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

        // Make logo clickable
        document.querySelector('.logo').style.cursor = 'pointer';
        document.querySelector('.footer-logo').style.cursor = 'pointer';
    </script>
</body>
</html>