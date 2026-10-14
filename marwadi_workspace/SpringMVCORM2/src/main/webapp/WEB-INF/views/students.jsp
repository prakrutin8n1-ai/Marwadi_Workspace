<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Management System</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 30px 20px;
            background: #f4f6f9;
            color: #333;
        }

        .container {
            max-width: 1100px;
            margin: auto;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 25px;
        }

        h1 {
            margin: 0 0 8px;
            font-size: 27px;
            color: #1769aa;
        }

        .subtitle {
            margin: 0;
            color: #777;
            font-size: 14px;
        }

        .add-btn {
            background: #1769aa;
            color: white;
            padding: 11px 16px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 14px;
        }

        .add-btn:hover {
            background: #10558d;
        }

        .table-card {
            background: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 3px 12px rgba(0, 0, 0, 0.06);
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 650px;
        }

        th, td {
            padding: 13px 12px;
            border-bottom: 1px solid #e5e7eb;
            text-align: left;
            font-size: 14px;
        }

        th {
            background: #f0f3f6;
            color: #333;
        }

        tr:hover td {
            background: #fafcff;
        }

        .action-link {
            display: inline-block;
            text-decoration: none;
            padding: 7px 10px;
            border-radius: 4px;
            font-size: 13px;
            margin: 2px;
        }

        .edit {
            background: #e0efff;
            color: #145ca8;
        }

        .delete {
            background: #fde8e7;
            color: #b42318;
        }

        .empty {
            text-align: center;
            padding: 30px;
            color: #777;
        }

        .count {
            color: #666;
            font-size: 13px;
            margin-bottom: 15px;
        }

        @media (max-width: 600px) {
            body {
                padding: 20px 12px;
            }

            .header {
                align-items: flex-start;
                flex-direction: column;
            }

            h1 {
                font-size: 23px;
            }
        }
    </style>
</head>

<body>

<div class="container">

    <div class="header">
        <div>
            <h1>Student Management System</h1>
            <p class="subtitle">
                Spring MVC + Hibernate ORM + MySQL
            </p>
        </div>

        <a class="add-btn"
           href="${pageContext.request.contextPath}/student/add">
            + Add New Student
        </a>
    </div>

    <div class="table-card">

        <p class="count">Student Records</p>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Course</th>
                    <th>Actions</th>
                </tr>
            </thead>

            <tbody>

                <c:choose>
                    <c:when test="${empty students}">
                        <tr>
                            <td colspan="5" class="empty">
                                No students found. Add your first student.
                            </td>
                        </tr>
                    </c:when>

                    <c:otherwise>
                        <c:forEach var="student" items="${students}">
                            <tr>
                                <td>
                                    <c:out value="${student.id}"/>
                                </td>

                                <td>
                                    <c:out value="${student.name}"/>
                                </td>

                                <td>
                                    <c:out value="${student.email}"/>
                                </td>

                                <td>
                                    <c:out value="${student.course}"/>
                                </td>

                                <td>
                                    <a class="action-link edit"
                                       href="${pageContext.request.contextPath}/student/edit/${student.id}">
                                        Edit
                                    </a>

                                    <a class="action-link delete"
                                       href="${pageContext.request.contextPath}/student/delete/${student.id}"
                                       onclick="return confirm('Are you sure you want to delete this student?');">
                                        Delete
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>

            </tbody>
        </table>

    </div>

</div>

</body>
</html>