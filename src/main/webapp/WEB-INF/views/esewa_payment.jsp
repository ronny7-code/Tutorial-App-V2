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

    <!-- Enhanced Payment Page CSS -->
    <style>
        /* Payment Form Styling */
        .payment-container {
            max-width: 600px;
            margin: 40px auto;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            border: 1px solid #eaeaea;
            transition: transform 0.3s ease;
        }

        .payment-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 50px rgba(0, 0, 0, 0.12);
        }

        .payment-header {
            background: linear-gradient(135deg, #4f46e5, #7c3aed);
            color: white;
            padding: 30px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .payment-header::before {
            content: "";
            position: absolute;
            top: -50%;
            right: -50%;
            width: 200px;
            height: 200px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
        }

        .payment-header::after {
            content: "";
            position: absolute;
            bottom: -80px;
            left: -50px;
            width: 150px;
            height: 150px;
            background: rgba(255, 255, 255, 0.08);
            border-radius: 50%;
        }

        .payment-header h2 {
            font-size: 2rem;
            margin-bottom: 10px;
            font-weight: 700;
            position: relative;
            z-index: 1;
        }

        .payment-header p {
            opacity: 0.9;
            margin: 0;
            font-size: 1.1rem;
            position: relative;
            z-index: 1;
        }

        .esewa-logo {
            width: 80px;
            height: 80px;
            background: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            position: relative;
            z-index: 1;
        }

        .esewa-logo i {
            font-size: 2.5rem;
            background: linear-gradient(135deg, #4f46e5, #7c3aed);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .payment-body {
            padding: 40px;
        }

        .payment-details {
            background-color: #f8f9fa;
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 30px;
            border-left: 5px solid #4f46e5;
            transition: all 0.3s ease;
        }

        .payment-details:hover {
            background-color: #f0f2ff;
            transform: translateX(5px);
        }

        .payment-details h3 {
            color: #333;
            font-size: 1.4rem;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            font-weight: 600;
        }

        .payment-details h3 i {
            margin-right: 12px;
            color: #4f46e5;
            background: white;
            padding: 10px;
            border-radius: 50%;
            box-shadow: 0 3px 10px rgba(79, 70, 229, 0.2);
        }

        .payment-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
            padding-bottom: 15px;
            border-bottom: 1px dashed #ddd;
            align-items: center;
        }

        .payment-row:last-child {
            border-bottom: none;
            margin-bottom: 0;
            padding-bottom: 0;
        }

        .payment-label {
            font-weight: 500;
            color: #555;
            display: flex;
            align-items: center;
        }

        .payment-label i {
            margin-right: 10px;
            color: #7c3aed;
            font-size: 0.9rem;
        }

        .payment-value {
            font-weight: 600;
            color: #222;
            font-size: 1.1rem;
        }

        .total-row {
            background: linear-gradient(135deg, rgba(79, 70, 229, 0.1), rgba(124, 58, 237, 0.1));
            padding: 18px;
            border-radius: 10px;
            margin-top: 10px;
            border: 2px solid #4f46e5;
        }

        .total-row .payment-label {
            font-weight: 700;
            color: #4f46e5;
            font-size: 1.2rem;
        }

        .total-row .payment-value {
            font-weight: 700;
            color: #4f46e5;
            font-size: 1.4rem;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #444;
            font-size: 1rem;
        }

        .form-control-custom {
            width: 100%;
            padding: 14px 16px;
            border: 2px solid #e1e5e9;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s;
            background-color: #fcfcfd;
            color: #333;
        }

        .form-control-custom:focus {
            outline: none;
            border-color: #4f46e5;
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.15);
            background-color: white;
        }

        .form-control-custom[readonly] {
            background-color: #f5f7fa;
            color: #666;
            cursor: not-allowed;
        }

        .submit-btn {
            width: 100%;
            background: linear-gradient(135deg, #4f46e5, #7c3aed);
            color: white;
            border: none;
            padding: 18px;
            font-size: 1.2rem;
            font-weight: 600;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 25px;
            letter-spacing: 0.5px;
            box-shadow: 0 6px 20px rgba(79, 70, 229, 0.3);
        }

        .submit-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(79, 70, 229, 0.4);
            background: linear-gradient(135deg, #4338ca, #6d28d9);
        }

        .submit-btn:active {
            transform: translateY(-1px);
        }

        .submit-btn i {
            margin-right: 12px;
            font-size: 1.3rem;
        }

        .security-note {
            background: linear-gradient(135deg, #fef3c7, #fde68a);
            border: 1px solid #f59e0b;
            border-radius: 10px;
            padding: 18px;
            margin-top: 30px;
            text-align: center;
            color: #92400e;
            font-size: 0.95rem;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .security-note i {
            margin-right: 12px;
            font-size: 1.3rem;
            color: #d97706;
        }

        .payment-method-icons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }

        .payment-method-icon {
            width: 50px;
            height: 50px;
            background: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            color: #4f46e5;
            font-size: 1.5rem;
            transition: all 0.3s ease;
        }

        .payment-method-icon:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.12);
            color: #7c3aed;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .payment-container {
                margin: 20px 15px;
            }

            .payment-body {
                padding: 25px 20px;
            }

            .payment-header {
                padding: 25px 20px;
            }

            .payment-header h2 {
                font-size: 1.7rem;
            }

            .payment-details {
                padding: 20px;
            }

            .submit-btn {
                padding: 16px;
                font-size: 1.1rem;
            }
        }

        /* Animation for page load */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .payment-container {
            animation: fadeInUp 0.6s ease-out;
        }
    </style>
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
        <div class="col-lg-8 text-center">
            <h6 class="text-secondary text-uppercase">Secure Payment Gateway</h6>
            <h1 class="display-4">Complete Your Enrollment</h1>
            <p class="lead mt-3">Final step to access your course. Your payment is secured with E-Sewa.</p>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10">
            <div class="payment-container">
                <div class="payment-header">
                    <div class="esewa-logo">
                        <i class="fas fa-credit-card"></i>
                    </div>
                    <h2>E-Sewa Payment</h2>
                    <p>Secure Digital Payment Gateway</p>
                </div>

                <div class="payment-body">
                    <div class="payment-details">
                        <h3><i class="fas fa-receipt"></i> Payment Summary</h3>

                        <div class="payment-row">
                            <span class="payment-label"><i class="fas fa-tag"></i> Course Fee</span>
                            <span class="payment-value">Rs. ${payment.amount}</span>
                        </div>

                        <div class="payment-row">
                            <span class="payment-label"><i class="fas fa-percentage"></i> Tax Amount</span>
                            <span class="payment-value">Rs. ${payment.taxAmount}</span>
                        </div>

                        <c:if test="${not empty payment.productServiceCharge && payment.productServiceCharge > 0}">
                            <div class="payment-row">
                                <span class="payment-label"><i class="fas fa-cogs"></i> Service Charge</span>
                                <span class="payment-value">Rs. ${payment.productServiceCharge}</span>
                            </div>
                        </c:if>

                        <c:if test="${not empty payment.productDeliveryCharge && payment.productDeliveryCharge > 0}">
                            <div class="payment-row">
                                <span class="payment-label"><i class="fas fa-shipping-fast"></i> Delivery Charge</span>
                                <span class="payment-value">Rs. ${payment.productDeliveryCharge}</span>
                            </div>
                        </c:if>

                        <div class="payment-row total-row">
                            <span class="payment-label"><i class="fas fa-file-invoice-dollar"></i> Total Amount</span>
                            <span class="payment-value">Rs. ${payment.totalAmount}</span>
                        </div>
                    </div>

                    <form action="https://rc-epay.esewa.com.np/api/epay/main/v2/form" method="POST" id="esewa-form">
                        <!-- Hidden fields for E-Sewa -->
                        <input type="hidden" id="amount" name="amount" value="${payment.amount}">
                        <input type="hidden" id="tax_amount" name="tax_amount" value="${payment.taxAmount}">
                        <input type="hidden" id="total_amount" name="total_amount" value="${payment.totalAmount}">
                        <input type="hidden" id="transaction_uuid" name="transaction_uuid" value="${payment.transactionUUID}">
                        <input type="hidden" id="product_code" name="product_code" value="${payment.productCode}">
                        <input type="hidden" id="product_service_charge" name="product_service_charge" value="${payment.productServiceCharge}">
                        <input type="hidden" id="product_delivery_charge" name="product_delivery_charge" value="${payment.productDeliveryCharge}">
                        <input type="hidden" id="success_url" name="success_url" value="${payment.successURL}">
                        <input type="hidden" id="failure_url" name="failure_url" value="${payment.failureURL}">
                        <input type="hidden" id="signed_field_names" name="signed_field_names" value="${payment.signedFieldNames}">
                        <input type="hidden" id="signature" name="signature" value="${payment.signature}">

                        <button type="submit" class="submit-btn">
                            <i class="fas fa-lock"></i> Pay Securely with E-Sewa
                        </button>
                    </form>

                    <div class="security-note">
                        <i class="fas fa-shield-alt"></i>
                        <span>Your payment is secured with 256-bit SSL encryption. We do not store your payment details.</span>
                    </div>

                    <div class="payment-method-icons">
                        <div class="payment-method-icon">
                            <i class="fas fa-mobile-alt"></i>
                        </div>
                        <div class="payment-method-icon">
                            <i class="fas fa-university"></i>
                        </div>
                        <div class="payment-method-icon">
                            <i class="fas fa-credit-card"></i>
                        </div>
                        <div class="payment-method-icon">
                            <i class="fas fa-wallet"></i>
                        </div>
                    </div>
                </div>
            </div>

            <div class="text-center mt-4">
                <p class="text-muted"><i class="fas fa-info-circle mr-2"></i>You will be redirected to E-Sewa's secure payment page to complete the transaction.</p>
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

        // Add loading animation to submit button
        $('#esewa-form').on('submit', function() {
            const submitBtn = $(this).find('.submit-btn');
            const originalText = submitBtn.html();
            submitBtn.html('<i class="fas fa-spinner fa-spin"></i> Redirecting to E-Sewa...');
            submitBtn.prop('disabled', true);

            // Revert after 5 seconds just in case the redirect doesn't happen
            setTimeout(function() {
                submitBtn.html(originalText);
                submitBtn.prop('disabled', false);
            }, 5000);
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