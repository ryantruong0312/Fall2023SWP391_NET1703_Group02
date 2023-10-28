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
                border-radius: 50%;
                color: #fff;
                padding: 30px;
                font-size: 30px;
                text-align: center;
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
                transition: transform 0.3s ease-in-out;
            }

            #mainImage:hover {
                transform: scale(1.1);
                cursor: pointer;
                border: 0px;
            }
            .image-top {
                position: relative;
            }
            .overlay-container {
                position: relative;
            }
            .button-form{
                margin-bottom: 5px;
                background-color:rgba(0,0,255, 0.6);
                /*margin-left: 775px;*/
                display:block;
                color: white;
                padding: 10px;
                border: 1px solid;
                font-size: 15px;
                border-radius: 4px;
                width: 160px;
            }
            .button-updateAccessory{
                margin-bottom: 5px;
                background-color:rgba(0,0,255, 0.6);
                color: white;
                padding: 10px;
                border: 1px solid;
                font-size: 15px;
                border-radius: 4px;
                width: 120px;
            }
            .popup {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: white;
                padding: 20px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
                z-index: 9999;
                cursor: move;
            }
            .popup.active {
                display: block;
            }

        </style>
    </head>

    <body>
        <!-- Header Start -->
        <%@include file="../layout/header.jsp" %>
        <!-- Header End -->
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
                    <c:if test="${LOGIN_USER.role == 'admin' || LOGIN_USER.role == 'manager' || LOGIN_USER.role == 'staff'}">
                        <c:choose>
                            <c:when test="${LOGIN_USER.role == 'admin' || LOGIN_USER.role == 'manager'}">
                                <div class="col-lg-7">                               
                                </div>
                                <div class="button-all col-lg-5" style="display: inline-block; white-space: nowrap;">
                                    <div class="UpdateAccessoryDetail" style="display: inline-block;">
                                        <form action="MainController" method="GET">
                                            <input type="hidden" value="${a.accessory_id}" name="accessory_id">
                                            <input type="hidden" value="${a.category_id}" name="category_id">
                                            <button class="button-form" type="submit" name="action" value="NavToUpdateAccessory">Chỉnh sửa phụ kiện</button>
                                        </form>
                                    </div>
                                    <div class="UpdateStockQuantity" style="display: inline-block;">
                                        <button id="openPopup" class="button-updateAccessory">Cập nhật kho</button>
                                        <div class="overlay" id="overlay"></div>
                                        <form action="RenderUpdateAccessoryController" method="GET">
                                            <input type="hidden" value="${a.accessory_id}" name="txtAccessoryID">
                                            <input type="hidden" name="btAction" value="UpdateQuantity">
                                            <div class="popup" id="popup">
                                                <h2>Cập nhật kho</h2>
                                                <p>Số lượng hiện tại trong kho: <span id="currentStock">${a.stock_quantity}</span></p>
                                                <label for="newStock">Số lượng mới:</label>
                                                <input type="number" id="newStock" name="txtNewQuantity" value="">
                                                <br>
                                                <button id="updateButton">Chỉnh sửa</button>
                                        </form>
                                        <button id="cancelButton">Trở về</button>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="col-lg-7">

                            </div>
                            <div class="col-lg-5">
                                <button id="openPopup" class="button-form">Cập nhật kho</button>
                                <div class="overlay" id="overlay"></div>
                                <form action="RenderUpdateAccessoryController" method="GET">
                                    <input type="hidden" value="${a.accessory_id}" name="txtAccessoryID">
                                    <input type="hidden" name="btAction" value="UpdateQuantity">
                                    <div class="popup" id="popup">
                                        <h2>Cập nhật kho</h2>
                                        <p>Số lượng hiện tại trong kho: <span id="currentStock">${a.stock_quantity}</span></p>
                                        <label for="newStock">Số lượng mới:</label>
                                        <input type="number" id="newStock" name="txtNewQuantity" value="">
                                        <br>
                                        <button id="updateButton">Chỉnh sửa</button>
                                </form>
                                <button id="cancelButton">Trở về</button>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:if>
        </div>

        <div class="row">
            <div class="col-lg-7">
                <div class="image-container">
                    <div class="image-top">
                        <div class="overlay-container">
                            <input type="hidden" name="accessory_id" value="${a.accessory_id}"/>
                            <img id="mainImage" style="width: 500px; height: 400px;" src="${im}" alt="Image main" onclick="swapImages()">
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

            <div class="col-lg-5">
                <div class="right-content">
                    <h4 id="nameAccessory">${a.accessory_name}</h4>
                    <c:choose>
                        <c:when test="${a.discount > 0}">
                            <span style="display: inline-block;"><del><fmt:formatNumber value="${a.unit_price}" pattern="#,###"/> ₫</del></span>
                            <span style="display: inline-block; border-radius: 10px; background-color: #cccccc; padding: 0 5px 0 5px; color: black;"> -${a.discount}%</span>
                            <span style="font-size: 20px;" id="unit_price"><fmt:formatNumber value="${a.unit_price - a.unit_price * a.discount / 100}" pattern="#,###"/> ₫</span>
                        </c:when>
                        <c:otherwise>
                            <span style="font-size: 20px;" id="unit_price"><fmt:formatNumber value="${a.unit_price}" pattern="#,###"/> ₫</span>
                        </c:otherwise>
                    </c:choose>
                    <div class="descript">
                        <h4>Mô tả sản phẩm: </h4>
                        <span style="margin-top: 5px;">${a.description}</span>
                    </div>
                    <div class="stock_quantity">
                        <h4>Kho: ${a.stock_quantity}</h4>
                    </div>
                    <c:if test="${sessionScope.LOGIN_USER.role == 'customer' || sessionScope.LOGIN_USER == null}">
                        <c:if test="${a.stock_quantity > 0}">
                            <div class="quantity-content">
                                <div class="left-content">
                                    <h6>Số lượng</h6>
                                </div>

                                <div class="right-content">
                                    <div class="quantity buttons_added">
                                        <div class="quantity buttons_added">
                                            <input type="button" value="-" class="minus" onclick="decrementQuantity('quantityInput', ${a.unit_price}, ${a.discount})">
                                            <input type="number" step="1" min="1" max="${a.stock_quantity}" name="order_quantity" id="quantityInput" value="1" title="Qty" class="input-text qty text" size="4" onchange="updateTotal('quantityInput', ${a.stock_quantity}, ${a.unit_price}, ${a.discount})">
                                            <input type="button" value="+" class="plus" onclick="incrementQuantity('quantityInput', ${a.stock_quantity}, ${a.unit_price}, ${a.discount})">
                                        </div>
                                    </div>
                                    <div id="warning"></div>
                                </div>                            
                            </div>
                        </c:if>
                    </div>
                    <c:if test="${a.stock_quantity > 0}">
                        <div class="total">
                            <c:choose>
                                <c:when test="${a.discount == 0}">
                                    <h4 style="float: left;">Tổng cộng: <span id="total"><fmt:formatNumber value="${a.unit_price}" pattern="#,###"/> ₫</span></h4>
                                </c:when>
                                <c:otherwise>
                                    <h4 style="float: left;">Tổng cộng: <span id="total"><fmt:formatNumber value="${a.unit_price - a.unit_price * a.discount / 100}" pattern="#,###"/> ₫</span></h4>
                                </c:otherwise>
                            </c:choose>
                            <div class="main-border-button">
                                <input type="hidden" name="accessory_id" value="${a.accessory_id}" />
                                <a class="accessory-cart" style="cursor: pointer" data-value="${a.accessory_id}">Thêm vào giỏ hàng</a>
                            </div>
                        </div>
                    </c:if>
                </c:if>
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


        function updateTotal(inputId, maxQuantity, unitPrice, discount) {
            var quantityInput = document.getElementById(inputId);
            var total1 = document.getElementById("total");
            var warning = document.getElementById("warning");
            var total;
            if (!isNaN(quantityInput.value) && quantityInput.value <= maxQuantity) {
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

        // Get references to HTML elements
        const openPopupButton = document.getElementById('openPopup');
        const overlay = document.getElementById('overlay');
        const popup = document.getElementById('popup');
        const currentStock = document.getElementById('currentStock');
        const newStockInput = document.getElementById('newStock');
        const updateButton = document.getElementById('updateButton');
        const cancelButton = document.getElementById('cancelButton');
        // Function to open the popup and display the current stock quantity
        openPopupButton.addEventListener('click', () => {
            const currentQuantity = document.getElementById('currentStock').textContent;
            currentStock.textContent = currentQuantity;
            newStockInput.value = currentQuantity;
            overlay.style.display = 'block';
            popup.style.display = 'block';
        });
        // Function to close the popup
        function closePopup() {
            overlay.style.display = 'none';
            popup.style.display = 'none';
        }

        // Close the popup when the Cancel button is clicked
        cancelButton.addEventListener('click', function (event) {
            event.preventDefault(); // Ngăn chặn hành vi mặc định của nút
            closePopup(); // Gọi hàm để đóng popup
        });
        // You can handle the update functionality with the updateButton click event
        updateButton.addEventListener('click', () => {
            const newQuantity = parseInt(newStockInput.value, 10);
            // You can perform an AJAX request here to update the stock quantity on the server
            // After a successful update, you can close the popup// For example, you can use jQuery's $.ajax or fetch API for the AJAX request.
            // Once the update is done, call closePopup();
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

