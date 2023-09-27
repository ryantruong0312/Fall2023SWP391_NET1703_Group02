<%-- 
    Document   : pair-birds
    Created on : Sep 13, 2023, 11:23:22 PM
    Author     : tlminh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V.E.T - Nhân giống</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">
        <link rel="stylesheet" href="assets/css/owl-carousel.css">
        <link rel="stylesheet" href="assets/css/lightbox.css">
        <link rel="stylesheet" href="assets/css/bird-compare.css">
    </head>

    <body>
        <!-- ***** Header Area Start ***** -->
        <header class="header-area header-sticky">
            <div class="container">
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
                                    <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.role == 'customer' || sessionScope.LOGIN_USER.role == 'staff'}">
                                    <li class="submenu"><a href="">Sản phẩm</a>
                                        <ul>
                                            <li><a href="${pageScope.toBirds}">Vẹt cảnh</a></li>
                                            <li><a href="${pageScope.toBirdNests}">Tổ chim non</a></li>
                                            <li><a href="${pageScope.toAccessories}">Phụ kiện</a></li>
                                        </ul>
                                    </li>
                                    <li class="scroll-to-section"><a href="#" class="active">So sánh</a></li>
                                        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.role == 'customer'}">
                                            <c:if test="${sessionScope.LOGIN_USER.role == 'staff'}">
                                            <li class="scroll-to-section"><a href="${pageScope.toShopOrders}">Đơn hàng</a></li>
                                            </c:if>
                                        <li class="scroll-to-section"><a href="${pageScope.toPair}">Nhân giống</a></li>
                                        <li id="show-cart" class="scroll-to-section">
                                            <a href="${pageScope.toCart}"><i style="font-size: 25px" class="fa fa-shopping-cart" aria-hidden="true"></i></a>
                                            <div class="cart-amount">8</div>
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
                                    <li class="scroll-to-section"><a href="#" class="active">So sánh</a></li>
                                    <li class="scroll-to-section"><a href="${pageScope.toShopOrders}">Đơn hàng</a></li>
                                    <li class="scroll-to-section"><a href="${pageScope.toAccounts}">Tài khoản</a></li>
                                    <li class="scroll-to-section"><a href="${pageScope.toReports}">Thống kê</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.LOGIN_USER != null}">
                                    <li class="submenu"><a href="">${LOGIN_USER.fullName}</a>
                                        <ul>
                                            <li><a href="${pageScope.toProfile}">Cá nhân</a></li>
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
                            <h2>So sánh thông tin</h2>
                            <span>Xem và đánh giá sự tương quan giữa hai cá thể vẹt của shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ***** Main Banner Area End ***** -->

        <main>
            <div class="comparison-container">
                <!-- First Column -->
                <div class="comparison-column">
                    <div class="column-content">
                        <h2>Chọn một chú vẹt trống</h2>

                        <!-- EL to populate the category combo box -->
                        <select class="combo-box" id="breedSelect1" onchange="updateBirdNames1()">
                            <option>Chọn giống vẹt</option>
                            <c:forEach items="${requestScope.BIRD_BREEDS}" var="breed">
                                <option value="${breed.breed_id}">${breed.breed_name}</option>
                            </c:forEach>
                        </select>

                        <!-- EL to populate the bird name combo box -->
                        <select class="combo-box" id="birdSelect1">
                            <!-- This is initially empty and will be populated dynamically based on the selected breed -->
                        </select>

                        <!-- Additional rows to display bird information -->
                        <div id="birdInformation1">
                            <div class="bird-info-row">
                                <!-- Placeholder for bird image -->
                                <img id="birdImage1" src="assets/images/bird-compare-1.jpg" alt="Bird Image">
                            </div>
                            <div class="bird-info-row info-name">
                                <span id="birdName1"></span>
                            </div>
                            <div class="bird-info-row">
                                <span class="info-title">Tuổi</span>
                                <span id="birdAge1" class="info-content"></span>
                            </div>
                            <div class="bird-info-row">
                                <span class="info-title">Thành tích</span>
                                <pre id="birdAchievement1" class="info-content"></pre>
                            </div>
                            <div class="bird-info-row">
                                <span class="info-title">Số lứa sinh sản</span>
                                <span id="birdReproductionHistory1" class="info-content"></span>
                            </div>
                            <div class="bird-info-row">
                                <span class="info-title">Tình trạng</span>
                                <span id="birdStatus1" class="info-content"></span>
                            </div>
                            <div class="bird-info-row">
                                <span class="info-title">Giá</span>
                                <span id="birdPrice1" class="info-content" pattern="#,###"></span>
                            </div>
                        </div>
                        <div class="btn-detail">
                            <button onclick="redirectToBirdDetails1()">Xem thêm</button>
                        </div>
                    </div>
                </div>
                <!-- Second Column -->
                <div class="comparison-column">
                    <div class="column-content">
                        <h2>Chọn một chú vẹt mái</h2>

                        <!-- EL to populate the category combo box -->
                        <select class="combo-box" id="breedSelect2" onchange="updateBirdNames2()">
                            <option>Chọn giống vẹt </option>
                            <c:forEach items="${requestScope.BIRD_BREEDS}" var="breed">
                                <option value="${breed.breed_id}">${breed.breed_name}</option>
                            </c:forEach>
                        </select>

                        <!-- EL to populate the bird name combo box -->
                        <select class="combo-box" id="birdSelect2">
                            <!-- This is initially empty and will be populated dynamically based on the selected breed -->
                        </select>

                        <!-- Additional rows to display bird information -->
                        <div id="birdInformation2">
                            <div class="bird-info-row">
                                <!-- Placeholder for bird image -->
                                <img id="birdImage2" src="assets/images/bird-compare-2.jpg" alt="Bird Image">
                            </div>
                            <div class="bird-info-row info-name">
                                <span id="birdName2"></span>
                            </div>
                            <div class="bird-info-row">
                                <span class="info-title">Tuổi</span>
                                <span id="birdAge2" class="info-content"></span>
                            </div>
                            <div class="bird-info-row">
                                <span class="info-title">Thành tích</span>
                                <pre id="birdAchievement2" class="info-content"></pre>
                            </div>  
                            <div class="bird-info-row">
                                <span class="info-title">Số lứa sinh sản</span>
                                <span id="birdReproductionHistory2" class="info-content"></span>
                            </div>
                            <div class="bird-info-row">
                                <span class="info-title">Tình trạng</span>
                                <span id="birdStatus2" class="info-content"></span>
                            </div>
                            <div class="bird-info-row">
                                <span class="info-title">Giá</span>
                                <span id="birdPrice2" class="info-content"></span>
                            </div>
                        </div>
                        <div class="btn-detail">
                            <button onclick="redirectToBirdDetails1()">Xem thêm</button>
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
                            <li><a href="#">Vẹt cảnh</a></li>
                            <li><a href="#">Tổ chim non</a></li>
                            <li><a href="#">Phụ kiện</a></li>
                            <li><a href="#">So sánh</a></li>
                            <li><a href="#">Nhân giống</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3">
                        <h4>Đường dẫn hữu ích</h4>
                        <ul>
                            <li><a href="#">Trang chủ</a></li>
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
    </body>
</html>