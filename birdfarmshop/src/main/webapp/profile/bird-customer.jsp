

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" type="image/png" href="assets/images/logo-title-bar.png"/>
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

        <title>V.E.T - Thông tin cá nhân</title>

        <!-- Additional CSS Files -->
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">
        <link rel="stylesheet" href="assets/css/owl-carousel.css">
        <link rel="stylesheet" href="assets/css/lightbox.css">
        <style type="text/css">
            body {
                margin: 0;
                padding-top: 150px;
                color: #2e323c;
                background: #f5f6fa;
                position: relative;
                height: 100%;
            }
            .account-settings .user-profile {
                margin: 0 0 1rem 0;
                padding-bottom: 1rem;
                text-align: center;
            }
            .account-settings .user-profile .user-avatar {
                margin: 0 0 1rem 0;
            }
            .account-settings .user-profile .user-avatar img {
                width: 90px;
                height: 90px;
                -webkit-border-radius: 100px;
                -moz-border-radius: 100px;
                border-radius: 100px;
            }
            .account-settings .user-profile h5.user-name {
                margin: 0 0 0.5rem 0;
            }
            .account-settings .user-profile h6.user-email {
                margin: 0;
                font-size: 0.8rem;
                font-weight: 400;
                color: #9fa8b9;
            }
            .account-settings .about {
                margin: 2rem 0 0 0;
                text-align: center;
            }
            .account-settings .about h5 {
                margin: 0 0 15px 0;
                color: #007ae1;
            }
            .account-settings .about p {
                font-size: 0.825rem;
            }
            .form-control {
                border: 1px solid #cfd1d8;
                -webkit-border-radius: 2px;
                -moz-border-radius: 2px;
                border-radius: 2px;
                font-size: .825rem;
                background: #ffffff;
                color: #2e323c;
            }

            .form-group .form-control {
                white-space: pre-wrap;
                font-size: 16px;
            }
            .form-group a {
                text-decoration: none;
                color: black;
            }

            .card {
                background: #ffffff;
                -webkit-border-radius: 5px;
                -moz-border-radius: 5px;
                border-radius: 5px;
                border: 0;
                margin-bottom: 1rem;
            }

            .about li {
                margin-bottom: 10px;
                padding-top: 10px;
                padding-bottom: 10px;
                padding-left: 5px;
                text-align: left;
            }

            .about li:hover {
                background: #cccccc;
            }
            .about .active-profile a
            {
                color:  orange;
            }
            .about a .icon{
                width: 24px;
                height: 24px;
                margin: 0px 10px 0px 0px;
                font-size: 24px;
            }

            .about a {
                color: black;
            }
            .text-primary{
                text-transform: uppercase;
                font-size: 20px;
            }
            .gutters{
                margin-bottom: 20px;
            }
            .register-date{
                font-style: italic;
                font-weight: bold;
            }
            .nav-item{
                width: 20%;
                text-align: center;
            }
            .image-item img{
                height: 100px;
                width: 100px;
            }
            .card .bird {
                border: 1px solid #e9e9ed;
                border-radius: 15px;
                padding: 0 12px;
            }
            .card .order{
                width: 40px;
            }
            .body-bird{
                max-height: 585px;
                overflow-y: scroll;
            }
            .body-bird::-webkit-scrollbar {
                border-radius: 0;
                width: 8px;
            }

            .body-bird::-webkit-scrollbar-thumb {
                border-radius: 4px;
                background-color: rgba(22, 24, 35, 0.06);
            }

            .body-bird::-webkit-scrollbar-track {
                border-radius: 0;
                background-color: rgba(0, 0, 0, 0);
            }
        </style>

    </head>

    <body>
        <c:url var="toCompare" value="MainController?action=NavToCompare"/>
        <c:url var="toHome" value="MainController?action=NavToHome"/>
        <c:url var="toLogin" value="MainController?action=NavToLogin"/>
        <c:url var="logout" value="MainController?action=Logout"/>
        <c:url var="toAccessories" value="MainController?action=NavToAccessory&amount=0"/>
        <c:url var="toBirds" value="MainController?action=NavToBird&amount=0"/>
        <c:url var="toBirdNests" value="MainController?action=NavToBirdNests"/>
        <c:url var="toCart" value="MainController?action=NavToCart"/>
        <c:url var="toProfile" value="MainController?action=NavToProfile"/>
        <c:url var="toEditProfile" value="MainController?action=NavToEditProfile"/>
        <c:url var="toOrders" value="MainController?action=NavToOrders"/>
        <c:url var="toShopOrders" value="MainController?action=NavToShopOrders"/>
        <c:url var="toAccounts" value="MainController?action=NavToAccounts"/>
        <c:url var="toReports" value="MainController?action=NavToReports"/>
        <c:url var="toPair" value="MainController?action=NavToPairBirds"/>

        <!-- ***** Preloader Start ***** -->
        <div id="preloader">
            <div class="jumper">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>  
        <!-- ***** Preloader End ***** -->

        <!-- ***** Header Area Start ***** -->
        <header class="header-area header-sticky">
            <div class="container home-custom">
                <div class="row">
                    <div class="col-12">
                        <nav class="main-nav">
                            <!-- ***** Logo Start ***** -->
                            <a href="#" class="logo scroll-to-section">
                                <img src="assets/images/logo.png">
                            </a>
                            <!-- ***** Logo End ***** -->
                            <!-- ***** Menu Start ***** -->
                            <ul class="nav">
                                <li class="scroll-to-section"><a href="${pageScope.toHome}" >Trang chủ</a></li>
                                    <c:if test="${LOGIN_USER == null || LOGIN_USER.role == 'customer' || LOGIN_USER.role == 'staff'}">
                                    <li class="submenu"><a href="">Sản phẩm</a>
                                        <ul>
                                            <li><a href="${pageScope.toBirds}">Vẹt cảnh</a></li>
                                            <li><a href="${pageScope.toBirdNests}">Tổ chim non</a></li>
                                            <li><a href="${pageScope.toAccessories}">Phụ kiện</a></li>
                                        </ul>
                                    </li>
                                    <li class="scroll-to-section"><a href="${pageScope.toCompare}">So sánh</a></li>
                                        <c:if test="${sessionScope.LOGIN_USER.role == 'staff'}">
                                        <li class="scroll-to-section"><a href="${pageScope.toShopOrders}">Đơn hàng</a></li>
                                        </c:if>
                                        <c:if test="${LOGIN_USER == null || LOGIN_USER.role == 'customer'}">
                                        <li class="scroll-to-section"><a href="${pageScope.toPair}">Nhân giống</a></li>
                                        <li id="show-cart" class="scroll-to-section">
                                            <a href="${pageScope.toCart}"><i style="font-size: 25px" class="fa fa-shopping-cart" aria-hidden="true"></i></a>
                                            <div class="cart-amount">
                                                <c:choose>
                                                    <c:when test="${sessionScope.CART == null}">0</c:when>
                                                    <c:otherwise>${sessionScope.CART.totalItem}</c:otherwise>
                                                </c:choose>
                                            </div>
                                        </li>

                                        <c:if test="${sessionScope.LOGIN_USER == null}">
                                            <li  class="scroll-to-section"> <a href="${pageScope.toLogin}">Đăng nhập</a></li>
                                            </c:if>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${LOGIN_USER.role == 'admin' || LOGIN_USER.role == 'manager'}">
                                    <li class="submenu"><a href="">Sản phẩm</a>
                                        <ul>
                                            <li><a href="${pageScope.toBirds}">Vẹt cảnh</a></li>
                                            <li><a href="${pageScope.toBirdNests}">Tổ chim non</a></li>
                                            <li><a href="${pageScope.toAccessories}">Phụ kiện</a></li>
                                        </ul>
                                    </li>
                                    <li class="scroll-to-section"><a href="${pageScope.toCompare}">So sánh</a></li>
                                    <li class="scroll-to-section"><a href="${pageScope.toShopOrders}">Đơn hàng</a></li>
                                    <li class="scroll-to-section"><a href="${pageScope.toAccounts}">Tài khoản</a></li>
                                    <li class="scroll-to-section"><a href="${pageScope.toReports}">Thống kê</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.LOGIN_USER != null}">
                                    <li class="submenu"><a class="user-name text-right active" href="#">${LOGIN_USER.fullName}</a>
                                        <ul>
                                            <li><a href="${pageScope.toProfile}&username=${sessionScope.LOGIN_USER.username}">Cá nhân</a></li>
                                            <li><a href="${pageScope.logout}">Đăng xuất</a></li>
                                        </ul>
                                    </li>
                                </c:if>
                            </ul>           
                            <a class='menu-trigger'>
                                <span>Menu</span>
                            </a>
                            <!-- ***** Menu End ***** -->
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <!-- ***** Header Area End ***** -->

        <main>
            <div class="container">
                <div class="row gutters">
                    <%@include file="../layout/sidebar-profile.jsp" %>
                    <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                        <div class="card h-100">
                            <div class="card-body profile-section">
                                <div class="row gutters">
                                    <div class="card-body order-section">
                                        <!-- Tab buttons -->
                                        <ul class="nav nav-tabs" id="orderTabs">
                                            <li class="nav-item">
                                                <a class="nav-link active" data-toggle="tab" href="#allBird">Tất cả</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#pairBird">Đang ghép cặp</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#yetPairBird">Chưa ghép cặp</a>
                                            </li>
                                        </ul>

                                        <!-- Tab content -->
                                        <div class="tab-content">
                                            <!-- Pending Orders Tab -->
                                            <div class="tab-pane fade show active" id="allBird">
                                                <div class="row">
                                                    <!-- Card components for pending orders -->
                                                    <div class="col-12 body-bird">
                                                        <c:choose>
                                                            <c:when test="${not empty requestScope.BIRDCUMTOMER}">
                                                                <c:forEach var="birdAll" items="${requestScope.BIRDCUMTOMER}" varStatus="counter">
                                                                    <div class="card w-100 mt-2"> <!-- Add the w-100 class to make the card expand to full width -->
                                                                        <div class="card-body bird">
                                                                            <!-- Order ID and Create Date -->
                                                                            <div class="d-flex justify-content-between align-items-center">
                                                                                <div class="order">
                                                                                    <h6 class="text-center">${counter.count}</h6>
                                                                                </div>
                                                                                <div>
                                                                                    <h5>${birdAll.name}</h5>
                                                                                </div>
                                                                                <div class="image-item">
                                                                                    <img src="${birdAll.img_url}" alt="${birdAll.name}" />
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="mt-5">
                                                                    <h4 class="text-center">Bạn chưa có con chim nào</h4>
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>

                                                    </div>
                                                </div>
                                            </div>

                                            <div class="tab-pane fade" id="pairBird">
                                                <div class="row">
                                                    <!-- Card components for pending orders -->
                                                    <div class="col-12 body-bird">
                                                        <c:choose>
                                                            <c:when test="${not empty requestScope.BIRDCUMTOMER}">
                                                                <c:set var="counter2" value="0"/>
                                                                <c:forEach var="birdPair" items="${requestScope.BIRDCUMTOMER}">
                                                                    <c:if test="${birdPair.status == 'Đang ghép cặp'}">
                                                                        <c:set var="counter2" value="${counter2 + 1}"/>
                                                                        <div class="card w-100 mt-2"> <!-- Add the w-100 class to make the card expand to full width -->
                                                                            <div class="card-body bird">
                                                                                <!-- Order ID and Create Date -->
                                                                                <div class="d-flex justify-content-between align-items-center">
                                                                                    <div class="order">
                                                                                        <h6 class="text-center">${counter2}</h6>
                                                                                    </div>
                                                                                    <div>
                                                                                        <h5>${birdPair.name}</h5>
                                                                                    </div>
                                                                                    <div class="image-item">
                                                                                        <img src="${birdPair.img_url}" alt="${birdPair.name}" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="mt-5">
                                                                    <h4 class="text-center">Bạn chưa có con chim nào</h4>
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="yetPairBird">
                                                <div class="row">
                                                    <!-- Card components for pending orders -->
                                                    <div class="col-12 body-bird">
                                                        <c:choose>
                                                            <c:when test="${not empty requestScope.BIRDCUMTOMER}">
                                                                <c:set var="counter3" value="0"/>
                                                                <c:forEach var="yetPairBird" items="${requestScope.BIRDCUMTOMER}">
                                                                    <c:if test="${yetPairBird.status == 'Chưa ghép cặp'}">
                                                                        <c:set var="counter3" value="${counter3 + 1}"/>
                                                                        <div class="card w-100 mt-2"> <!-- Add the w-100 class to make the card expand to full width -->
                                                                            <div class="card-body bird">
                                                                                <!-- Order ID and Create Date -->
                                                                                <div class="d-flex justify-content-between align-items-center">
                                                                                    <div class="order">
                                                                                        <h6 class="text-center">${counter3}</h6>
                                                                                    </div>
                                                                                    <div>
                                                                                        <h5>${yetPairBird.name}</h5>
                                                                                    </div>
                                                                                    <div class="image-item">
                                                                                        <img src="${yetPairBird.img_url}" alt="${yetPairBird.name}" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="mt-5">
                                                                    <h4 class="text-center">Bạn chưa có con chim nào</h4>
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
        </main>


        <!-- ***** Footer Start ***** -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="first-item">
                            <div class="logo">
                                <img src="assets/images/logo.png" alt="hexashop ecommerce templatemo">
                            </div>
                            <ul>
                                <li><a href="#">284 Pasteur, P.8 Q.3, TP.HCM</a></li>
                                <li><a href="#">thegioivetcanh@petshop.com</a></li>
                                <li><a href="#">0913-244-567</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <h4>Sản phẩm và dịch vụ</h4>
                        <ul>
                            <li><a href="${pageScope.toBirds}">Vẹt cảnh</a></li>
                            <li><a href="${pageScope.toBirdNests}">Tổ chim non</a></li>
                            <li><a href="${pageScope.toAccessories}">Phụ kiện</a></li>
                            <li><a href="${pageScope.toCompare}">So sánh</a></li>
                            <li><a href="${pageScope.toPair}">Nhân giống</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3">
                        <h4>Đường dẫn hữu ích</h4>
                        <ul>
                            <li><a href="${pageScope.toHome}">Trang chủ</a></li>
                            <li><a href="#">Về chúng tôi</a></li>
                            <li><a href="#">Hỗ trợ</a></li>
                            <li><a href="#">Liên hệ</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3">
                        <h4>Thông tin hỗ trợ</h4>
                        <ul>
                            <li><a href="#">Hỗ trợ</a></li>
                            <li><a href="#">Câu hỏi thường gặp</a></li>
                            <li><a href="#">Giao hàng</a></li>
                            <li><a href="#">Theo dõi đơn hàng</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-12">
                        <div class="under-footer">
                            <p>Copyright © 2023 V.E.T Co., Ltd. All Rights Reserved. 

                            <ul>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- ***** Footer Area Ends ***** -->

    </script>
    <!-- jQuery -->
    <script src="assets/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="assets/js/popper.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="assets/js/owl-carousel.js"></script>
    <script src="assets/js/accordions.js"></script>
    <script src="assets/js/datepicker.js"></script>
    <script src="assets/js/scrollreveal.min.js"></script>
    <script src="assets/js/waypoints.min.js"></script>
    <script src="assets/js/jquery.counterup.min.js"></script>
    <script src="assets/js/imgfix.min.js"></script> 
    <script src="assets/js/slick.js"></script> 
    <script src="assets/js/lightbox.js"></script> 
    <script src="assets/js/isotope.js"></script> 

    <!-- Global Init -->
    <script src="assets/js/custom.js"></script>
    <script>

    </script>
</body>
</html>