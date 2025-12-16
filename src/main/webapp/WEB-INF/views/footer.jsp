<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<div class="container-fluid position-relative overlay-top bg-dark text-white-50 py-5" style="margin-top: 90px;">
    <div class="container mt-5 pt-5">
        <div class="row">
            <!-- Left Column: Branding + About Us -->
            <div class="col-md-6 mb-5">
                <a href="${pageContext.request.contextPath}/home" class="navbar-brand">
                    <h1 class="mt-n2 text-uppercase text-white"><i class="fa fa-book-reader mr-3"></i>eLearning Hub</h1>
                </a>
                <p class="m-0">Learn anytime, anywhere. Explore our wide range of online courses designed to upgrade your skills. Join thousands of students worldwide who trust us for their online learning journey.</p>
                <div class="d-flex mt-3">
                    <a class="text-white mr-3" href="#"><i class="fab fa-2x fa-twitter"></i></a>
                    <a class="text-white mr-3" href="https://www.facebook.com"><i class="fab fa-2x fa-facebook-f"></i></a>
                    <a class="text-white mr-3" href="#"><i class="fab fa-2x fa-linkedin-in"></i></a>
                    <a class="text-white" href="https://www.instagram.com"><i class="fab fa-2x fa-instagram"></i></a>
                </div>
            </div>

            <!-- Right Column: Contact Info + Courses -->
            <div class="col-md-6 mb-5">
                <div class="row">
                    <!-- Contact Info -->
                    <div class="col-md-6 mb-4">
                        <h5 class="text-white mb-3">Get In Touch</h5>
                        <p><i class="fa fa-map-marker-alt mr-2"></i>Kathmandu, Nepal</p>
                        <p><i class="fa fa-phone-alt mr-2"></i>+977 9800000000</p>
                        <p><i class="fa fa-envelope mr-2"></i>eLearning@gmail.com</p>
                    </div>

                    <!-- Courses -->
                    <div class="col-md-6 mb-4">
                        <h5 class="text-white mb-3">Our Courses</h5>
                        <div class="d-flex flex-column">
                            <c:forEach items="${courseList}" var="course">
                                <a class="text-white-50 mb-2" href="${pageContext.request.contextPath}/user/course/${course.id}">
                                    <i class="fa fa-angle-right mr-2"></i>${course.name}
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer Bottom -->
<div class="container-fluid bg-dark text-white-50 border-top py-4" style="border-color: rgba(256, 256, 256, .1) !important;">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center mb-3 mb-md-0">
                <p class="m-0">Copyright &copy; <a class="text-white" href="#">JCode Pvt. Ltd.</a>. All Rights Reserved.</p>
            </div>
        </div>
    </div>
</div>