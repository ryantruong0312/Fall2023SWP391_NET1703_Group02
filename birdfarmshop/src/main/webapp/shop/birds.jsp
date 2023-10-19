<%-- 
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
                                    <li class="submenu"><a href="" class="active">Sản phẩm</a>
                                        <ul>
                                            <li><a href="${pageScope.toBirds}" class="active">Vẹt cảnh</a></li>
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
        <div class="py-5 px-2 layout-item" style="border-bottom: none" id="top">
            <form id="selectBird" action="MainController" method="POST">
                <input type="hidden" name="action" value="NavToBird"> 
                <div class="d-flex justify-content-center">
                    <div class="search-bar">
                        <img style="width: 15px; height: 15px;" src="assets/images/search.png"/>
                        <input type="text" name="txtBirdName" id="search" placeholder="Tìm kiếm" value="${requestScope.SEARCH}">
                        <input type="hidden" name="page" value="1" />
                        <input type="submit" value="Tìm kiếm">
                    </div>
                </div>
                <c:if test="${sessionScope.LOGIN_USER.role == 'manager' || sessionScope.LOGIN_USER.role == 'admin'}">
                    <div class="new-item d-flex justify-content-center">
                        <a href="MainController?action=AddNewBird"><span>Thêm mới chim</span></a>
                    </div>
                </c:if>
                <main class="my-5">
                    <div class="container-fluid">
                        <div class="row m-0">
                            <div class="col-md-3 col-xs-12">
                                <div class="d-flex justify-content-between">
                                    <h4>Phân loại theo</h4>
                                    <button name="clear" value="clear" class=" btn-sm btn-danger text-nowrap border-0">Bỏ lọc</button>
                                </div>
                                <div class="type">Loài</div>
                                <ol class="d-block" id="typeList-1">   
                                    <li class="ml-2"><input type="radio" id="type-0" name="txtBreedId" ${requestScope.BREED_ID == null ? "checked":""} value="All"><label for="type-0">Tất cả các loài vẹt</label></li>
                                        <c:forEach var="breed" items="${requestScope.BREEDLIST}" varStatus="counter">
                                        <li class="ml-2"><input type="radio" id="type-${counter.count}" name="txtBreedId" value="${breed.breed_id}" ${requestScope.BREED_ID == breed.breed_id ? "checked":""}><label for="type-${counter.count}">${breed.breed_name}</label></li>
                                        </c:forEach>
                                </ol>
                                <div class="type">Giá cả</div>
                                <ol class="d-block" id="typeList-2">   
                                    <li class="ml-2"><input type="radio" ${requestScope.PRICE == null  ? "checked":""} id="type-65" name="txtPrice" value="All"><label for="type-65">Tất cả</label></li>
                                    <li class="ml-2"><input type="radio" ${requestScope.PRICE == "price < 5000000" ? "checked":""} id="type-6" name="txtPrice" value="price < 5000000"><label for="type-6">Dưới 5,000,000₫</label></li>
                                    <li class="ml-2"><input type="radio" ${requestScope.PRICE == "price >= 5000000 AND price <= 20000000" ? "checked":""} id="type-7" name="txtPrice" value="price >= 5000000 AND price <= 20000000"><label for="type-7">5,000,000₫ - 20,000,000₫</label></li>
                                    <li class="ml-2"><input type="radio" ${requestScope.PRICE == "price > 20000000" ? "checked":""} id="type-8" name="txtPrice" value="price > 20000000"><label for="type-8">Trên 20,000,000₫</label></li>
                                </ol>
                                <div class="type">Giống</div>
                                <ol class="d-block" id="typeList-3">
                                    <li class="ml-2"><input type="radio" ${requestScope.GENDER == null ? "checked":""} id="type-95" name="txtGender" value="All"><label for="type-95">Tất cả</label></li>
                                    <li class="ml-2"><input type="radio" ${requestScope.GENDER == "1" ? "checked":""} id="type-9" name="txtGender" value="1"><label for="type-9">Trống</label></li>
                                    <li class="ml-2"><input type="radio" ${requestScope.GENDER == "0" ? "checked":""} id="type-10" name="txtGender" value="0"><label for="type-10">Mái</label></li>
                                </ol>
                                <div class="type">Tuổi</div>
                                <ol class="d-block" id="typeList-4">
                                    <li class="ml-2"><input type="radio" ${requestScope.AGE == null ? "checked":""}  id="type-115" name="txtAge" value="All"><label for="type-115">Tất cả</label></li>
                                    <li class="ml-2"><input type="radio" ${requestScope.AGE == "DATEDIFF(MONTH, birthday, GETDATE()) < 5" ? "checked":""} id="type-11" name="txtAge" value="DATEDIFF(MONTH, birthday, GETDATE()) < 5"><label for="type-11">Dưới 5 tháng</label></li>
                                    <li class="ml-2"><input type="radio" ${requestScope.AGE == "DATEDIFF(MONTH, birthday, GETDATE()) >= 5 AND DATEDIFF(MONTH, birthday, GETDATE()) <= 18" ? "checked":""} id="type-12" name="txtAge" value="DATEDIFF(MONTH, birthday, GETDATE()) >= 5 AND DATEDIFF(MONTH, birthday, GETDATE()) <= 18"><label for="type-12">Từ 5 - 18 tháng</label></li>
                                    <li class="ml-2"><input type="radio" ${requestScope.AGE == "DATEDIFF(MONTH, birthday, GETDATE()) > 18" ? "checked":""} id="type-13" name="txtAge" value="DATEDIFF(MONTH, birthday, GETDATE()) > 18"><label for="type-13">Trên 18 tháng</label></li>
                                </ol>
                            </div>
                            <div class="col-md-9 col-xs-12" style="padding: 0 0 1px 0  ">
                                <div class="row mx-1">
                                    <c:choose>
                                        <c:when test="${not empty requestScope.BIRDLIST}">
                                            <c:forEach var="bird" items="${requestScope.BIRDLIST}">
                                                <div class="col-xl-4 col-md-6 col-sm-6">
                                                    <div class="card mt-1 mb-3 card-custom">
                                                        <div class="thumb-img">
                                                            <img src="${bird.image_url}" class="card-img-top" alt="${bird.bird_name}">
                                                            <c:if test="${bird.discount > 0}">
                                                                <span class="tag-discount"> -${bird.discount}%</span>
                                                            </c:if>
                                                            <div class="hover-card">
                                                                <ul class="d-flex justify-content-center">
                                                                    <li>
                                                                        <a href="MainController?action=NavToBirdDetails&bird_id=${bird.bird_id}">
                                                                            <i class="fa fa-eye"></i>
                                                                        </a>
                                                                    </li>
                                                                    <c:if test="${(sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.role == 'customer') && bird.status == 'Còn hàng'}">
                                                                        <li>
                                                                            <a class="bird-cart" data-value="${bird.bird_id}">
                                                                                <i class="fa fa-shopping-cart"></i>
                                                                            </a>
                                                                        </li>
                                                                    </c:if>
                                                                </ul>
                                                            </div>
                                                            <c:if test="${bird.status == 'Đã bán'}">
                                                                <div class="overlay-text">Đã bán</div>
                                                            </c:if>
                                                            <c:if test="${bird.status == 'Đang sinh sản'}">
                                                                <div class="overlay-text">Đang sinh sản</div>
                                                            </c:if>
                                                            <c:if test="${bird.status == 'Đang ghép cặp'}">
                                                                <div class="overlay-text">Đang ghép cặp</div>
                                                            </c:if>
                                                        </div>
                                                        <div class="card-body">
                                                            <h5 class="card-title font-weight-bold text-center">${bird.bird_name}</h5>
                                                            <div class="card-text text-center">
                                                                <c:choose>
                                                                    <c:when test="${bird.discount > 0}">
                                                                        <span class="d-block"><del><fmt:formatNumber value="${bird.price}" pattern="#,###"/> ₫</del></span>
                                                                        <span class="d-block" style="font-size: 1.2rem; color: red;">Giá: <fmt:formatNumber value="${bird.price - bird.price * bird.discount / 100}" pattern="#,###"/> ₫</span>
                                                                    </c:when>                                                    
                                                                    <c:otherwise>
                                                                        <span style="font-size: 1.2rem;">Giá: <fmt:formatNumber value="${bird.price}" pattern="#,###"/> ₫</span>
                                                                    </c:otherwise>
                                                                </c:choose> 
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <h4 class="m-auto">Không có sản phẩm nào</h4>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div id="products" class="row justify-content-center">
                                    <c:if test="${noOfPages != 1}">
                                        <div class="d-flex float-right align-items-center pagination">
                                            <c:set var="numberOfPage" value="${requestScope.currentPage}"/>
                                            <input type="hidden" name="numberOfPage" value="${requestScope.noOfPages}"/>
                                            <input type="hidden" name="page" value="${numberOfPage}"/>
                                            <c:if test="${noOfPages >= 1 && noOfPages <= 5}">  
                                                <ul class="d-flex">
                                                    <c:if test="${requestScope.currentPage > 1}">
                                                        <li>
                                                            <a class="start-page"><<</a>
                                                        </li>
                                                    </c:if>
                                                    <c:forEach begin="1" end="${noOfPages}" var="i">
                                                        <li class="${i == requestScope.currentPage ? "active":""}" >
                                                            <a data-value="${i}" onclick="takePage(this)">${i}</a>
                                                        </li>
                                                    </c:forEach>
                                                    <c:if test="${requestScope.currentPage < noOfPages}">
                                                        <li>
                                                            <a class="end-page" >>></a>
                                                        </li>
                                                    </c:if>
                                                </ul>
                                            </c:if>    
                                            <c:if test="${noOfPages > 5}">
                                                <ul class="d-flex">
                                                    <c:if test="${numberOfPage > 2}">
                                                        <c:if test="${requestScope.currentPage > 1}">
                                                            <li id="page">
                                                                <a class="start-page"><<</a>
                                                            </li>
                                                        </c:if>
                                                        <c:if test="${numberOfPage + 2 < noOfPages}">
                                                            <c:set var="beginItem" value="${numberOfPage - 2 }"/>
                                                            <c:set var="endItem" value="${numberOfPage + 2 }"/>
                                                        </c:if>
                                                        <c:if test="${numberOfPage + 2 >= noOfPages}">
                                                            <c:set var="beginItem" value="${noOfPages - 4}"/>
                                                            <c:set var="endItem" value="${noOfPages}"/>
                                                        </c:if>
                                                        <c:forEach begin="${beginItem}" end="${endItem}" var="i">
                                                            <li class="${i == requestScope.currentPage ? "active":""}">
                                                                <a data-value="${i}" onclick="takePage(this)">${i}</a>
                                                            </li>
                                                        </c:forEach>
                                                        <c:if test="${requestScope.currentPage < noOfPages}">
                                                            <li>
                                                                <a class="end-page" >>></a>
                                                            </li>
                                                        </c:if>
                                                    </c:if>
                                                    <c:if test="${numberOfPage <= 2}">
                                                        <c:if test="${requestScope.currentPage > 1}">
                                                            <li>
                                                                <a class="start-page"><<</a>
                                                            </li>
                                                        </c:if>
                                                        <c:forEach var="i" begin="1" end="5">
                                                            <li class="${i == requestScope.currentPage ? "active":""}">
                                                                <a data-value="${i}" onclick="takePage(this)">${i}</a>
                                                            </li>       
                                                        </c:forEach>                   
                                                        <c:if test="${requestScope.currentPage < noOfPages}">
                                                            <li>
                                                                <a class="end-page" >>></a>
                                                            </li>
                                                        </c:if>
                                                    </c:if>   
                                                </ul>
                                            </c:if>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </main>
            </form>
        </div>
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

        <script src="assets/js/jquery-2.1.0.min.js"></script>
        <!-- jQuery -->
        <%@include file="../layout/message.jsp" %>

        <!-- Bootstrap -->
        <script src="assets/js/popper.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- Plugins -->
        <script src="assets/js/owl-carousel.js"></script>
        <script src="assets/js/accordions.js"></script>
        <script src="assets/js/datepicker.js"></script>
        <script src="assets/js/scrollreveal.min.js"></script>
        <!--        <script src="assets/js/waypoints.min.js"></script>-->
        <script src="assets/js/jquery.counterup.min.js"></script>
        <script src="assets/js/imgfix.min.js"></script> 
        <script src="assets/js/slick.js"></script> 
        <script src="assets/js/lightbox.js"></script> 
        <script src="assets/js/isotope.js"></script> 

        <!-- Global Init -->
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
                                                                        $("input[name=txtBreedId]").change(function () {
                                                                            $("#selectBird").submit();
                                                                        });
                                                                        $("input[name=txtPrice]").change(function () {
                                                                            $("#selectBird").submit();
                                                                        });
                                                                        $("input[name=txtGender]").change(function () {
                                                                            $("#selectBird").submit();
                                                                        });
                                                                        $("input[name=txtAge]").change(function () {
                                                                            $("#selectBird").submit();
                                                                        });
                                                                        $(".start-page").click(function () {
                                                                            $('input[name=page]').val(1);
                                                                            $("#selectBird").submit();
                                                                        });
                                                                        $(".end-page").click(function () {
                                                                            let endPage = $('input[name=numberOfPage]').val();
                                                                            $('input[name=page]').val(endPage);
                                                                            $("#selectBird").submit();
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
                                                                    function takePage(event) {
                                                                        let value = event.getAttribute('data-value');
                                                                        $('input[name=page]').val(value);
                                                                        $("#selectBird").submit();
                                                                    }
        </script>

    </body>

</html>
