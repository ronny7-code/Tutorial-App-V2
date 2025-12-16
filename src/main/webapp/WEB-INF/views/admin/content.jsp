<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin - Content</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/assets/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom form styling -->
    <style>
        body {
            background: #f4f6f9;
        }
        .form-container {
            max-width: 800px;
            margin: 40px auto;
            background: #fff;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }
        .form-container h2 {
            text-align: center;
            color: #4e73df;
            font-weight: 700;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            font-weight: 600;
            color: #333;
        }
        .form-group input[type="text"],
        .form-group input[type="file"],
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 10px 15px;
            border-radius: 10px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            border-color: #4e73df;
            box-shadow: 0 0 5px rgba(78, 115, 223, 0.5);
            outline: none;
        }
        input[type="submit"] {
            background-color: #1cc88a;
            color: white;
            border: none;
            padding: 12px 40px;
            border-radius: 10px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #17a673;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 40px;
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        table th, table td {
            padding: 12px 15px;
            text-align: left;
        }
        table thead {
            background-color: #4e73df;
            color: #fff;
        }
        table tbody tr:nth-child(even) {
            background-color: #f8f9fc;
        }
        table tbody tr:hover {
            background-color: #e2e6f0;
        }
        table a {
            color: #4e73df;
            text-decoration: none;
            font-weight: 600;
        }
        table a:hover {
            text-decoration: underline;
        }
    </style>

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <jsp:include page="sidebar.jsp" />
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column pl-4">

            <!-- Main Content -->
            <div class="form-container">
                <h2>
                    <c:if test="${not empty course}">Update Content </c:if>
                    <c:if test="${empty course}">Create Content </c:if>
                </h2>

                <c:if test="${not empty course}">
                    <form action="${pageContext.request.contextPath}/admin/content/update/${course.id}?${_csrf.parameterName}=${_csrf.token}" method="POST" encType="multipart/form-data">
                </c:if>
                <c:if test="${empty course}">
                    <form action="${pageContext.request.contextPath}/admin/content/add?${_csrf.parameterName}=${_csrf.token}" method="POST" encType="multipart/form-data">
                </c:if>

                    <div class="form-group">
                        <label>Content Name:</label>
                        <input type="text" name="name" value="${content.name}" required>
                    </div>

                    <div class="form-group">
                        <label>Content Type:</label>
                        <select name="type" required>
                            <option>Select Content Type</option>
                            <option value="WORD_DOC"> Microsoft Word Document </option>
                            <option value="PDF"> PDF File </option>
                            <option value="IMG"> Image File </option>
                            <option value="VIDEO"> Video Recording </option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Description:</label>
                        <textarea name="description" rows="4" required>${content.description}</textarea>
                    </div>

                    <div class="form-group">
                        <label>Course List:</label>
                        <select name="course" required>
                            <option>Courses</option>
                            <c:forEach items="${courseList}" var="courses">
                                <option value="${courses.id}">${courses.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Select a file:</label>
                        <input type="file" name="file" placeholder="Select a file to upload.." required>
                    </div>

                    <div class="text-center">
                        <input type="submit" value="<c:if test='${not empty content}'>Update</c:if><c:if test='${empty content}'>Submit</c:if>">
                    </div>
                </form>

                <!-- Content Table -->
                <table>
                    <thead>
                        <tr>
                            <th>Content Name</th>
                            <th>Courses</th>
                            <th>Description</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="contents" items="${contentList}">
                            <tr>
                                <td>${contents.name}</td>
                                <td>${contents.course.name}</td>
                                <td>${contents.description}</td>
                                <td><a href="${pageContext.request.contextPath}/admin/content/update/${contents.id}">Edit</a></td>
                                <td><a href="${pageContext.request.contextPath}/admin/content/delete/${contents.id}">Delete</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Footer -->
            <footer class="sticky-footer bg-white mt-4">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; JCode Pvt Ltd. 2025</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/assets/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/assets/js/sb-admin-2.min.js"></script>

</body>

</html>