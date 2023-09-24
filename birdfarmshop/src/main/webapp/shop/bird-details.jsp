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

        <title>Hexashop - Product Detail Page</title>


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

            .left-image img {
                width: 400px;
                height: 404px;
                margin-right: 10px;
            }

            .right-images {
                display: flex;
                flex-direction: column;
            }

            .right-images img {
                width: 200px;
                height: 200px;
                margin-top: 2px;
            }
        </style>
        <script>
            function swapImages(clickedImage) {
                const leftImage = document.querySelector('.left-image img');
                const rightImage1 = document.querySelectorAll('.right-images img')[0];
                const rightImage2 = document.querySelectorAll('.right-images img')[1];

                const tempSrc = leftImage.src;
                leftImage.src = clickedImage.src;
                clickedImage.src = tempSrc;
            }
        </script>


    </head>

    <body>

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
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <nav class="main-nav">
                            <!-- ***** Logo Start ***** -->
                            <a href="../RenderHomeController" class="logo">
                                <img src="assets/images/logo.png">
                            </a>
                            <!-- ***** Logo End ***** -->
                            <!-- ***** Menu Start ***** -->
                            <ul class="nav">
                                <li class="scroll-to-section"><a href="MainController?action=NavToHome">Trang chủ</a></li>
                                    <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.role == 'customer' || sessionScope.LOGIN_USER.role == 'staff'}">

                                    <li class="submenu"><a href="" class="active">Sản phẩm</a>
                                        <ul>
                                            <li><a href="MainController?action=NavToBird&amount=0">Chim vẹt</a></li>
                                            <li><a href="shop/bird-nest.jsp">Tổ chim non</a></li>
                                            <li><a href="MainController?action=NavToAccessory">Phụ kiện</a></li>
                                        </ul>
                                    </li>

                                    <li class="scroll-to-section"><a href="MainController?action=NavToCompare">So sánh</a></li>
                                        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.role == 'customer'}">
                                            <c:if test="${sessionScope.LOGIN_USER.role == 'staff'}">
                                            <li class="scroll-to-section"><a href="">Đơn hàng</a></li>
                                            </c:if>
                                        <li class="scroll-to-section"><a href="">Ghép cặp</a></li>
                                        <li class="scroll-to-section"><a href="../cart-view.jsp">Giỏ hàng</a></li>
                                        <c:if test="${sessionScope.LOGIN_USER == null}">
                                            <li  class="scroll-to-section"> <a href="${pageScope.toLogin}">Đăng nhập</a></li>
                                            </c:if>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${sessionScope.LOGIN_USER.role == 'admin' || sessionScope.LOGIN_USER.role == 'manager'}">
                                    <li class="submenu"><a href="">Products</a>
                                        <ul>
                                            <li><a href="#">Sản phẩm</a></li>
                                            <li><a href="#">Tổ chim non</a></li>
                                            <li><a href="#">Phụ kiện</a></li>
                                        </ul>
                                    </li>
                                    <li class="scroll-to-section"><a href="${pageScope.toCompare}">So sánh</a></li>
                                    <li class="scroll-to-section"><a href="">Đơn hàng</a></li>
                                    <li class="scroll-to-section"><a href="../shop/accounts.jsp">Tài khoản</a></li>
                                    <li class="scroll-to-section"><a href="shop/reports.jsp">Thống kê</a></li>
                                    </c:if>

                                <c:if test="${sessionScope.LOGIN_USER != null}">
                                    <li class="submenu"><a href="#">${LOGIN_USER.fullName}</a>
                                        <ul>
                                            <li><a href="#">Cá nhân</a></li>
                                            <li><a href="${logout}">Đăng xuất</a></li>
                                        </ul>
                                    </li>
                                </c:if>
                            </ul>
                            <a class='menu-trigger'>
                                <span>Menu</span>
                            </a>

<!--                            <form action="MainController" method="post">
                                <input style="width: 200px;" type="text" name="txtBirdName" value="" placeholder="Tìm kiếm"/>
                                <button type="submit" name="action" value="SearchBird">
                                    <img style="width: 15px; height: 15px;" src="assets\images\search.png">
                                </button></br>
                            </form>-->
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
                            <h2>Single Product Page</h2>
                            <span>Awesome &amp; Creative HTML CSS layout by TemplateMo</span>
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
                <div class="row">
                    <div class="col-lg-8">
                        <c:if test="${birdDetails != null}">
                            <c:set var="image_urls" value="${birdDetails.image_urls}"/>
                                <div class="image-container">
                                    <div class="left-image">
                                        <img src="${image_urls[0]}" alt="" onclick="swapImages(this)">
                                    </div>
                                    <div class="right-images">
                                        <img src="${image_urls[1]}" alt="" onclick="swapImages(this)">
                                        <img src="${image_urls[2]}" alt="" onclick="swapImages(this)">
                                    </div>
                                </div>
                        </c:if>
                    </div>
                    <div class="col-lg-4">
                        <div class="right-content">
                            <h4>${birdDetails.bird_name}</h4>
                            <span class="price"><fmt:formatNumber value="${birdDetails.price}" pattern="#,###"/> đ</span>
                            <span>${birdDetails.description}</span>
                            <div class="quote">
                                <c:if test="${not empty birdDetails.dad_bird_name && not empty birdDetails.mom_bird_name}">
                                <i class="fa fa-quote-left"></i><p>${birdDetails.dad_bird_name} lai với ${birdDetails.mom_bird_name}</p>
                                </c:if>
                            </div>
                            <div class="quantity-content">
                                <div class="left-content">
                                    <h6>Chỉ duy nhất</h6>
                                </div>
                                <div class="right-content">
                                    <div class="quantity buttons_added">
                                        <input type="button" value="-" class="minus"><input type="button" step="1" min="1" max="" name="quantity" value="1" title="Qty" class="input-text qty text" size="4" pattern="" inputmode=""><input type="button" value="+" class="plus">
                                    </div>
                                </div>
                            </div>
                            <div class="total">
                                <h4>Tổng đơn hàng: </h4>
                                <div class="main-border-button"><a href="#">Thêm vào giỏ hàng</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ***** Product Area Ends ***** -->

        <!-- ***** Footer Start ***** -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="first-item">
                            <div class="logo">
                                <img src="assets/images/white-logo.png" alt="hexashop ecommerce templatemo">
                            </div>
                            <ul>
                                <li><a href="#">16501 Collins Ave, Sunny Isles Beach, FL 33160, United States</a></li>
                                <li><a href="#">hexashop@company.com</a></li>
                                <li><a href="#">010-020-0340</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <h4>Shopping &amp; Categories</h4>
                        <ul>
                            <li><a href="#">Men’s Shopping</a></li>
                            <li><a href="#">Women’s Shopping</a></li>
                            <li><a href="#">Kid's Shopping</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3">
                        <h4>Useful Links</h4>
                        <ul>
                            <li><a href="#">Homepage</a></li>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Help</a></li>
                            <li><a href="#">Contact Us</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3">
                        <h4>Help &amp; Information</h4>
                        <ul>
                            <li><a href="#">Help</a></li>
                            <li><a href="#">FAQ's</a></li>
                            <li><a href="#">Shipping</a></li>
                            <li><a href="#">Tracking ID</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-12">
                        <div class="under-footer">
                            <p>Copyright © 2022 HexaShop Co., Ltd. All Rights Reserved. 

                                <br>Design: <a href="https://templatemo.com" target="_parent" title="free css templates">TemplateMo</a></p>
                            <ul>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#"><i class="fa fa-behance"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer>

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
            });

        </script>

    </body>

</html>


