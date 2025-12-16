<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
                    <a href="#about-section" class="nav-item nav-link">About</a>
                    <a href="#courses-section" class="nav-item nav-link">Courses</a>
                  <div class="nav-item dropdown">
                      <a href="#" class="nav-link dropdown-toggle" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          Pages
                      </a>
                      <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                          <a href="#feature-section" class="dropdown-item scroll-link">Our Features</a>
                          <a href="#testimonial-section" class="dropdown-item scroll-link">Testimonial</a>
                      </div>
                  </div>
                    <a href="#contact-section" class="nav-item nav-link">Contact</a>
                </div>
                <a href="${pageContext.request.contextPath}/login" class="btn btn-primary py-2 px-4 d-none d-lg-block">Login</a>
            </div>
        </nav>
    </div>