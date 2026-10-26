
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Registration</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f1f5f9;
            margin: 0;
            padding: 40px;
        }

        .container {
            width: 420px;
            max-width: 90%;
            margin: 30px auto;
            padding: 25px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 12px #cccccc;
            box-sizing: border-box;
        }

        h2 {
            text-align: center;
            color: #1e3a8a;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input {
            width: 100%;
            box-sizing: border-box;
            padding: 11px;
            margin-top: 7px;
            border: 1px solid #cccccc;
            border-radius: 5px;
        }

        button {
            width: 100%;
            margin-top: 22px;
            padding: 12px;
            background: #2563eb;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background: #1d4ed8;
        }

        .link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #2563eb;
            text-decoration: none;
        }

        .error {
            color: red;
            overflow-wrap: anywhere;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>${student.id > 0 ? 'Edit Student' : 'Student Registration'}</h2>

    <p class="error">${error}</p>

    <form
        action="${pageContext.request.contextPath}${student.id > 0 ? '/update' : '/save'}"
        method="post">

        <input type="hidden" name="id" value="${student.id}">

        <label>Student Name</label>
        <input type="text"
               name="name"
               value="${student.name}"
               placeholder="Enter student name"
               required>

        <label>Email Address</label>
        <input type="email"
               name="email"
               value="${student.email}"
               placeholder="Enter email address"
               required>

        <label>Course</label>
        <input type="text"
               name="course"
               value="${student.course}"
               placeholder="Enter course name"
               required>

        <button type="submit">
            ${student.id > 0 ? 'Update Student' : 'Save Student'}
        </button>

    </form>

    <a class="link"
       href="${pageContext.request.contextPath}/students">
        Back to Student List
    </a>

</div>

</body>
</html>
