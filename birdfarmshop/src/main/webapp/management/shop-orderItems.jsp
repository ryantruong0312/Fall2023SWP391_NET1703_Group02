<%-- 
    Document   : shop-orderItems
    Created on : Oct 11, 2023, 2:08:55 PM
    Author     : phong pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" type="image/png" href="assets/images/logo-title-bar.png"/>
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <title>V.E.T - Đơn hàng của shop</title>

        <!-- Additional CSS Files -->
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">
        <link rel="stylesheet" href="assets/css/owl-carousel.css">
        <link rel="stylesheet" href="assets/css/lightbox.css">
        <style>
            .col-lg-12 span, label {
                color: black;
            }
            .col-lg-12 button {
                height: 30px;
                border-radius: 5px;
            }
            .col-lg-12 li, form {
                margin: 10px 0 10px 0;
                display: inline-block;
                padding: 0;
            }
            .col-lg-12 #back {
                border: 1px solid #000;
                border-radius: 5px;
                height: 30px;
                padding: 5px;
                background-color: #E0E0E0;
            }
            .order-bar {
                margin-top: 10px;
                border: 1px solid #cccccc;
            }
            .order-bar form {
                width: 30%;
            }
            .order-bar ul {
                border: 1px solid #cccccc;
            }
            .order-bar li {
                display: inline-block;
                color: black;
                margin: 0 10px 0 10px;
            }
            .search-bar {
                border-radius: 8px;
                border: 1px solid rgb(221, 221, 227);
                margin: 0 auto;
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
            .scrollable-container {
                overflow-x: scroll;
            }
            .scrollable-list {
                white-space: nowrap;
                display: inline-block;
            }
            .scrollable-list th {
                width: auto;
                padding: 20px;
            }
            .scrollable-list td {
                width: auto;
                padding: 10px;
            }
            .col-md-3 img {
                width: 250px;
                height: 250px;
            }
            .col-md-3 {
                margin: 10px 0;
                display: flex;
                justify-content: center;/*Căn theo chiều ngang*/
                align-items: center; /*Căn theo chiều dọc*/
            }
            .col-md-6 {
                margin: 10px 0;
                display: flex;
                align-items: center;
            }
            .card-body h3,h5,p {
                float: left;
                clear: left;
                text-align: left;
            }
            .odd {
                background-color: #FFFFFF;
            }
            .even {
                background-color: #E0E0E0;
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
                            <h2>Chi tiết đơn hàng</h2>
                            <span>Những chú vẹt thông minh và đáng yêu nhất đã có mặt tại V.E.T</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ***** Main Banner Area End ***** -->


        <c:set value="${requestScope.ITEMLIST}" var="itemList"/>
        <main>
            <div class="container">
                <div class="col-lg-12">
                    <a id="back" href="MainController?action=NavToShopOrders">
                        <i style="color: white; font-size: 1rem; width: 30px;" class="fa fa-arrow-left"></i>
                        <span>Quay lại</span>
                    </a>
                </div>
                <div class="col-lg-12">
                    <div class="order-bar" style="background-color: #cccccc; text-align: center;">
                        <div style="background-color: #cccccc; border-bottom: 3px solid #ffffff;">
                            <img style="width: 15px; height: 15px; float: left; margin: 5px;" class="icon" src="assets/images/order.png" alt="Đơn hàng"/>
                            <span style="color: black; float: left;">Đơn hàng: ${itemList.get(0).order_id}</span>
                            <br/>
                        </div>
                        <div class="scrollable-container">
                            <div class="card mb-3" style="max-width: 100%;">
                                <div class="row no-gutters">
                                    <c:forEach items="${itemList}" var="item">
                                    <c:set value="${counter.count}" var="index"/>
                                    <c:choose>    
                                        <c:when test="${item.bird != null}">
                                    <div class="col-md-3">
                                        <img src="${item.bird.image_url}" class="card-img" alt="${item.bird.bird_id}">
                                    </div>
                                    <div class="col-md-6">
                                        <div class="card-body">
                                            <h3 class="card-title">${item.bird.bird_name}</h3>
                                            <h5 class="card-title">Màu sắc: ${item.bird.color}</h5><br/>
                                            <c:forEach items="${requestScope.BREEDS}" var="breed">
                                                <c:if test="${breed.breed_id eq item.bird.breed_id}">
                                            <h5 class="card-title">Phân loại: ${breed.breed_name}</h5>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="card-body">
                                            <h5 class="card-title">Số lượng: ${item.order_quantity}</h5>
                                            <h5 class="btn btn-primary">
                                                <fmt:formatNumber value="${item.bird.price}" pattern="#,###"/>₫ <span class="badge badge-light">- ${item.bird.discount}%</span>
                                            </h5>
                                        </div>
                                    </div>
                                        </c:when>
                                        <c:when test="${item.accessory != null}">
                                    <div class="col-md-3">
                                        <img src="${item.accessory.image_url}" class="card-img" alt="${item.accessory.accessory_id}">
                                    </div>
                                    <div class="col-md-6">
                                        <div class="card-body">
                                            <h3 class="card-title">Phụ kiện: ${item.accessory.accessory_name}</h3>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="card-body">
                                            <h5 class="card-title">Số lượng: ${item.order_quantity}</h5>
                                            <h5 class="btn btn-primary">
                                                <c:if test="${item.unit_price == 0}">
                                                <div><span>Tặng kèm</span></div>
                                                </c:if>
                                                <c:if test="${item.unit_price != 0}">
                                                <fmt:formatNumber value="${item.accessory.unit_price}" pattern="#,###"/>₫ <span class="badge badge-light">- ${item.accessory.discount}%</span>
                                                </c:if>
                                            </h5>
                                        </div>
                                    </div>
                                        </c:when>
                                        <c:when test="${item.birdNest != null}">
                                    <div class="col-md-3">
                                        <img src="${item.birdNest.image_url}" class="card-img" alt="${item.birdNest.nest_id}">
                                    </div>
                                    <div class="col-md-6">
                                        <div class="card-body">
                                            <h3 class="card-title">Tổ chim non: ${item.birdNest.nest_name}</h3>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="card-body">
                                            <h5 class="card-title">Số lượng: ${item.order_quantity}</h5>
                                            <h5 class="btn btn-primary">
                                                <fmt:formatNumber value="${item.birdNest.price}" pattern="#,###"/>₫ <span class="badge badge-light">- ${item.birdNest.discount}%</span>
                                            </h5>
                                        </div>
                                    </div>
                                        </c:when>
                                        <c:when test="${item.birdPair != null}">
                                    <div class="col-md-3">
                                        <c:if test="${not empty item.birdPair.pList}" >
                                        <img src="${item.birdPair.pList.get(0)}" class="card-img">
                                        </c:if>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="card-body">
                                            <c:if test="${item.birdPair.male_bird != null && item.birdPair.female_bird != null}">
                                            <h3 class="card-title">${item.birdPair.male_bird.bird_name} x ${item.birdPair.female_bird.bird_name}</h3>
                                            <p class="card-text">Trạng thái nhân giống: ${item.birdPair.status}</p>
                                            </c:if>
                                            <c:if test="${item.birdPair.birdCustomer != null && item.birdPair.female_bird != null}">
                                            <h3 class="card-title">${item.birdPair.birdCustomer.name} x ${item.birdPair.female_bird.bird_name}</h3>
                                            <p class="card-text">Trạng thái nhân giống: ${item.birdPair.status}</p>
                                            </c:if>
                                            <c:if test="${item.birdPair.male_bird != null && item.birdPair.birdCustomer != null}">
                                            <h3 class="card-title">${item.birdPair.male_bird.bird_name} x ${item.birdPair.birdCustomer.name}</h3>
                                            <p class="card-text">Trạng thái nhân giống: ${item.birdPair.status}</p>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="card-body">
                                            <h5 class="card-title">Số lượng: ${item.birdPair.number_young_bird}</h5>
                                            <h5 class="btn btn-primary">
                                                Tiền giống: <fmt:formatNumber value="${item.birdPair.number_young_bird * item.birdPair.young_bird_price}" pattern="#,###"/>₫
                                            </h5>
                                            <h5 class="btn btn-primary">
                                                Tiền phí: <fmt:formatNumber value="2000000" pattern="#,###"/>₫
                                            </h5>
                                        </div>
                                    </div>
                                        </c:when>
                                        <c:otherwise>
                                        </c:otherwise>
                                    </c:choose>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>        
            </div>
        </main>
        <!-- Start Footer -->
        <%@include file="../layout/footer.jsp" %>
    </body>
</html>
