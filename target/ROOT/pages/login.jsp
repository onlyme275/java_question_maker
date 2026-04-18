<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<jsp:include page="/components/header.jsp"/>

<h2>Login Page</h2>

<form action="login" method="post">
    Email: <input type="email" name="email"><br><br>
    Password: <input type="password" name="password"><br><br>

    <button type="submit">Login</button>
</form>

<p style="color:red;">
    ${error}
</p>

<a href="register">Register here</a>

<jsp:include page="/components/footer.jsp"/>
</body>
</html>

