<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.user.model.User" %>

<%
    User user = (User) session.getAttribute("user");

    if(user == null){
        response.sendRedirect("login");
        return;
    }

    String page = (String) request.getAttribute("page");

    if(page == null){
        page = "info";
    }

    String contentPage = "/dashboard/" + page + ".jsp";
%>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>

<jsp:include page="/components/sidebar.jsp">
    <jsp:param name="contentPage" value="<%= contentPage %>" />
</jsp:include>

</body>
</html>

