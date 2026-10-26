<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Spring MVC AOP Demo</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f5f9;
            margin: 0;
            padding: 40px;
        }

        .container {
            max-width: 550px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 3px 12px #cccccc;
        }

        h2 {
            color: #174a8b;
        }

        p {
            font-size: 17px;
        }

        a {
            display: inline-block;
            margin-top: 15px;
            margin-right: 12px;
            color: #174a8b;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>Spring MVC with AOP</h2>

    <h3>Student Information</h3>

    <p><b>Name:</b> ${name}</p>
    <p><b>Course:</b> ${course}</p>
    <p><b>City:</b> ${city}</p>

    <hr>

    <p>AOP logging is enabled.</p>

    <a href="${pageContext.request.contextPath}/">
        Home
    </a>

    <a href="${pageContext.request.contextPath}/about">
        About
    </a>

</div>

</body>
</html>
