<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f1f5f9;
            margin: 0;
            padding: 35px;
        }
        .container {
            max-width: 950px;
            margin: auto;
            background: white;
            padding: 25px;
            border-radius: 12px;
        }
        h1 { color: #1e3a8a; }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        th { background: #1e40af; color: white; }
        a.button {
            display: inline-block;
            padding: 9px 13px;
            background: #2563eb;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .delete { background: #dc2626 !important; }
    </style>
</head>
<body>
<div class="container">

    <h1>Student Management System</h1>
    <p>Manage your students in one place.</p>

    <a class="button" href="${pageContext.request.contextPath}/student/add">
        + Add Student
    </a>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Course</th>
            <th>Actions</th>
        </tr>

        <c:forEach var="s" items="${students}">
            <tr>
                <td><c:out value="${s.id}"/></td>
                <td><c:out value="${s.name}"/></td>
                <td><c:out value="${s.email}"/></td>
                <td><c:out value="${s.course}"/></td>
                <td>
                    <a class="button"
                       href="${pageContext.request.contextPath}/student/edit/${s.id}">
                        Edit
                    </a>

                    <a class="button delete"
                       href="${pageContext.request.contextPath}/student/delete/${s.id}"
                       onclick="return confirm('Delete this student?')">
                        Delete
                    </a>
                </td>
            </tr>
        </c:forEach>

        <c:if test="${empty students}">
            <tr>
                <td colspan="5">No students found.</td>
            </tr>
        </c:if>
    </table>

</div>
</body>
</html>