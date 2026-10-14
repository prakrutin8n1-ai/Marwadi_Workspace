<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f1f5f9;
            padding: 35px;
        }
        .box {
            max-width: 500px;
            margin: auto;
            padding: 25px;
            background: white;
            border-radius: 12px;
        }
        input {
            width: 95%;
            padding: 10px;
            margin: 8px 0 16px;
        }
        button {
            background: #2563eb;
            color: white;
            padding: 11px 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="box">
    <h2>Student Details</h2>

    <form:form modelAttribute="student"
               method="post"
               action="${pageContext.request.contextPath}/student/save">

        <form:hidden path="id"/>

        <label>Student Name</label>
        <form:input path="name" required="required"/>

        <label>Email</label>
        <form:input path="email" type="email" required="required"/>

        <label>Course</label>
        <form:input path="course" required="required"/>

        <button type="submit">Save Student</button>

        <a href="${pageContext.request.contextPath}/">
            Cancel
        </a>
    </form:form>
</div>

</body>
