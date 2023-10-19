

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

        <title>V.E.T - Ghép cặp</title>

        <!-- Additional CSS Files -->
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">
        <link rel="stylesheet" href="assets/css/owl-carousel.css">
        <link rel="stylesheet" href="assets/css/lightbox.css">
        <style type="text/css">
            body {
                margin: 0;
                padding-top: 150px;
                color: #2e323c;
                background: #f5f6fa;
                position: relative;
                height: 100%;
            }
            .account-settings .user-profile {
                margin: 0 0 1rem 0;
                padding-bottom: 1rem;
                text-align: center;
            }
            .account-settings .user-profile .user-avatar {
                margin: 0 0 1rem 0;
            }
            .account-settings .user-profile .user-avatar img {
                width: 90px;
                height: 90px;
                -webkit-border-radius: 100px;
                -moz-border-radius: 100px;
                border-radius: 100px;
            }
            .account-settings .user-profile h5.user-name {
                margin: 0 0 0.5rem 0;
            }
            .account-settings .user-profile h6.user-email {
                margin: 0;
                font-size: 0.8rem;
                font-weight: 400;
                color: #9fa8b9;
            }
            .account-settings .about {
                margin: 2rem 0 0 0;
                text-align: center;
            }
            .account-settings .about h5 {
                margin: 0 0 15px 0;
                color: #007ae1;
            }
            .account-settings .about p {
                font-size: 0.825rem;
            }
            .form-control {
                border: 1px solid #cfd1d8;
                -webkit-border-radius: 2px;
                -moz-border-radius: 2px;
                border-radius: 2px;
                font-size: .825rem;
                background: #ffffff;
                color: #2e323c;
            }

            .form-group .form-control {
                white-space: pre-wrap;
                font-size: 16px;
            }
            .form-group a {
                text-decoration: none;
                color: black;
            }

            .card {
                background: #ffffff;
                -webkit-border-radius: 5px;
                -moz-border-radius: 5px;
                border-radius: 5px;
                border: 0;
                margin-bottom: 1rem;
            }

            .about li {
                margin-bottom: 10px;
                padding-top: 10px;
                padding-bottom: 10px;
                padding-left: 5px;
                text-align: left;
            }

            .about li:hover {
                background: #cccccc;
            }
            .about .active-profile a
            {
                color:  orange;
            }
            .about a .icon{
                width: 24px;
                height: 24px;
                margin: 0px 10px 0px 0px;
                font-size: 24px;
            }

            .about a {
                color: black;
            }
            .text-primary{
                text-transform: uppercase;
                font-size: 20px;
            }
            .gutters{
                margin-bottom: 20px;
            }
            .register-date{
                font-style: italic;
                font-weight: bold;
            }
            .nav-item{
                width: 20%;
                text-align: center;
            }
            .image-item img{
                height: 100px;
                width: 100px;
            }
            .card .bird {
                border: 1px solid #e9e9ed;
                border-radius: 15px;
                padding: 0 12px;
            }
            .card .order{
                width: 40px;
            }
            .body-bird{
                max-height: 585px;
                overflow-y: scroll;
            }
            .body-bird::-webkit-scrollbar {
                border-radius: 0;
                width: 8px;
            }

            .body-bird::-webkit-scrollbar-thumb {
                border-radius: 4px;
                background-color: rgba(22, 24, 35, 0.06);
            }

            .body-bird::-webkit-scrollbar-track {
                border-radius: 0;
                background-color: rgba(0, 0, 0, 0);
            }
        </style>

    </head>

    <body>
        <!-- Header Start -->
        <%@include file="../layout/header.jsp" %>
        <!-- Header End -->
        <main class="detail-bird-pair">
            <div class="container">
                <div class="row gutters">
                    <%@include file="../layout/sidebar-profile.jsp" %>
                    <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                        <div class="card h-100">
                            <div class="card-body order-section">
                                <!-- Tab buttons -->
                                <div class="tab-pane">
                                    <!-- Similar structure as the Pending Orders Tab -->
                                    <div class="row">
                                        <!-- Card components for pending orders -->
                                        <div class="col-12">
                                            <div class="card w-100"> 
                                                <div class="card-body card-pair p-0">
                                                    <c:choose>
                                                        <c:when test="${not empty requestScope.BIRDPAIR}">
                                                            <c:set var="birdPair" value="${requestScope.BIRDPAIR}"/>
                                                            <a style="color: black;" class="ml-3"href="MainController?action=NavToBirdPairCustomer">
                                                                <i style="color: black; font-size: 1rem; width: 20px;" class="fa fa-arrow-left" aria-hidden="true"></i>
                                                                Quay lại
                                                            </a>
                                                            <c:choose>
                                                                <c:when test="${not empty birdPair.birdCustomer}">
                                                                    <div class="box-pair mt-2">
                                                                        <div class="d-flex align-items-center justify-content-between">
                                                                            <div class="pair-img pl-3 py-3 text-center">
                                                                                <img src="${birdPair.birdCustomer.img_url}" alt="${birdPair.birdCustomer.name}" />
                                                                                <p>${birdPair.birdCustomer.name}</p>
                                                                            </div>
                                                                            <div class="text-center">
                                                                                <div class="pair-status mb-4">
                                                                                    ${birdPair.status}
                                                                                </div>                                                                         
                                                                            </div>
                                                                            <c:choose>
                                                                                <c:when test="${not empty birdPair.male_bird}">
                                                                                    <a href="MainController?action=NavToBirdDetails&bird_id=${birdPair.male_bird.bird_id}"> 
                                                                                        <div class="pair-img pl-3 py-3 text-center">
                                                                                            <img src="${birdPair.male_bird.image_url}" alt="${birdPair.male_bird.bird_name}"/>
                                                                                            <p>${birdPair.male_bird.bird_name}</p>
                                                                                        </div>
                                                                                    </a>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <a href="MainController?action=NavToBirdDetails&bird_id=${birdPair.female_bird.bird_id}">
                                                                                        <div class="pair-img pr-3 py-3 text-center">
                                                                                            <img src="${birdPair.female_bird.image_url}" alt="${birdPair.female_bird.bird_name}"/>
                                                                                            <p>${birdPair.female_bird.bird_name}</p>
                                                                                        </div>
                                                                                    </a>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </div>
                                                                    </div>
                                                                    <div class="content-birdpair mx-3">
                                                                        <div class="d-flex">
                                                                            <p>Số lượng trứng</p>
                                                                            <p class="ml-3">${birdPair.number_egg}</p>
                                                                        </div>
                                                                        <div class="d-flex">
                                                                            <p>Số lượng chim non</p>
                                                                            <p class="ml-3">${birdPair.number_young_bird}</p>
                                                                        </div>
                                                                        <div class="d-flex">
                                                                            <div class="price-pair">
                                                                                <p>Giá tiền một con chim non</p>
                                                                                <span class="text-muted">(Giá tiền chim con được tính trên 20% giá gốc tiền chim ghép cặp)</span>
                                                                            </div>
                                                                            <p class="ml-3"><fmt:formatNumber value="${birdPair.young_bird_price}" pattern="#,###"/> ₫</p>
                                                                        </div>

                                                                        <div class="d-flex">
                                                                            <p>Tổng tiền cần thanh toán</p>
                                                                            <p class="ml-3 text-danger"><fmt:formatNumber value="${birdPair.number_young_bird * birdPair.young_bird_price}" pattern="#,###"/> ₫</p>
                                                                        </div>
                                                                        <c:if test="${birdPair.status == 'Đã ấp nở'}">
                                                                            <div class="d-flex">
                                                                                <p>Hình thức thanh toán</p>
                                                                                <p class="ml-3">Chưa thanh toán</p>
                                                                            </div>
                                                                            <div class="text-center  border-0">
                                                                                <button id="payment-youngBird" class="btn-danger mt-3 py-2 px-3">Xác nhận thanh toán</button>
                                                                            </div>
                                                                        </c:if>
                                                                    </div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <div class="box-pair mt-2">
                                                                        <div class="d-flex align-items-center justify-content-between">
                                                                            <a href="MainController?action=NavToBirdDetails&bird_id=${birdPair.male_bird.bird_id}"> 
                                                                                <div class="pair-img pl-3 py-3 text-center">
                                                                                    <img src="${birdPair.male_bird.image_url}" alt="${birdPair.male_bird.bird_name}"/>
                                                                                    <p>${birdPair.male_bird.bird_name}</p>
                                                                                </div>
                                                                            </a>
                                                                            <div class="text-center">
                                                                                <div class="pair-status mb-4">
                                                                                    ${birdPair.status}
                                                                                </div>                                                                         
                                                                            </div>
                                                                            <a href="MainController?action=NavToBirdDetails&bird_id=${birdPair.female_bird.bird_id}">
                                                                                <div class="pair-img pr-3 py-3 text-center">
                                                                                    <img src="${birdPair.female_bird.image_url}" alt="${birdPair.female_bird.bird_name}"/>
                                                                                    <p>${birdPair.female_bird.bird_name}</p>
                                                                                </div>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="line-status d-flex align-items-center py-5">
                                                                        <div class="img-detail w-50 h-100">

                                                                        </div>
                                                                        <div class="line-time w-50 h-100">
                                                                            <ul class="p-2 mt-3">
                                                                                <c:forEach var="tracking" items="${requestScope.TRACKINGLIST}">
                                                                                    <li class="mb-2"><fmt:formatDate value="${tracking.date}" pattern="dd-MM-yyyy HH:mm"/> <span class="ml-3">${tracking.content}</span></li>
                                                                                    </c:forEach>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                    <div class="content-birdpair mx-3">
                                                                        <div class="d-flex">
                                                                            <p>Số lượng trứng</p>
                                                                            <p class="ml-3">${birdPair.number_egg}</p>
                                                                        </div>
                                                                        <div class="d-flex">
                                                                            <p>Số lượng chim non</p>
                                                                            <p class="ml-3">${birdPair.number_young_bird}</p>
                                                                        </div>
                                                                        <div class="d-flex">
                                                                            <div class="price-pair">
                                                                                <p>Giá tiền một con chim non</p>
                                                                                <span class="text-muted">(Giá tiền chim con được tính trên 20% giá gốc tiền chim của cửa hàng ghép cặp)</span>
                                                                            </div>
                                                                            <p class="ml-3"><fmt:formatNumber value="${birdPair.young_bird_price}" pattern="#,###"/> ₫</p>
                                                                        </div>
                                                                        <c:if test="${birdPair.status == 'Đã ấp nở'}">
                                                                            <div class="d-flex">
                                                                                <p>Tổng tiền cần thanh toán</p>
                                                                                <p class="ml-3 text-danger"><fmt:formatNumber value="${birdPair.number_young_bird * birdPair.young_bird_price}" pattern="#,###"/> ₫</p>
                                                                            </div>
                                                                            <c:if test="${birdPair.status == 'Đã ấp nở'}">
                                                                                <div class="d-flex">
                                                                                    <p>Hình thức thanh toán</p>
                                                                                    <p class="ml-3">Chưa thanh toán</p>
                                                                                </div>
                                                                                <div class="text-center border-bottom-0">
                                                                                    <button id="payment-youngBird" class="btn-danger mt-3 py-2 px-3">Xác nhận thanh toán</button>
                                                                                </div>
                                                                            </c:if>

                                                                        </c:if>
                                                                    </div>        
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="mt-5">
                                                                <h4 class="text-center">Bạn chưa có ghép cặp chim</h4>
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <section id="confirm-payment" class="container-fluid">
            <div class="vh-100 row">
                <div class="h-100 m-auto d-flex align-items-center">
                    <div class="box-remove bg-white p-4">
                        <h4>Xác nhận</h4>
                        <p class="mb-4 mt-4">
                            Bạn có muốn mua chim của cửa hàng đã ghép cặp không ?
                        </p>
                        <c:choose>
                            <c:when test="${not empty birdPair.male_bird && not empty birdPair.female_bird}">
                                <div class="item-cart pr-3 my-3">
                                    <h6 class="ml-3">Chim trống:</h6>
                                    <div class="row align-items-center py-3 pl-3">
                                        <div class="image-item col-2">
                                            <img src="${birdPair.male_bird.image_url}" alt="${birdPair.male_bird.bird_name}" />
                                        </div>
                                        <div class="infor-item px-5  col-md-6  col-7">
                                            <h5>${birdPair.male_bird.bird_name}</h5>
                                            <div class="mt-2">
                                                <p> 1
                                                    <span style="font-size: 13px; margin-right: 5px">x</span>
                                                    <c:choose>
                                                        <c:when test="${birdPair.male_bird.discount > 0}">
                                                        <p style="font-size: 14px;">  <fmt:formatNumber value="${birdPair.male_bird.price - birdPair.male_bird.bird.price * birdPair.male_bird.discount / 100}" pattern="#,###"/> ₫</p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p class="mb-0" style="font-size: 14px; color: black; display: inline-block"><fmt:formatNumber value="${birdPair.male_bird.price}" pattern="#,###"/> ₫</p>
                                                    </c:otherwise>
                                                </c:choose> 
                                                </p>
                                            </div>
                                        </div>
                                        <div class="price-item ml-4 px-3 col-md-3 col-2">
                                            <c:choose>
                                                <c:when test="${birdPair.male_bird.discount > 0}">
                                                    <p class="float-right" style="font-size: 19px;font-weight: bold; position: relative "><fmt:formatNumber value="${birdPair.male_bird.price - birdPair.male_bird.bird.price * birdPair.male_bird.discount / 100}" pattern="#,###"/> ₫</p>
                                                    <p style="position: absolute;top: -25px;right: -13px; display: inline-block; border-radius: 10px; background-color: #cccccc; padding: 0 5px 0 5px; color: black;"> -${birdPair.male_bird.discount}%</p>
                                                </c:when>
                                                <c:otherwise>
                                                    <p class="mb-0 float-right" style="font-size: 20px; font-weight: bold; display: inline-block"><fmt:formatNumber value="${birdPair.male_bird.price}" pattern="#,###"/> ₫</p>
                                                </c:otherwise>
                                            </c:choose> 
                                        </div>
                                    </div>
                                </div>
                                <div class="item-cart pr-3 my-3">
                                    <h6 class="ml-3">Chim mái:</h6>
                                    <div class="row align-items-center py-3 pl-3">
                                        <div class="image-item  col-2">
                                            <img src="${birdPair.female_bird.image_url}" alt="${birdPair.female_bird.bird_name}" />
                                        </div>
                                        <div class="infor-item px-5  col-md-6 col-7">
                                            <h5>${birdPair.female_bird.bird_name}</h5>
                                            <div class="mt-2">
                                                <p> 1
                                                    <span style="font-size: 13px; margin-right: 5px">x</span>
                                                    <c:choose>
                                                        <c:when test="${birdPair.female_bird.discount > 0}">
                                                        <p style="font-size: 14px;">  <fmt:formatNumber value="${birdPair.female_bird.price - birdPair.female_bird.price * birdPair.female_bird.discount / 100}" pattern="#,###"/> ₫</p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p class="mb-0" style="font-size: 14px; color: black; display: inline-block"><fmt:formatNumber value="${birdPair.female_bird.price}" pattern="#,###"/> ₫</p>
                                                    </c:otherwise>
                                                </c:choose> 
                                                </p>
                                            </div>
                                        </div>
                                        <div class="price-item ml-4 px-3 col-md-3  col-2">
                                            <c:choose>
                                                <c:when test="${birdPair.female_bird.discount > 0}">
                                                    <p class="float-right" style="font-size: 19px;font-weight: bold; position: relative "><fmt:formatNumber value="${birdPair.female_bird.price - birdPair.female_bird.price * birdPair.female_bird.discount / 100}" pattern="#,###"/> ₫</p>
                                                    <p style="position: absolute;top: -25px;right: -13px; display: inline-block; border-radius: 10px; background-color: #cccccc; padding: 0 5px 0 5px; color: black;"> -${birdPair.female_bird.discount}%</p>
                                                </c:when>
                                                <c:otherwise>
                                                    <p class="mb-0 float-right" style="font-size: 20px; font-weight: bold; display: inline-block"><fmt:formatNumber value="${birdPair.female_bird.price}" pattern="#,###"/> ₫</p>
                                                </c:otherwise>
                                            </c:choose> 
                                        </div>
                                    </div>
                                </div>  
                            </c:when>
                            <c:when test="${not empty birdPair.male_bird}">
                                <div class="item-cart pr-3 my-3">
                                    <h6 class="ml-3">Chim trống:</h6>
                                    <div class="row align-items-center py-3 pl-3">
                                        <div class="image-item col-2">
                                            <img src="${birdPair.male_bird.image_url}" alt="${birdPair.male_bird.bird_name}" />
                                        </div>
                                        <div class="infor-item px-5 col-md-6 col-7">
                                            <h5>${birdPair.male_bird.bird_name}</h5>
                                            <div class="mt-2">
                                                <p> 1
                                                    <span style="font-size: 13px; margin-right: 5px">x</span>
                                                    <c:choose>
                                                        <c:when test="${birdPair.male_bird.discount > 0}">
                                                        <p style="font-size: 14px;">  <fmt:formatNumber value="${birdPair.male_bird.price - birdPair.male_bird.price * birdPair.male_bird.discount / 100}" pattern="#,###"/> ₫</p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p class="mb-0" style="font-size: 14px; color: black; display: inline-block"><fmt:formatNumber value="${birdPair.male_bird.price}" pattern="#,###"/> ₫</p>
                                                    </c:otherwise>
                                                </c:choose> 
                                                </p>
                                            </div>
                                        </div>
                                        <div class="price-item ml-4 px-3 col-md-3 col-2">
                                            <c:choose>
                                                <c:when test="${birdPair.male_bird.discount > 0}">
                                                    <p class="float-right" style="font-size: 19px;font-weight: bold; position: relative "><fmt:formatNumber value="${birdPair.male_bird.price - birdPair.male_bird.price * birdPair.male_bird.discount / 100}" pattern="#,###"/> ₫</p>
                                                    <p style="position: absolute;top: -25px;right: -13px; display: inline-block; border-radius: 10px; background-color: #cccccc; padding: 0 5px 0 5px; color: black;"> -${birdPair.male_bird.discount}%</p>
                                                </c:when>
                                                <c:otherwise>
                                                    <p class="mb-0 float-right" style="font-size: 20px; font-weight: bold; display: inline-block"><fmt:formatNumber value="${birdPair.male_bird.price}" pattern="#,###"/> ₫</p>
                                                </c:otherwise>
                                            </c:choose> 
                                        </div>
                                    </div>
                                </div>
                            </c:when>                                
                            <c:when test="${not empty birdPair.female_bird}">
                                <h6 class="ml-3">Chim mái:</h6>
                                <div class="item-cart pr-3 my-3">
                                    <div class="row align-items-center py-3 pl-3">
                                        <div class="image-item col-2">
                                            <img src="${birdPair.female_bird.image_url}" alt="${birdPair.female_bird.bird_name}" />
                                        </div>
                                        <div class="infor-item px-5 col-md-6 col-7">
                                            <h5>${birdPair.female_bird.bird_name}</h5>
                                            <div class="mt-2">
                                                <p> 1
                                                    <span style="font-size: 13px; margin-right: 5px">x</span>
                                                    <c:choose>
                                                        <c:when test="${birdPair.female_bird.discount > 0}">
                                                        <p style="font-size: 14px;">  <fmt:formatNumber value="${birdPair.female_bird.price - birdPair.female_bird.price * birdPair.female_bird.discount / 100}" pattern="#,###"/> ₫</p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p class="mb-0" style="font-size: 14px; color: black; display: inline-block"><fmt:formatNumber value="${birdPair.female_bird.price}" pattern="#,###"/> ₫</p>
                                                    </c:otherwise>
                                                </c:choose> 
                                                </p>
                                            </div>
                                        </div>
                                        <div class="price-item ml-4 px-3 col-md-3 col-2">
                                            <c:choose>
                                                <c:when test="${birdPair.female_bird.discount > 0}">
                                                    <p class="float-right" style="font-size: 19px;font-weight: bold; position: relative "><fmt:formatNumber value="${birdPair.female_bird.price - birdPair.female_bird.price * birdPair.female_bird.discount / 100}" pattern="#,###"/> ₫</p>
                                                    <p style="position: absolute;top: -25px;right: -13px; display: inline-block; border-radius: 10px; background-color: #cccccc; padding: 0 5px 0 5px; color: black;"> -${birdPair.female_bird.discount}%</p>
                                                </c:when>
                                                <c:otherwise>
                                                    <p class="mb-0 float-right" style="font-size: 20px; font-weight: bold; display: inline-block"><fmt:formatNumber value="${birdPair.female_bird.price}" pattern="#,###"/> ₫</p>
                                                </c:otherwise>
                                            </c:choose> 
                                        </div>
                                    </div>
                                </div>   
                            </c:when>
                        </c:choose>
                        <div class="d-flex float-right">
                            <c:if test="${not empty birdPair.male_bird && not empty birdPair.female_bird}" >
                                <form action="MainController" method="POST">
                                    <input type="hidden" name="action" value="NavToCheckoutBirdPair"/>
                                    <input type="hidden" name="order_id" value="${birdPair.order_id}"/>
                                    <input type="hidden" name="pair_id" value="${birdPair.pair_id}"/>
                                    <input type="hidden" name="male_bird" value="${birdPair.male_bird.bird_id}"/>
                                    <input type="hidden" name="female_bird" value="${birdPair.female_bird.bird_id} "/>
                                    <button id="btn-confirrm" class="btn btn-group-sm btn-primary mx-1">Cả hai</button>  
                                </form>
                            </c:if>
                            <c:if test="${not empty birdPair.male_bird}">
                                <form action="MainController" method="POST">
                                    <input type="hidden" name="action" value="NavToCheckoutBirdPair"/>
                                    <input type="hidden" name="order_id" value="${birdPair.order_id}"/>
                                    <input type="hidden" name="pair_id" value="${birdPair.pair_id}"/>
                                    <input type="hidden" name="male_bird" value="${birdPair.male_bird.bird_id}"/>
                                    <button id="btn-confirrm" class="btn btn-group-sm btn-primary mx-1">Chim trống</button>  
                                </form> 
                            </c:if>
                            <c:if test="${not empty birdPair.female_bird}">
                                <form action="MainController" method="POST">
                                    <input type="hidden" name="action" value="NavToCheckoutBirdPair"/>
                                    <input type="hidden" name="order_id" value="${birdPair.order_id}"/>
                                    <input type="hidden" name="pair_id" value="${birdPair.pair_id}"/>
                                    <input type="hidden" name="female_bird" value="${birdPair.female_bird.bird_id}"/>
                                    <button id="btn-confirrm" class="btn btn-group-sm btn-primary mx-1">Chim mái</button>  
                                </form>
                            </c:if>
                            <form action="MainController" method="POST">
                                <input type="hidden" name="action" value="NavToCheckoutBirdPair"/>
                                <input type="hidden" name="order_id" value="${birdPair.order_id}"/>
                                <input type="hidden" name="pair_id" value="${birdPair.pair_id}"/>
                                <button id="btn-confirrm" class="btn btn-group-sm btn-primary mx-1">Không</button>
                            </form>
                            <button  onclick="cancelRemove()" class="btn btn-group-sm btn-secondary mx-1">Hủy</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>             
        <!-- Start Footer -->
        <%@include file="../layout/footer.jsp" %>
        <!-- End Footer -->
        <script>
            $('#payment-youngBird').click(function () {
                $('#confirm-payment').css('display', 'block');
            });
            function cancelRemove() {
                $('#confirm-payment').css('display', 'none');
            }
        </script>
    </body>
</html>
