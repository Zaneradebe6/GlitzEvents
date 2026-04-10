<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Glitz_Events.HomePage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Glitz Events - Turning Moments into Memories</title>
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
            transition: all 0.3s ease;
        }

        /* ===== HEADER STYLES ===== */
        .header {
            background: rgba(255, 255, 255, 0.95);
            padding: 20px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .logo {
            display: flex;
            align-items: center;
            font-size: 24px;
            font-weight: bold;
            color: #2c2c2c;
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
            display: none;
            margin-right: 15px;
            color: #2c2c2c;
            font-weight: 500;
        }

        /* ===== HOME PAGE STYLES ===== */
        .main-content {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 100px 50px;
            max-width: 1400px;
            margin: 0 auto;
            gap: 80px;
        }

        .text-content {
            flex: 1;
            max-width: 500px;
        }

        .main-heading {
            font-size: 72px;
            line-height: 1.1;
            color: #2c2c2c;
            margin-bottom: 30px;
            font-weight: 400;
        }

        .description {
            font-size: 18px;
            line-height: 1.6;
            color: #666;
            margin-bottom: 40px;
        }

        .buttons {
            display: flex;
            gap: 20px;
        }

        .btn-primary {
            background: #2c2c2c;
            color: white;
            padding: 15px 30px;
            text-decoration: none;
            font-weight: 500;
            font-size: 16px;
            transition: all 0.3s ease;
            border: 2px solid #2c2c2c;
            text-transform: uppercase;
            cursor: pointer;
            font-family: 'Georgia', serif;
        }

            .btn-primary:hover {
                background: #8B4513;
                border-color: #8B4513;
            }

        .btn-secondary {
            background: transparent;
            color: #2c2c2c;
            padding: 15px 30px;
            text-decoration: none;
            font-weight: 500;
            font-size: 16px;
            border: 2px solid #2c2c2c;
            transition: all 0.3s ease;
            text-transform: uppercase;
            cursor: pointer;
            font-family: 'Georgia', serif;
            display: inline-block;
            text-align: center;
        }

            .btn-secondary:hover {
                background: #2c2c2c;
                color: white;
            }

        .image-content {
            flex: 1;
            max-width: 600px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .event-image {
            width: 100%;
            height: 400px;
            object-fit: cover;
            border-radius: 10px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
        }

        .image-placeholder {
            width: 100%;
            height: 400px;
            background: linear-gradient(135deg, #e8e8e8 0%, #d4d4d4 100%);
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #8B4513;
            font-size: 18px;
            font-weight: 500;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
        }

        /* ===== MODAL STYLES ===== */
        .modal-backdrop {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.7);
            z-index: 1000;
        }

        .login-modal {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.3);
            z-index: 1001;
            max-width: 450px;
            width: 90%;
        }

        .modal-header {
            text-align: center;
            margin-bottom: 20px;
        }

            .modal-header h2 {
                color: #2c2c2c;
                font-weight: 400;
                margin-bottom: 10px;
            }

        .modal-message {
            text-align: center;
            margin-bottom: 25px;
            color: #666;
            line-height: 1.5;
            font-size: 16px;
        }

        .modal-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
        }

        .modal-btn {
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            font-family: 'Georgia', serif;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }

        .modal-btn-primary {
            background: #2c2c2c;
            color: white;
        }

            .modal-btn-primary:hover {
                background: #8B4513;
            }

        .modal-btn-secondary {
            background: transparent;
            border: 2px solid #2c2c2c;
            color: #2c2c2c;
            text-decoration: none;
        }

            .modal-btn-secondary:hover {
                background: #2c2c2c;
                color: white;
            }

        /* ===== FOOTER STYLES ===== */
        .footer {
            background: linear-gradient(135deg, #1a1a1a 0%, #2c2c2c 100%);
            color: white;
            padding: 60px 50px 30px;
            margin-top: 80px;
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
            color: white;
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

        body.dark-mode .btn-secondary {
            color: #fff;
            border-color: #fff;
        }

        body.dark-mode .btn-secondary:hover {
            background: #fff;
            color: #2c2c2c;
        }

        body.dark-mode .description {
            color: #ccc;
        }

        body.dark-mode .login-modal {
            background: #2c2c2c;
            color: #fff;
        }

        body.dark-mode .modal-header h2 {
            color: #fff;
        }

        body.dark-mode .modal-message {
            color: #ccc;
        }

        body.dark-mode .modal-btn-secondary {
            border-color: #fff;
            color: #fff;
        }

        body.dark-mode .modal-btn-secondary:hover {
            background: #fff;
            color: #2c2c2c;
        }

        /* ===== RESPONSIVE STYLES ===== */
        @media (max-width: 1024px) {
            .main-content {
                flex-direction: column;
                text-align: center;
                gap: 50px;
                padding: 50px 30px;
            }

            .main-heading {
                font-size: 56px;
            }

            .footer-container {
                grid-template-columns: 1fr 1fr;
                gap: 40px;
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

            .main-heading {
                font-size: 48px;
            }

            .buttons {
                flex-direction: column;
                align-items: center;
            }

            .footer {
                padding: 40px 20px 20px;
            }

            .footer-container {
                grid-template-columns: 1fr;
                gap: 30px;
            }

            .login-modal {
                padding: 20px;
            }

            .modal-buttons {
                flex-direction: column;
            }
        }

        @media (max-width: 480px) {
            .main-heading {
                font-size: 36px;
            }
            
            .description {
                font-size: 16px;
            }
            
            .btn-primary, .btn-secondary {
                padding: 12px 20px;
                font-size: 14px;
            }
            
            .event-image, .image-placeholder {
                height: 300px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header class="header">
            <div class="logo">
                <span class="logo-symbol">GLITZ EVENTS</span>
            </div>
            
            <nav class="nav">
                <a href="HomePage.aspx" class="active">HOME</a>
                <a href="Services.aspx">SERVICES</a>
                <a href="Portfolio.aspx">PORTFOLIO</a>
                <a href="About.aspx">ABOUT</a>
                <a href="Contact.aspx">CONTACT</a>
            </nav>
            
            <div class="auth-buttons">
                <span class="user-welcome" id="userWelcome" runat="server" style="display: none;">
                    Welcome, <span id="usernamePlaceholder" runat="server"></span>!
                </span>
                <button type="button" class="moon-toggle">🌙</button>

                <!-- Login/Logout Button -->
                <asp:LinkButton ID="btn_auth" runat="server" CssClass="login-btn" OnClick="btn_auth_Click">
                    LOGIN
                </asp:LinkButton>

                <!-- Register Button -->
                <asp:LinkButton ID="btn_register" runat="server" CssClass="register-btn" OnClick="btn_register_Click">
                    REGISTER
                </asp:LinkButton>
            </div>
        </header>

        <main class="main-content">
            <div class="text-content">
                <h1 class="main-heading">Turning<br />Moments into<br />Memories</h1>
                <p class="description">
                    From intimate celebrations to grand corporate affairs, we transform your vision into extraordinary experiences that leave lasting impressions.
                </p>
                <div class="buttons">
                    <asp:LinkButton ID="btn_plan_event" runat="server" CssClass="btn-primary" OnClick="btn_plan_event_Click">
                        PLAN YOUR EVENT
                    </asp:LinkButton>
                    <asp:HyperLink ID="btn_portfolio" runat="server" CssClass="btn-secondary" NavigateUrl="Portfolio.aspx">
                        VIEW PORTFOLIO
                    </asp:HyperLink>
                </div>
            </div>
            
            <div class="image-content">
                <asp:Image ID="Image1" runat="server" ImageUrl="Images/landingPage.jpg" 
                    AlternateText="Elegant event venue with golden chandeliers and round tables" CssClass="event-image" 
                    onerror="this.style.display='none'; document.getElementById('imagePlaceholder').style.display='flex';" />
                <div id="imagePlaceholder" class="image-placeholder" style="display: none;">
                    Event Showcase Image
                </div>
            </div>
        </main>

        <!-- Login Requirement Modal -->
        <div class="modal-backdrop" id="loginModalBackdrop"></div>
        <div class="login-modal" id="loginModal">
            <div class="modal-header">
                <h2>Login Required</h2>
            </div>
            <div class="modal-message">
                <p>You need to be logged in to plan your event. Please login or register to continue.</p>
            </div>
            <div class="modal-buttons">
                <asp:HyperLink ID="btn_modal_login" runat="server" CssClass="modal-btn modal-btn-primary" NavigateUrl="Login.aspx">
                    LOGIN
                </asp:HyperLink>
                <asp:HyperLink ID="btn_modal_register" runat="server" CssClass="modal-btn modal-btn-secondary" NavigateUrl="Register.aspx">
                    REGISTER
                </asp:HyperLink>
            </div>
        </div>

        <footer class="footer">
            <div class="footer-container">
                <div class="footer-column">
                    <div class="footer-logo">
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
                        <li><a href="#wedding">Wedding Planning</a></li>
                        <li><a href="#corporate">Corporate Events</a></li>
                        <li><a href="#luxury">Birthday Celebrations</a></li>
                        <li><a href="#coordination">Graduation Parties</a></li>
                    </ul>
                </div>
                
                <div class="footer-column">
                    <h4>Company</h4>
                    <ul>
                        <li><a href="About.aspx">About Us</a></li>
                        <li><a href="Portfolio.aspx">Portfolio</a></li>
                        <li><a href="#testimonials">Testimonials</a></li>
                        <li><a href="Contact.aspx">Contact</a></li>
                    </ul>
                </div>
                
                <div class="footer-column">
                    <h4>Legal</h4>
                    <ul>
                        <li><a href="#privacy">Privacy Policy</a></li>
                        <li><a href="#terms">Terms of Service</a></li>
                        <li><a href="#cookies">Cookie Policy</a></li>
                    </ul>
                </div>
            </div>
            
            <div class="footer-bottom">
                <p>&copy; 2025 Glitz Events. All rights reserved. | Turning moments into memories since 2014.</p>
            </div>
        </footer>

        <script>
            // Show login modal
            function showLoginModal() {
                document.getElementById('loginModalBackdrop').style.display = 'block';
                document.getElementById('loginModal').style.display = 'block';
            }

            // Hide login modal
            function hideLoginModal() {
                document.getElementById('loginModalBackdrop').style.display = 'none';
                document.getElementById('loginModal').style.display = 'none';
            }

            // Event planning button click handler
            document.getElementById('<%= btn_plan_event.ClientID %>').addEventListener('click', function (e) {
                // Check if user is logged in (using server-side value passed to client)
                const isLoggedIn = <%= Session["UserAuthenticated"] != null ? "true" : "false" %>;

                if (!isLoggedIn) {
                    e.preventDefault();
                    showLoginModal();
                }
            });

            // Modal backdrop click handler
            document.getElementById('loginModalBackdrop').addEventListener('click', hideLoginModal);

            // Enhanced dark mode toggle
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
                });

                element.addEventListener('mouseleave', () => {
                    element.style.transform = 'translateY(0)';
                });
            });

            // Check if image failed to load
            window.addEventListener('load', function () {
                const eventImage = document.getElementById('<%= Image1.ClientID %>');
                const placeholder = document.getElementById('imagePlaceholder');

                if (eventImage && eventImage.complete && eventImage.naturalHeight === 0) {
                    eventImage.style.display = 'none';
                    placeholder.style.display = 'flex';
                }
            });
        </script>
    </form>
</body>
</html>