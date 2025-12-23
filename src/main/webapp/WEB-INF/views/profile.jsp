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
        /* Enhanced Profile Styles Only */
        .header-banner {
            background: linear-gradient(135deg, #007bff 0%, #0056b3 100%);
            color: #fff;
            padding: 100px 0 60px 0;
            text-align: center;
            border-radius: 0 0 30px 30px;
            position: relative;
            overflow: hidden;
        }

        .header-banner::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 100" preserveAspectRatio="none"><path d="M500,97C126.7,96.3,0.8,19.8,0,0v100l1000,0V1C1000,19.4,873.3,97.8,500,97z" fill="%23ffffff" opacity="0.05"/></svg>');
            background-size: 100% 100px;
            background-position: bottom;
        }

        .header-banner h1 {
            font-size: 2.8rem;
            font-weight: 700;
            margin-bottom: 15px;
            text-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .header-banner p {
            font-size: 1.2rem;
            opacity: 0.9;
            max-width: 600px;
            margin: 0 auto;
        }

        /* Profile Card Enhancement */
        .profile-card {
            background: linear-gradient(135deg, #ffffff 0%, #f8f9ff 100%);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 10px 40px rgba(0, 123, 255, 0.15);
            text-align: center;
            transition: all 0.3s ease;
            border: 1px solid rgba(0, 123, 255, 0.1);
            position: relative;
            overflow: hidden;
            margin-bottom: 30px;
        }

        .profile-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: linear-gradient(90deg, #007bff, #17a2b8);
        }

        .profile-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 50px rgba(0, 123, 255, 0.2);
        }

        .profile-img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 50%;
            border: 5px solid white;
            box-shadow: 0 8px 25px rgba(0, 123, 255, 0.2);
            margin-bottom: 20px;
            transition: all 0.3s ease;
        }

        .profile-img:hover {
            transform: scale(1.05);
        }

        .profile-card h4 {
            color: #2c3e50;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .profile-card .text-muted {
            color: #6c757d !important;
            margin-bottom: 25px;
        }

        .btn-profile {
            border-radius: 10px;
            padding: 10px 25px;
            font-weight: 600;
            transition: all 0.3s ease;
            margin: 5px;
            min-width: 150px;
        }

        .btn-profile:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        /* Enhanced Info Panel */
        .info-panel {
            background: linear-gradient(135deg, #ffffff 0%, #f8f9ff 100%);
            border-radius: 20px;
            padding: 35px;
            box-shadow: 0 10px 40px rgba(0, 123, 255, 0.15);
            border: 1px solid rgba(0, 123, 255, 0.1);
            height: 100%;
        }

        .info-panel h4 {
            color: #2c3e50;
            font-weight: 700;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 2px solid #007bff;
            position: relative;
        }

        .info-panel h4::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -2px;
            width: 50px;
            height: 2px;
            background: #17a2b8;
        }

        .info-row {
            padding: 15px 0;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }

        .info-row:hover {
            background: rgba(0, 123, 255, 0.03);
            padding-left: 10px;
            border-radius: 8px;
        }

        .info-row .font-weight-bold {
            color: #007bff;
            font-weight: 600 !important;
            font-size: 0.95rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .info-row div:last-child {
            color: #2c3e50;
            font-weight: 500;
            font-size: 1.05rem;
        }

        /* Stats Badges */
        .stats-badge {
            background: rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            padding: 8px 20px;
            font-size: 0.9rem;
            display: inline-block;
            margin: 5px;
            backdrop-filter: blur(10px);
        }

        /* Responsive Enhancements */
        @media (max-width: 991px) {
            .header-banner {
                padding: 80px 0 40px 0;
            }
            .header-banner h1 {
                font-size: 2.2rem;
            }
            .profile-img {
                width: 120px;
                height: 120px;
            }
        }

        @media (max-width: 768px) {
            .header-banner h1 {
                font-size: 1.8rem;
            }
            .header-banner p {
                font-size: 1rem;
            }
            .info-row {
                padding: 10px 0;
            }
            .btn-profile {
                min-width: 140px;
                padding: 8px 20px;
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

<!-- Header Banner -->
<div class="header-banner">
    <div class="container">
        <h1>Welcome Back, ${user.firstName}!</h1>
        <p>Your personalized learning dashboard is ready. Continue your educational journey!</p>
        <div class="mt-4">
            <c:if test="${not empty user.active}">
                <span class="stats-badge">
                    <i class="fas fa-circle mr-2" style="color: ${user.active eq '1' ? '#28a745' : '#dc3545'}"></i>
                    Status: ${user.active eq '1' ? 'Active' : 'Inactive'}
                </span>
            </c:if>
            <c:if test="${not empty user.userRole}">
                <span class="stats-badge">
                    <i class="fas fa-user-tag mr-2"></i>
                    Role: ${user.userRole.role}
                </span>
            </c:if>
        </div>
    </div>
</div>

<!-- Main Profile Section -->
<div class="container py-5">
    <div class="row">
        <!-- Left Profile Card -->
        <div class="col-lg-4 mb-4">
            <div class="profile-card">
                <c:choose>
                    <c:when test="${not empty user.profilePicture}">
                        <img src="${pageContext.request.contextPath}/UserProfilePictures/${user.profilePicture}"
                             alt="Profile Picture"
                             class="profile-img"
                             onerror="this.src='https://ui-avatars.com/api/?name=${user.firstName}+${user.lastName}&background=007bff&color=fff&size=150'">
                    </c:when>
                    <c:otherwise>
                        <img src="${pageContext.request.contextPath}/UserProfilePictures/defaultPic.jpg"
                             alt="Profile Picture"
                             class="profile-img">
                    </c:otherwise>
                </c:choose>

                <h4 class="text-primary mb-2">${user.firstName} ${user.lastName}</h4>
                <p class="text-muted mb-4"><i class="fas fa-at mr-2"></i>${user.username}</p>

                <!-- Account Status -->
                <div class="mb-4">
                    <c:choose>
                        <c:when test="${user.active eq '1'}">
                            <span class="badge badge-success p-2">
                                <i class="fas fa-check-circle mr-1"></i> Active Account
                            </span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge badge-danger p-2">
                                <i class="fas fa-times-circle mr-1"></i> Inactive Account
                            </span>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="d-flex flex-column gap-2">
                    <a href="${pageContext.request.contextPath}/user/profile/update/${user.id}"
                       class="btn btn-primary btn-profile">
                        <i class="fas fa-edit mr-2"></i>Edit Profile
                    </a>
                    <a href="${pageContext.request.contextPath}/logout"
                       class="btn btn-danger btn-profile">
                        <i class="fas fa-sign-out-alt mr-2"></i>Logout
                    </a>
                </div>
            </div>
        </div>

        <!-- Right Info Panel -->
        <div class="col-lg-8">
            <div class="info-panel">
                <h4 class="text-primary mb-4">
                    <i class="fas fa-user-circle mr-3"></i>Profile Information
                </h4>

                <div class="info-row row">
                    <div class="col-sm-4 font-weight-bold">Full Name:</div>
                    <div class="col-sm-8">${user.firstName} ${user.lastName}</div>
                </div>

                <div class="info-row row">
                    <div class="col-sm-4 font-weight-bold">Username:</div>
                    <div class="col-sm-8">${user.username}</div>
                </div>

                <c:if test="${not empty user.phoneNumber}">
                    <div class="info-row row">
                        <div class="col-sm-4 font-weight-bold">Phone Number:</div>
                        <div class="col-sm-8">
                            <i class="fas fa-phone mr-2 text-muted"></i>${user.phoneNumber}
                        </div>
                    </div>
                </c:if>

                <c:if test="${not empty user.address}">
                    <div class="info-row row">
                        <div class="col-sm-4 font-weight-bold">Address:</div>
                        <div class="col-sm-8">
                            <i class="fas fa-map-marker-alt mr-2 text-muted"></i>${user.address}
                        </div>
                    </div>
                </c:if>

                <c:if test="${not empty user.gender}">
                    <div class="info-row row">
                        <div class="col-sm-4 font-weight-bold">Gender:</div>
                        <div class="col-sm-8">
                            <i class="fas fa-${user.gender eq 'Male' ? 'mars' : 'venus'} mr-2 text-muted"></i>${user.gender}
                        </div>
                    </div>
                </c:if>

                <c:if test="${not empty user.DOB}">
                    <div class="info-row row">
                        <div class="col-sm-4 font-weight-bold">Date of Birth:</div>
                        <div class="col-sm-8">
                            <i class="fas fa-birthday-cake mr-2 text-muted"></i>${user.DOB}
                        </div>
                    </div>
                </c:if>

                <c:if test="${not empty user.active}">
                    <div class="info-row row">
                        <div class="col-sm-4 font-weight-bold">Account Status:</div>
                        <div class="col-sm-8">
                            <c:choose>
                                <c:when test="${user.active eq '1'}">
                                    <span class="badge badge-success p-2">
                                        <i class="fas fa-check-circle mr-1"></i> Active
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge badge-danger p-2">
                                        <i class="fas fa-times-circle mr-1"></i> Inactive
                                    </span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </c:if>

                <c:if test="${not empty user.userRole}">
                    <div class="info-row row">
                        <div class="col-sm-4 font-weight-bold">User Role:</div>
                        <div class="col-sm-8">
                            <i class="fas fa-user-tag mr-2 text-muted"></i>${user.userRole.role}
                        </div>
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

<script>
    $(document).ready(function() {
        // Add hover effect to profile card
        $('.profile-card').hover(
            function() {
                $(this).css('transform', 'translateY(-10px)');
            },
            function() {
                $(this).css('transform', 'translateY(0)');
            }
        );

        // Smooth scroll for anchor links
        $('a[href^="#"]').on('click', function(e) {
            if (this.hash !== "") {
                e.preventDefault();
                const hash = this.hash;
                $('html, body').animate({
                    scrollTop: $(hash).offset().top - 70
                }, 800);
            }
        });

        // Profile image fallback
        $('.profile-img').on('error', function() {
            const name = '${user.firstName}+${user.lastName}';
            $(this).attr('src', 'https://ui-avatars.com/api/?name=' + name + '&background=007bff&color=fff&size=150');
        });
    });
</script>

</body>
</html>