<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.about.model.About" %>

<%
    List<About> aboutList = (List<About>) request.getAttribute("aboutList");
%>

<style>
    .admin-box {
        background: #ffffff;
        padding: 30px;
        border-radius: 16px;
        max-width: 800px;
        margin: 20px auto;
        box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.05), 0 4px 6px -2px rgba(0, 0, 0, 0.02);
        font-family: 'Inter', system-ui, -apple-system, sans-serif;
    }

    .admin-box h2 {
        margin-top: 0;
        margin-bottom: 24px;
        color: #0f172a;
        font-size: 26px;
        font-weight: 700;
        letter-spacing: -0.02em;
    }

    .admin-box h3 {
        margin-top: 40px;
        margin-bottom: 18px;
        color: #334155;
        font-size: 18px;
        font-weight: 600;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group label {
        display: block;
        font-size: 14px;
        font-weight: 500;
        color: #475569;
        margin-bottom: 8px;
    }

    input[type="text"], textarea {
        width: 100%;
        padding: 12px 16px;
        border: 1px solid #cbd5e1;
        border-radius: 10px;
        font-family: inherit;
        font-size: 15px;
        color: #0f172a;
        box-sizing: border-box;
        transition: border-color 0.2s, box-shadow 0.2s;
    }

    input[type="text"]:focus, textarea:focus {
        outline: none;
        border-color: #2563eb;
        box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1);
    }

    .file-input-wrapper {
        position: relative;
        display: block;
        margin-top: 8px;
    }

    input[type="file"] {
        width: 100%;
        padding: 10px 14px;
        border: 1px dashed #cbd5e1;
        border-radius: 10px;
        background: #f8fafc;
        cursor: pointer;
        font-family: inherit;
        font-size: 14px;
        box-sizing: border-box;
        transition: border-color 0.2s, background 0.2s;
    }

    input[type="file"]:hover {
        border-color: #2563eb;
        background: #f1f5f9;
    }

    button[type="submit"] {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 12px 24px;
        background: #2563eb;
        color: #ffffff;
        border: none;
        cursor: pointer;
        border-radius: 10px;
        font-size: 15px;
        font-weight: 600;
        transition: background 0.2s, transform 0.1s;
        box-shadow: 0 4px 6px -1px rgba(37, 99, 235, 0.2);
    }

    button[type="submit"]:hover {
        background: #1d4ed8;
    }

    button[type="submit"]:active {
        transform: scale(0.98);
    }

    .card-list {
        display: flex;
        flex-direction: column;
        gap: 16px;
    }

    .member-card {
        background: #f8fafc;
        padding: 20px;
        border: 1px solid #e2e8f0;
        border-radius: 12px;
        display: flex;
        gap: 20px;
        align-items: center;
        transition: transform 0.2s, box-shadow 0.2s;
    }

    .member-card:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 12px -1px rgba(0, 0, 0, 0.05);
    }

    .member-avatar-wrapper {
        width: 80px;
        height: 80px;
        border-radius: 50%;
        padding: 3px;
        background: linear-gradient(135deg, #2563eb 0%, #38bdf8 100%);
        flex-shrink: 0;
    }

    .member-avatar {
        width: 100%;
        height: 100%;
        object-fit: cover;
        border-radius: 50%;
        border: 2px solid #ffffff;
        background: #e2e8f0;
    }

    .card-info {
        flex: 1;
    }

    .card-info b {
        color: #0f172a;
        font-size: 17px;
        font-weight: 600;
        display: block;
        margin-bottom: 4px;
    }

    .card-info p {
        color: #475569;
        margin: 0;
        font-size: 14px;
        line-height: 1.6;
    }

    .empty-state {
        text-align: center;
        padding: 30px 10px;
        color: #94a3b8;
        font-style: italic;
        font-size: 14px;
    }
</style>

<div class="admin-box">

    <h2>Manage Team Profiles (About Us)</h2>

    <form method="post" action="about" enctype="multipart/form-data">

        <div class="form-group">
            <label for="name">Full Name</label>
            <input type="text" id="name" name="name" placeholder="e.g. Dr. John Doe" required>
        </div>

        <div class="form-group">
            <label for="description">Short Bio / Description</label>
            <textarea id="description" name="description" placeholder="Write a short description about this member..." rows="4" required></textarea>
        </div>

        <div class="form-group">
            <label for="image">Circular Profile Picture</label>
            <div class="file-input-wrapper">
                <input type="file" id="image" name="image" accept="image/*" required>
            </div>
        </div>

        <button type="submit">
            <i class="fa-solid fa-plus" style="margin-right: 8px;"></i> Save Team Profile
        </button>

    </form>

    <h3>Existing Showcase Profiles</h3>

    <div class="card-list">
        <%
            if (aboutList != null && !aboutList.isEmpty()) {
                for (About a : aboutList) {
        %>

            <div class="member-card">
                <div class="member-avatar-wrapper">
                    <img src="<%= request.getContextPath() %>/<%= a.getImage() %>"
                         alt="<%= a.getName() %>"
                         class="member-avatar">
                </div>

                <div class="card-info">
                    <b><%= a.getName() %></b>
                    <p><%= a.getDescription() %></p>
                </div>
            </div>

        <%
                }
            } else {
        %>
            <div class="empty-state">
                <i class="fa-solid fa-users-slash" style="font-size: 24px; margin-bottom: 8px; display: block; color: #cbd5e1;"></i>
                No team profiles added yet.
            </div>
        <%
            }
        %>
    </div>

</div>