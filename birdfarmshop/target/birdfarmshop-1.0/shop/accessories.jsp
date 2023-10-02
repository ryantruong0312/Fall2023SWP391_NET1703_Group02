<%-- 
    Document   : accessories
    Created on : Sep 13, 2023, 11:20:56 PM
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
        <link rel="icon" type="image/png" href="assets/images/logo-title-bar.png"/>
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

        <title>V.E.T - Phụ Kiện</title>

        <!-- Additional CSS Files -->
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">
        <link rel="stylesheet" href="assets/css/owl-carousel.css">
        <link rel="stylesheet" href="assets/css/lightbox.css">

            <style>
            .thumb{
                width: 370px;
                height: 350px;
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
            .bird-pg li{
                cursor: pointer;
            }
            a {
                color: black;
            }
        </style>
    </head>

    <body>
        <c:url var="toHome" value="MainController?action=NavToHome"/>
        <c:url var="toLogin" value="MainController?action=NavToLogin"/>
        <c:url var="logout" value="MainController?action=Logout"/>
        <c:url var="toAccessories" value="MainController?action=NavToAccessory&amount=0"/>
        <c:url var="toCompare" value="MainController?action=NavToCompare"/>
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
                                    <li class="submenu"><a href="" class="active">Sản phẩm</a>
                                        <ul>
                                            <li><a href="${pageScope.toBirds}">Vẹt cảnh</a></li>
                                            <li><a href="${pageScope.toBirdNests}">Tổ chim non</a></li>
                                            <li><a href="#" class="active">Phụ kiện</a></li>
                                        </ul>
                                    </li>
                                    <li class="scroll-to-section"><a href="${pageScope.toCompare}">So sánh</a></li>
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
                                    <li class="submenu"><a href="" class="active">Sản phẩm</a>
                                        <ul>
                                            <li><a href="${pageScope.toBirds}">Vẹt cảnh</a></li>
                                            <li><a href="${pageScope.toBirdNests}">Tổ chim non</a></li>
                                            <li><a href="#" class="active">Phụ kiện</a></li>
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
                            <h2>Phụ kiện cho vẹt</h2>
                            <span>Chăm sóc chú vẹt của bạn với những phụ kiện và vật dụng không thể thiếu tại V.E.T </span>
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
                    <form id="selectAccessory" action="MainController" method="POST">
                        <input type="hidden" name="action" value="NavToAccessory"> 
                        <div class="search-bar">
                            <img style="width: 15px; height: 15px;" src="assets/images/search.png"/>
                            <input type="text" name="txtAccessory" id="search" placeholder="Tìm kiếm" value="${requestScope.SEARCH}">
                            <input type="submit" value="Tìm kiếm">
                        </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <!-- Sidebar -->
                    <nav class="col-md-3 col-lg-2 d-md-block bg-light sidebar">
                        <div class="position-sticky">
                            <h3>Phân loại theo</h3>
                            <div class="type" onclick="toggleList('typeList-1')">Loài</div>
                            <ol style="display: block;" id="typeList-1">
                                <li><input type="radio" id="type-0" ${requestScope.CATEGORY_ID == null ? "checked": ""} name="txtType" value="All"><label for="type-0">Tất cả</label></li>
                                <li><input type="radio" id="type-1" ${requestScope.CATEGORY_ID == "cage" ? "checked": ""} name="txtType" value="cage"><label for="type-1">Lồng & cây đứng</label></li>
                                <li><input type="radio" id="type-2" ${requestScope.CATEGORY_ID == "care" ? "checked": ""} name="txtType" value="care"><label for="type-2">Phụ kiện chăm sóc</label></li>
                                <li><input type="radio" id="type-3" ${requestScope.CATEGORY_ID == "toy" ? "checked": ""} name="txtType" value="toy"><label for="type-3">Phụ kiện trang trí - Đồ chơi</label></li>
                            </ol>
                            <div class="type" onclick="toggleList('typeList-2')">Giá cả</div>
                            <ol style="display: block;" id="typeList-2">
                                  <li><input type="radio" id="type-65" ${requestScope.PRICE == null ? "checked": ""} name="txtPrice" value="All"><label for="type-65">Tất cả</label></li>
                                <li><input type="radio" id="type-6" ${requestScope.PRICE == "unit_price < 300000" ? "checked": ""}  name="txtPrice" value="unit_price < 300000"><label for="type-6">dưới 300,000đ</label></li>
                                <li><input type="radio" id="type-7" ${requestScope.PRICE == "unit_price >= 600000 AND unit_price <= 900000" ? "checked": ""} name="txtPrice" value="unit_price >= 600000 AND unit_price <= 900000"><label for="type-7">300,000 - 600,000</label></li>
                                <li><input type="radio" id="type-8" ${requestScope.PRICE == "unit_price > 900000" ? "checked": ""} name="txtPrice" value="unit_price > 900000"><label for="type-8">trên 900,000</label></li>
                            </ol>
                        </div>
                    </nav>
                    <!-- Nội dung chính -->
                    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                        <div id="content" class="row">
                            <c:if test="${requestScope.error != null}">
                                <div>${error}</div>
                            </c:if>
                            <c:if test="${requestScope.error1 != null}">
                                <div>${error1}</div>
                            </c:if>
                            <c:if test="${requestScope.accessoryList != null}">
                                <c:set var="accessoryList" value="${requestScope.accessoryList}"/>
                                <c:if test="${not empty accessoryList}">
                                    <c:forEach items="${accessoryList}" var="accessory" varStatus="counter">
                                        <div class="bird col-lg-4">
                                            <div class="item">
                                                <div class="thumb">
                                                    <div class="hover-content">
                                                        <ul>
                                                            <li><a href="RenderAccessoryDetailsController?id=${accessory.accessory_id}"><i class="fa fa-eye"></i></a></li>
                                                            <li><a href="AddtoCartController?idAccessory=${accessory.accessory_id}&quantity=1"><i class="fa fa-shopping-cart"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <img class="thumb" src="${accessory.image_url}" alt="">
                                                </div>
                                                <div class="down-content">
                                                    <h4>${accessory.accessory_name}</h4>
                                                    <span><fmt:formatNumber value="${accessory.unit_price}" pattern="#,###"/> ₫</span>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </c:if>
                            <div class="col-lg-12">
                                <div class="pagination bird-pg">
                                    <c:if test="${noOfPages > 1 && noOfPages <= 5}">
                                        <input type="hidden" name="page" value="${requestScope.currentPage}"/>
                                        <ul>
                                            <c:if test="${requestScope.currentPage > 1}">
                                                <li id="page">
                                                    <a class="prev-page"><<</a>
                                                </li>
                                            </c:if>
                                            <c:forEach begin="1" end="${noOfPages}" var="i">
                                                <li id="page-number">
                                                    <a data-value="${i}" onclick="takePage(this)" class="${i == requestScope.currentPage ? "activeNav":""}">${i}</a>
                                                </li>
                                            </c:forEach>
                                            <c:if test="${requestScope.currentPage < noOfPages}">
                                                <li id="page">
                                                    <a class="next-page" >>></a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </c:if>    
                                    <c:if test="${noOfPages > 5}">
                                        <input name="page" value="${requestScope.currentPage}"/>
                                        <c:set var="numberOfPage" value="${requestScope.currentPage}"/>
                                        <ul>
                                            <li id="page">
                                                <a class="prev-page" ><<</a>
                                            </li>
                                            <c:forEach begin="${numberOfPage - 2}" end="${numberOfPage + 2}" var="i">
                                                <li id="page-number">
                                                    <a data-value="${i}" onclick="takePage(this)" class="${i == requestScope.currentPage ? "activeNav":""}">${i}</a>
                                                </li>
                                            </c:forEach>
                                            <li id="page">
                                                <a class="next-page">>></a>
                                            </li>
                                        </ul>
                                    </c:if>
                                </div>
                            </div>
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
        <script src="assets/js/jquery-2.1.0.min.js"></script>

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
                                                                    $("input[name=txtType]").change(function () {
                                                                        $("#selectAccessory").submit();
                                                                    });
                                                                    $("input[name=txtPrice]").change(function () {
                                                                        $("#selectAccessory").submit();
                                                                    });
                                                                    $(".prev-page").click(function () {
                                                                        let  page = $('input[name=page]').val();
                                                                        let prevPage = Number(page) - 1;
                                                                        $('input[name=page]').val(prevPage);
                                                                        $("#selectAccessory").submit();
                                                                    });
                                                                    $(".next-page").click(function () {
                                                                        let  page = $('input[name=page]').val();
                                                                        let nextpage = Number(page) + 1;
                                                                        $('input[name=page]').val(nextpage);
                                                                        $("#selectAccessory").submit();
                                                                    });
                                                                });
                                                                function takePage(event) {
                                                                    let value = event.getAttribute('data-value');
                                                                    $('input[name=page]').val(value);
                                                                    $("#selectAccessory").submit();
                                                                }

        </script>

    </body>

</html>