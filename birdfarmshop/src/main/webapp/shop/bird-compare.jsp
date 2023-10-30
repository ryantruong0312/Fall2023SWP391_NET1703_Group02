<%-- 
    Document   : compair-birds
    Created on : Sep 13, 2023, 11:23:00 PM
    Author     : tlminh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>V.E.T - So sánh</title>
        <link rel="icon" type="image/png" href="assets/images/logo-title-bar.png"/>
        <!-- Additional CSS Files -->
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">
        <link rel="stylesheet" href="assets/css/owl-carousel.css">
        <link rel="stylesheet" href="assets/css/lightbox.css">
        <link rel="stylesheet" href="assets/compare-bird/css/style.css"> <!-- Resource style -->
        <script src="assets/compare-bird/js/modernizr.js"></script> <!-- Modernizr -->
        <style>
            #counter-box:hover{
                cursor: pointer;
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
                            <h2>So sánh thông tin</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ***** Main Banner Area End ***** -->

        <main>

            <a href="${toBirds}"><button class="btn btn-primary">Quay lại</button></a>
            <section class="cd-products-comparison-table">
                <div class="cd-products-table">
                    <div class="cd-products-wrapper">
                        <ul class="cd-products-columns">
                            <c:forEach var="bird" items="${requestScope.BIRDS}">
                                <li class="product">
                                    <ul class="cd-features-list">
                                        <li>
                                            <img class="birdImage" src="${bird.image_url}" style="height: 250px" alt="product image">
                                            <h3> ${bird.bird_name} </h3>
                                        </li>
                                        <c:choose>
                                            <c:when test="${bird.discount > 0}">
                                                <li>
                                                    <span class="d-block">Giá bán: <del><fmt:formatNumber value="${bird.price}" pattern="#,###"/> ₫</del></span>
                                                    <span class="d-block birdPrice" style="color: red; margin-top: 5px;"><fmt:formatNumber value="${bird.price - bird.price * bird.discount / 100}" pattern="#,###"/> ₫</span>
                                                </li>
                                            </c:when>                                                    
                                            <c:otherwise>
                                                <li clas="birdPrice">
                                                    <span>Giá bán: <fmt:formatNumber value="${bird.price}" pattern="#,###"/> ₫</span>
                                                </li>
                                            </c:otherwise>
                                        </c:choose> 
                                        <li>Tuổi chim: ${bird.age} tháng</li>
                                        <li>Lứa sinh sản: ${bird.reproduction_history} </li>
                                        <li>Thành tích: ${bird.achievement} </li>
                                        <li>Tình trạng: ${bird.status} </li>
                                        <li>
                                            <a href="MainController?action=NavToBirdDetails&bird_id=${bird.bird_id}">
                                                <button class="detail-info btn btn-success">Chi tiết</button>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div> <!-- .cd-products-table -->
            </section> <!-- .cd-products-comparison-table -->
        </main>
        <!-- Start Footer -->
        <%@include file="../layout/footer.jsp" %>
        <!-- End Footer -->

    </body>
</html>

