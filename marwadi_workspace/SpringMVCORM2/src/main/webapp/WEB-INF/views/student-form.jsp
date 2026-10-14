
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${pageTitle}</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 35px 15px;
            color: #333;
        }

        .container {
            max-width: 480px;
            margin: 25px auto;
            background: #fff;
            padding: 28px;
            border-radius: 8px;
            box-shadow: 0 3px 12px rgba(0, 0, 0, 0.08);
        }

        h1 {
            margin-top: 0;
            color: #1769aa;
            font-size: 25px;
        }

        .subtitle {
            color: #777;
            font-size: 14px;
            margin-bottom: 22px;
        }

        label {
            display: block;
            margin-top: 16px;
            font-weight: bold;
            font-size: 14px;
        }

        input {
            width: 100%;
            padding: 11px;
            margin-top: 7px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        input:focus {
            outline: none;
            border-color: #1769aa;
        }

        .buttons {
            display: flex;
            gap: 10px;
            margin-top: 24px;
        }

        button, .cancel {
            padding: 11px 16px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            text-decoration: none;
            cursor: pointer;
        }

        button {
            background: #1769aa;
            color: white;
            flex: 1;
        }

        button:hover {
            background: #10558d;
        }

        .cancel {
            background: #e5e7eb;
            color: #333;
            text-align: center;
        }
    </style>
</head>

<body>

<div class="container">

    <h1><c:out value="${pageTitle}"/></h1>

    <p class="subtitle">
        Enter the student details below.
    </p>

    <form action="${pageContext.request.contextPath}/student/save"
          method="post">

        <input type="hidden" name="id" value="${student.id}">

        <label for="name">Student Name</label>
        <input type="text"
               id="name"
               name="name"
               value="<c:out value='${student.name}'/>"
               maxlength="100"
               required>

        <label for="email">Email Address</label>
        <input type="email"
               id="email"
               name="email"
               value="<c:out value='${student.email}'/>"
               maxlength="150"
               required>

        <label for="course">Course</label>
        <input type="text"
               id="course"
               name="course"
               value="<c:out value='${student.course}'/>"
               maxlength="100"
               required>

        <div class="buttons">

            <button type="submit">
                <c:choose>
                    <c:when test="${student.id == 0}">
                        Save Student
                    </c:when>
                    <c:otherwise>
                        Update Student
                    </c:otherwise>
                </c:choose>
            </button>

            <a class="cancel"
               href="${pageContext.request.contextPath}/students">
                Cancel
            </a>

        </div>

    </form>

</div>

</body>
</html>
