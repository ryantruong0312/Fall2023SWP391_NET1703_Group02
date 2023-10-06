<%-- 
    Document   : accessory-details
    Created on : Sep 13, 2023, 11:22:17 PM
    Author     : tlminh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="a" value="${a}" />
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

        <title>V.E.T - Chi tiết phụ kiện</title>


        <!-- Additional CSS Files -->
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">
        <link rel="stylesheet" href="assets/css/owl-carousel.css">
        <link rel="stylesheet" href="assets/css/lightbox.css">
        <style>
            .overlay-text {
                position: absolute;
                top: 50%;
                left: 35%;
                transform: translate(-50%, -50%);
                background-color: rgba(0, 0, 0, 0.5);
                border-radius: 70%;
                color: #fff;
                padding: 30px;
                font-size: 50px;
                text-align: center;
                margin-right: 100px;
                margin-top: 0px;
            }
            .stock_quantity{
                margin-top: 20px;
            }
            .descript h4{
                margin-top: 15px;
            }
            .descript span{
                margin-top: 0px;
            }
            .image-bottom {
                display: inline-block;
                margin: 10px 10px 0 0;
            }

            #mainImage {
                width: 500px;
                height: 400px;
                border: 1px solid;
                transition: transform 0.3s ease-in-out; /* Tạo hiệu ứng dịch chuyển mượt mà */
            }

            #mainImage:hover {
                transform: scale(1.1); /* Phóng to 110% khi hover qua */
                cursor: pointer; /* Biểu tượng con trỏ khi hover qua */
            }
            .image-top {
                position: relative; /* Đặt vị trí tương đối để xác định vị trí của overlay-text */
            }
            .overlay-container {
                position: relative; /* Đặt vị trí tương đối để xác định vị trí của overlay-text */
            }
            .button-form{
                margin-bottom: 15px;
                background-color:rgba(0, 0, 0, 0);
                margin-left:auto;
                margin-right: 1px;
                display:block;
                color: black;
                padding: 12px 25px;
                border: 1px solid;
                font-size: 13px;
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
                <c:if test="${LOGIN_USER.role == 'admin' || LOGIN_USER.role == 'manager' || LOGIN_USER.role == 'staff'}">
                    <form action="RenderUpdateAccessoryController" method="GET">
                        <input type="hidden" value="${a.accessory_id}" name="accessory_id">
                        <input type="hidden" value="${LOGIN_USER.role}" name="user_role">
                        <button class="button-form" type="submit">Chỉnh sửa</button>
                    </form>
                </c:if>           
                <div class="row">
                    <div class="col-lg-8">
                        <div class="image-container">
                            <div class="image-top">
                                <div class="overlay-container">
                                    <img id="mainImage" style="width: 500px; height: 400px; border: 1px solid;" src="${im}" alt="Image main" onclick="swapImages()">
                                    <c:if test="${requestScope.MESSAGE != null}">
                                        <div class="overlay-text">${MESSAGE}</div>
                                    </c:if>
                                </div>
                            </div>
                            <div class="image-bottom">
                                <c:forEach items="${a.image_url}" var="accessory">
                                    <c:if test="${im ne accessory}">
                                        <img style="width: 150px; height: 100px; border: 1px solid;" class="accessory-image" src="${accessory}" alt="" onclick="swapImages(this)">
                                    </c:if>
                                </c:forEach>
                            </div>                         
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="right-content">
                            <h4 id="nameAccessory">${a.accessory_name}</h4>
                            <c:choose>
                                <c:when test="${a.discount > 0}">
                                    <span style="display: inline-block;"><del><fmt:formatNumber value="${a.unit_price}" pattern="#,###"/> ₫</del></span>
                                    <span style="display: inline-block; border-radius: 10px; background-color: #cccccc; padding: 0 5px 0 5px; color: black;"> -${a.discount}%</span>
                                    <span style="font-size: 20px; color: red;"><fmt:formatNumber value="${a.unit_price - a.unit_price * a.discount / 100}" pattern="#,###"/> ₫</span>
                                </c:when>
                                <c:otherwise>
                                    <span style="font-size: 20px; color: red;"><fmt:formatNumber value="${a.unit_price}" pattern="#,###"/> ₫</span>
                                </c:otherwise>
                            </c:choose>
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
                                <form action="MainController">
                                    <div class="right-content">
                                        <div class="quantity buttons_added">
                                            <div class="quantity buttons_added">
                                                <input type="button" value="-" class="minus" onclick="decrementQuantity('quantityInput', ${a.unit_price}, ${a.discount})">
                                                <c:choose>
                                                    <c:when test="${a.stock_quantity > 0}">
                                                        <input type="number" step="1" min="1" max="${a.stock_quantity}" name="order_quantity" id="quantityInput" value="1" title="Qty" class="input-text qty text" size="4" onchange="updateTotal()">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="number" step="1" min="0" max="${a.stock_quantity}" name="quantity" id="quantityInput" value="0" title="Qty" class="input-text qty text" size="4" onchange="updateTotal()">
                                                    </c:otherwise>
                                                </c:choose>
                                                <input type="button" value="+" class="plus" onclick="incrementQuantity('quantityInput', ${a.stock_quantity}, ${a.unit_price}, ${a.discount})">
                                            </div>
                                        </div>
                                        <div id="warning"></div>
                                    </div>                            
                            </div>
                        </div>
                        <c:choose>
                            <c:when test="${a.stock_quantity > 0}">
                                <div class="total">
                                    <c:choose>
                                        <c:when test="${a.discount == 0}">
                                            <h4 style="float: left;">Tổng cộng: <span id="total"><fmt:formatNumber value="${a.unit_price}" pattern="#,###"/> ₫</span></h4>
                                        </c:when>
                                        <c:otherwise>
                                            <h4 style="float: left;">Tổng cộng: <span id="total"><fmt:formatNumber value="${a.unit_price - a.unit_price * a.discount / 100}" pattern="#,###"/> ₫</span></h4>
                                        </c:otherwise>
                                    </c:choose>
                                    <div type="button" class="main-border-button" style="margin-left: 185px; margin-top: 20px; float: left;" id="buttonContainer">
                                        <input type="hidden" name="accessory_id" value="${a.accessory_id}" />
                                        <button type="submit" name="action" value="AddAccessoryToCart" id="Add" class="btn btn-primary">Thêm vào giỏ hàng</button>
                                    </div>
                                    <div style="clear: both;"></div>
                                </div>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <div class="total">
                                    <h4 style="float: left;">Tổng cộng: <span id="total">0 ₫</span></h4>
                                    <div type="button" class="main-border-button" style="margin-left: 185px; margin-top: 20px; float: left;" id="buttonContainer">
                                        <a href="#" id="AddToCart" class="btn btn-primary">Thêm vào giỏ hàng</a>
                                    </div>
                                    <div style="clear: both;"></div>
                                </div>
                            </c:otherwise>
                        </c:choose>   
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

<script>
    function incrementQuantity(inputId, maxQuantity, unitPrice, discount)
    {
        var quantityInput = document.getElementById(inputId);
        var currentValue = parseInt(quantityInput.value);

        var total1 = document.getElementById("total");
        var warning = document.getElementById("warning");
        var total;
        if (!isNaN(currentValue) && currentValue < maxQuantity) {
            quantityInput.value = currentValue + 1;
            if (discount > 0) {
                total = (unitPrice - (unitPrice * discount / 100)) * quantityInput.value + " ₫";
            } else {
                total = unitPrice * quantityInput.value + " ₫";
            }
            total1.innerHTML = formatNumber(total) + " ₫";
            warning.innerHTML = "";
        } else {
            warning.innerHTML = "Số lượng không đủ!";
        }
    }


    function decrementQuantity(inputId, unitPrice, discount) {
        var quantityInput = document.getElementById(inputId);
        var currentValue = parseInt(quantityInput.value);
        var total1 = document.getElementById("total");
        var warning = document.getElementById("warning");
        var total;
        if (!isNaN(currentValue) && currentValue > 1) {
            quantityInput.value = currentValue - 1;
            if (discount > 0) {
                total = (unitPrice - (unitPrice * discount / 100)) * quantityInput.value + " ₫";
            } else {
                total = unitPrice * quantityInput.value + " ₫";
            }
            total1.innerHTML = formatNumber(total) + " ₫";
            warning.innerHTML = "";
        }
    }


    function formatNumber(n) {
        return n.replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
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
        var quantityInput = document.getElementById("quantityInput");

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
        const leftImage = document.querySelector('.image-top img');
        const rightImage1 = document.querySelectorAll('.image-bottom img')[0];

        const tempSrc = leftImage.src;
        leftImage.src = clickedImage.src;
        clickedImage.src = tempSrc;
    }
    function NavToNewPage(event) {
        let page = $(event).attr('data-value');
        let accessory_id = $('input[name=accessory_id]').val();
        if (accessory_id) {
            $.ajax({
                url: 'RenderAccessoryDetailsController',
                type: 'POST',
                data: {page: page, id: accessory_id},
                success: function (data) {
                    $('.comment-list').html(data);
                    window.scrollTo(0, 800);
                }
            });
        }
    }

    function PrevPage() {
        let page = $('input[name=page]').val();
        let prevPage = Number(page) - 1;
        let accessory_id = $('input[name=accessory_id]').val();
        if (accessory_id && prevPage > 0) {
            $.ajax({
                url: 'RenderAccessoryDetailsController',
                type: 'POST',
                data: {page: prevPage, id: accessory_id},
                success: function (data) {
                    $('.comment-list').html(data);
                    window.scrollTo(0, 800);
                }
            });
        }
    }

    function NextPage() {
        let page = $('input[name=page]').val();
        let limitPage = $('input[name=numberOfPage]').val();
        let amountPage = Number(limitPage);
        let nextPage = Number(page) + 1;
        let accessory_id = $('input[name=accessory_id]').val();
        if (accessory_id && nextPage < amountPage) {
            $.ajax({
                url: 'RenderAccessoryDetailsController',
                type: 'POST',
                data: {page: nextPage, id: accessory_id},
                success: function (data) {
                    $('.comment-list').html(data);
                    window.scrollTo(0, 800);
                }
            });
        }
    }

    document.getElementById("AddToCart").addEventListener("click", function (event) {
        event.preventDefault(); // Ngăn chặn hành động mặc định của thẻ <a>

        // Lấy thẻ <div> bọc nút
        var buttonContainer = document.getElementById("buttonContainer");

        // Thêm thuộc tính "disabled" vào thẻ <div>
        buttonContainer.classList.add("disabled");

        // Ngăn chặn sự kiện click
        this.style.pointerEvents = "none";
    });

</script>
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
        $(".accessory-cart").click(function () {
            let accessory_id = $(this).attr('data-value');
            let quantity = $('input[name=quantity]').val();
            $.ajax({
                url: "AddAccessoryToCartController",
                type: 'POST',
                data: {accessory_id: accessory_id, order_quantity: quantity},
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
                            url: "AddAccessoryToCartController",
                            type: 'POST',
                            data: {order_quantity: 1},
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

