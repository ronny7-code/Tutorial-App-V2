<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin - Course Management</title>

    <link href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,600,700,800,900" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/sb-admin-2.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fc;
            font-family: 'Nunito', sans-serif;
        }

        .container-form {
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            margin-top: 40px;
        }

        .container-form h2 {
            color: #4e73df;
            font-weight: 700;
            text-align: center;
            margin-bottom: 30px;
        }

        .form-group label {
            font-weight: 600;
            color: #333;
            margin-bottom: 5px;
            display: block;
        }

        input.form-control,
        textarea.form-control,
        select.form-control {
            width: 100%;
            font-size: 14px;
            border-radius: 6px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        input.form-control,
        textarea.form-control {
            padding: 10px 12px;
        }

        /* FIXED SELECT DROPDOWN STYLING */
        select.form-control {
            padding: 12px 15px;
            height: auto;
            min-height: 46px;
            line-height: 1.5;
        }

        /* IMPORTANT: Ensure options have proper padding */
        select.form-control option {
            padding: 12px 15px !important;
            font-size: 14px;
            line-height: 1.5;
        }

        /* Use browser default dropdown appearance */
        select.form-control {
            appearance: menulist;
            -moz-appearance: menulist;
            -webkit-appearance: menulist;
        }

        input.form-control:focus,
        textarea.form-control:focus,
        select.form-control:focus {
            border-color: #4e73df;
            box-shadow: 0 0 5px rgba(78,115,223,0.5);
            outline: none;
        }

        .btn-submit {
            background-color: #1cc88a;
            border-color: #1cc88a;
            font-weight: 600;
            border-radius: 6px;
            padding: 10px 25px;
            transition: 0.3s;
        }

        .btn-submit:hover {
            background-color: #17a673;
            border-color: #17a673;
        }

        table {
            width: 100%;
            margin-top: 40px;
            border-collapse: collapse;
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0,0,0,0.05);
        }

        table th {
            background-color: #4e73df;
            color: #fff;
            padding: 12px 15px;
        }

        table td {
            padding: 12px 15px;
            text-align: center;
        }

        table tr:nth-child(even) {
            background-color: #f4f6f9;
        }

        table tr:hover {
            background-color: #e9ecef;
        }

        .action-btn {
            border-radius: 6px;
            padding: 6px 12px;
            font-size: 14px;
            text-decoration: none;
            display: inline-block;
        }

        .action-btn.edit {
            background-color: #36b9cc;
            color: #fff;
            border: none;
        }

        .action-btn.edit:hover {
            background-color: #2c9faf;
        }

        .action-btn.delete {
            background-color: #e74a3b;
            color: #fff;
            border: none;
        }

        .action-btn.delete:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body id="page-top">

<div id="wrapper">
    <jsp:include page="sidebar.jsp" />

    <div id="content-wrapper" class="d-flex flex-column pl-4">
        <div id="content" class="p-4">

            <div class="container container-form">
                <h2>
                    <c:if test="${not empty course}">Update Course</c:if>
                    <c:if test="${empty course}">Create Course</c:if>
                </h2>

                <c:choose>
                    <c:when test="${not empty course}">
                        <form action="${pageContext.request.contextPath}/admin/course/update/${course.id}" method="POST">
                    </c:when>
                    <c:otherwise>
                        <form action="${pageContext.request.contextPath}/admin/course/add" method="POST">
                    </c:otherwise>
                </c:choose>

                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

                    <div class="form-group">
                        <label>Course Name:</label>
                        <input type="text" name="name" class="form-control" value="${course.name}" required>
                    </div>

                    <div class="form-group">
                        <label>Category:</label>
                        <select name="category" class="form-control" required style="padding: 12px 15px; min-height: 46px;">
                            <option value="">Select Course Category</option>
                            <c:forEach items="${categoryList}" var="cat">
                                <option value="${cat.id}" <c:if test="${course != null && course.courseCategory.id == cat.id}">selected</c:if>>
                                    ${cat.name}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Price:</label>
                        <input type="text" name="price" class="form-control" value="${course.price}" required>
                    </div>

                    <div class="form-group">
                        <label>Description:</label>
                        <textarea name="description" class="form-control" rows="4" required>${course.description}</textarea>
                    </div>

                    <div class="text-center mt-3">
                        <button type="submit" class="btn btn-submit">
                            <c:if test="${not empty course}">Update</c:if>
                            <c:if test="${empty course}">Submit</c:if>
                        </button>
                    </div>
                </form>
            </div>

            <div class="mt-5">
                <table class="table table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>Course Name</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Description</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="course" items="${courseList}">
                            <tr>
                                <td>${course.name}</td>
                                <td>${course.courseCategory.name}</td>
                                <td>${course.price}</td>
                                <td>${course.description}</td>
                                <td>
                                    <a class="btn action-btn edit" href="${pageContext.request.contextPath}/admin/course/update/${course.id}">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                </td>
                                <td>
                                    <a class="btn action-btn delete" href="${pageContext.request.contextPath}/admin/course/delete/${course.id}">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>

        <footer class="sticky-footer bg-white mt-5">
            <div class="container my-auto">
                <div class="text-center my-auto">
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
        // Add confirmation for delete buttons
        $('.action-btn.delete').on('click', function(e) {
            if (!confirm('Are you sure you want to delete this course?')) {
                e.preventDefault();
                return false;
            }
        });

        // Force proper styling on select elements
        $('select.form-control').css({
            'padding': '12px 15px',
            'min-height': '46px',
            'height': 'auto'
        });
    });
</script>

</body>
</html>