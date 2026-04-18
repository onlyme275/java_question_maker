<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.user.model.User" %>

<%
    User user = (User) session.getAttribute("user");
%>

<style>
    body {
        margin: 0;
        font-family: "Segoe UI", Arial, sans-serif;
        background: #f1f5f9;
    }

    .navbar {
        background: #0f172a;
        padding: 12px 24px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        color: white;
        position: sticky;
        top: 0;
        z-index: 1000;
        box-shadow: 0 2px 10px rgba(0,0,0,0.2);
    }

    .logo {
        font-size: 18px;
        font-weight: 600;
        letter-spacing: 0.5px;
    }

    .nav-links {
        display: flex;
        align-items: center;
        gap: 14px;
    }

    .nav-links a {
        color: white;
        text-decoration: none;
        padding: 7px 12px;
        border-radius: 6px;
        transition: 0.25s;
        font-size: 14px;
    }

    .nav-links a:hover {
        background: #1e293b;
    }

    .btn {
        background: #38bdf8;
        color: #0f172a !important;
        font-weight: 600;
    }

    .btn:hover {
        background: #0ea5e9;
    }

    /* PROFILE */
    .profile {
        position: relative;
        display: flex;
        align-items: center;
        cursor: pointer;
    }

    .profile-icon {
        width: 36px;
        height: 36px;
        border-radius: 50%;
        background: linear-gradient(135deg, #38bdf8, #60a5fa);
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
        color: #0f172a;
        box-shadow: 0 2px 8px rgba(0,0,0,0.2);
    }

    .dropdown {
        display: none;
        position: absolute;
        right: 0;
        top: 45px;
        background: white;
        color: black;
        min-width: 160px;
        border-radius: 8px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        overflow: hidden;
    }

    .dropdown a {
        display: block;
        padding: 10px 12px;
        text-decoration: none;
        color: #0f172a;
        font-size: 14px;
        transition: 0.2s;
    }

    .dropdown a:hover {
        background: #f1f5f9;
    }

    .profile:hover .dropdown {
        display: block;
    }

    .profile-name {
        margin-left: 8px;
        font-size: 14px;
        opacity: 0.9;
    }
</style>

<div class="navbar">

    <div class="logo"> InstituteMedical</div>

    <div class="nav-links">

        <a href="main">Home</a>

        <%
            if (user == null) {
        %>

            <a href="login" class="btn">Login</a>
            <a href="register">Register</a>

        <%
            } else {
        %>

            <div class="profile">

                <div class="profile-icon">
                    <%= user.getUsername().substring(0,1).toUpperCase() %>
                </div>

                <span class="profile-name">
                    <%= user.getUsername() %>
                </span>

                <div class="dropdown">
                    <a href="dashboard">Dashboard</a>
                    <a href="#">Profile</a>
                    <a href="logout">Logout</a>
                </div>

            </div>

        <%
            }
        %>

    </div>
</div>