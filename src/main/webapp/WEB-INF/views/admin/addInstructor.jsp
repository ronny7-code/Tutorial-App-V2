<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin - Instructors</title>

    <link href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,600,700,800,900" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/sb-admin-2.min.css" rel="stylesheet">

    <style>
        body {
            background: #f4f6f9;
            font-family: 'Nunito', sans-serif;
        }

        .form-container {
            max-width: 900px;
            margin: 50px auto;
            background: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }

        .form-container h2 {
            font-weight: 700;
            margin-bottom: 30px;
            text-align: center;
            color: #4e73df;
        }

        .form-group label {
            font-weight: 600;
            color: #333;
            display: block;
            margin-bottom: 8px;
        }

        .form-control, textarea {
            border-radius: 10px;
            padding: 12px 15px;
            border: 1px solid #ccc;
            width: 100%;
            box-sizing: border-box;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        /* FIXED SELECT DROPDOWN */
        select.form-control {
            border-radius: 10px;
            padding: 12px 15px;
            border: 1px solid #ccc;
            width: 100%;
            box-sizing: border-box;
            font-size: 14px;
            transition: all 0.3s ease;
            min-height: 46px;
            height: auto;
            line-height: 1.5;
            /* Use browser default dropdown */
            appearance: auto;
            -moz-appearance: auto;
            -webkit-appearance: auto;
        }

        /* Ensure options have proper padding */
        select.form-control option {
            padding: 12px 15px !important;
            font-size: 14px;
            line-height: 1.5;
        }

        .form-control:focus, select:focus, textarea:focus {
            box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.25);
            border-color: #4e73df;
            outline: none;
        }

        .btn-success {
            background-color: #1cc88a;
            border-color: #1cc88a;
            padding: 12px 30px;
            border-radius: 10px;
            font-weight: 600;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .btn-success:hover {
            background-color: #17a673;
            border-color: #17a673;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 50px;
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0,0,0,0.05);
        }

        table th, table td {
            border: 1px solid #ddd;
            padding: 12px 15px;
            text-align: left;
        }

        table th {
            background-color: #4e73df;
            color: white;
            font-weight: 600;
        }

        table tr:nth-child(even) {
            background-color: #f8f9fc;
        }

        table tr:hover {
            background-color: #e9ecef;
        }

        .form-row {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .form-row .form-group {
            flex: 1;
            min-width: 250px;
        }

        .btn-primary, .btn-danger {
            border-radius: 6px;
            padding: 6px 12px;
            font-size: 14px;
            text-decoration: none;
            display: inline-block;
        }

        .btn-primary {
            background-color: #4e73df;
            border-color: #4e73df;
            color: #fff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #2e59d9;
        }

        .btn-danger {
            background-color: #e74a3b;
            border-color: #e74a3b;
            color: #fff;
            border: none;
        }

        .btn-danger:hover {
            background-color: #c0392b;
        }

        @media (max-width: 768px) {
            .form-container {
                padding: 25px;
                margin: 25px auto;
            }

            .form-row {
                gap: 15px;
            }

            .form-row .form-group {
                min-width: 100%;
            }

            table {
                display: block;
                overflow-x: auto;
            }
        }
    </style>
</head>

<body id="page-top">
<div id="wrapper">
    <jsp:include page="sidebar.jsp" />

    <div id="content-wrapper" class="d-flex flex-column pl-4">
        <div id="content" class="p-4">

            <!-- Instructor Form -->
            <div class="form-container">
                <h2>
                    <c:if test="${not empty instructor}">Update Instructor</c:if>
                    <c:if test="${empty instructor}">Add New Instructor</c:if>
                </h2>

                <c:choose>
                    <c:when test="${not empty instructor}">
                        <form action="${pageContext.request.contextPath}/admin/instructor/update/${instructor.id}" method="POST">
                    </c:when>
                    <c:otherwise>
                        <form action="${pageContext.request.contextPath}/admin/instructor/add" method="POST">
                    </c:otherwise>
                </c:choose>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

                    <div class="form-row">
                        <div class="form-group">
                            <label>Name:</label>
                            <input type="text" name="name" class="form-control" required value="${instructor.name}">
                        </div>

                        <div class="form-group">
                            <label>Course:</label>
                            <select name="subject" class="form-control" required style="padding: 12px 15px; min-height: 46px;">
                                <option value="">Select Course</option>
                                <c:forEach var="course" items="${courseList}">
                                    <option value="${course.name}"
                                        <c:if test="${instructor != null && instructor.subject == course.name}">selected</c:if>>
                                        ${course.name}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label>Email:</label>
                            <input type="email" name="email" class="form-control" required value="${instructor.email}">
                        </div>

                        <div class="form-group">
                            <label>Phone Number:</label>
                            <input type="text" name="phoneNumber" class="form-control" pattern="[0-9]{10}" title="10 digit number" value="${instructor.phoneNumber}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Address:</label>
                        <input type="text" name="address" class="form-control" required value="${instructor.address}">
                    </div>

                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-success">
                            <c:if test="${not empty instructor}">Update Instructor</c:if>
                            <c:if test="${empty instructor}">Add Instructor</c:if>
                        </button>
                    </div>
                </form>
            </div>

            <!-- Instructor Table -->
            <div class="table-responsive mt-5">
                <h3 class="mb-4" style="color: #4e73df; font-weight: 600;">Instructor List</h3>
                <table>
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Course</th>
                        <th>Email</th>
                        <th>Phone Number</th>
                        <th>Address</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="ins" items="${instructorList}">
                        <tr>
                            <td>${ins.name}</td>
                            <td>${ins.subject}</td>
                            <td>${ins.email}</td>
                            <td>${ins.phoneNumber}</td>
                            <td>${ins.address}</td>
                            <td>
                                <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/admin/instructor/update/${ins.id}">
                                    <i class="fas fa-edit"></i>
                                </a>
                            </td>
                            <td>
                                <a class="btn btn-danger btn-sm"
                                   href="${pageContext.request.contextPath}/admin/instructor/delete/${ins.id}"
                                   onclick="return confirm('Are you sure you want to delete this instructor?')">
                                    <i class="fas fa-trash"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>

        <!-- Footer -->
        <footer class="sticky-footer bg-white mt-5">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; JCode Pvt Ltd. 2025</span>
                </div>
            </div>
        </footer>
    </div>
</div>

<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/sb-admin-2.min.js"></script>

<script>
    $(document).ready(function() {
        // Force proper styling on select elements
        $('select.form-control').css({
            'padding': '12px 15px',
            'min-height': '46px',
            'height': 'auto'
        });

        // Add confirmation for delete buttons
        $('.btn-danger').on('click', function(e) {
            if (!confirm('Are you sure you want to delete this instructor?')) {
                e.preventDefault();
                return false;
            }
        });
    });
</script>

</body>
</html>