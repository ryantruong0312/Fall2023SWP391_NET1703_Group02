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
                border: 0px;
            }
            .image-top {
                position: relative; /* Đặt vị trí tương đối để xác định vị trí của overlay-text */
            }
            .overlay-container {
                position: relative; /* Đặt vị trí tương đối để xác định vị trí của overlay-text */
            }
            .button-form{
                margin-bottom: 5px;
                background-color:rgba(0,0,255, 0.6);
                margin-left: 964px;
                display:block;
                color: white;
                padding: 10px;
                border: 1px solid;
                font-size: 15px;
                border-radius: 4px;
                width: 160px;
            }

        </style>
    </head>

    <body>
        <!-- Header Start -->
        <%@include file="../layout/header.jsp" %>
        <!-- Header End -->
        <!-- ***** Product Area Starts ***** -->
        <section class="section" id="product">
            <div class="container">
                <div class="row">
                    <c:if test="${LOGIN_USER.role == 'admin' || LOGIN_USER.role == 'manager' || LOGIN_USER.role == 'staff'}">
                        <form action="RenderUpdateAccessoryController" method="GET">
                            <input type="hidden" value="${a.accessory_id}" name="accessory_id">
                            <input type="hidden" value="${LOGIN_USER.role}" name="user_role">
                            <button class="button-form" type="submit">Chỉnh sửa phụ kiện</button>
                        </form>
                    </c:if>
                </div>                   
                <div class="row">
                    <div class="col-lg-8">
                        <div class="image-container">
                            <div class="image-top">
                                <div class="overlay-container">
                                    <input type="hidden" name="accessory_id" value="${a.accessory_id}"/>
                                    <img id="mainImage" style="width: 500px; height: 400px; border: 1px solid;" src="${im}" alt="Image main" onclick="swapImages()">
                                    <c:if test="${requestScope.MESSAGE != null}">
                                        <div class="overlay-text">${MESSAGE}</div>
                                    </c:if>
                                </div>
                            </div> 
                        </div>
                        <div class="image-bottom">
                            <c:forEach items="${a.image_url}" var="accessory">
                                <c:if test="${im ne accessory}">
                                    <img style="width: 100px; height: 75px; border: 1px solid;" class="accessory-image" src="${accessory}" alt="" onclick="swapImages(this)">
                                </c:if>
                            </c:forEach>
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

                            </c:when>
                            <c:otherwise>
                                <div class="total">
                                    <h4 style="float: left;">Tổng cộng: <span id="total">0 ₫</span></h4>
                                    <div type="button" class="main-border-button" style="margin-left: 185px; margin-top: 20px; float: left;" id="buttonContainer">
                                        <div type="button" class="main-border-button" style="margin-left: 100px; float: left;"><a style="cursor: pointer" class="accessory-cart" data-value="${a.accessory_id}">Thêm vào giỏ hàng</a></div>
                                    </div>
                                    <div style="clear: both;"></div>
                                </div>
                            </c:otherwise>
                        </c:choose>   
                    </div>
                </div>
            </div>
        </section>     
        <%@include file="../layout/feedback.jsp" %>
        <!-- Start Footer -->
        <%@include file="../layout/footer.jsp" %>
        <!-- End Footer -->

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

