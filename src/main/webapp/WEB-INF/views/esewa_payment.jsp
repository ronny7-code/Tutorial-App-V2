<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>eLearning - E-Sewa Payment</title>
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
    <jsp:include page="navbar.jsp" />
    <!-- Navbar End -->


    <!-- Payment Section -->
    <div id="instructors-section" class="container py-5">
        <div class="row justify-content-center mb-4">
            <div class="col-lg-6 text-center">
                <h6 class="text-secondary text-uppercase">Payment by Esewa</h6>
                <h1 class="display-4">Pay for your enrollment.</h1>
            </div>
        </div>
        <div class="row">

                <div class="col-lg-3 col-md-4 mb-4">
                    <div class="card instructor-card shadow-sm">
                    <table>
                       <form action="https://rc-epay.esewa.com.np/api/epay/main/v2/form" method="POST">

                       <input type="text" id="amount" name="amount" value="${payment.amount / 100 }" required>

                       <input type="text" id="tax_amount" name="tax_amount" value ="${payment.taxAmount / 100 }" required>

                       <input type="text" id="total_amount" name="total_amount" value="${payment.totalAmount / 100 }" required>

                       <input type="text" id="transaction_uuid" name="transaction_uuid" value="${payment.transactionUUID }" required>
                       <input type="text" id="product_code" name="product_code" value ="${payment.productCode }" required>
                       <input type="text" id="product_service_charge" name="product_service_charge" value="${payment.productServiceCharge }" required>
                       <input type="text" id="product_delivery_charge" name="product_delivery_charge" value="${payment.productDeliveryCharge }" required>
                       <input type="text" id="success_url" name="success_url" value="${payment.successURL }" required>
                       <input type="text" id="failure_url" name="failure_url" value="${payment.failureURL }" required>
                       <input type="text" id="signed_field_names" name="signed_field_names" value="${payment.signedFieldNames }" required>
                       <input type="text" id="signature" name="signature" value="${payment.signature }" required>
                       <input value="Submit" type="submit">
                       </form>


                    </div>
                </div>

        </div>
    </div>


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

<script>
$(document).ready(function() {
    // Smooth scroll for all links with hash or scroll-link class
    $('a[href^="#"], .scroll-link').on('click', function(e) {
        var target = this.hash;
        if (target) {
            e.preventDefault();

            // Close any open dropdown
            $(this).closest('.dropdown-menu').removeClass('show');
            $(this).closest('.dropdown').removeClass('show');

            $('html, body').animate({
                scrollTop: $(target).offset().top
            }, 800); // 800ms smooth scroll
        }
    });
});
</script>
<script>
    $(document).ready(function() {
        if (window.location.search.includes('messageSent=true')) {
            $('html, body').animate({
                scrollTop: $('#contact-section').offset().top
            }, 800);
        }
    });
</script>



    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/Frontend/js/main.js"></script>
</body>

</html>