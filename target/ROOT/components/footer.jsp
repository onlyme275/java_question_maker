<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    .footer-section {
        background: #0f172a;
        color: #94a3b8;
        font-family: 'Inter', system-ui, -apple-system, sans-serif;
        padding: 60px 40px 30px 40px;
        border-top: 1px solid rgba(255, 255, 255, 0.08);
        position: relative;
        z-index: 10;
        margin-top: 80px; /* Spacing from main content */
    }

    .footer-container {
        max-width: 1140px;
        margin: 0 auto;
        display: grid;
        grid-template-columns: 2fr 1fr 1fr 1.5fr;
        gap: 40px;
    }

    .footer-col h4 {
        color: #ffffff;
        font-size: 16px;
        font-weight: 700;
        margin-top: 0;
        margin-bottom: 20px;
        position: relative;
    }

    .footer-col h4::after {
        content: '';
        position: absolute;
        left: 0;
        bottom: -6px;
        width: 30px;
        height: 2px;
        background: linear-gradient(135deg, #38bdf8 0%, #2563eb 100%);
        border-radius: 2px;
    }

    .footer-col p {
        font-size: 14px;
        line-height: 1.6;
        margin: 0 0 16px 0;
    }

    .footer-logo {
        display: flex;
        align-items: center;
        gap: 10px;
        text-decoration: none;
        color: #ffffff;
        font-size: 18px;
        font-weight: 800;
        margin-bottom: 16px;
    }

    .footer-logo i {
        background: linear-gradient(135deg, #38bdf8 0%, #2563eb 100%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        font-size: 20px;
    }

    .footer-logo div {
        background: linear-gradient(135deg, #ffffff 40%, #cbd5e1 100%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }

    .footer-logo span {
        background: linear-gradient(135deg, #38bdf8 0%, #2563eb 100%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }

    .footer-links {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .footer-links li {
        margin-bottom: 12px;
    }

    .footer-links a {
        color: #94a3b8;
        text-decoration: none;
        font-size: 14px;
        transition: all 0.25s ease;
        display: inline-flex;
        align-items: center;
        gap: 8px;
    }

    .footer-links a:hover {
        color: #ffffff;
        transform: translateX(4px);
    }

    .footer-links a i {
        font-size: 10px;
        color: #38bdf8;
    }

    .contact-item {
        display: flex;
        align-items: flex-start;
        gap: 12px;
        font-size: 14px;
        margin-bottom: 14px;
        line-height: 1.5;
    }

    .contact-item i {
        color: #38bdf8;
        font-size: 15px;
        margin-top: 2px;
        width: 16px;
        text-align: center;
    }

    .social-links {
        display: flex;
        gap: 12px;
        margin-top: 20px;
    }

    .social-icon {
        width: 38px;
        height: 38px;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.05);
        color: #94a3b8;
        display: flex;
        align-items: center;
        justify-content: center;
        text-decoration: none;
        transition: all 0.3s ease;
        border: 1px solid rgba(255, 255, 255, 0.05);
    }

    .social-icon:hover {
        background: linear-gradient(135deg, #2563eb 0%, #3b82f6 100%);
        color: #ffffff;
        transform: translateY(-3px);
        box-shadow: 0 4px 12px rgba(37, 99, 235, 0.3);
        border-color: transparent;
    }

    .footer-bottom {
        max-width: 1140px;
        margin: 40px auto 0 auto;
        padding-top: 24px;
        border-top: 1px solid rgba(255, 255, 255, 0.08);
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size: 13px;
    }

    .footer-bottom-links {
        display: flex;
        gap: 20px;
    }

    .footer-bottom-links a {
        color: #64748b;
        text-decoration: none;
        transition: color 0.2s;
    }

    .footer-bottom-links a:hover {
        color: #ffffff;
    }

    @media (max-width: 960px) {
        .footer-container {
            grid-template-columns: 1fr 1fr;
            gap: 30px;
        }
    }

    @media (max-width: 600px) {
        .footer-section {
            padding: 40px 20px 20px 20px;
            margin-top: 40px;
        }
        .footer-container {
            grid-template-columns: 1fr;
            gap: 30px;
        }
        .footer-bottom {
            flex-direction: column;
            gap: 16px;
            text-align: center;
        }
    }
</style>

<footer class="footer-section">
    <div class="footer-container">
        
        <!-- Column 1: Info and brand summary -->
        <div class="footer-col">
            <a href="main" class="footer-logo">
                <i class="fa-solid fa-staff-snake"></i>
                <div>Institute<span>Medical</span></div>
            </a>
            <p>Empowering medical excellence through interactive question banks, insightful resources, and advanced portal systems designed for healthcare professionals.</p>
            <div class="social-links">
                <a href="#" class="social-icon"><i class="fa-brands fa-facebook-f"></i></a>
                <a href="#" class="social-icon"><i class="fa-brands fa-x-twitter"></i></a>
                <a href="#" class="social-icon"><i class="fa-brands fa-linkedin-in"></i></a>
                <a href="#" class="social-icon"><i class="fa-brands fa-github"></i></a>
            </div>
        </div>

        <!-- Column 2: Quick Navigation Links -->
        <div class="footer-col">
            <h4>Quick Links</h4>
            <ul class="footer-links">
                <li><a href="main"><i class="fa-solid fa-chevron-right"></i> Home</a></li>
                <li><a href="login"><i class="fa-solid fa-chevron-right"></i> Member Login</a></li>
                <li><a href="register"><i class="fa-solid fa-chevron-right"></i> Join System</a></li>
            </ul>
        </div>

        <!-- Column 3: Feature Highlights -->
        <div class="footer-col">
            <h4>Features</h4>
            <ul class="footer-links">
                <li><a href="#"><i class="fa-solid fa-chevron-right"></i> Question Maker</a></li>
                <li><a href="#"><i class="fa-solid fa-chevron-right"></i> Exam Generator</a></li>
                <li><a href="#"><i class="fa-solid fa-chevron-right"></i> Local Medical News</a></li>
                <li><a href="#"><i class="fa-solid fa-chevron-right"></i> Staff Portal</a></li>
            </ul>
        </div>

        <!-- Column 4: Contact Information -->
        <div class="footer-col">
            <h4>Contact Info</h4>
            <div class="contact-item">
                <i class="fa-solid fa-location-dot"></i>
                <div>102 Health Science Drive,<br>Dulari ,Nepal</div>
            </div>
            <div class="contact-item">
                <i class="fa-solid fa-phone"></i>
                <div>+977 982312035</div>
            </div>
            <div class="contact-item">
                <i class="fa-solid fa-envelope"></i>
                <div>institute@medical.org</div>
            </div>
        </div>

    </div>

    <!-- Bottom copyright bar -->
    <div class="footer-bottom">
        <div>© 2026 Institute Medical System. All Rights Reserved.</div>
        <div class="footer-bottom-links">
            <a href="#">Privacy Policy</a>
            <a href="#">Terms of Use</a>
        </div>
    </div>
</footer>