<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>eLearning - ${course.name} course detail</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="${pageContext.request.contextPath}/Frontend/img/favicon.ico" rel="icon">

    <!-- Google Fonts -->
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

<!-- Navbar -->
<div class="container-fluid p-0">
    <nav class="navbar navbar-expand-lg bg-white navbar-light py-3 py-lg-0 px-lg-5">
        <a href="${pageContext.request.contextPath}/user/profile" class="navbar-brand ml-lg-3">
            <h1 class="m-0 text-uppercase text-primary"><i class="fa fa-book-reader mr-3"></i>eLearning Hub</h1>
        </a>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-between px-lg-3" id="navbarCollapse">
            <div class="navbar-nav mx-auto py-0">
                <a href="#" class="nav-item nav-link active">Home</a>
                <a href="#courses-section" class="nav-item nav-link">Courses</a>
                <a href="#contact-section" class="nav-item nav-link">Contact</a>
            </div>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger py-2 px-4 d-none d-lg-block">Logout</a>
        </div>
    </nav>
</div>

<!-- Course Header -->
<div class="container-fluid py-5 mb-5" style="background: linear-gradient(135deg, #4e73df, #1cc88a);">
    <div class="container text-center text-white">
        <div class="d-inline-block bg-white text-dark rounded p-4 shadow-lg" style="max-width: 600px;">
            <h2 class="mb-2" style="font-weight: 700; font-size: 2rem;">${course.name}</h2>
            <p class="mb-3 text-muted" style="font-size: 1rem;">${course.courseCategory.type} / ${course.courseCategory.name}</p>

            <div class="text-center mt-3">
                <a href="${pageContext.request.contextPath}/user/enroll/${course.id}"
                   class="btn btn-success btn-lg rounded-pill px-4 mb-2">
                   Enroll Now
                </a>
                <div class="h5 text-success">Price: ₹${course.price} only</div>
            </div>
        </div>
    </div>
</div>

<!-- Course Details -->
<div class="container py-5">
    <div class="row">
        <!-- Course Description -->
        <div class="col-lg-6 mb-4">
            <div class="bg-light rounded p-4 shadow-sm">
                <h4 class="text-primary mb-4">Course Overview</h4>
                <p>${course.description}</p>
                <p>${course.courseCategory.description}</p>
            </div>
        </div>

        <!-- Course Content -->
        <div class="col-lg-6">
            <c:forEach items="${course.content}" var="content">
                <div class="bg-light rounded p-4 shadow-sm mb-3">
                    <h5 class="text-secondary">${content.name}</h5>
                    <p>${content.description}</p>
                    <c:if test="${content.type eq 'IMG'}">
                        <img src="C:/Users/bijay/Documents/Tutorial_App_Contents/${content.fileName}" alt="content image" class="img-fluid mb-2" style="max-height:200px;">
                    </c:if>
                </div>
            </c:forEach>
        </div>
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

<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary rounded-0 btn-lg-square back-to-top"><i class="fa fa-angle-double-up"></i></a>

<!-- JS Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/Frontend/lib/easing/easing.min.js"></script>
<script src="${pageContext.request.contextPath}/Frontend/lib/waypoints/waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/Frontend/lib/counterup/counterup.min.js"></script>
<script src="${pageContext.request.contextPath}/Frontend/lib/owlcarousel/owl.carousel.min.js"></script>

<script>
    // Smooth scroll for navbar links
    $(document).ready(function() {
        $('a[href^="#"]').on('click', function(e) {
            var target = this.hash;
            if (target) {
                e.preventDefault();
                $('html, body').animate({
                    scrollTop: $(target).offset().top
                }, 800);
            }
        });
    });
</script>

<!-- Template JS -->
<script src="${pageContext.request.contextPath}/Frontend/js/main.js"></script>
</body>
</html>