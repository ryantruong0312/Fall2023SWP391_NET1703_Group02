<%-- 
    Document   : bird-details
    Created on : Sep 13, 2023, 11:21:39 PM
    Author     : tlminh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

        <title>V.E.T - Chi tiết vẹt cảnh</title>


        <!-- Additional CSS Files -->
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">
        <link rel="stylesheet" href="assets/css/owl-carousel.css">
        <link rel="stylesheet" href="assets/css/lightbox.css">
        <style>
            .image-container {
                display: flex;
                align-items: center;
            }


            .col-lg-12 a {
                border-radius: 10px;
                border: 1px solid rgb(221, 221, 227);
                background-color: #f5c6cb;
                display: flex;
                justify-content: center;
                align-items: center;
                margin: 0 auto;
                width: 50%;
                margin-bottom: 30px;
                margin-top: 20px;
                width: 150px;
                float: right;
            }

            .overlay-text {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: rgba(0, 0, 0, 0.5);
                border-radius: 50%;
                color: #fff;
                padding: 30px;
                font-size: 50px;
                text-align: center;
            }
            .image-bottom {
                display: inline-block;
                margin: 10px 10px 0 0;
            }

            #mainImage {
                width: 500px;
                height: 400px;
                border: 1px solid;
                transition: transform 0.3s ease-in-out;
            }

            #mainImage:hover {
                transform: scale(1.1);
                cursor: pointer;
                border: 0px;
            }
            .image-top {
                position: relative;
            }
            .overlay-container {
                position: relative;
            }
        </style>
        <script>
            function swapImages(clickedImage) {
                const leftImage = document.querySelector('.image-top img');
                const rightImage1 = document.querySelectorAll('.image-bottom img')[0];
                const tempSrc = leftImage.src;
                leftImage.src = clickedImage.src;
                clickedImage.src = tempSrc;
            }
        </script>
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
                                <li class="scroll-to-section"><a href="${pageScope.toHome}">Trang chủ</a></li>
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
                                    <li class="submenu"><a class="user-name text-right" href="#">${LOGIN_USER.fullName}</a>
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

        <!-- ***** Main Banner Area Start ***** -->
        <div class="page-heading" id="top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="inner-content">
                            <h2>Thông tin chi tiết</h2>
                            <span>Tất tần tật thông tin và mô tả về chú vẹt sẽ được tìm thấy tại đây!</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ***** Main Banner Area End ***** -->


        <!-- ***** Product Area Starts ***** -->
        <c:set var="birdDetails" value="${requestScope.birdDetails}"/>
        <section class="section" id="product">
            <div class="container">
                <c:if test="${LOGIN_USER.role == 'admin' || LOGIN_USER.role == 'manager'}">
                    <div class="row">
                        <div class="col-lg-12">
                            <a href="MainController?action=UpdateBird&bird_id=${birdDetails.bird_id}"><span>Cập nhật chim</span></a>
                        </div>
                    </div>
                </c:if>
                <div class="row">
                    <div class="col-lg-8">
                        <c:if test="${birdDetails != null}">
                            <div class="image-container">
                                <div class="image-top">
                                    <div class="overlay-container">
                                        <img id="mainImage" style="width: 500px; height: 400px;" src="${im}" alt="" onclick="swapImages(this)">
                                        <c:if test="${birdDetails.status == 'Đã bán'}">
                                            <div class="overlay-text">Đã bán</div>
                                        </c:if>
                                        <c:if test="${birdDetails.status == 'Đang sinh sản'}">
                                            <div class="overlay-text">Đang sinh sản</div>
                                        </c:if>
                                        <c:if test="${birdDetails.status == 'Đang ghép cặp'}">
                                            <div class="overlay-text">Đang ghép cặp</div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            <div class="image-bottom">
                                <c:forEach items="${birdDetails.image_urls}" var="bird">
                                    <c:if test="${bird ne im}">
                                        <img style="width: 100px; height: 75px; border: 1px solid;" class="accessory-image" src="${bird}" alt="" onclick="swapImages(this)">
                                    </c:if>
                                </c:forEach>
                            </div>
                        </c:if>
                    </div>
                    <div class="col-lg-4">
                        <div class="right-content">
                            <h4>${birdDetails.bird_name}</h4>
                            <c:choose>
                                <c:when test="${birdDetails.discount > 0}">
                                    <span>
                                        <span style="display: inline-block;"><del><fmt:formatNumber value="${birdDetails.price}" pattern="#,###"/> ₫</del></span>
                                        <span style="display: inline-block; border-radius: 10px; background-color: #cccccc; padding: 0 5px 0 5px; color: black;"> -${birdDetails.discount}%</span>
                                        <span style="font-size: 20px; color: red;"><fmt:formatNumber value="${birdDetails.price - birdDetails.price * birdDetails.discount / 100}" pattern="#,###"/> ₫<span>
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span style="font-size: 20px; color: red;"><fmt:formatNumber value="${birdDetails.price}" pattern="#,###"/> ₫</span>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="mt-2">
                                        <h4>Mô tả sản phẩm: </h4>
                                        <c:if test="${not empty birdDetails.description}">
                                            <span>Thông tin: ${birdDetails.description}</span>
                                        </c:if>
                                        <c:if test="${not empty birdDetails.achievement}">
                                            <div style="white-space: nowrap; margin-top: 10px;">
                                                <h4 style="display: inline;">Thành tựu: </h4>
                                                <span style="display: inline;">${birdDetails.achievement}</span>
                                            </div>
                                        </c:if>
                                        <div style="white-space: nowrap; margin-top: 10px;">
                                            <h4 style="display: inline;">Màu sắc: </h4>
                                            <span style="display: inline;">${birdDetails.color}</span>
                                        </div>
                                        
                                        <div style="white-space: nowrap; margin-top: 10px;">
                                            <h4 style="display: inline;">Tháng tuổi: </h4>
                                            <span style="display: inline;">${birdDetails.age}</span>
                                        </div>
                                        
                                        <div style="white-space: nowrap; margin-top: 10px;">
                                            <h4 style="display: inline;">Thời gian trưởng thành: </h4>
                                            <span style="display: inline;">${birdDetails.grown_age} tháng</span>
                                        </div>
                                        
                                        <div style="white-space: nowrap; margin-top: 10px;">
                                            <h4 style="display: inline;">Số lần giao phối: </h4>
                                            <span style="display: inline;">${birdDetails.reproduction_history}</span>
                                        </div>
                                        <div>
                                            <div class="quote">
                                                <c:if test="${not empty birdDetails.dad_bird_name && not empty birdDetails.mom_bird_name}">
                                                    <i class="fa fa-quote-left"></i><p>${birdDetails.dad_bird_name} lai với ${birdDetails.mom_bird_name}</p>
                                                    </c:if>
                                            </div>
                                            <c:if test="${(sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.role == 'customer') && bird.status != 'Đã bán'}">
                                                <div class="total">
                                                    <div class="main-border-button"><a class="bird-cart" style="cursor: pointer" data-value="${birdDetails.bird_id}">Thêm vào giỏ hàng</a></div>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                    </div>
                                    </div>
                                    </section>
                                    <!-- ***** Product Area Ends ***** -->
                                    <!-- Feedback start-->
                                    <%@include file="../layout/feedback.jsp" %>
                                    <!-- Feedback end-->
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
                                                            <li><a href="#">thegioivetcanh@gmail.com</a></li>
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
                                    <%@include file="../layout/message.jsp" %>
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

                                            $(function () {
                                                var selectedClass = "";
                                                $("p").click(function () {
                                                    selectedClass = $(this).attr("data-rel");
                                                    $("#portfolio").fadeTo(50, 0.1);
                                                    $("#portfolio div").not("." + selectedClass).fadeOut();
                                                    setTimeout(function () {
                                                        $("." + selectedClass).fadeIn();
                                                        $("#portfolio").fadeTo(50, 1);
                                                    }, 500);

                                                });
                                                $(".bird-cart").click(function () {
                                                    let birdId = $(this).attr('data-value');
                                                    $.ajax({
                                                        url: "AddBirdToCartController",
                                                        type: 'POST',
                                                        data: {bird_id: birdId},
                                                        success: function (data) {
                                                            if (data == 0) {
                                                                toast({
                                                                    title: 'Lỗi',
                                                                    message: 'Sản phẩm này đã có trong giỏ hàng',
                                                                    type: 'error',
                                                                    duration: 3000
                                                                });
                                                            } else {
                                                                toast({
                                                                    title: 'Thành công',
                                                                    message: 'Thêm sản phẩm vào giỏ hàng thành công',
                                                                    type: 'success',
                                                                    duration: 3000
                                                                });
                                                                $.ajax({
                                                                    url: "AddBirdToCartController",
                                                                    type: 'POST',
                                                                    success: function (data) {
                                                                        $('.cart-amount').html(data);
                                                                    }
                                                                });
                                                            }
                                                        }
                                                    });
                                                });
                                            });

                                    </script>

                                    </body>

                                    </html>


