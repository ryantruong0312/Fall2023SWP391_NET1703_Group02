<%-- 
    Document   : cart-view
    Created on : Sep 13, 2023, 11:24:00 PM
    Author     : tlminh
--%>

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

        <title>V.E.T - Giỏ hàng</title>

        <!-- Additional CSS Files -->
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">
        <link rel="stylesheet" href="assets/css/owl-carousel.css">
        <link rel="stylesheet" href="assets/css/lightbox.css">
    </head>


    <body>
        <c:url var="toHome" value="MainController?action=NavToHome"/>
        <c:url var="toCompare" value="MainController?action=NavToCompare"/>
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

        <!-- ***** Header Area Start ***** -->
        <header class="header-area header-sticky mb-5">
            <div class="container ">
                <div class="row ">
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
                                    <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.role == 'customer' || sessionScope.LOGIN_USER.role == 'staff'}">
                                    <li class="submenu"><a href="">Sản phẩm</a>
                                        <ul>
                                            <li><a href="${pageScope.toBirds}">Vẹt cảnh</a></li>
                                            <li><a href="${pageScope.toBirdNests}">Tổ chim non</a></li>
                                            <li><a href="${pageScope.toAccessories}">Phụ kiện</a></li>
                                        </ul>
                                    </li>
                                    <li class="scroll-to-section"><a href="${pageScope.toCompare}" >So sánh</a></li>
                                        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.role == 'customer'}">
                                            <c:if test="${sessionScope.LOGIN_USER.role == 'staff'}">
                                            <li class="scroll-to-section"><a href="${pageScope.toShopOrders}">Đơn hàng</a></li>
                                            </c:if>
                                        <li class="scroll-to-section"><a href="${pageScope.toPair}">Nhân giống</a></li>
                                        <li id="show-cart" class="scroll-to-section active">
                                            <a href="#"><i style="font-size: 25px" class="fa fa-shopping-cart" aria-hidden="true"></i></a>
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
                                    <c:if test="${sessionScope.LOGIN_USER.role == 'admin' || sessionScope.LOGIN_USER.role == 'manager'}">
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
                                    <li class="submenu"><a href="">${LOGIN_USER.fullName}</a>
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
                            <h2>Giỏ hàng</h2>
                            <span>Kiểm tra lại giỏ hàng và tiến hành thanh toán nhanh chóng với V.E.T</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ***** Main Banner Area End ***** -->

        <section class="h-100">
            <div class="container-fluid h-100 py-5">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-10">

                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="fw-normal mb-0 text-black">Vẹt cảnh</h3>
                        </div><hr>
                        <c:forEach items="${sessionScope.CART.birdList}" var="bird">
                            <div class="card rounded-3 mb-4">
                                <div class="card-body p-4">
                                    <div class="row d-flex justify-content-between align-items-center">
                                        <div class="col-md-2 col-lg-2 col-xl-2" style="text-align: center;">
                                            <img src="${bird.value.bird.image_url}" class="img-fluid rounded-3" alt="Vẹt cảnh" style="height: 150px; width: 120px;">
                                        </div>
                                        <div class="col-md-4 col-lg-4 col-xl-4">
                                            <p class="lead fw-bold mb-2" style="font-size: 23px;">${bird.value.bird.bird_name}</p>
                                            <c:forEach var="breed" items="${requestScope.BREED_LIST}">
                                                <c:if test="${breed.breed_id == bird.value.bird.breed_id}">
                                                    <p><span class="text-muted">Giống: </span>${breed.breed_name}
                                                    </c:if>
                                                </c:forEach>
                                        </div>
                                        <div class="col-md-2 col-lg-2 col-xl-2 d-flex">
                                            <button class="btn btn-link px-2" style="visibility: hidden"
                                                    onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                <img src="assets/images/decrease-button.png"/>
                                            </button>
                                            <input id="form1" min="0" name="quantity" value="1" type="number" disabled=""
                                                   class="form-control form-control-sm" style="text-align: center; height: 40px; border: 1px solid; font-size: 16px;"/>
                                            <button class="btn btn-link px-2" style="visibility: hidden"
                                                    onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                <img src="assets/images/increase-button.png"/>
                                            </button>
                                        </div>
                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                            <c:choose>
                                                <c:when test="${bird.value.bird.discount > 0}">
                                                    <h5 class="mb-0" style="font-weight: bold; display: inline-block"><del><fmt:formatNumber value="${bird.value.bird.price}" pattern="#,###"/> ₫</del></h5>
                                                    <h5 style="display: inline-block; border-radius: 10px; background-color: #cccccc; padding: 0 5px 0 5px; color: black;"> -${bird.value.bird.discount}%</h5>
                                                    <h5 style="font-size: 20px; color: red;"><fmt:formatNumber value="${bird.value.bird.price - bird.value.bird.price * bird.value.bird.discount / 100}" pattern="#,###"/> ₫</h5>
                                                </c:when>
                                                <c:otherwise>
                                                    <h5 class="mb-0" style="font-weight: bold; display: inline-block"><fmt:formatNumber value="${bird.value.bird.price}" pattern="#,###"/> ₫</h5>
                                                </c:otherwise>
                                            </c:choose> 
                                        </div>
                                        <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                            <a href="MainController?action=RemoveBirdFromCart&bird_id=${bird.key}" class="text-danger"><img src="assets/images/remove-button.png"/></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Card for cage attached with bird -->          
                            <div class="card rounded-3 mb-4">
                                <div class="card-body p-4">
                                    <div class="row d-flex justify-content-between align-items-center">
                                        <div class="col-md-2 col-lg-2 col-xl-2" style="text-align: center;">
                                            <img src="${bird.value.cage.image_url}" class="img-fluid rounded-3" alt="Phụ kiện" style="height: 150px; width: 120px;">
                                        </div>
                                        <div class="col-md-4 col-lg-4 col-xl-4">
                                            <p class="lead fw-bold mb-2" style="font-size: 23px;">${bird.value.cage.accessory_name}</p>
                                            <c:forEach var="category" items="${requestScope.CATEGORY_LIST}">
                                                <c:if test="${bird.value.cage.category_id == category.category_id}">
                                                    <p><span class="text-muted">Loại phụ kiện: </span>${category.category_name}
                                                    </c:if>
                                                </c:forEach>

                                        </div>
                                        <div class="col-md-2 col-lg-2 col-xl-2 d-flex">
                                            <button class="btn btn-link px-2" style="visibility: hidden"
                                                    onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                <img src="assets/images/decrease-button.png"/>
                                            </button>

                                            <input id="form1" min="0" name="quantity" value="1" type="number" disabled=""
                                                   class="form-control form-control-sm" style="text-align: center; height: 40px; border: 1px solid; font-size: 16px;"/>

                                            <button class="btn btn-link px-2" style="visibility: hidden"
                                                    onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                <img src="assets/images/increase-button.png"/>
                                            </button>
                                        </div>
                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                            <c:choose>
                                                <c:when test="${bird.value.cage.discount > 0}">
                                                    <h5 class="mb-0" style="font-weight: bold; display: inline-block"><del><fmt:formatNumber value="${bird.value.cage.unit_price}" pattern="#,###"/> ₫</del></h5>
                                                    <h5 style="display: inline-block; border-radius: 10px; background-color: #cccccc; padding: 0 5px 0 5px; color: black;"> -${bird.value.cage.discount}%</h5>
                                                    <h5 style="font-size: 20px; color: red;"><fmt:formatNumber value="${bird.value.cage.unit_price - bird.value.cage.unit_price * bird.value.cage.discount / 100}" pattern="#,###"/> ₫</h5>
                                                </c:when>
                                                <c:otherwise>
                                                    <h5 class="mb-0" style="font-weight: bold; display: inline-block"><fmt:formatNumber value="${bird.value.cage.unit_price}" pattern="#,###"/> ₫</h5>
                                                </c:otherwise>
                                            </c:choose> 
                                        </div>
                                        <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="fw-normal mb-0 text-black">Tổ chim non</h3>
                        </div><hr>

                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="fw-normal mb-0 text-black">Phụ kiện</h3>
                        </div><hr>
                        <c:forEach items="${sessionScope.CART.accessoryList}" var="accessory">
                            <div class="card rounded-3 mb-4">
                                <div class="card-body p-4">
                                    <div class="row d-flex justify-content-between align-items-center">
                                        <div class="col-md-2 col-lg-2 col-xl-2" style="text-align: center;">
                                            <img src="${accessory.value.accessory.image_url}" class="img-fluid rounded-3" alt="Phụ kiện" style="height: 150px; width: 120px;">
                                        </div>
                                        <div class="col-md-4 col-lg-4 col-xl-4">
                                            <p class="lead fw-bold mb-2" style="font-size: 23px;">${accessory.value.accessory.accessory_name}</p>
                                            <c:forEach var="category" items="${requestScope.CATEGORY_LIST}">
                                                <c:if test="${accessory.value.accessory.category_id == category.category_id}">
                                                    <p><span class="text-muted">Loại phụ kiện: </span>${category.category_name}
                                                    </c:if>
                                                </c:forEach>

                                        </div>
                                        <div class="col-md-2 col-lg-2 col-xl-2 d-flex">
                                            <button class="btn btn-link px-2" 
                                                    onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                <img src="assets/images/decrease-button.png"/>
                                            </button>

                                            <input id="form1" min="0" name="quantity" value="${accessory.value.order_quantity}" type="number"
                                                   class="form-control form-control-sm" style="text-align: center; height: 40px; border: 1px solid; font-size: 16px;"/>

                                            <button class="btn btn-link px-2"
                                                    onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                <img src="assets/images/increase-button.png"/>
                                            </button>
                                        </div>
                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                            <c:choose>
                                                <c:when test="${accessory.value.accessory.discount > 0}">
                                                    <h5 class="mb-0" style="font-weight: bold; display: inline-block"><del><fmt:formatNumber value="${accessory.value.accessory.unit_price}" pattern="#,###"/> ₫</del></h5>
                                                    <h5 style="display: inline-block; border-radius: 10px; background-color: #cccccc; padding: 0 5px 0 5px; color: black;"> -${accessory.value.accessory.discount}%</h5>
                                                    <h5 style="font-size: 20px; color: red;"><fmt:formatNumber value="${accessory.value.accessory.unit_price - accessory.value.accessory.unit_price * accessory.value.accessory.discount / 100}" pattern="#,###"/> ₫</h5>
                                                </c:when>
                                                <c:otherwise>
                                                    <h5 class="mb-0" style="font-weight: bold; display: inline-block"><fmt:formatNumber value="${accessory.value.accessory.unit_price}" pattern="#,###"/> ₫</h5>
                                                </c:otherwise>
                                            </c:choose> 
                                        </div>
                                        <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                            <a href="MainController?action=RemoveAccessoryFromCart&accessory_id=${accessory.key}" class="text-danger"><img src="assets/images/remove-button.png"/></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                        <div class="card mb-4">
                            <div class="card-body p-4 d-flex flex-row">
                                <div class="form-outline flex-fill">
                                    <input type="text" id="form1" class="form-control form-control-lg" placeholder="Nhập mã khuyến mãi" />
                                </div>
                                <button type="button" class="btn btn-outline-warning btn-lg ms-3">Áp dụng</button>
                            </div>
                        </div><hr>
                        <h3 style="text-align: right">Tổng cộng</h3>
                        <h4 style="text-align: right"><fmt:formatNumber value="${sessionScope.CART.cartTotalPrice}" pattern="#,###"/> ₫</h4>

                        <div class="card">
                            <div class="card-body">
                                <form action="MainController">
                                    <input type="hidden" name="action" value="NavToCheckout"/>
                                    <button type="submit" class="btn btn-warning btn-block btn-lg">Tiến hành thanh toán</button>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>


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

        <!-- jQuery -->
        <%@include file="../layout/message.jsp" %>
        <script src="assets/js/jquery-2.1.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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
                                                        });
        </script>
    </body>
</html>
