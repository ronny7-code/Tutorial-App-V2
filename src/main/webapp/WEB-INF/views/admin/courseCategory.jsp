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

    <title>Admin - Course Category</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,600,700,800,900"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/assets/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom form styling -->
    <style>
        body {
            background: #f4f6f9;
            font-family: 'Nunito', sans-serif;
        }

        .form-container {
            max-width: 700px;
            margin: 50px auto;
            background: #fff;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }

        .form-container h2 {
            font-weight: 700;
            margin-bottom: 30px;
            text-align: center;
            color: #4e73df;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: 600;
            color: #333;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 12px 15px;
            border-radius: 10px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        .form-group input:focus,
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

        hr {
            border-top: 1px solid #ccc;
        }

        /* Table styling */
        .table-container {
            max-width: 1000px;
            margin: 50px auto;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        table th, table td {
            padding: 12px 15px;
            text-align: left;
        }

        table th {
            background-color: #4e73df;
            color: white;
        }

        table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        table a {
            color: #1cc88a;
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
                    <c:if test="${not empty category}">Update Course Category</c:if>
                    <c:if test="${empty category}">Create Course Category</c:if>
                </h2>

                <c:if test="${not empty category}">
                    <form action="${pageContext.request.contextPath}/admin/category/update/${category.id}" method="POST">
                </c:if>
                <c:if test="${empty category}">
                    <form action="${pageContext.request.contextPath}/admin/category/add" method="POST">
                </c:if>

                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

                    <div class="form-group">
                        <label>Category Name:</label>
                        <input type="text" name="name" value="${category.name}" required>
                    </div>

                    <div class="form-group">
                        <label>Type:</label>
                        <input type="text" name="type" value="${category.type}" required>
                    </div>

                    <div class="form-group">
                        <label>Description:</label>
                        <textarea name="description" rows="4" required>${category.description}</textarea>
                    </div>

                    <div class="text-center">
                        <input type="submit" value="<c:if test='${not empty category}'>Update</c:if><c:if test='${empty category}'>Submit</c:if>">
                    </div>
                </form>
            </div>

            <!-- Category Table -->
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Category Name</th>
                            <th>Type</th>
                            <th>Description</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="category" items="${category_list}">
                            <tr>
                                <td>${category.name}</td>
                                <td>${category.type}</td>
                                <td>${category.description}</td>
                                <td><a href="${pageContext.request.contextPath}/admin/category/update/${category.id}">Edit</a></td>
                                <td><a href="${pageContext.request.contextPath}/admin/category/delete/${category.id}">Delete</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
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