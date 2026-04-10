<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Portfolio.aspx.cs" Inherits="Glitz_Events.Portfolio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #f5f5f5 0%, #e8e8e8 100%);
            color: #2c2c2c;
            transition: all 0.3s ease;
            min-height: 100vh;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 5%;
            background: rgba(255, 255, 255, 0.95);
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 100;
            transition: all 0.3s ease;
        }

        .logo-symbol {
            font-size: 1.8rem;
            font-weight: bold;
            color: #8B4513;
            letter-spacing: 1px;
        }

        .nav {
            display: flex;
            gap: 2rem;
        }

        .nav a {
            text-decoration: none;
            color: #2c2c2c;
            font-weight: 500;
            transition: all 0.3s ease;
            position: relative;
        }

        .nav a:hover {
            color: #8B4513;
        }

        .nav a::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 0;
            height: 2px;
            background-color: #8B4513;
            transition: width 0.3s ease;
        }

        .nav a:hover::after {
            width: 100%;
        }

        .auth-buttons {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .moon-toggle {
            background: none;
            border: none;
            font-size: 1.5rem;
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .login-btn, .register-btn {
            padding: 0.5rem 1.2rem;
            border-radius: 25px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .login-btn {
            color: #2c2c2c;
            border: 1px solid #2c2c2c;
        }

        .login-btn:hover {
            background-color: #2c2c2c;
            color: #fff;
        }

        .register-btn {
            background-color: #8B4513;
            color: white;
        }

        .register-btn:hover {
            background-color: #6b3300;
        }

        .portfolio-container {
            padding: 3rem 5%;
            text-align: center;
        }

        .portfolio-title {
            font-size: 2.5rem;
            margin-bottom: 2rem;
            color: #8B4513;
            position: relative;
            display: inline-block;
        }

        .portfolio-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background-color: #8B4513;
        }

        .gallery-collage {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 1.5rem;
            margin-top: 2rem;
        }

        .gallery-item {
            overflow: hidden;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            aspect-ratio: 4/3;
        }

        .gallery-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }

        .gallery-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .gallery-item:hover img {
            transform: scale(1.05);
        }

        .footer {
            background-color: #2c2c2c;
            color: #fff;
            padding: 3rem 5% 1rem;
            margin-top: 4rem;
        }

        .footer-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .footer-column h4 {
            font-size: 1.2rem;
            margin-bottom: 1.2rem;
            color: #8B4513;
        }

        .footer-column ul {
            list-style: none;
        }

        .footer-column ul li {
            margin-bottom: 0.8rem;
        }

        .footer-column ul li a {
            color: #ddd;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer-column ul li a:hover {
            color: #8B4513;
        }

        .footer-logo .logo-text {
            font-size: 1.8rem;
            font-weight: bold;
            color: #8B4513;
        }

        .footer-description {
            margin: 1rem 0;
            color: #ddd;
            font-style: italic;
        }

        .contact-info p {
            margin-bottom: 0.5rem;
            color: #ddd;
        }

        .footer-bottom {
            text-align: center;
            padding-top: 1.5rem;
            border-top: 1px solid #444;
            color: #ddd;
            font-size: 0.9rem;
        }

        /* Dark mode styles */
        body.dark-mode {
            background: linear-gradient(135deg, #2c2c2c 0%, #1a1a1a 100%);
            color: #fff;
        }

        body.dark-mode .header {
            background: rgba(44, 44, 44, 0.95);
        }

        body.dark-mode .nav a {
            color: #fff;
        }

        body.dark-mode .login-btn {
            color: #fff;
            border: 1px solid #fff;
        }

        body.dark-mode .login-btn:hover {
            background-color: #fff;
            color: #2c2c2c;
        }

        /* Responsive styles */
        @media (max-width: 900px) {
            .header {
                flex-direction: column;
                padding: 1rem;
            }
            
            .nav {
                margin: 1.5rem 0;
                flex-wrap: wrap;
                justify-content: center;
            }
            
            .gallery-collage {
                grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            }
        }

        @media (max-width: 600px) {
            .portfolio-title {
                font-size: 2rem;
            }
            
            .gallery-collage {
                grid-template-columns: 1fr;
            }
            
            .footer-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
    <title>Portfolio - Glitz Events</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header class="header">
                <div class="logo">
                    <span class="logo-symbol">GLITZ EVENTS</span>
                </div>
                
                <nav class="nav">
                    <a href="HomePage.aspx">HOME</a>
                    <a href="Services.aspx">SERVICES</a>
                    <a href="Portfolio.aspx" style="color: #8B4513;">PORTFOLIO</a>
                    <a href="About.aspx">ABOUT</a>
                    <a href="Contact.aspx">CONTACT</a>
                </nav>
                
                <div class="auth-buttons">
                    <button type="button" class="moon-toggle">🌙</button>
                    <a href="Login.aspx" class="login-btn">LOGIN</a>
                    <a href="Register.aspx" class="register-btn">REGISTER</a>
                </div>
            </header>

            <div class="portfolio-container">
                <h1 class="portfolio-title">Our Portfolio</h1>

                <div class="gallery-collage">
                    <div class="gallery-item">
                        <img src="Images/IMG-20250827-WA0014.jpg" alt="Wedding Event">
                    </div>
                    <div class="gallery-item">
                        <img src="Images/IMG-20250827-WA0015.jpg" alt="Wedding Event">
                    </div>
                    <div class="gallery-item">
                        <img src="Images/IMG-20250827-WA0016.jpg" alt="Wedding Event">
                    </div>
                    <div class="gallery-item">
                        <img src="Images/IMG-20250827-WA0017.jpg" alt="Wedding Event">
                    </div>
                    <div class="gallery-item">
                        <img src="Images/IMG-20250827-WA0018.jpg" alt="Wedding Event">
                    </div>
                    <div class="gallery-item">
                        <img src="Images/IMG-20250827-WA0019.jpg" alt="Wedding Event">
                    </div>
                    <div class="gallery-item">
                        <img src="Images/IMG-20250827-WA0020.jpg" alt="Wedding Event">
                    </div>
                    <div class="gallery-item">
                        <img src="Images/IMG-20250827-WA0021.jpg" alt="Corporate Event">
                    </div>
                    <div class="gallery-item">
                        <img src="Images/IMG-20250827-WA0022.jpg" alt="Birthday Party">
                    </div>
                    <div class="gallery-item">
                        <img src="Images/IMG-20250827-WA0023.jpg" alt="Conference">
                    </div>
                    <div class="gallery-item">
                        <img src="Images/IMG-20250827-WA0024.jpg" alt="Gala Dinner">
                    </div>
                    <div class="gallery-item">
                        <img src="Images/IMG-20250827-WA0025.jpg" alt="Product Launch">
                    </div>
                    <div class="gallery-item">
                        <img src="Images/IMG-20250827-WA0026.jpg" alt="Anniversary Celebration">
                    </div>
                    <div class="gallery-item">
                        <img src="Images/IMG-20250827-WA0027.jpg" alt="Graduation Party">
                    </div>
                    <div class="gallery-item">
                        <img src="Images/IMG-20250827-WA0028.jpg" alt="Festival">
                    </div>
                    <div class="gallery-item">
                        <img src="Images/IMG-20250827-WA0029.jpg" alt="Award Ceremony">
                    </div>
                    <div class="gallery-item">
                        <img src="Images/IMG-20250827-WA0030.jpg" alt="Charity Event">
                    </div>
                    <div class="gallery-item">
                        <img src="Images/IMG-20250827-WA0031.jpg" alt="Team Building">
                    </div>
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
        </div>
    </form>
    
    <script>
        // Dark mode toggle functionality
        const moonToggle = document.querySelector('.moon-toggle');
        let isDarkMode = false;

        moonToggle.addEventListener('click', () => {
            isDarkMode = !isDarkMode;
            if (isDarkMode) {
                document.body.classList.add('dark-mode');
                moonToggle.textContent = '☀️';
            } else {
                document.body.classList.remove('dark-mode');
                moonToggle.textContent = '🌙';
            }
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
    </script>
</body>
</html>