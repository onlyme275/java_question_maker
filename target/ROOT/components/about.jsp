<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.about.model.About" %>

<%
    List<About> aboutList = (List<About>) request.getAttribute("aboutList");
    int aboutCount = (aboutList != null) ? aboutList.size() : 0;
%>

<style>
    .about-section {
        background: #f8fafc;
        padding: 90px 24px;
        font-family: 'Inter', system-ui, -apple-system, sans-serif;
    }

    .about-container {
        max-width: 1140px;
        margin: 0 auto;
    }

    .about-header {
        text-align: center;
        max-width: 650px;
        margin: 0 auto 60px auto;
    }

    .about-header span {
        font-size: 13px;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.12em;
        color: #2563eb;
        margin-bottom: 10px;
        display: inline-block;
    }

    .about-header h2 {
        font-size: 34px;
        font-weight: 800;
        color: #0f172a;
        line-height: 1.25;
        margin: 0 0 18px 0;
        letter-spacing: -0.025em;
    }

    .about-header p {
        font-size: 16px;
        color: #64748b;
        line-height: 1.6;
        margin: 0;
    }

    .about-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
        gap: 40px;
        justify-content: center;
    }

    .about-card {
        background: #ffffff;
        border: 1px solid #e2e8f0;
        border-radius: 20px;
        padding: 35px 24px;
        text-align: center;
        transition: transform 0.4s cubic-bezier(0.16, 1, 0.3, 1), box-shadow 0.4s cubic-bezier(0.16, 1, 0.3, 1), border-color 0.4s ease;
        display: flex;
        flex-direction: column;
        align-items: center;
        box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.02), 0 2px 4px -1px rgba(0, 0, 0, 0.02);
    }

    .about-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.05), 0 10px 10px -5px rgba(0, 0, 0, 0.03);
        border-color: #cbd5e1;
    }

    .about-avatar-container {
        width: 140px;
        height: 140px;
        border-radius: 50%;
        padding: 6px;
        background: linear-gradient(135deg, #2563eb 0%, #38bdf8 100%);
        box-shadow: 0 10px 15px -3px rgba(37, 99, 235, 0.2);
        margin-bottom: 24px;
        transition: transform 0.4s ease;
    }

    .about-card:hover .about-avatar-container {
        transform: scale(1.05) rotate(3deg);
    }

    .about-avatar {
        width: 100%;
        height: 100%;
        border-radius: 50%;
        object-fit: cover;
        border: 4px solid #ffffff;
        background: #f1f5f9;
    }

    .about-card h3 {
        font-size: 20px;
        font-weight: 700;
        color: #0f172a;
        margin: 0 0 8px 0;
        line-height: 1.4;
    }

    .about-card .about-role {
        font-size: 14px;
        font-weight: 500;
        color: #2563eb;
        margin-bottom: 16px;
        text-transform: uppercase;
        letter-spacing: 0.05em;
    }

    .about-card p {
        font-size: 14px;
        color: #475569;
        line-height: 1.6;
        margin: 0;
        flex: 1;
    }

    /* Empty state */
    .about-empty {
        text-align: center;
        padding: 70px 20px;
        background: #ffffff;
        border-radius: 20px;
        border: 2px dashed #cbd5e1;
        color: #94a3b8;
        max-width: 500px;
        margin: 0 auto;
    }

    .about-empty i {
        font-size: 48px;
        margin-bottom: 18px;
        color: #cbd5e1;
    }

    .about-empty p {
        font-size: 16px;
        margin: 0;
        font-weight: 500;
    }

    @media (max-width: 640px) {
        .about-section {
            padding: 60px 16px;
        }

        .about-header h2 {
            font-size: 28px;
        }
    }
</style>

<section class="about-section">
    <div class="about-container">

        <div class="about-header">
            <span>Our Dedicated Team</span>
            <h2>Meet the Experts Behind Us</h2>
            <p>We are a group of passionate professionals committed to delivering standard educational resources and seamless software solutions.</p>
        </div>

        <% if (aboutList != null && !aboutList.isEmpty()) { %>
            <div class="about-grid">
                <% for (About a : aboutList) { %>
                    <div class="about-card">
                        <div class="about-avatar-container">
                            <img src="<%= request.getContextPath() %>/<%= a.getImage() %>"
                                 alt="<%= a.getName() %>"
                                 class="about-avatar">
                        </div>
                        <h3><%= a.getName() %></h3>
                        <div class="about-role">Team Member</div>
                        <p><%= a.getDescription() %></p>
                    </div>
                <% } %>
            </div>
        <% } else { %>
            <div class="about-empty">
                <i class="fa-solid fa-users"></i>
                <p>No team profiles are currently showcase. Admins can easily add profiles from the dashboard.</p>
            </div>
        <% } %>

    </div>
</section>