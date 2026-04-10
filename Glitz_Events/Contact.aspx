<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Glitz_Events.Contact" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Contact Us - Glitz Events</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Georgia', serif;
        }
        
        body {
            background: linear-gradient(135deg, #f5f5f5 0%, #e8e8e8 100%);
            min-height: 100vh;
            color: #2c2c2c;
            line-height: 1.6;
        }
        
        .header {
            background: rgba(255, 255, 255, 0.95);
            padding: 20px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        
        .logo-symbol {
            font-size: 24px;
            font-weight: bold;
            color: #8B4513;
        }
        
        .nav {
            display: flex;
            gap: 30px;
        }
        
        .nav a {
            text-decoration: none;
            color: #2c2c2c;
            font-weight: 500;
            transition: color 0.3s;
        }
        
        .nav a:hover {
            color: #8B4513;
        }
        
        .auth-buttons {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .moon-toggle {
            background: none;
            border: none;
            font-size: 20px;
            cursor: pointer;
        }
        
        .login-btn, .register-btn {
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 5px;
            font-weight: 500;
        }
        
        .login-btn {
            color: #333;
        }
        
        .register-btn {
            background-color: #8B4513;
            color: white;
        }
        
        .main-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 50px 20px;
        }
        
        .text-content {
            text-align: center;
            margin-bottom: 50px;
        }
        
        .main-heading {
            font-size: 48px;
            margin-bottom: 20px;
            color: #2c2c2c;
        }
        
        .description {
            max-width: 800px;
            margin: 0 auto;
            font-size: 18px;
            color: #666;
        }
        
        .team-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            width: 100%;
            margin-bottom: 50px;
        }
        
        .team-member {
            background: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s;
        }
        
        .team-member:hover {
            transform: translateY(-5px);
        }
        
        .team-avatar {
            height: 120px;
            width: 120px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            color: white;
            font-size: 40px;
            font-weight: bold;
        }
        
        .avatar-ceo {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
        }
        
        .avatar-cto {
            background: linear-gradient(135deg, #FF512F 0%, #DD2476 100%);
        }
        
        .avatar-dev {
            background: linear-gradient(135deg, #1D976C 0%, #93F9B9 100%);
        }
        
        .team-name {
            font-size: 22px;
            margin-bottom: 5px;
            color: #2c2c2c;
        }
        
        .team-role {
            color: #8B4513;
            font-weight: 500;
            margin-bottom: 15px;
        }
        
        .team-contact {
            color: #666;
            margin-bottom: 15px;
        }
        
        .contact-form-section {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
        }
        
        .contact-form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #2c2c2c;
        }
        
        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
        }
        
        .form-control:focus {
            border-color: #8B4513;
            outline: none;
        }
        
        .btn-register {
            background-color: #8B4513;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            transition: background-color 0.3s;
        }
        
        .btn-register:hover {
            background-color: #6b3300;
        }
        
        .footer {
            background-color: #2c2c2c;
            color: white;
            padding: 50px 0 20px;
            margin-top: 50px;
        }
        
        .footer-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
        }
        
        .footer-logo {
            margin-bottom: 15px;
        }
        
        .logo-text {
            font-size: 24px;
            font-weight: bold;
            color: #8B4513;
        }
        
        .footer-description {
            margin-bottom: 20px;
            color: #ccc;
        }
        
        .footer-column h4 {
            margin-bottom: 20px;
            color: #8B4513;
            font-size: 18px;
        }
        
        .footer-column ul {
            list-style: none;
        }
        
        .footer-column ul li {
            margin-bottom: 10px;
        }
        
        .footer-column ul li a {
            color: #ccc;
            text-decoration: none;
            transition: color 0.3s;
        }
        
        .footer-column ul li a:hover {
            color: #8B4513;
        }
        
        .footer-bottom {
            text-align: center;
            padding-top: 30px;
            margin-top: 30px;
            border-top: 1px solid #444;
            color: #ccc;
        }
        
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                padding: 20px;
            }
            
            .nav {
                margin: 20px 0;
                flex-wrap: wrap;
                justify-content: center;
            }
            
            .contact-form-grid {
                grid-template-columns: 1fr;
            }
            
            .team-grid {
                grid-template-columns: 1fr;
            }
            
            .main-heading {
                font-size: 36px;
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
                <a href="HomePage.aspx">HOME</a>
                <a href="Services.aspx">SERVICES</a>
                <a href="Portfolio.aspx">PORTFOLIO</a>
                <a href="About.aspx">ABOUT</a>
                <a href="Contact.aspx" style="color: #8B4513;">CONTACT</a>
            </nav>
            
            <div class="auth-buttons">
                <button type="button" class="moon-toggle">🌙</button>
                <a href="Login.aspx" class="login-btn">LOGIN</a>
                <a href="Register.aspx" class="register-btn">REGISTER</a>
            </div>
        </header>

        <main class="main-content">
            <div class="text-content">
                <h1 class="main-heading">Our Team</h1>
                <p class="description">
                    Meet the talented individuals behind GlitzEvents. Our dedicated team works tirelessly 
                    to create unforgettable experiences for our clients.
                </p>
            </div>

            <!-- Team Members -->
            <div class="team-grid">
                <!-- CEO -->
                <div class="team-member">
                    <div class="team-avatar avatar-ceo">
                        ZR
                    </div>
                    <h3 class="team-name">Zanele Radebe</h3>
                    <p class="team-role">Chief Executive Officer</p>
                    <p class="team-contact">📧 zanele@glitzevents.co.za</p>
                    <p class="team-contact">📞 +27 123 456 7891</p>
                </div>

                <!-- CTO -->
                <div class="team-member">
                    <div class="team-avatar avatar-cto">
                        NM
                    </div>
                    <h3 class="team-name">Ntswaki Mokwana</h3>
                    <p class="team-role">Chief Technology Officer</p>
                    <p class="team-contact">📧 ntswaki@glitzevents.co.za</p>
                    <p class="team-contact">📞 +27 123 456 7892</p>
                </div>

                <!-- Senior Developer -->
                <div class="team-member">
                    <div class="team-avatar avatar-dev">
                        BM
                    </div>
                    <h3 class="team-name">Bonolo Masemola</h3>
                    <p class="team-role">Senior Developer</p>
                    <p class="team-contact">📧 bonolo@glitzevents.co.za</p>
                    <p class="team-contact">📞 +27 123 456 7894</p>
                </div>
            </div>

            <!-- Contact Form Section -->
            <div class="contact-form-section">
                <h2 style="text-align: center; font-size: 32px; margin-bottom: 30px; color: #2c2c2c;">Get In Touch</h2>
                
                <div class="contact-form-grid">
                    <div>
                        <h3 style="font-size: 20px; margin-bottom: 20px; color: #2c2c2c;">Contact Information</h3>
                        <p style="margin-bottom: 15px; color: #666;">
                            <strong>Email:</strong> info@glitzevents.co.za
                        </p>
                        <p style="margin-bottom: 15px; color: #666;">
                            <strong>Phone:</strong> +27 123 456 7890
                        </p>
                        <p style="margin-bottom: 15px; color: #666;">
                            <strong>Address:</strong> Vanderbijlpark, Gauteng, South Africa
                        </p>
                        <p style="margin-top: 30px; color: #666;">
                            Have questions or want to discuss your next event? Reach out to us using the contact form or through our direct contact information.
                        </p>
                    </div>
                    
                    <div>
                        <div class="form-group">
                            <label for="txtName">Your Name</label>
                            <input type="text" id="txtName" class="form-control" placeholder="Enter your name" runat="server">
                        </div>
                        
                        <div class="form-group">
                            <label for="txtEmail">Email Address</label>
                            <input type="email" id="txtEmail" class="form-control" placeholder="Enter your email" runat="server">
                        </div>
                        
                        <div class="form-group">
                            <label for="txtMessage">Message</label>
                            <textarea id="txtMessage" class="form-control" placeholder="Type your message here" rows="5" runat="server"></textarea>
                        </div>
                        
                        <button type="submit" class="btn-register">Send Message</button>
                    </div>
                </div>
            </div>
        </main>

        <!-- Footer -->
        <footer class="footer">
            <div class="footer-container">
                <div>
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
                        <li><a href="#about">About Us</a></li>
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
    </form>

    <script>
        // Dark mode toggle functionality
        document.querySelector('.moon-toggle').addEventListener('click', function() {
            document.body.classList.toggle('dark-mode');
            
            if (document.body.classList.contains('dark-mode')) {
                this.textContent = '☀️';
                // You would add additional dark mode styles here
            } else {
                this.textContent = '🌙';
            }
        });
    </script>
</body>
</html>