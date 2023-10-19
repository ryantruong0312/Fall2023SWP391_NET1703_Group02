<%-- 
    Document   : accessory-details
    Created on : Sep 13, 2023, 11:22:17 PM
    Author     : tlminh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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

        <title>V.E.T - Chi tiết tổ chim non</title>


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
                    <div class="col-lg-8">                    
                        <c:if test="${birdNest != null}">
                            <c:set var="image_url_arr" value="${birdNest.image_url_arr}" />
                            <div class="image-container">
                                <div class="left-image">
                                    <img id="image_main" src="${image_url_arr[0]}" alt="Image 1" onclick="swapImages(this)">
                                </div>

                                <div class="right-image">
                                    <img src="${image_url_arr[1]}" alt="Image 2" onclick="swapImages(this)">
                                    <img src="${image_url_arr[2]}" alt="Image 3" onclick="swapImages(this)">
                                </div>
                            </div>
                        </c:if>
                    </div>
                    <div class="col-lg-4">
                        <div class="right-content">
                            <h4 id="nameAccessory">${birdNest.nest_id}</h4>
                            <span id="unit_price" class="price">${birdNest.price} ₫</span>
                            <!--                        <ul class="stars">
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                        <li><i class="fa fa-star"></i></li>
                                                    </ul>-->
                            <div class="descript">
                                <h4>Mô tả sản phẩm: </h4>
                                <span>${birdNest.description}</span>
                            </div>
                            <div class="stock_quantity">
                                <h4>Chim non/trứng trong tổ: ${birdNest.baby_quantity}</h4>
                            </div>
                        </div>
                        <div class="total">
                            <h4 style="float: left;">Tổng cộng: <span id="total">${birdNest.price} ₫</span></h4>
                            <div type="button" class="main-border-button" style="margin-left: 100px; float: left;"><a href="MainController?action=AddtoCart&type=nest&id=${birdNest.nest_id}" id="AddToCart">Thêm vào giỏ hàng</a></div>
                            <div style="clear: both;"></div>
                        </div>

                    </div>
                </div>
            </div>
        </section>     
        <%@include file="../layout/feedback.jsp" %>
        <!-- Start Footer -->
        <%@include file="../layout/footer.jsp" %>
        <!-- End Footer -->
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

    </body>


</html>

