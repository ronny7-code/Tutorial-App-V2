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


    <!-- Navbar Start -->
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
                    <a href="${pageContext.request.contextPath}/login" class="btn btn-primary py-2 px-4 d-none d-lg-block">Login</a>
                </div>
            </nav>
        </div>
    <!-- Navbar End -->


    <!-- User Signup Start -->
    <div class="container-fluid px-0 py-5">
        <div class="row mx-0 justify-content-center pt-5">
            <div class="col-lg-6">
                <div class="section-title text-center position-relative mb-4">
                    <h1 class="display-4">Sign Up New User</h1>
                </div>
            </div>
        </div>

        <div class="row justify-content-center bg-image mx-0 mb-5">
            <div class="col-lg-6 py-5">
                <div class="bg-white p-5 my-5">
                    <h1 class="text-center mb-4">New User Detail</h1>
                    <form action="${pageContext.request.contextPath}/signup" method="POST">
                     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                      <div class="form-row">
                          <div class="col-sm-6">
                               <div class="form-group">
                                 <input type="text" name="firstName" class="form-control bg-light border-0" placeholder="Your First Name" style="padding: 30px 20px;">
                               </div>
                          </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                  <input type="text" name="lastName" class="form-control bg-light border-0" placeholder="Your Last Name" style="padding: 30px 20px;">
                                 </div>
                            </div>
                          </div>
                      <div class="form-row">
                          <div class="col-sm-6">
                               <div class="form-group">
                                  <input type="text" name="phoneNumber" class="form-control bg-light border-0" placeholder="Your Phone Number" style="padding: 30px 20px;">
                                </div>
                          </div>
                           <div class="col-sm-6">
                                 <div class="form-group">
                                    <input type="email" name="email" class="form-control bg-light border-0" placeholder="Your Email" style="padding: 30px 20px;">
                                 </div>
                           </div>
                       </div>
                       <div class="form-row">
                          <div class="col-sm-6">
                               <div class="form-group">
                                  <input type="text" name="address" class="form-control bg-light border-0" placeholder="Your Address" style="padding: 30px 20px;">
                                </div>
                          </div>
                           <div class="col-sm-6">
                                 <div class="form-group">
                                    <input type="text" name="gender" class="form-control bg-light border-0" placeholder="Your Gender" style="padding: 30px 20px;">
                                 </div>
                           </div>
                       </div>
                       <div class="form-row">
                          <div class="col-sm-6">
                               <div class="form-group">
                                  <input type="date" name="DOB" class="form-control bg-light border-0" placeholder="Your DOB" style="padding: 30px 20px;">
                                </div>
                          </div>
                           <div class="col-sm-6">
                                 <div class="form-group">
                                    <input type="text" name="username" class="form-control bg-light border-0" placeholder="Your Username" style="padding: 30px 20px;">
                                 </div>
                           </div>
                       </div>
                       <div class="form-row">
                          <div class="col-sm-6">
                               <div class="form-group">
                                  <input type="password" name="password" class="form-control bg-light border-0" placeholder="Your Password" style="padding: 30px 20px;">
                                </div>
                          </div>
                           <div class="col-sm-6">
                                 <div class="form-group">
                                    <input type="password" name="cPassword" class="form-control bg-light border-0" placeholder="Confirm Your Password" style="padding: 30px 20px;">
                                 </div>
                           </div>
                       </div>
                        <div class="form-row">
                            <div class="col-sm-6">
                                 <div class="form-group">
                                     <select class="custom-select bg-light border-0 px-3" style="height: 60px;">
                                         <option selected>Select a courses</option>
                                         <c:forEach var="courses" items="${courseList}">
                                         <option > ${courses.name} </option>
                                         </c:forEach>
                                     </select>
                                 </div>
                            </div>
                                 <div class="col-sm-6">
                                     <button class="btn btn-primary btn-block" type="submit" style="height: 60px;">Sign Up Now</button>
                                 </div>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>


    </div>
    <!-- User Signup End -->

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