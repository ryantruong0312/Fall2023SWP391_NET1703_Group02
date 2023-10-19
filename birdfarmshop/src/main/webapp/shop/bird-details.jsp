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
        <link rel="icon" type="image/png" href="assets/images/logo-title-bar.png"/>
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

        <title>V.E.T - Chi tiết vẹt cảnh</title>


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

            .col-lg-12 a {
                border-radius: 10px;
                border: 1px solid rgb(221, 221, 227);
                background-color: #f5c6cb;
                display: flex;
                justify-content: center;
                align-items: center;
                margin: 0 auto;
                width: 50%;
                margin-bottom: 30px;
                margin-top: 20px;
                width: 150px;
                float: right;
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
        <!-- Header Start -->
        <%@include file="../layout/header.jsp" %>
        <!-- Header End -->
        <!-- ***** Main Banner Area Start ***** -->
        <div class="page-heading" id="top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="inner-content">
                            <h2>Thông tin chi tiết</h2>
                            <span>Tất tần tật thông tin và mô tả về chú vẹt sẽ được tìm thấy tại đây!</span>
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
                <c:if test="${LOGIN_USER.role == 'admin' || LOGIN_USER.role == 'manager'}">
                    <div class="row">
                        <div class="col-lg-12">
                            <a href="MainController?action=UpdateBird&bird_id=${birdDetails.bird_id}"><span>Cập nhật chim</span></a>
                        </div>
                    </div>
                </c:if>
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
                            <c:choose>
                                <c:when test="${birdDetails.discount > 0}">
                                    <span>
                                        <span style="display: inline-block;"><del><fmt:formatNumber value="${birdDetails.price}" pattern="#,###"/> ₫</del></span>
                                        <span style="display: inline-block; border-radius: 10px; background-color: #cccccc; padding: 0 5px 0 5px; color: black;"> -${birdDetails.discount}%</span>
                                        <span style="font-size: 20px; color: red;"><fmt:formatNumber value="${birdDetails.price - birdDetails.price * birdDetails.discount / 100}" pattern="#,###"/> ₫</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span><fmt:formatNumber value="${birdDetails.price}" pattern="#,###"/> ₫</span>
                                    </c:otherwise>
                                </c:choose>
                                <div class="mt-2">
                                    <h4>Mô tả sản phẩm: </h4>
                                    <c:if test="${not empty birdDetails.description}">
                                        <span>Thông tin: ${birdDetails.description}</span>
                                    </c:if>
                                    <c:if test="${not empty birdDetails.achievement}">
                                        <span>Thành tựu: ${birdDetails.achievement}</span>
                                    </c:if>
                                    <span>Màu sắc: ${birdDetails.color}</span>
                                    <span>Tháng tuổi: ${birdDetails.age}</span>
                                    <span>Thời gian trưởng thành: ${birdDetails.grown_age} tháng</span>
                                    <span>Số lần giao phối: ${birdDetails.reproduction_history}</span>
                                    <div>
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
                                        <c:if test="${(sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.role == 'customer') && bird.status != 'Đã bán'}">
                                            <div class="total">
                                                <div class="main-border-button"><a class="bird-cart" style="cursor: pointer" data-value="${birdDetails.bird_id}">Thêm vào giỏ hàng</a></div>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ***** Product Area Ends ***** -->
        <!-- Feedback start-->
        <%@include file="../layout/feedback.jsp" %>
        <!-- Feedback end-->
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

        </script>

    </body>

</html>


