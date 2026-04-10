<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Glitz Events - Our Services</title>
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

        /* ===== SERVICES HERO STYLES ===== */
        .services-hero {
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

        /* ===== SERVICES CONTENT STYLES ===== */
        .services-content {
            padding: 80px 50px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .services-intro {
            text-align: center;
            margin-bottom: 60px;
        }

            .services-intro h2 {
                font-size: 36px;
                color: #2c2c2c;
                margin-bottom: 20px;
                font-weight: 400;
            }

            .services-intro p {
                font-size: 18px;
                max-width: 800px;
                margin: 0 auto;
                color: #666;
                line-height: 1.6;
            }

        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 30px;
            margin-bottom: 60px;
        }

        .service-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

            .service-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            }

        .service-image {
            height: 200px;
            overflow: hidden;
        }

            .service-image img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                transition: transform 0.5s ease;
            }

        .service-card:hover .service-image img {
            transform: scale(1.05);
        }

        .service-details {
            padding: 25px;
        }

            .service-details h3 {
                font-size: 22px;
                margin-bottom: 15px;
                color: #2c2c2c;
                font-weight: 400;
            }

            .service-details p {
                color: #666;
                margin-bottom: 20px;
                line-height: 1.6;
            }

        .service-features {
            margin-top: 20px;
        }

            .service-features h4 {
                font-size: 16px;
                color: #8B4513;
                margin-bottom: 10px;
                font-weight: 500;
            }

        .features-list {
            list-style: none;
        }

            .features-list li {
                padding: 5px 0;
                color: #666;
                display: flex;
                align-items: center;
            }

                .features-list li:before {
                    content: "•";
                    color: #8B4513;
                    font-weight: bold;
                    display: inline-block;
                    width: 1em;
                    margin-right: 5px;
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
                padding: 15px 30px;
                text-decoration: none;
                font-weight: 500;
                font-size: 16px;
                transition: all 0.3s ease;
                border: 2px solid #8B4513;
                text-transform: uppercase;
                cursor: pointer;
                font-family: 'Georgia', serif;
                color: white;
                display: inline-block;
            }

                .cta-section .btn-primary:hover {
                    background: #A0522D;
                    border-color: #A0522D;
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

            .services-grid {
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
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

            .services-hero h1 {
                font-size: 36px;
            }

            .services-hero p {
                font-size: 18px;
            }

            .services-content {
                padding: 40px 20px;
            }

            .services-intro h2 {
                font-size: 28px;
            }

            .cta-section {
                padding: 30px 20px;
            }

                .cta-section h2 {
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
        <!-- Header -->
        <header class="header">
            <div class="logo">
                <span class="logo-symbol"></span>GLITZ EVENTS
            </div>
            <nav class="nav">
                <a href="HomePage.aspx">HOME</a>
                <a href="Services.aspx" style="color: #8B4513;">SERVICES</a>
                <a href="Portfolio.aspx">PORTFOLIO</a>
                <a href="About.aspx">ABOUT</a>
                <a href="Contact.aspx">CONTACT</a>
            </nav>
            <div class="auth-buttons">
                <button class="moon-toggle">🌙</button>
                <a href="Login.aspx" class="login-btn">LOGIN</a>
                <a href="Register.aspx" class="register-btn">REGISTER</a>
            </div>
        </header>

        <!-- Hero Section -->
        <section class="services-hero">
            <div class="hero-overlay">
                <h1>OUR SERVICES</h1>
                <p>From intimate celebrations to grand corporate affairs, we transform your vision into extraordinary experiences.</p>
            </div>
        </section>

        <!-- Services Content -->
        <section class="services-content">
            <div class="services-intro">
                <h2>COMPREHENSIVE EVENT SOLUTIONS</h2>
                <p>At Glitz Events, we offer a wide range of event planning services to make your special occasions truly memorable. From intimate gatherings to grand celebrations, we handle every detail with precision and care.</p>
            </div>

            <!-- Services Grid -->
            <div class="services-grid">
                <!-- Birthday Celebrations -->
                <div class="service-card">
                    <div class="service-image">
                        <img src="Images/BirthdayCelebration.jpg" />" alt="Birthday Celebration" />
                    </div>
                    <div class="service-details">
                        <h3>BIRTHDAY CELEBRATIONS</h3>
                        <p>Complete birthday packages with themed décor, catering, and entertainment options to make every birthday unforgettable.</p>
                        <div class="service-features">
                            <h4>INCLUDES:</h4>
                            <ul class="features-list">
                                <li>Kids Birthday Parties</li>
                                <li>Adult Celebrations</li>
                                <li>Themed Parties</li>
                                <li>Traditional & Cultural</li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <!-- Wedding Events -->
                <div class="service-card">
                    <div class="service-image">
                        <img src="Images/WeddingEvent.jpg" />" alt="Wedding Event" />
                    </div>
                    <div class="service-details">
                        <h3>WEDDING EVENTS</h3>
                        <p>Elegant wedding packages including venue decoration, seating arrangements, sound systems, and catering services.</p>
                        <div class="service-features">
                            <h4>INCLUDES:</h4>
                            <ul class="features-list">
                                <li>Traditional Ceremonies</li>
                                <li>Destination Weddings</li>
                                <li>Intimate Gatherings</li>
                                <li>Cultural Celebrations</li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <!-- Graduation Parties -->
                <div class="service-card">
                    <div class="service-image">
                        <img src="Images/GraduationParty.jpg" />" alt="Graduation Party" />
                    </div>
                    <div class="service-details">
                        <h3>GRADUATION PARTIES</h3>
                        <p>Celebrate academic achievements with our specially curated graduation packages featuring professional décor and catering.</p>
                        <div class="service-features">
                            <h4>INCLUDES:</h4>
                            <ul class="features-list">
                                <li>High School Graduations</li>
                                <li>College/University Ceremonies</li>
                                <li>Graduate School Celebrations</li>
                                <li>Theme-Based Parties</li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <!-- Corporate Events -->
                <div class="service-card">
                    <div class="service-image">
                        <img src="Images/CorporateEvent.jpg" />" alt="Corporate Event" />
                    </div>
                    <div class="service-details">
                        <h3>CORPORATE EVENTS</h3>
                        <p>Professional corporate event solutions including conference setups, networking events, and team building celebrations.</p>
                        <div class="service-features">
                            <h4>INCLUDES:</h4>
                            <ul class="features-list">
                                <li>Conferences & Seminars</li>
                                <li>Product Launches</li>
                                <li>Team Building Activities</li>
                                <li>Networking Events</li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <!-- Farewell Events -->
                <div class="service-card">
                    <div class="service-image">
                        <img src="Images/FarewellEvent.jpg" /> alt="Farewell Event" />
                    </div>
                    <div class="service-details">
                        <h3>FAREWELL EVENTS</h3>
                        <p>Memorable farewell celebrations with customizable packages to honor departures and new beginnings.</p>
                        <div class="service-features">
                            <h4>INCLUDES:</h4>
                            <ul class="features-list">
                                <li>Retirement Parties</li>
                                <li>Employee Departures</li>
                                <li>Moving Away Parties</li>
                                <li>Memorial Services</li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <!-- Custom Events -->
                <div class="service-card">
                    <div class="service-image">
                        <img src="Images/CustomEvent.jpg" /> alt="Custom Event" />
                    </div>
                    <div class="service-details">
                        <h3>CUSTOM EVENTS</h3>
                        <p>Bespoke event solutions tailored to your unique requirements with full customization options available.</p>
                        <div class="service-features">
                            <h4>INCLUDES:</h4>
                            <ul class="features-list">
                                <li>Anniversaries</li>
                                <li>Baby Showers</li>
                                <li>Engagement Parties</li>
                                <li>Holiday Celebrations</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Call to Action -->
            <div class="cta-section">
                <h2>READY TO PLAN YOUR EVENT?</h2>
                <p>Contact us today to discuss your vision and let us bring it to life with our professional event planning services.</p>
                <a href="Contact.aspx" class="btn-primary">GET IN TOUCH</a>
            </div>
        </section>

        <!-- Footer -->
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
    </form>
    
    <script>
        // Simple dark mode toggle
        const moonToggle = document.querySelector('.moon-toggle');
        let isDarkMode = false;

        moonToggle.addEventListener('click', () => {
            isDarkMode = !isDarkMode;
            if (isDarkMode) {
                document.body.style.background = 'linear-gradient(135deg, #2c2c2c 0%, #1a1a1a 100%)';
                document.body.style.color = '#fff';
                document.querySelector('.header').style.background = 'rgba(44, 44, 44, 0.95)';
                moonToggle.textContent = '☀️';

                // Update all text colors for dark mode
                document.querySelectorAll('h1, h2, h3, h4, h5, h6, p, a, li').forEach(element => {
                    element.style.color = '#fff';
                });

                // Update service cards background
                document.querySelectorAll('.service-card').forEach(card => {
                    card.style.background = 'rgba(44, 44, 44, 0.95)';
                });

            } else {
                document.body.style.background = 'linear-gradient(135deg, #f5f5f5 0%, #e8e8e8 100%)';
                document.body.style.color = '#2c2c2c';
                document.querySelector('.header').style.background = 'rgba(255, 255, 255, 0.95)';
                moonToggle.textContent = '🌙';

                // Reset all text colors
                document.querySelectorAll('h1, h2, h3, h4, h5, h6, p, a, li').forEach(element => {
                    element.style.color = '';
                });

                // Reset service cards background
                document.querySelectorAll('.service-card').forEach(card => {
                    card.style.background = 'rgba(255, 255, 255, 0.95)';
                });
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