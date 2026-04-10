<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Glitz_Events.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Glitz Events</title>
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

        /* ===== LOGIN FORM STYLES ===== */
        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex: 1;
            padding: 50px 20px;
        }

        .login-form {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 450px;
        }

        .form-title {
            text-align: center;
            font-size: 32px;
            margin-bottom: 30px;
            color: #2c2c2c;
            font-weight: 400;
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

        .form-input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-family: 'Georgia', serif;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

            .form-input:focus {
                border-color: #8B4513;
                outline: none;
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

        .register-link {
            text-align: center;
            margin-top: 20px;
            color: #666;
        }

            .register-link a {
                color: #8B4513;
                text-decoration: none;
                font-weight: 500;
            }

                .register-link a:hover {
                    text-decoration: underline;
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

            .login-form {
                padding: 30px 20px;
            }

            .form-title {
                font-size: 28px;
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
                <a href="Login.aspx" class="login-btn active">LOGIN</a>
                <a href="Register.aspx" class="register-btn">REGISTER</a>
            </div>
        </header>

        <div class="login-container">
            <div class="login-form">
                <h2 class="form-title">Login to Your Account</h2>
                
                <asp:Panel ID="pnlMessage" runat="server" CssClass="message" Visible="false">
                    <asp:Literal ID="litMessage" runat="server"></asp:Literal>
                </asp:Panel>
                
                <div class="form-group">
                    <label class="form-label" for="txtEmail">Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" placeholder="Enter your email" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" 
                        ErrorMessage="Email is required" Display="Dynamic" CssClass="validation-error"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                        ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ErrorMessage="Invalid email format" 
                        Display="Dynamic" CssClass="validation-error"></asp:RegularExpressionValidator>
                </div>
                
                <div class="form-group">
                    <label class="form-label" for="txtPassword">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-input" placeholder="Enter your password" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" 
                        ErrorMessage="Password is required" Display="Dynamic" CssClass="validation-error"></asp:RequiredFieldValidator>
                </div>
                
                <asp:Button ID="btnLogin" runat="server" Text="LOGIN" CssClass="btn-submit" OnClick="btnLogin_Click" />
                
                <div class="register-link">
                    Don't have an account? <a href="Register.aspx">Register here</a>
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
        let isDarkMode = false;

        moonToggle.addEventListener('click', () => {
            isDarkMode = !isDarkMode;
            if (isDarkMode) {
                document.body.style.background = 'linear-gradient(135deg, #2c2c2c 0%, #1a1a1a 100%)';
                document.body.style.color = '#fff';
                document.querySelector('.header').style.background = 'rgba(44, 44, 44, 0.95)';
                document.querySelector('.login-form').style.background = '#333';
                document.querySelector('.login-form').style.color = '#fff';
                moonToggle.textContent = '☀️';

                // Update all text colors for dark mode
                document.querySelectorAll('.form-label, .form-input, .register-link').forEach(el => {
                    el.style.color = '#fff';
                });
            } else {
                document.body.style.background = 'linear-gradient(135deg, #f5f5f5 0%, #e8e8e8 100%)';
                document.body.style.color = '#2c2c2c';
                document.querySelector('.header').style.background = 'rgba(255, 255, 255, 0.95)';
                document.querySelector('.login-form').style.background = 'white';
                document.querySelector('.login-form').style.color = '#2c2c2c';
                moonToggle.textContent = '🌙';

                // Revert text colors for light mode
                document.querySelectorAll('.form-label, .register-link').forEach(el => {
                    el.style.color = '#2c2c2c';
                });
                document.querySelectorAll('.form-input').forEach(el => {
                    el.style.color = '#2c2c2c';
                });
                document.querySelector('.register-link').style.color = '#666';
            }
        });

       
        document.querySelectorAll('a, button').forEach(element => {
            element.addEventListener('mouseenter', () => {
                element.style.transform = 'translateY(-2px)';
                element.style.transition = 'transform 0.3s ease';
            });

            element.addEventListener('mouseleave', () => {
                element.style.transform = 'translateY(0)';
            });
        });

        
        document.querySelector('.logo').style.cursor = 'pointer';
        document.querySelector('.footer-logo').style.cursor = 'pointer';
    </script>
</body>
</html>