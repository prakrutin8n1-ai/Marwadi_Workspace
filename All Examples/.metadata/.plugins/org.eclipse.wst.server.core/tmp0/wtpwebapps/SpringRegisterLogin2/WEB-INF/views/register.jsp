<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Registration</title>
</head>
<body>

    <h2>Student Registration</h2>

    <p style="color:red">${error}</p>

    <form action="register" method="post">
        Username:
        <input type="text" name="username" required>
        <br><br>

        Password:
        <input type="password" name="password" required>
        <br><br>

        <button type="submit">Register</button>
    </form>

    <p>
        Already registered?
        <a href="login">Login Here</a>
    </p>

</body>
</html>
