<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Glitz_Events.About" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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

        /* ===== ABOUT PAGE STYLES ===== */
        .about-hero {
            background: url('https://images.unsplash.com/photo-1492684223066-81342ee5ff30?ixlib=rb-4.0.3&auto=format&fit=crop&w=1950&q=80') no-repeat center center/cover;
            height: 400px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
            position: relative;
        }

        .hero-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 20px;
        }

            .hero-overlay h1 {
                font-size: 48px;
                margin-bottom: 15px;
                font-weight: 400;
            }

            .hero-overlay p {
                font-size: 20px;
                max-width: 600px;
            }

        .about-content {
            padding: 80px 50px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .about-intro {
            text-align: center;
            margin-bottom: 60px;
        }

            .about-intro h2 {
                font-size: 36px;
                color: #2c2c2c;
                margin-bottom: 20px;
                font-weight: 400;
            }

            .about-intro p {
                font-size: 18px;
                max-width: 800px;
                margin: 0 auto 20px;
                color: #666;
                line-height: 1.6;
            }

        .mission-vision {
            display: flex;
            gap: 30px;
            margin: 50px 0;
        }

        .mission, .vision {
            flex: 1;
            background: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease;
        }

            .mission:hover, .vision:hover {
                transform: translateY(-5px);
            }

            .mission h3, .vision h3 {
                color: #8B4513;
                margin-bottom: 15px;
                display: flex;
                align-items: center;
                font-weight: 400;
                font-size: 24px;
            }

            .mission i, .vision i {
                margin-right: 10px;
                font-size: 24px;
            }

        .values {
            margin: 60px 0;
        }

            .values h2 {
                text-align: center;
                font-size: 36px;
                color: #2c2c2c;
                margin-bottom: 40px;
                font-weight: 400;
            }

        .values-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
        }

        .value-item {
            background: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease;
        }

            .value-item:hover {
                transform: translateY(-5px);
            }

            .value-item i {
                font-size: 40px;
                color: #8B4513;
                margin-bottom: 20px;
            }

            .value-item h4 {
                font-size: 22px;
                margin-bottom: 15px;
                color: #2c2c2c;
                font-weight: 400;
            }

            .value-item p {
                color: #666;
                line-height: 1.6;
            }

        /* ===== CTA SECTION ===== */
        .cta-section {
            background: linear-gradient(135deg, #2c2c2c 0%, #1a1a1a 100%);
            padding: 50px;
            border-radius: 10px;
            text-align: center;
            margin-top: 40px;
        }

            .cta-section h2 {
                font-size: 32px;
                margin-bottom: 20px;
                color: white;
                font-weight: 400;
            }

            .cta-section p {
                font-size: 18px;
                margin-bottom: 30px;
                color: #ccc;
                max-width: 700px;
                margin-left: auto;
                margin-right: auto;
            }

            .cta-section .btn-primary {
                background: #8B4513;
                border-color: #8B4513;
            }

                .cta-section .btn-primary:hover {
                    background: #A0522D;
                    border-color: #A0522D;
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
            .footer-container {
                grid-template-columns: 1fr 1fr;
                gap: 40px;
            }

            .mission-vision {
                flex-direction: column;
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

            .footer {
                padding: 40px 20px 20px;
            }

            .footer-container {
                grid-template-columns: 1fr;
                gap: 30px;
            }

            .about-hero h1 {
                font-size: 36px;
            }

            .about-hero p {
                font-size: 18px;
            }

            .about-content {
                padding: 40px 20px;
            }

            .about-intro h2,
            .values h2 {
                font-size: 28px;
            }

            .cta-section {
                padding: 30px 20px;
            }

                .cta-section h2 {
                    font-size: 28px;
                }
        }

        @media (max-width: 480px) {
            /* Additional mobile styles if needed */
        }
    </style>
    <title>About Us</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Header Section -->
            <header class="header">
                <a href="About.aspx">About.aspx</a>
                <div class="logo">
                    <span class="logo-symbol">GLITZ EVENTS</span>
                </div>
                
                <nav class="nav">
                    <a href="HomePage.aspx">HOME</a>
                    <a href="Services.aspx">SERVICES</a>
                    <a href="Portfolio.aspx">PORTFOLIO</a>
                    <a href="About.aspx" style="color: #8B4513;">ABOUT</a>
                    <a href="Contact.aspx">CONTACT</a>
                </nav>
                
                <div class="auth-buttons">
                    <button type="button" class="moon-toggle">🌙</button>
                    <a href="Login.aspx" class="login-btn">LOGIN</a>
                    <a href="Register.aspx" class="register-btn">REGISTER</a>
                </div>
            </header>

            <!-- Hero Section -->
            <section class="about-hero">
                <div class="hero-overlay">
                    <h1>About Glitz Events</h1>
                    <p>Turning moments into memories</p>
                </div>
            </section>

            <!-- Main Content -->
            <main class="about-content">
                <div class="about-intro">
                    <h2>Our Story</h2>
                    <p>Glitz Event was founded in 2014 with a simple mission: to make event planning stress-free and enjoyable for South Africans. What started as a small local service has grown into a premier event rental platform serving clients across the country.</p>
                    <p>We understand that every event is unique, which is why we offer customizable packages that can be tailored to your specific needs and preferences.</p>
                </div>

                <div class="mission-vision">
                    <div class="mission">
                        <h3><i class="fas fa-bullseye"></i> Our Mission</h3>
                        <p>To simplify event planning by providing curated packages that include all essential services, making memorable events accessible to everyone.</p>
                    </div>
                    <div class="vision">
                        <h3><i class="fas fa-eye"></i> Our Vision</h3>
                        <p>To become South Africa's most trusted event planning platform, known for reliability, quality, and exceptional customer experiences.</p>
                    </div>
                </div>

                <div class="values">
                    <h2>Our Values</h2>
                    <div class="values-grid">
                        <div class="value-item">
                            <i class="fas fa-star"></i>
                            <h4>Excellence</h4>
                            <p>We strive for excellence in every service we provide and every interaction we have.</p>
                        </div>
                        <div class="value-item">
                            <i class="fas fa-handshake"></i>
                            <h4>Integrity</h4>
                            <p>We build trust through honesty, transparency, and ethical business practices.</p>
                        </div>
                        <div class="value-item">
                            <i class="fas fa-lightbulb"></i>
                            <h4>Innovation</h4>
                            <p>We continuously improve our services and embrace new ideas to serve you better.</p>
                        </div>
                        <div class="value-item">
                            <i class="fas fa-heart"></i>
                            <h4>Passion</h4>
                            <p>We're passionate about creating unforgettable experiences for our clients.</p>
                        </div>
                    </div>
                </div>

                <div class="cta-section">
                    <h2>Ready to Plan Your Event?</h2>
                    <p>Let us help you create unforgettable memories with our professional event planning services.</p>
                    <a href="Booking.aspx" class="btn-primary">Get Started</a>
                </div>
            </main>

            <!-- Footer Section -->
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
        </div>
    </form>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
</body>
</html>