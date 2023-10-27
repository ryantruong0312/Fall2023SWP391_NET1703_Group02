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

            .overlay-text {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: rgba(0, 0, 0, 0.5);
                border-radius: 50%;
                color: #fff;
                padding: 30px;
                font-size: 25px;
                text-align: center;
            }
            .image-bottom {
                cursor: pointer;
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
        </style>
        <script>
            function swapImages(clickedImage) {
                const leftImage = document.querySelector('.image-top img');
                const rightImage1 = document.querySelectorAll('.image-bottom img')[0];
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
                    <div class="col-lg-7">
                        <c:if test="${birdDetails != null}">
                            <div class="image-container">
                                <div class="image-top">
                                    <div class="overlay-container">
                                        <img id="mainImage" style="width: 500px; height: 400px;" src="${im}" alt="" onclick="swapImages(this)">
                                        <c:if test="${birdDetails.status == 'Đã bán'}">
                                            <div class="overlay-text">Đã bán</div>
                                        </c:if>
                                        <c:if test="${birdDetails.status == 'Đang sinh sản'}">
                                            <div class="overlay-text">Đang sinh sản</div>
                                        </c:if>
                                        <c:if test="${birdDetails.status == 'Đang ghép cặp'}">
                                            <div class="overlay-text">Đang ghép cặp</div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            <div class="image-bottom">
                                <c:forEach items="${birdDetails.image_urls}" var="bird">
                                    <c:if test="${bird ne im}">
                                        <img style="width: 100px; height: 75px; border: 1px solid;" class="accessory-image" src="${bird}" alt="" onclick="swapImages(this)">
                                    </c:if>
                                </c:forEach>
                            </div>
                        </c:if>
                    </div>
                    <div class="col-lg-5">
                        <div class="right-content">
                            <h4>${birdDetails.bird_name}</h4>
                            <c:choose>
                                <c:when test="${birdDetails.discount > 0}">
                                    <span style="display: inline-block;"><del><fmt:formatNumber value="${birdDetails.price}" pattern="#,###"/> ₫</del></span>
                                    <span style="display: inline-block; border-radius: 10px; background-color: #cccccc; padding: 0 5px 0 5px; color: black;"> -${birdDetails.discount}%</span>
                                    <span style="font-size: 20px;"><fmt:formatNumber value="${birdDetails.price - birdDetails.price * birdDetails.discount / 100}" pattern="#,###"/> ₫</span>
                                </c:when>
                                <c:otherwise>
                                    <span style="font-size: 20px;"><fmt:formatNumber value="${birdDetails.price}" pattern="#,###"/> ₫</span>
                                </c:otherwise>
                            </c:choose>
                            <div class="mt-2">
                                <h4>Mô tả sản phẩm: </h4>
                                <div style="white-space: nowrap; margin-top: 10px;">
                                    <h5 style="display: inline;">Màu sắc: </h5>
                                    <span style="display: inline;">${birdDetails.color}</span>
                                </div>

                                <div style="white-space: nowrap; margin-top: 10px;">
                                    <h5 style="display: inline;">Tháng tuổi: </h5>
                                    <span style="display: inline;">${birdDetails.age}</span>
                                </div>

                                <div style="white-space: nowrap; margin-top: 10px;">
                                    <h5 style="display: inline;">Thời gian trưởng thành: </h5>
                                    <span style="display: inline;">${birdDetails.grown_age} tháng</span>
                                </div>

                                <div style="white-space: nowrap; margin-top: 10px;">
                                    <h5 style="display: inline;">Số lần giao phối: </h5>
                                    <span style="display: inline;">${birdDetails.reproduction_history}</span>
                                </div>
                                <c:if test="${not empty birdDetails.achievement}">
                                    <div style="white-space: nowrap; margin-top: 10px;">
                                        <h5 style="display: inline;">Thành tựu: </h5>
                                        <span style="display: inline;">${birdDetails.achievement}</span>
                                    </div>
                                </c:if>

                                <c:if test="${not empty birdDetails.description}">
                                    <div style="margin-top: 10px;">
                                        <h5>Thông tin: </h5>
                                        <span style="margin-top: 10px;">${birdDetails.description}</span>
                                    </div>
                                </c:if>
                                <div>
                                    <c:if test="${empty sessionScope.LOGIN_USER || sessionScope.LOGIN_USER.role == 'customer'}">
                                        <c:if test="${bird.status ne 'Đã bán' && birdDetails.status ne 'Đang sinh sản' && birdDetails.status ne 'Đang ghép cặp'}">
                                            <div class="total">
                                                <div class="main-border-button">
                                                    <a class="bird-cart" style="cursor: pointer" data-value="${birdDetails.bird_id}">Thêm vào giỏ hàng</a>
                                                </div>
                                            </div>
                                        </c:if>
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
