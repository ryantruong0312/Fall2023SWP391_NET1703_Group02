<%-- 
    Document   : birds
    Created on : Sep 13, 2023, 11:19:25 PM
    Author     : tlminh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

        <title>Bird Farm Shop - Chim Vẹt</title>

        <!-- Additional CSS Files -->
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">
        <link rel="stylesheet" href="assets/css/owl-carousel.css">
        <link rel="stylesheet" href="assets/css/lightbox.css">

        <style>
            .thumb{
                width: 370px;
                height: 390px;
            }
            .bird-thumbnail{
                max-width: 100%; /* Set the maximum width to ensure it fits within the parent container */
                max-height: 100%; /* Set the maximum height to ensure it fits within the parent container */
                width: auto; /* Let the width adjust to maintain the aspect ratio */
                height: auto;
            }
        </style>
    </head>

    <body>
        <c:url var="toCompare" value="MainController?action=NavToCompare"/>
        <c:url var="toLogin" value="MainController?action=NavToLogin"/>
        <c:url var="logout" value="MainController?action=Logout"/>
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
                                        <li class="submenu"><a href="">Sắp xếp theo</a>
                                            <ul>
                                                <li><a href="MainController?action=NavToBird&amount=0">Thấp đến cao</a></li>
                                                <li><a href="MainController?action=NavToBird&amount=0">Cao đến thấp</a></li>
                                                <li><a href="MainController?action=NavToBird&amount=0">Giống</a></li>
                                            </ul>
                                        </li>
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
                                <!--                                    <li class="scroll-to-section">
                                                                        <form action="MainController" method="post">
                                                                            <input type="text" name="txtBirdName" value="" placeholder="Tìm kiếm"/>
                                                                            <button type="submit" name="action" value="SearchBird">
                                                                                <img style="width: 15px; height: 15px;" src="assets\images\search.png">
                                                                            </button></br>
                                                                            </select><br/>
                                                                        </form>
                                                                    </li>-->
                            </ul>

                            <ul style="padding-right: 800px;float: left;" class="nav">
                            </ul>
                            <a class='menu-trigger'>
                                <span>Menu</span>
                            </a>

                            <form action="MainController" method="post">
                                <input style="width: 200px;" type="text" name="txtBirdName" value="" placeholder="Tìm kiếm"/>
                                <button type="submit" name="action" value="SearchBird">
                                    <img style="width: 15px; height: 15px;" src="assets\images\search.png">
                                </button></br>
                            </form>
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
                            <h2>Các sản phẩm chính</h2>
                            <span>Awesome &amp; Creative HTML CSS layout by TemplateMo</span>
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
                            <h2>Our Latest Products</h2>
                            <span>Check out all of our products.</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div id="content" class="row">
                    <c:set var="BIRDLIST" value="${requestScope.BIRDLIST}"/>
                    <c:set var="IMAGEBIRDLIST" value="${requestScope.IMAGEBIRDLIST}"/>
                    <c:if test="${BIRDLIST != null && IMAGEBIRDLIST != null}">
                        <c:if test="${not empty BIRDLIST && not empty IMAGEBIRDLIST}">
                            <c:forEach items="${BIRDLIST}" var="bird">
                                <c:forEach items="${IMAGEBIRDLIST}" var="imagebird">
                                    <c:if test="${bird.bird_id == imagebird.bird_id}">    
                                        <div class="bird col-lg-4">
                                            <div class="item">
                                                <div class="thumb">
                                                    <div class="hover-content">
                                                        <ul>
                                                            <li><a href="MainController?action=NavToBirdDetails"><i class="fa fa-eye"></i></a></li>
                                                            <li><a href="bird-details.jsp"><i class="fa fa-shopping-cart"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <img src="${imagebird.image_url}" alt="">
                                                </div>
                                                <div class="down-content">
                                                    <h4>${bird.bird_name}</h4>
                                                    <span>${bird.price}</span>
                                                </div>
                                            </div>
                                            <img class="bird-thumbnail" src="${bird.image_url}" alt="">
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                            <!--                            <button onClick="loadMoreBird()">Load More </button>-->
                        </c:if>
                    </c:if>      
                    <div class="col-lg-12">
                        <div class="pagination">
                            <ul>
                                <li class="active">
                                    <a href="MainController?action=NavToBird&amount=0">1</a>
                                </li>
                                <li>
                                    <a href="MainController?action=NavToBird&amount=9">2</a>
                                </li>
                                <li>
                                    <a href="MainController?action=NavToBird&amount=18">3</a>
                                </li>
                                <li>
                                    <a href="#" id="page-4">4</a>
                                </li>
                                <li>
                                    <a href="#">></a>
                                </li>
                            </ul>
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
        <!-- ***** Footer Area Ends ***** -->

        <!-- jQuery -->
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
            // Đoạn mã JavaScript sử dụng jQuery
            $(document).ready(function () {
                var currentPage = 1; // Trang hiện tại

                // Hàm để tải sản phẩm từ máy chủ
                function loadProducts(page) {
                    $.ajax({
                        url: 'MainController?action=NavToBird&amount=' + (page - 1) * 9,
                        method: 'GET',
                        success: function (data) {
                            // Xử lý dữ liệu sản phẩm và cập nhật trang web
                            $('#content').html(data);
                            currentPage = page; // Cập nhật trang hiện tại
                        },
                        error: function (error) {
                            console.log(error);
                        }
                    });
                }

                // Xử lý sự kiện khi người dùng nhấn vào liên kết trang
                $('#page-1').click(function (e) {
                    e.preventDefault(); // Ngăn chặn hành vi mặc định của liên kết
                    loadProducts(1);
                });

                $('#page-2').click(function (e) {
                    e.preventDefault();
                    loadProducts(2);
                });

                $('#page-3').click(function (e) {
                    e.preventDefault();
                    loadProducts(3);
                });

                $('#page-4').click(function (e) {
                    e.preventDefault();
                    loadProducts(4);
                });

                $('#next-page').click(function (e) {
                    e.preventDefault();
                    // Tải trang kế tiếp (currentPage + 1)
                    loadProducts(currentPage + 1);
                });
                function updateActivePage() {
                    $('.pagination ul li').removeClass('active'); // Xóa tất cả lớp "active" trước tiên
                    $('#page-' + currentPage).parent().addClass('active'); // Thêm lớp "active" cho trang hiện tại
                }

                // Gọi hàm để cập nhật lớp "active" ban đầu
                updateActivePage();
            });

        </script>

    </body>

</html>