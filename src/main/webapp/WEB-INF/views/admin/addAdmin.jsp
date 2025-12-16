<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,600,700,800,900" rel="stylesheet">

    <!-- Custom styles for this template-->
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
            padding: 40px 50px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }

        .form-container h2 {
            font-weight: 700;
            margin-bottom: 30px;
            text-align: center;
            color: #4e73df;
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 20px;
        }

        .form-group {
            flex: 1;
            min-width: 200px;
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            font-weight: 600;
            margin-bottom: 5px;
        }

        .form-group input {
            padding: 12px 15px;
            border-radius: 10px;
            border: 1px solid #ccc;
            width: 100%;
            box-sizing: border-box;
        }

        .form-group input:focus {
            border-color: #4e73df;
            box-shadow: 0 0 5px rgba(78,115,223,0.5);
            outline: none;
        }

        .btn-submit {
            display: block;
            width: 50%;
            margin: 30px auto 0;
            padding: 12px 0;
            border-radius: 10px;
            border: none;
            font-weight: 600;
            color: white;
            background-color: #1cc88a;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn-submit:hover {
            background-color: #17a673;
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

    <div id="wrapper">

        <!-- Sidebar -->
        <jsp:include page="sidebar.jsp" />
        <!-- End of Sidebar -->

        <div id="content-wrapper" class="d-flex flex-column pl-4">

            <!-- Main Content -->
            <div class="form-container">
                <h2>
                    <c:if test="${not empty admin}">Update Admin</c:if>
                    <c:if test="${empty admin}">Create New Admin</c:if>
                </h2>

                <c:choose>
                    <c:when test="${not empty admin}">
                        <form action="${pageContext.request.contextPath}/admin/update/${admin.id}" method="POST">
                    </c:when>
                    <c:otherwise>
                        <form action="${pageContext.request.contextPath}/admin/add" method="POST">
                    </c:otherwise>
                </c:choose>

                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

                    <div class="form-row">
                        <div class="form-group">
                            <label>Name:</label>
                            <input type="text" name="name" value="${admin.name}" required>
                        </div>
                        <div class="form-group">
                            <label>Username:</label>
                            <input type="text" name="username" value="${admin.username}" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label>Email:</label>
                            <input type="email" name="email" value="${admin.email}" required>
                        </div>
                        <div class="form-group">
                            <label>Phone Number:</label>
                            <input type="text" name="phoneNumber" value="${admin.phoneNumber}" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label>Address:</label>
                            <input type="text" name="address" value="${admin.address}" required>
                        </div>
                        <div class="form-group">
                            <label>Gender:</label>
                            <input type="text" name="gender" value="${admin.gender}" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label>Password:</label>
                            <input type="password" name="password" required>
                        </div>
                        <div class="form-group">
                            <label>Confirm Password:</label>
                            <input type="password" name="cPassword" required>
                        </div>
                    </div>

                    <input type="submit" class="btn-submit" value="<c:if test='${not empty admin}'>Update</c:if><c:if test='${empty admin}'>Submit</c:if>">

                </form>
            </div>

            <!-- Admin Table -->
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Gender</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="adm" items="${adminList}">
                            <tr>
                                <td>${adm.name}</td>
                                <td>${adm.username}</td>
                                <td>${adm.email}</td>
                                <td>${adm.phoneNumber}</td>
                                <td>${adm.address}</td>
                                <td>${adm.gender}</td>
                                <td><a href="${pageContext.request.contextPath}/admin/update/${adm.id}">Edit</a></td>
                                <td><a href="${pageContext.request.contextPath}/admin/delete/${adm.id}">Delete</a></td>
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
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Ready to Leave?</h5>
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