<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>eLearning - Online Education Website</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="${pageContext.request.contextPath}/Frontend/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${pageContext.request.contextPath}/Frontend/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/Frontend/css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Topbar Start -->
    <jsp:include page="topbar.jsp" />
    <!-- Topbar End -->


<div class="container-fluid p-0">
        <nav class="navbar navbar-expand-lg bg-white navbar-light py-3 py-lg-0 px-lg-5">
            <a href="${pageContext.request.contextPath}/home" class="navbar-brand ml-lg-3">
                <h1 class="m-0 text-uppercase text-primary"><i class="fa fa-book-reader mr-3"></i>eLearning Hub</h1>
            </a>
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between px-lg-3" id="navbarCollapse">
                <div class="navbar-nav mx-auto py-0">
                    <a href="${pageContext.request.contextPath}/home" class="nav-item nav-link active">Home</a>

                </div>
                <a href="${pageContext.request.contextPath}/signup" class="btn btn-primary py-2 px-4 d-none d-lg-block">Sign Up</a>
            </div>
        </nav>
    </div>


    <!-- Login Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="row align-items-center">

                <div class="col-lg-8">
                    <div class="section-title position-relative mb-4">
                    <c:if test="${not empty errorMsg}">
                    <h6 class="d-inline-block position-relative text-secondary text-uppercase pb-2">
                    ${errorMsg}
                    </h6> <br> <br>
                    </c:if>
                        <h6 class="d-inline-block position-relative text-secondary text-uppercase pb-2">Not Registered Yet? <a href="${pageContext.request.contextPath}/signup">Sign Up </a></h6>
                        <h1 class="display-4">User Login Here</h1>
                    </div>
                    <div class="contact-form">
                        <form action="${pageContext.request.contextPath}/login" method="POST">
                         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                            <div class="row">
                                <div class="col-6 form-group">
                                    <input type="text" name="username" class="form-control border-top-0 border-right-0 border-left-0 p-0" placeholder="Your Username" required="required">
                                </div>
                            </div>
                            <div class="row">
                             <div class="col-6 form-group">
                                <input type="password" name="password" class="form-control border-top-0 border-right-0 border-left-0 p-0" placeholder="Your Password" required="required">
                             </div>
                            </div>
                            <div>
                                <button class="btn btn-primary py-3 px-5" type="submit">Login</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Login End -->


    <!-- Footer Start -->
  <jsp:include page="footer.jsp"/>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary rounded-0 btn-lg-square back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/Frontend/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/Frontend/lib/waypoints/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/Frontend/lib/counterup/counterup.min.js"></script>
    <script src="${pageContext.request.contextPath}/Frontend/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/Frontend/js/main.js"></script>
</body>

</html>