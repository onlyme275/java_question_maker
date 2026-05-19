<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.user.model.User" %>

<%
    User user = (User) session.getAttribute("user");
%>

<!-- Load Google Fonts and FontAwesome Icons -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
    body {
        margin: 0;
        font-family: 'Inter', sans-serif;
        background: #f8fafc;
    }

    .navbar {
        background: rgba(15, 23, 42, 0.95);
        backdrop-filter: blur(12px);
        -webkit-backdrop-filter: blur(12px);
        border-bottom: 1px solid rgba(255, 255, 255, 0.08);
        padding: 14px 40px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        position: sticky;
        top: 0;
        z-index: 1000;
        box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
    }

    .logo-container {
        display: flex;
        align-items: center;
        gap: 10px;
        text-decoration: none;
    }

    .logo-icon {
        font-size: 22px;
        background: linear-gradient(135deg, #38bdf8 0%, #2563eb 100%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }

    .logo-text {
        font-size: 20px;
        font-weight: 800;
        letter-spacing: -0.025em;
        background: linear-gradient(135deg, #ffffff 40%, #cbd5e1 100%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }

    .logo-text span {
        background: linear-gradient(135deg, #38bdf8 0%, #2563eb 100%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }

    .nav-links {
        display: flex;
        align-items: center;
        gap: 16px;
    }

    .nav-link {
        color: #94a3b8;
        text-decoration: none;
        font-size: 14px;
        font-weight: 500;
        padding: 8px 16px;
        border-radius: 8px;
        transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .nav-link:hover {
        color: #ffffff;
        background: rgba(255, 255, 255, 0.06);
    }

    /* BUTTONS */
    .btn-login {
        color: #e2e8f0 !important;
        font-weight: 600;
        font-size: 14px;
        text-decoration: none;
        padding: 8px 18px;
        border-radius: 8px;
        transition: all 0.25s ease;
        border: 1px solid rgba(255, 255, 255, 0.15);
    }

    .btn-login:hover {
        background: rgba(255, 255, 255, 0.08);
        border-color: rgba(255, 255, 255, 0.3);
        color: #ffffff !important;
    }

    .btn-register {
        background: linear-gradient(135deg, #2563eb 0%, #3b82f6 100%);
        color: #ffffff !important;
        font-weight: 600;
        font-size: 14px;
        text-decoration: none;
        padding: 9px 20px;
        border-radius: 8px;
        transition: all 0.25s ease;
        box-shadow: 0 4px 12px rgba(37, 99, 235, 0.25);
    }

    .btn-register:hover {
        background: linear-gradient(135deg, #1d4ed8 0%, #2563eb 100%);
        box-shadow: 0 6px 16px rgba(37, 99, 235, 0.4);
        transform: translateY(-1px);
    }

    /* PROFILE */
    .profile {
        position: relative;
        display: flex;
        align-items: center;
        gap: 10px;
        cursor: pointer;
        padding: 6px 12px;
        border-radius: 10px;
        transition: all 0.2s ease;
    }

    .profile:hover {
        background: rgba(255, 255, 255, 0.06);
    }

    .profile-icon {
        width: 34px;
        height: 34px;
        border-radius: 50%;
        background: linear-gradient(135deg, #38bdf8 0%, #2563eb 100%);
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: 700;
        color: #ffffff;
        box-shadow: 0 4px 10px rgba(37, 99, 235, 0.25);
        font-size: 14px;
        border: 2px solid rgba(255, 255, 255, 0.2);
        transition: all 0.3s ease;
    }

    .profile:hover .profile-icon {
        transform: scale(1.05);
        border-color: rgba(255, 255, 255, 0.5);
    }

    .profile-name {
        font-size: 14px;
        font-weight: 600;
        color: #e2e8f0;
    }

    .profile-chevron {
        font-size: 11px;
        color: #94a3b8;
        transition: transform 0.2s ease;
    }

    .profile:hover .profile-chevron {
        transform: rotate(180deg);
        color: #ffffff;
    }

    .dropdown {
        opacity: 0;
        visibility: hidden;
        transform: translateY(10px);
        position: absolute;
        right: 0;
        top: 52px;
        background: #0f172a;
        border: 1px solid rgba(255, 255, 255, 0.08);
        min-width: 190px;
        border-radius: 12px;
        box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.3), 0 10px 10px -5px rgba(0, 0, 0, 0.2);
        overflow: hidden;
        transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
        z-index: 1001;
        padding: 6px;
    }

    .profile:hover .dropdown {
        opacity: 1;
        visibility: visible;
        transform: translateY(0);
    }

    .dropdown a {
        display: flex;
        align-items: center;
        gap: 10px;
        padding: 10px 12px;
        text-decoration: none;
        color: #94a3b8;
        font-size: 14px;
        font-weight: 500;
        transition: all 0.2s ease;
        border-radius: 8px;
    }

    .dropdown a i {
        font-size: 15px;
        width: 18px;
        text-align: center;
    }

    .dropdown a:hover {
        background: rgba(255, 255, 255, 0.06);
        color: #ffffff;
    }

    .dropdown-divider {
        height: 1px;
        background: rgba(255, 255, 255, 0.08);
        margin: 6px 0;
    }

    .dropdown a.logout-item {
        color: #f87171;
    }

    .dropdown a.logout-item:hover {
        background: rgba(239, 68, 68, 0.1);
        color: #ef4444;
    }

    @media (max-width: 640px) {
        .navbar {
            padding: 14px 20px;
        }
        .profile-name, .profile-chevron {
            display: none;
        }
    }
</style>

<div class="navbar">
    <a href="main" class="logo-container">
        <i class="fa-solid fa-staff-snake logo-icon"></i>
        <div class="logo-text">Institute<span>Medical</span></div>
    </a>

    <div class="nav-links">
        <a href="main" class="nav-link">
            <i class="fa-solid fa-house"></i> Home
        </a>

        <% if (user == null) { %>
            <a href="login" class="btn-login">Login</a>
            <a href="register" class="btn-register">Register</a>
        <% } else { %>
            <div class="profile">
                <div class="profile-icon">
                    <%= user.getUsername().substring(0,1).toUpperCase() %>
                </div>
                <span class="profile-name">
                    <%= user.getUsername() %>
                </span>
                <i class="fa-solid fa-chevron-down profile-chevron"></i>

                <div class="dropdown">
                    <a href="dashboard">
                        <i class="fa-solid fa-gauge-high"></i> Dashboard
                    </a>
                    <a href="#">
                        <i class="fa-solid fa-user"></i> Profile
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="logout" class="logout-item">
                        <i class="fa-solid fa-right-from-bracket"></i> Logout
                    </a>
                </div>
            </div>
        <% } %>
    </div>
</div>
