<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<div class="container-fluid py-5">
    <div class="container py-5">
        <div class="section-title text-center position-relative mb-5">
            <h6 class="d-inline-block position-relative text-secondary text-uppercase pb-2">Instructors</h6>
            <h1 class="display-4">Meet Our Instructors</h1>
        </div>

        <div class="owl-carousel team-carousel position-relative" style="padding: 0 30px;">

            <c:forEach items="${instructorList}" var="instructor">
                <div class="team-item">
                    <img class="img-fluid w-100" src="${pageContext.request.contextPath}/Frontend/img/me.jpg}" alt="Instructor Image">
                    <div class="bg-light text-center p-4">
                        <h5 class="mb-3">${instructor.name}</h5>
                        <p class="mb-2">${instructor.subject}</p>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>
</div>