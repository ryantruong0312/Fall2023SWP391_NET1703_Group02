<%-- 
    Document   : accessory-details
    Created on : Sep 13, 2023, 11:22:17 PM
    Author     : tlminh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="a" value="${a}" />

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" type="image/png" href="assets/images/logo-title-bar.png"/>
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

        <title>V.E.T - Chi tiết phụ kiện</title>


        <!-- Additional CSS Files -->
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">
        <link rel="stylesheet" href="assets/css/owl-carousel.css">
        <link rel="stylesheet" href="assets/css/lightbox.css">

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
                                <li class="scroll-to-section"><a href="${pageScope.toHome}" class="active">Trang chủ</a></li>
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
                                            <div class="cart-amount">${(sessionScope.CART_BIRD_NEST.getSize()!=null ? sessionScope.CART_BIRD_NEST.getSize():0)+(sessionScope.CART_BIRD.getSize()!=null ? sessionScope.CART_BIRD.getSize():0)}</div>

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
                            <h2>Chi tiết phụ kiện</h2>
                            <span>Tìm hiểu về sản phẩm và sắm ngay cho chú vẹt cưng của bạn!</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ***** Main Banner Area End ***** -->


        <!-- ***** Product Area Starts ***** -->
        <section class="section" id="product">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">                    
                        <c:if test="${a != null}">
                            <c:set var="image_url" value="${a.image_url}" />
                            <div class="image-container">
                                <div class="left-image">
                                    <img id="image_main" src="${image_url[0]}" alt="Image 1" onclick="swapImages(this)">
                                </div>

                                <div class="right-image">
                                    <img src="${image_url[1]}" alt="Image 2" onclick="swapImages(this)">
                                    <img src="${image_url[2]}" alt="Image 3" onclick="swapImages(this)">
                                </div>
                            </div>
                        </c:if>
                    </div>
                    <div class="col-lg-4">
                        <div class="right-content">
                            <h4 id="nameAccessory">${a.accessory_name}</h4>
                            <span id="unit_price" class="price">${a.unit_price} ₫</span>
                            <!--                        <ul class="stars">
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                    </ul>-->
                            <div class="descript">
                                <h4>Mô tả sản phẩm: </h4>
                                <span>${a.description}</span>
                            </div>
                            <div class="stock_quantity">
                                <h4>Kho: ${a.stock_quantity}</h4>
                            </div>
                            <div class="quantity-content">
                                <div class="left-content">
                                    <h6>Số lượng</h6>
                                </div>
                                <div class="right-content">
                                    <div class="quantity buttons_added">
                                        <div class="quantity buttons_added">
                                            <input type="button" value="-" class="minus" onclick="decrementQuantity('quantityInput', ${a.unit_price})">
                                            <input type="number" step="1" min="1" max="${a.stock_quantity}" name="quantity" id="quantityInput" value="1" title="Qty" class="input-text qty text" size="4" onchange="updateTotal()">
                                            <input type="button" value="+" class="plus" onclick="incrementQuantity('quantityInput', ${a.stock_quantity}, ${a.unit_price})">
                                        </div>
                                    </div>
                                    <div id="warning"></div>
                                </div>                            
                            </div>
                        </div>
                        <div class="total">
                            <h4 style="float: left;">Tổng cộng: <span id="total">${a.unit_price} ₫</span></h4>
                            <div type="button" class="main-border-button" style="margin-left: 100px; float: left;"><a href="#" id="AddToCart">Thêm vào giỏ hàng</a></div>
                            <div style="clear: both;"></div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>     
<%@include file="../layout/feedback.jsp" %>
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

                                                function incrementQuantity(inputId, maxQuantity, unitPrice)
                                                {
                                                    var quantityInput = document.getElementById(inputId);
                                                    var currentValue = parseInt(quantityInput.value);

                                                    var total1 = document.getElementById("total");
                                                    var warning = document.getElementById("warning");
                                                    if (!isNaN(currentValue) && currentValue < maxQuantity) {
                                                        quantityInput.value = currentValue + 1;
                                                        total1.innerHTML = unitPrice * quantityInput.value + " ₫";

                                                        warning.innerHTML = "";
                                                    } else {
                                                        //alert("Số lượng không đủ!");
                                                        warning.innerHTML = "Số lượng không đủ!";
                                                    }
                                                }


                                                function decrementQuantity(inputId, unitPrice) {
                                                    var quantityInput = document.getElementById(inputId);
                                                    var currentValue = parseInt(quantityInput.value);
                                                    var total = document.getElementById("total");
                                                    var warning = document.getElementById("warning");
                                                    if (!isNaN(currentValue) && currentValue > 0) {
                                                        quantityInput.value = currentValue - 1;
                                                        total.innerHTML = unitPrice * quantityInput.value + " ₫";
                                                        warning.innerHTML = "";
                                                    }
                                                }

                                                function formatNumber(n) {
                                                    // format number 1000000 to 1.234.567
                                                    return n.replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ".");
                                                }

                                                function ConvertToNumber(priceStr) {
                                                    var priceParts = priceStr.split(".");
                                                    var price = "";
                                                    for (var i = 0; i < priceParts.length; i++) {
                                                        price += priceParts[i];
                                                    }
                                                    return Number.parseInt(price);
                                                }


                                                function updateTotal() {
                                                    var unitPrice = document.getElementById("unit_price");
                                                    var quantityInput = document.getElementById("quantityInput"); // Lấy phần tử input số lượng

                                                    console.log(unitPrice);
                                                    console.log(quantityInput);
                                                }


                                                function addToCart() {
                                                    var name = document.getElementById("nameAccessory");
                                                    var quantity = document.getElementById("quantityInput");
                                                    var total = document.getElementById("total");
                                                    sessionStorage.setItem("name", JSON.stringify(name));
                                                    sessionStorage.setItem("quantity", JSON.stringify(quantity));
                                                    sessionStorage.setItem("total", JSON.stringify(total));

                                                }

                                                function swapImages(clickedImage) {
                                                    const leftImage = document.querySelector('.left-image img');
                                                    const rightImage1 = document.querySelectorAll('.right-images img')[0];
                                                    const rightImage2 = document.querySelectorAll('.right-images img')[1];

                                                    const tempSrc = leftImage.src;
                                                    leftImage.src = clickedImage.src;
                                                    clickedImage.src = tempSrc;
                                                }

</script>



<style>
    .image-container {
        display: flex;
        align-items: center;
    }

    .right-image {
        display: flex;
        flex-direction: column;
    }

    .left-image img{
        width: 400px;
        height: 400px;
        margin-right: 10px;
    }

    .right-image img{
        width: 200px;
        height: 200px;
        margin-right: 2px;
    }
</style>


</body>


</html>

