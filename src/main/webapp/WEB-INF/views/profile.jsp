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
        background-color: #f3f4f7;
        font-family: 'Inter', -apple-system, sans-serif;
    }

    /* Minimalist Profile Card */
    .profile-card-v2 {
        background: #ffffff;
        border: 1px solid rgba(0,0,0,0.05);
        border-radius: 12px;
        text-align: center;
        box-shadow: 0 10px 25px rgba(0,0,0,0.02);
    }

    .profile-avatar {
        width: 100px;
        height: 100px;
        object-fit: cover;
        border-radius: 50%;
        padding: 4px;
        background: #fff;
        border: 2px solid #0d6efd;
    }

    /* Elegant Info Panel */
    .info-panel-v2 {
        background: #ffffff;
        border: 1px solid rgba(0,0,0,0.05);
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.02);
    }

    .icon-box {
        width: 40px;
        height: 40px;
        background: rgba(13, 110, 253, 0.1);
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 8px;
    }

    /* Typography & Spacing */
    .info-item {
        margin-bottom: 1.25rem;
        border-bottom: 1px solid #f8f9fa;
        padding-bottom: 0.5rem;
    }

    .info-item label {
        display: block;
        font-size: 0.75rem;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        color: #6c757d;
        font-weight: 600;
        margin-bottom: 2px;
    }

    .info-item p {
        margin: 0;
        color: #212529;
        font-weight: 500;
    }

    .btn-sm {
        padding: 0.5rem 1rem;
        font-weight: 500;
        font-size: 0.85rem;
    }

    /* Clean hover effect */
    .profile-card-v2, .info-panel-v2 {
        transition: all 0.3s ease;
    }

    .profile-card-v2:hover {
        border-color: #0d6efd44;
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
    <div class="row justify-content-center g-4">
        <!-- Left Profile Card -->
        <div class="col-lg-3">
            <div class="profile-card-v2 p-4">
                <div class="position-relative d-inline-block mb-3">
                    <img src="${pageContext.request.contextPath}/UserProfilePictures/${user.profilePicture}"
                         alt="Profile" class="profile-avatar shadow-sm">
                </div>
                <h5 class="fw-bold text-dark mb-1">${user.firstName} ${user.lastName}</h5>
                <p class="text-muted small mb-4">@${user.username}</p>

                <div class="d-grid gap-2">
                    <a href="${pageContext.request.contextPath}/user/profile/update/${user.id}"
                       class="btn btn-primary btn-sm rounded-pill">Edit Profile</a>
                    <a href="${pageContext.request.contextPath}/logout"
                       class="btn btn-outline-danger btn-sm rounded-pill">Logout</a>
                </div>
            </div>
        </div>

        <!-- Right Info Panel -->
        <div class="col-lg-6">
            <div class="info-panel-v2 p-4 h-100">
                <div class="d-flex align-items-center mb-4">
                    <div class="icon-box me-3">
                        <i class="bi bi-person-badge text-primary"></i>
                    </div>
                    <h5 class="mb-0 fw-bold text-dark">Account Details</h5>
                </div>

                <div class="info-grid">
                    <div class="info-item">
                        <label>Full Name</label>
                        <p>${user.firstName} ${user.lastName}</p>
                    </div>

                    <c:if test="${not empty user.phoneNumber}">
                        <div class="info-item">
                            <label>Phone Number</label>
                            <p>${user.phoneNumber}</p>
                        </div>
                    </c:if>

                    <c:if test="${not empty user.address}">
                        <div class="info-item">
                            <label>Address</label>
                            <p>${user.address}</p>
                        </div>
                    </c:if>

                    <div class="row">
                        <c:if test="${not empty user.gender}">
                            <div class="col-sm-6 info-item">
                                <label>Gender</label>
                                <p>${user.gender}</p>
                            </div>
                        </c:if>
                        <c:if test="${not empty user.DOB}">
                            <div class="col-sm-6 info-item">
                                <label>Date of Birth</label>
                                <p>${user.DOB}</p>
                            </div>
                        </c:if>
                    </div>
                </div>
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