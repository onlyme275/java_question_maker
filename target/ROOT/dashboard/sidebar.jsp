<%@ page import="com.user.model.User" %>

<%
    User user = (User) session.getAttribute("user");
    int role = (user != null) ? user.getIs_staff() : 0;

    String contentPage = (String) request.getAttribute("contentPage");
    if (contentPage == null || contentPage.trim().isEmpty()) {
        contentPage = "/dashboard/info.jsp";
    }
%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f1f5f9;
}

/* SIDEBAR */
.sidebar {
    width: 230px;
    background: #0f172a;
    color: white;
    position: fixed;
    top: 0;
    left: 0;
    height: 100vh;
    display: flex;
    flex-direction: column;
}

/* MENU */
.sidebar h3 {
    text-align: center;
    padding: 15px 0;
    margin: 0;
}

.menu {
    flex: 1;
    overflow-y: auto;
}

.sidebar a {
    display: block;
    padding: 12px 18px;
    color: white;
    text-decoration: none;
    transition: 0.3s;
}

.sidebar a i {
    margin-right: 10px;
}

.sidebar a:hover {
    background: #1e293b;
}

/* LOGOUT */
.logout {
    background: #dc2626;
    padding: 12px 18px;
    text-decoration: none;
    color: white;
}

.logout:hover {
    background: #b91c1c;
}

/* CONTENT FIX (IMPORTANT PART) */
.content {
    position: absolute;
    left: 230px;
    top: 0;
    right: 0;
    bottom: 0;
    overflow-y: auto;
    padding: 20px;
    background: #f1f5f9;
}

/* BADGE */
.badge {
    font-size: 12px;
    background: #38bdf8;
    color: black;
    padding: 2px 6px;
    border-radius: 4px;
    margin-left: 5px;
}

</style>

</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">

    <h3>
        Menu
        <span class="badge">
            <%= (role == 1) ? "Admin" : "User" %>
        </span>
    </h3>

    <div class="menu">

        <a href="dashboard?page=question">
            <i class="fa-solid fa-pen-to-square"></i> Question
        </a>

        <a href="dashboard?page=result">
            <i class="fa-solid fa-chart-line"></i> Result
        </a>

        <%
            if(role == 1){
        %>

        <a href="dashboard?page=adminhero">
            <i class="fa-solid fa-house"></i> Hero Section
        </a>

        <a href="dashboard?page=adminwhyus">
            <i class="fa-solid fa-circle-question"></i> Why Us
        </a>

        <a href="dashboard?page=adminabout">
            <i class="fa-solid fa-circle-info"></i> About Us
        </a>

        <a href="dashboard?page=adminlocalnews">
            <i class="fa-solid fa-newspaper"></i> Local News
        </a>

        <a href="dashboard?page=adminanswers">
            <i class="fa-solid fa-comments"></i> Answers
        </a>

        <%
            }
        %>

    </div>

    <a href="logout" class="logout">
        <i class="fa-solid fa-right-from-bracket"></i> Logout
    </a>

</div>

<!-- CONTENT -->
<div class="content">
    <jsp:include page="<%= contentPage %>" />
</div>

</body>
</html>