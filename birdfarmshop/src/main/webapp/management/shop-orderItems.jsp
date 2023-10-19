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
        </style>
        <style>
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
                            <h2>Vẹt cảnh</h2>
                            <span>Những chú vẹt thông minh và đáng yêu nhất đã có mặt tại V.E.T</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ***** Main Banner Area End ***** -->


        <main>
            <c:set value="${requestScope.ITEMLIST}" var="itemList"/>
            <div class="container">
                <div class="col-lg-12">
                    <h1 style="text-align: center;">Chi tiết đơn hàng</h1>
                    <a id="back" href="MainController?action=NavToShopOrders">
                        <i style="color: white; font-size: 1rem; width: 30px;" class="fa fa-arrow-left"></i>
                        <span>Quay lại</span>
                    </a>
                </div>
                <div class="col-lg-12">
                    <div class="order-bar" style="background-color: #cccccc; text-align: center;">
                        <div style="background-color: #cccccc; border-bottom: 3px solid #ffffff;">
                            <img style="width: 15px; height: 15px; float: left; margin: 5px;" class="icon" src="assets/images/test.png" alt="Đơn hàng"/>
                            <span style="color: black; float: left;">Đơn hàng: ${itemList.get(0).order_id}</span>
                            <br/>
                        </div>
                        <div class="scrollable-container">
                            <table class="scrollable-list">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Hình ảnh</th>
                                        <th>Mã sản phẩm</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Giá thành sản phẩm</th>
                                        <th>Số lượng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${itemList}" var="item" varStatus="counter">
                                        <tr class="${counter.count % 2 == 0 ? 'even' : 'odd'}">
                                            <td>${counter.count}</td>
                                            <td><img style="height: 100px; width: 80px;" src="${item.image_url}"/></td>
                                                <c:choose>
                                                    <c:when test="${item.bird_id != null}">
                                                    <td>${item.bird_id}</td>
                                                    <td>${item.bird_name}</td>
                                                </c:when>
                                                <c:when test="${item.nest_id != null}">
                                                    <td>${item.nest_id}</td>
                                                    <td>${item.nest_name}</td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td>${item.accessory_id}</td>
                                                    <td>${item.accessory_name}</td>
                                                </c:otherwise>
                                            </c:choose>
                                            <td>${item.unit_price}</td>
                                            <td>${item.order_quantity}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>        
            </div>
        </main>
        <!-- Start Footer -->
        <%@include file="../layout/message.jsp" %>
        <script src="assets/js/jquery-3.7.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/jquery.validate.min.js" ></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/js/birdshop.js"></script>
        <!-- Plugins -->
        <script src="assets/js/owl-carousel.js"></script>
        <script src="assets/js/accordions.js"></script>
        <script src="assets/js/datepicker.js"></script>
        <script src="assets/js/scrollreveal.min.js"></script>
        <script src="assets/js/slick.js"></script> 
        <script src="assets/js/lightbox.js"></script> 
        <script src="assets/js/isotope.js"></script> 
        <!-- Global Init -->
        <script src="assets/js/custom.js"></script>
        <!-- End Footer -->
    </body>
</html>
