<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register</title>
</head>
<body>

<h2>Register Page</h2>

<form action="register" method="post">
    Username: <input type="text" name="username"><br><br>
    Age: <input type="number" name="age"><br><br>
    Address: <input type="text" name="address"><br><br>
    Email: <input type="email" name="email"><br><br>
    Password: <input type="password" name="password"><br><br>

    <button type="submit">Register</button>
</form>

<p style="color:red;">
    ${error}
</p>

<a href="login">Back to Login</a>

</body>
</html>

