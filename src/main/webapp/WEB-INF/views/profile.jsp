<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>eLearning - User Profile</title>
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

  <style>
    body {
        font-family: 'Open Sans', sans-serif;
        background-color: #f8f9fa;
    }
    .header-banner {
        background-color: #007bff;
        color: #fff;
        padding: 80px 0 40px 0;
        text-align: center;
        border-radius: 0 0 20px 20px;
    }
    .header-banner h1 {
        font-size: 2rem;
        font-weight: 600;
        margin-bottom: 10px;
    }
    .header-banner p {
        font-size: 1.1rem;
    }
    .profile-card {
        background: #fff;
        border-radius: 15px;
        padding: 20px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.08);
        text-align: center;
        transition: transform 0.3s ease;
    }
    .profile-card:hover {
        transform: translateY(-5px);
    }
    .profile-img {
        width: 120px;
        height: 120px;
        object-fit: cover;
        border-radius: 50%;
        border: 4px solid #007bff;
        margin-bottom: 15px;
    }
    .info-panel {
        background: #fff;
        border-radius: 15px;
        padding: 20px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.08);
    }
    .info-panel .row {
        margin-bottom: 10px;
    }
    .info-panel .font-weight-bold {
        color: #007bff;
    }
    @media (max-width: 991px) {
        .header-banner {
            padding: 60px 0 30px 0;
        }
        .header-banner h1 {
            font-size: 1.6rem;
        }
        .header-banner p {
            font-size: 1rem;
        }
    }
  </style>
</head>

<body>

<!-- Navbar -->
<div class="container-fluid p-0">
    <nav class="navbar navbar-expand-lg bg-white navbar-light py-3 py-lg-0 px-lg-5">
        <a href="${pageContext.request.contextPath}/user/profile" class="navbar-brand ml-lg-3">
            <h1 class="m-0 text-uppercase text-primary"><i class="fa fa-book-reader mr-2"></i>eLearning Hub</h1>
        </a>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-between px-lg-3" id="navbarCollapse">
            <div class="navbar-nav mx-auto py-0">
                <a href="${pageContext.request.contextPath}/user/profile" class="nav-item nav-link active">Home</a>
                <a href="#courses-section" class="nav-item nav-link">Courses</a>
                <a href="#contact-section" class="nav-item nav-link">Contact</a>
            </div>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger py-2 px-4 d-none d-lg-block">Logout</a>
        </div>
    </nav>
</div>

<!-- Main Profile Section -->
<div class="container py-5">
    <div class="row">
        <!-- Left Profile Card -->
        <div class="col-lg-4 mb-4">
            <div class="profile-card">
                <img src="${pageContext.request.contextPath}/UserProfilePictures/${user.profilePicture}" alt="Profile Picture" class="profile-img">
                <h4 class="text-primary mb-1">${user.firstName} ${user.lastName}</h4>
                <p class="text-muted mb-2">${user.username}</p>
                <a href="${pageContext.request.contextPath}/user/profile/update/${user.id}" class="btn btn-primary btn-sm px-4 mb-2">Edit Profile</a>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger btn-sm px-4">Logout</a>
            </div>
        </div>

        <!-- Right Info Panel -->
        <div class="col-lg-8">
            <div class="info-panel">
                <h4 class="text-primary mb-4">Profile Information</h4>

                <div class="row">
                    <div class="col-sm-4 font-weight-bold">Full Name:</div>
                    <div class="col-sm-8">${user.firstName} ${user.lastName}</div>
                </div>

                <div class="row">
                    <div class="col-sm-4 font-weight-bold">Username:</div>
                    <div class="col-sm-8">${user.username}</div>
                </div>

                <c:if test="${not empty user.phoneNumber}">
                    <div class="row">
                        <div class="col-sm-4 font-weight-bold">Phone:</div>
                        <div class="col-sm-8">${user.phoneNumber}</div>
                    </div>
                </c:if>

                <c:if test="${not empty user.address}">
                    <div class="row">
                        <div class="col-sm-4 font-weight-bold">Address:</div>
                        <div class="col-sm-8">${user.address}</div>
                    </div>
                </c:if>

                <c:if test="${not empty user.gender}">
                    <div class="row">
                        <div class="col-sm-4 font-weight-bold">Gender:</div>
                        <div class="col-sm-8">${user.gender}</div>
                    </div>
                </c:if>

                <c:if test="${not empty user.DOB}">
                    <div class="row">
                        <div class="col-sm-4 font-weight-bold">Date of Birth:</div>
                        <div class="col-sm-8">${user.DOB}</div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>

    <!-- Courses Section -->
    <div id="courses-section" class="container-fluid px-0 py-5">
        <div class="row mx-0 justify-content-center pt-5">
            <div class="col-lg-6">
                <div class="section-title text-center position-relative mb-4">
                    <h6 class="d-inline-block position-relative text-secondary text-uppercase pb-2">Our Courses</h6>
                    <h1 class="display-4">New Releases Of Our Courses</h1>
                </div>
            </div>
        </div>

        <div class="owl-carousel courses-carousel">
            <c:forEach items="${courseList}" var="course">
                <div class="courses-item position-relative">
                    <img class="img-fluid" src="${pageContext.request.contextPath}/Frontend/img/courses-1.jpg" alt="">
                    <div class="courses-text">
                        <h4 class="text-center text-white px-3">${course.name}</h4>
                        <div class="border-top w-100 mt-3">
                            <div class="d-flex justify-content-between p-4">
                                <span class="text-white"><i class="fa fa-user mr-2"></i>${course.description}</span>
                            </div>
                        </div>
                        <div class="w-100 bg-white text-center p-4">
                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/course/${course.id}">Course Detail</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

<!-- Contact Section -->
<div id="contact-section">
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="row align-items-center">
                <div class="col-lg-5 mb-5 mb-lg-0">
                    <div class="bg-light d-flex flex-column justify-content-center px-5" style="height: 450px;">
                        <div class="d-flex align-items-center mb-5">
                            <div class="btn-icon bg-primary mr-4">
                                <i class="fa fa-2x fa-map-marker-alt text-white"></i>
                            </div>
                            <div class="mt-n1">
                                <h4>Our Location</h4>
                                <p class="m-0">Nepal, Kathmandu</p>
                            </div>
                        </div>
                        <div class="d-flex align-items-center mb-5">
                            <div class="btn-icon bg-secondary mr-4">
                                <i class="fa fa-2x fa-phone-alt text-white"></i>
                            </div>
                            <div class="mt-n1">
                                <h4>Call Us</h4>
                                <p class="m-0">+977 9800000000</p>
                            </div>
                        </div>
                        <div class="d-flex align-items-center">
                            <div class="btn-icon bg-warning mr-4">
                                <i class="fa fa-2x fa-envelope text-white"></i>
                            </div>
                            <div class="mt-n1">
                                <h4>Email Us</h4>
                                <p class="m-0">eLearning@gmail.com</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="section-title position-relative mb-4">
                        <h6 class="d-inline-block position-relative text-secondary text-uppercase pb-2">Need Help?</h6>
                        <h1 class="display-4">Send Us A Message</h1>
                    </div>

                    <!-- Success alert -->
                    <c:if test="${param.messageSent == 'true'}">
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            Your message has been sent successfully!
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <div class="contact-form">
                        <form action="${pageContext.request.contextPath}/contact/message" method="POST">
                            <div class="row">
                                <div class="col-6 form-group">
                                    <input type="text" class="form-control border-top-0 border-right-0 border-left-0 p-0"
                                           name="name" placeholder="Your Name" required="required">
                                </div>
                                <div class="col-6 form-group">
                                    <input type="email" class="form-control border-top-0 border-right-0 border-left-0 p-0"
                                           name="email" placeholder="Your Email" required="required">
                                </div>
                            </div>

                            <div class="form-group">
                                <select class="form-control border-top-0 border-right-0 border-left-0 p-0"
                                        name="subject" required="required"
                                        style="width: 60%; max-width: 300px;">
                                    <option value="" disabled selected>Select a Course</option>
                                    <c:forEach var="courses" items="${courseList}">
                                        <option value="${courses.name}">${courses.name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <textarea class="form-control border-top-0 border-right-0 border-left-0 p-0"
                                          name="message" rows="5" placeholder="Message" required="required"></textarea>
                            </div>

                            <div>
                                <button class="btn btn-primary py-3 px-5" type="submit">Send Message</button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<jsp:include page="footer.jsp"/>

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