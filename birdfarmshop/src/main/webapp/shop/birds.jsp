<%-- 
    Document   : birds
    Created on : Sep 13, 2023, 11:19:25 PM
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

        <title>V.E.T - Vẹt Cảnh</title>

        <!-- Additional CSS Files -->
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">
        <link rel="stylesheet" href="assets/css/owl-carousel.css">
        <link rel="stylesheet" href="assets/css/lightbox.css">

        <style>
            .bird-thumbnail{
                width: 358.44px;
                height: 400px;
            }
            .thumb img {
                width: 358.44px !important;
                height: 400px;
            }
            .activeNav{
                background-color: black;
                color: white !important;
            }
            .search-bar {
                margin: 0 0 10px 120px;
                border: 5px;
                border-radius: 8px;
                border: 1px solid rgb(221, 221, 227);
            }
            .search-bar input {
                border: 0;
                background: none;
                outline: none;
            }
            .search-bar input[type=submit] {
                float: right;
            }
            .search-bar img {
                margin-left: 5px;
            }
            
            .type {
                cursor: pointer;
                background-color: #cccccc;
                padding: 0 0 0 5px; /*top right bot left*/
                margin: 5px 0 5px 5px;
            }
            .type + ol {
                display: none;
            }
            #typeList-1, #typeList-2, #typeList-3, #typeList-4 {
                margin-left: 10px;
            }
            
            .position-sticky li {
                margin-bottom: 5px;
            }
            a {
                color: black;
            }
        </style>
    </head>

    <body>
        <c:url var="toHome" value="MainController?action=NavToHome"/>
        <c:url var="toCompare" value="MainController?action=NavToCompare"/>
        <c:url var="toLogin" value="MainController?action=NavToLogin"/>
        <c:url var="logout" value="MainController?action=Logout"/>
        <c:url var="toAccessories" value="MainController?action=NavToAccessory&amount=0"/>
        <c:url var="toBirds" value="MainController?action=NavToBird&page=1"/>
        <c:url var="toBirdNests" value="MainController?action=NavToBirdNests"/>
        <c:url var="toCart" value="MainController?action=NavToCart"/>
        <c:url var="toProfile" value="MainController?action=NavToProfile"/>
        <c:url var="toOrders" value="MainController?action=NavToOrders"/>
        <c:url var="toShopOrders" value="MainController?action=NavToShopOrders"/>
        <c:url var="toAccounts" value="MainController?action=NavToAccounts"/>
        <c:url var="toReports" value="MainController?action=NavToReports"/>
        <c:url var="toPair" value="MainController?action=NavToPairBirds"/>

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
                                    <li class="submenu"><a href="#" class="active">Sản phẩm</a>
                                        <ul>
                                            <li><a href="${pageScope.toBirds}" class="active">Vẹt cảnh</a></li>
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
                                        <li id="show-cart" class="scroll-to-section">
                                            <a href="${pageScope.toCart}"><i style="font-size: 25px" class="fa fa-shopping-cart" aria-hidden="true"></i></a>
                                                <c:if test="${sessionScope.CART_BIRD == null}">
                                                <div class="cart-amount">0</div>
                                            </c:if>
                                            <c:if test="${sessionScope.CART_BIRD != null}">
                                                <div class="cart-amount">${sessionScope.CART_BIRD.getSize()}</div>
                                            </c:if>
                                        </li>
                                        <c:if test="${sessionScope.LOGIN_USER == null}">
                                            <li  class="scroll-to-section"> <a href="${pageScope.toLogin}">Đăng nhập</a></li>
                                            </c:if>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${sessionScope.LOGIN_USER.role == 'admin' || sessionScope.LOGIN_USER.role == 'manager'}">
                                    <li class="submenu"><a href="" class="active">Sản phẩm</a>
                                        <ul>
                                            <li><a href="#" class="active">Vẹt cảnh</a></li>
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
                            <h2>Vẹt cảnh</h2>
                            <span>Những chú vẹt thông minh và đáng yêu nhất đã có mặt tại V.E.T</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ***** Main Banner Area End ***** -->


        <!-- ***** Products Area Starts ***** -->
        <section class="section" id="products">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-heading">
                            <h2>Sản phẩm của chúng tôi</h2>
                        </div>
                    </div>
                    
                <div class="search-bar">
                    <form action="MainController" method="GET">
                        <input type="hidden" name="action" value="SearchBird">
                        <img style="width: 15px; height: 15px;" src="assets/images/search.png"/>
                        <input type="text" name="txtBirdName" id="search" placeholder="Tìm kiếm" value="${txtBirdName}">
                        <input type="submit" value="Tìm kiếm">
                    </form>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row">
                    <!-- Sidebar -->
                    <nav class="col-md-3 col-lg-2 d-md-block bg-light sidebar">
                        <div class="position-sticky">
                            <h3>Phân loại theo</h3>
                            <div class="type" onclick="toggleList('typeList-1')">Loài</div>
                            <ol style="display: block;" id="typeList-1">
                                <li><input type="checkbox" id="type-1"><label for="type-1">Châu Phi</label></li>
                                <li><input type="checkbox" id="type-2"><label for="type-2">Châu Á</label></li>
                                <li><input type="checkbox" id="type-3"><label for="type-3">Châu Úc</label></li>
                                <li><input type="checkbox" id="type-4"><label for="type-4">Nam Mỹ (Amazon)</label></li>
                                <li><input type="checkbox" id="type-5"><label for="type-5">Nam Mỹ (Macaw)</label></li>
                            </ol>
                            <div class="type" onclick="toggleList('typeList-2')">Giá cả</div>
                            <ol style="display: block;" id="typeList-2">
                                <li><input type="checkbox" id="type-6" name="txtPrice" value="cheap"><label for="type-6">dưới 5,000,000đ</label></li>
                                <li><input type="checkbox" id="type-7" name="txtPrice" value="median"><label for="type-7">5,000,000 - 20,000,000</label></li>
                                <li><input type="checkbox" id="type-8" name="txtPrice" value="high"><label for="type-8">trên 20,000,000</label></li>
                            </ol>
                            <div class="type" onclick="toggleList('typeList-3')">Giống</div>
                            <ol style="display: block;" id="typeList-3">
                                <li><input type="checkbox" id="type-9" name="txtGender" value="male"><label for="type-9">Đực</label></li>
                                <li><input type="checkbox" id="type-10" name="txtGender" value="female"><label for="type-10">Cái</label></li>
                            </ol>
                            <div class="type" onclick="toggleList('typeList-4')">Tuổi</div>
                            <ol style="display: block;" id="typeList-4">
                                <li><input type="checkbox" id="type-11" name="txtAge" value="lessThan2"><label for="type-11">dưới 1 tuổi</label></li>
                                <li><input type="checkbox" id="type-12" name="txtAge" value="from2To7"><label for="type-12">từ 1 - 7 tuổi</label></li>
                                <li><input type="checkbox" id="type-13" name="txtAge" value="moreThan7"><label for="type-13">trên 7 tuổi</label></li>
                            </ol>
                        </div>
                    </nav>
                    <!-- Nội dung chính -->
                    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                        <div id="content" class="row">
                            <c:set var="SEARCHLIST" value="${requestScope.SEARCHLIST}"/>
                            <c:set var="BIRDLISTBYBREED_ID" value="${requestScope.BIRDLISTBYBREED_ID}"/> 
                            <c:set var="BIRDLIST" value="${requestScope.BIRDLIST}"/>
                                <div id="content" class="row">
                                    <c:choose>
                                        <c:when test="${SEARCHLIST != null}">
                                            <c:if test="${requestScope.SearchingNotMatch != null}">
                                                <h4 style="margin-left: 15px; color: #ff3333;">${requestScope.SearchingNotMatch}</h4>
                                            </c:if>
                                            <c:if test="${not empty SEARCHLIST}">
                                                    <c:forEach items="${SEARCHLIST}" var="bird">
                                                        <div class="bird col-lg-4">
                                                            <div class="item">
                                                                <div class="thumb">
                                                                    <div class="hover-content">
                                                                        <ul>
                                                                            <li><a href="MainController?action=NavToBirdDetails&bird_id=${bird.bird_id}"><i class="fa fa-eye"></i></a></li>
                                                                            <li><a href="MainController?action=AddtoCart&bird_id=${bird.bird_id}"><i class="fa fa-shopping-cart"></i></a></li>
                                                                        </ul>
                                                                    </div>
                                                                    <img class="bird-thumbnail" src="${bird.image_url}" alt="">
                                                                </div>
                                                                <div class="down-content">
                                                                    <h4>${bird.bird_name}</h4>
                                                                    <c:choose>
                                                                        <c:when test="${bird.discount > 0}">
                                                                            <span>
                                                                                <span style="display: inline-block;"><del><fmt:formatNumber value="${bird.price}" pattern="#,###"/> ₫</del></span>
                                                                                <span style="display: inline-block; border-radius: 10px; background-color: #cccccc; padding: 0 5px 0 5px; color: black;"> -${bird.discount}%</span>
                                                                                <span style="font-size: 20px; color: red;"><fmt:formatNumber value="${bird.price - bird.price * bird.discount / 100}" pattern="#,###"/> ₫<span>
                                                                            </span>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <span><fmt:formatNumber value="${bird.price}" pattern="#,###"/> ₫</span>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                            </c:if>
                                        </c:when>
                                        <c:when test="${BIRDLISTBYBREED_ID != null}">
                                            <c:if test="${not empty BIRDLISTBYBREED_ID}">
                                                    <c:forEach items="${BIRDLISTBYBREED_ID}" var="bird">
                                                        <div class="bird col-lg-4">
                                                            <div class="item">
                                                                <div class="thumb">
                                                                    <div class="hover-content">
                                                                        <ul>
                                                                            <li><a href="MainController?action=NavToBirdDetails&bird_id=${bird.bird_id}"><i class="fa fa-eye"></i></a></li>
                                                                            <li><a href="MainController?action=AddtoCart&bird_id=${bird.bird_id}"><i class="fa fa-shopping-cart"></i></a></li>
                                                                        </ul>
                                                                    </div>
                                                                    <img class="bird-thumbnail" src="${bird.image_url}" alt="">
                                                                </div>
                                                                <div class="down-content">
                                                                    <h4>${bird.bird_name}</h4>
                                                                    <c:choose>
                                                                        <c:when test="${bird.discount > 0}">
                                                                            <span>
                                                                                <span style="display: inline-block;"><del><fmt:formatNumber value="${bird.price}" pattern="#,###"/> ₫</del></span>
                                                                                <span style="display: inline-block; border-radius: 10px; background-color: #cccccc; padding: 0 5px 0 5px; color: black;"> -${bird.discount}%</span>
                                                                                <span style="font-size: 20px; color: red;"><fmt:formatNumber value="${bird.price - bird.price * bird.discount / 100}" pattern="#,###"/> ₫<span>
                                                                            </span>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <span><fmt:formatNumber value="${bird.price}" pattern="#,###"/> ₫</span>
                                                                        </c:otherwise>
                                                                    </c:choose> 
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                            </c:if>
                                        </c:when>        
                                        <c:otherwise>
                                            <c:if test="${BIRDLIST != null}">
                                                <c:if test="${not empty BIRDLIST}">
                                                    <c:forEach items="${BIRDLIST}" var="bird">
                                                        <div class="bird col-lg-4">
                                                            <div class="item">
                                                                <div class="thumb">
                                                                    <div class="hover-content">
                                                                        <ul>
                                                                            <li><a href="MainController?action=NavToBirdDetails&bird_id=${bird.bird_id}"><i class="fa fa-eye"></i></a></li>
                                                                            <li><a href="MainController?action=AddtoCart&bird_id=${bird.bird_id}"><i class="fa fa-shopping-cart"></i></a></li>
                                                                        </ul>
                                                                    </div>
                                                                    <img class="bird-thumbnail" src="${bird.image_url}" alt="">
                                                                </div>
                                                                <div class="down-content">
                                                                    <h4>${bird.bird_name}</h4>
                                                                    <c:choose>
                                                                        <c:when test="${bird.discount > 0}">
                                                                            <span>
                                                                                <span style="display: inline-block;"><del><fmt:formatNumber value="${bird.price}" pattern="#,###"/> ₫</del></span>
                                                                                <span style="display: inline-block; border-radius: 10px; background-color: #cccccc; padding: 0 5px 0 5px; color: black;"> -${bird.discount}%</span>
                                                                                <span style="font-size: 20px; color: red;"><fmt:formatNumber value="${bird.price - bird.price * bird.discount / 100}" pattern="#,###"/> ₫<span>
                                                                            </span>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <span><fmt:formatNumber value="${bird.price}" pattern="#,###"/> ₫</span>
                                                                        </c:otherwise>
                                                                    </c:choose> 
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </c:if>
                                            </c:if>
                                        </c:otherwise>
                                    </c:choose>
                                                
                                    <div class="col-lg-12">
                                        <div class="pagination">
                                            <c:choose>
                                                <c:when test="${SEARCHLIST != null && not empty SEARCHLIST}">
                                                    <c:if test="${noOfPages >= 1}">
                                                        <ul>
                                                            <li id="page-${1}"><a href="MainController?action=SearchBird&page=1&txtBirdName=${txtBirdName}"><<</a></li>
                                                            <c:forEach begin="1" end="${noOfPages}" var="i">
                                                            <li id="page-${i}"><a class="${i == requestScope.currentPage ? "activeNav":""}" href="MainController?action=SearchBird&page=${i}&txtBirdName=${txtBirdName}">${i}</a></li>
                                                            </c:forEach>
                                                            <li id="page-${noOfPages}"><a href="MainController?action=SearchBird&page=${noOfPages}&txtBirdName=${txtBirdName}">>></a></li>
                                                        </ul>
                                                    </c:if>
                                                </c:when>
                                                <c:when test="${BIRDLISTBYBREED_ID != null && not empty BIRDLISTBYBREED_ID}">
                                                    <c:if test="${noOfPages >= 1}">
                                                        <ul>
                                                            <li id="page-${1}"><a href="MainController?action=SearchBird&page=1&breed_id=${breed_id}"><<</a></li>
                                                            <c:forEach begin="1" end="${noOfPages}" var="i">
                                                            <li id="page-${i}"><a class="${i == requestScope.currentPage ? "activeNav":""}" href="MainController?action=RenderBirdByBreed_id&page=${i}&breed_id=${breed_id}">${i}</a></li>
                                                            </c:forEach>
                                                            <li id="page-${noOfPages}"><a href="MainController?action=SearchBird&page=${noOfPages}&breed_id=${breed_id}">>></a></li>
                                                        </ul>
                                                    </c:if>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:if test="${noOfPages > 1}">
                                                        <ul>
                                                            <li id="page-${1}"><a href="MainController?action=NavToBird&page=1"><<</a></li>
                                                            <c:forEach begin="1" end="${noOfPages}" var="i">
                                                                <li id="page-${i}"><a class="${i == requestScope.currentPage ? "activeNav":""}" href="MainController?action=NavToBird&page=${i}">${i}</a></li>
                                                            </c:forEach>
                                                            <li id="page-${noOfPages}"><a href="MainController?action=NavToBird&page=${noOfPages}">>></a></li>
                                                        </ul>
                                                    </c:if>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                        </div>
                    </main>            
                </div>
            </div>
        </section>
        <!-- ***** Products Area Ends ***** -->

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
            
            function toggleList(listId) {
                var list = document.getElementById(listId);
                if (list.style.display === "none" || list.style.display === "") {
                    list.style.display = "block";
                } else {
                    list.style.display = "none";
                }
            }

//            var listItems = document.querySelectorAll("#page-${i}");
//            listItems.forEach(function (item) {
//                item.addEventListener("click", function () {\
//                    listItems.forEach(function (li) {
//                        li.classList.remove("active");
//                    });
//                    item.classList.add("active");
//                });
//            });

        </script>

    </body>

</html>