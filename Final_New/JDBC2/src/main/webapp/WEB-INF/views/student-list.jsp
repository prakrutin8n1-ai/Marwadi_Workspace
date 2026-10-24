
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student List</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f1f5f9;
            margin: 0;
            padding: 35px;
        }

        .container {
            max-width: 1100px;
            margin: auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 12px #cccccc;
        }

        h2 {
            text-align: center;
            color: #1e3a8a;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 10px;
            margin: 20px 0;
        }

        .btn {
            display: inline-block;
            padding: 9px 13px;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .add {
            background: #2563eb;
        }

        .edit {
            background: #d97706;
        }

        .delete {
            background: #dc2626;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #d1d5db;
            padding: 12px;
            text-align: left;
        }

        th {
            background: #2563eb;
            color: white;
        }

        tr:nth-child(even) {
            background: #f8fafc;
        }

        .empty {
            text-align: center;
            padding: 20px;
        }

        .error {
            color: red;
            overflow-wrap: anywhere;
        }

        .action-cell {
            white-space: nowrap;
        }

        .action-cell form {
            display: inline;
        }

        @media (max-width: 700px) {
            body {
                padding: 10px;
            }

            .container {
                padding: 12px;
                overflow-x: auto;
            }

            table {
                min-width: 700px;
            }

            .top-bar {
                flex-direction: column;
                align-items: flex-start;
            }
        }
    </style>
</head>

<body>

<div class="container">

    <h2>Student Management System</h2>

    <p class="error"><c:out value="${error}"/></p>

    <div class="top-bar">
        <h3>Registered Students</h3>

        <a class="btn add"
           href="${pageContext.request.contextPath}/register">
            + Add New Student
        </a>
    </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Student Name</th>
                <th>Email</th>
                <th>Course</th>
                <th>Actions</th>
            </tr>
        </thead>

        <tbody>
            <c:choose>
                <c:when test="${not empty students}">

                    <c:forEach var="s" items="${students}">
                        <tr>
                            <td><c:out value="${s.id}"/></td>
                            <td><c:out value="${s.name}"/></td>
                            <td><c:out value="${s.email}"/></td>
                            <td><c:out value="${s.course}"/></td>

                            <td class="action-cell">

                                <a class="btn edit"
                                   href="${pageContext.request.contextPath}/edit/${s.id}">
                                    Edit
                                </a>

                                <form
                                    action="${pageContext.request.contextPath}/delete/${s.id}"
                                    method="post"
                                    onsubmit="return confirm('Are you sure you want to delete this student?');">

                                    <button type="submit" class="btn delete">
                                        Delete
                                    </button>

                                </form>

                            </td>
                        </tr>
                    </c:forEach>

                </c:when>

                <c:otherwise>
                    <tr>
                        <td colspan="5" class="empty">
                            No students found. Please add a student.
                        </td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>

</div>

</body>
</html>
