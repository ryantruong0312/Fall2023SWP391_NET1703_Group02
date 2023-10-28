 <%-- 
    Document   : order-customer
    Created on : Oct 18, 2023, 12:19:32 AM
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

        <title>V.E.T - Thông tin cá nhân</title>

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
            .nav-item:first-child{
                width: 10%;
            }
            .nav-item{
                width: 18%;
            }
            #orderTabs li:hover{
                cursor: pointer;
            }
            
            .scrollable-container {
                width: 100%;
                max-height: 300px; /* Điều chỉnh kích thước tối đa theo nhu cầu */
                overflow-y: auto;
            }

            .scrollable-list {
                width: 100%;
            }

            .scrollable-list th, .scrollable-list td {
                text-align: center;
            }
        </style>

    </head>

    <body>
        <!-- Header Start -->
        <%@include file="../layout/header.jsp" %>
        <!-- Header End -->

        <c:set value="${requestScope.ITEMMAP}" var="itemMap"/>
        <main>
            <div class="container container-custome">
                <div class="row gutters">
                    <%@include file="../layout/sidebar-profile.jsp" %>
                    <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                        <div class="card h-100">
                            <div class="card-body profile-section">
                                <div class="row gutters">
                                    <div class="card-body order-section">
                                        <!-- Tab buttons -->
                                        <ul class="nav nav-tabs row" id="orderTabs">
                                            <li class="nav-item col">
                                                <a class="nav-link active" data-toggle="tab" href="#allOrder">Tất cả</a>
                                            </li>
                                            <li class="nav-item col">
                                                <a class="nav-link" data-toggle="tab" href="#wait">Chờ xử lý</a>
                                            </li>
                                            <li class="nav-item col">
                                                <a class="nav-link" data-toggle="tab" href="#inProgress">Đang xử lý</a>
                                            </li>
                                            <li class="nav-item col">
                                                <a class="nav-link" data-toggle="tab" href="#delivering">Đang giao</a>
                                            </li>
                                            <li class="nav-item col">
                                                <a class="nav-link" data-toggle="tab" href="#delivered">Đã giao</a>
                                            </li>
                                            <li class="nav-item col">
                                                <a class="nav-link" data-toggle="tab" href="#rated">Đã đánh giá</a>
                                            </li>
                                            <li class="nav-item col">
                                                <a class="nav-link" data-toggle="tab" href="#cancel">Đã hủy</a>
                                            </li>
                                        </ul>
                                        <div class="tab-content">
                                            <div class="tab-pane fade show active" id="allOrder">
                                                <div class="row">
                                                    <!-- Card components for pending orders -->
                                                    <div class="scrollable-container">
                                                        <%--    <c:forEach items="${itemMap}" var="map">
                                                        <div style="display: none;" class="table-hover scrollable-list w-100" id="cc">
                                                                <c:forEach items="${map.value}" var="orderItem">
                                                                        <c:choose>
                                                                            <c:when test="${orderItem.bird != null}">
                                                                                <span>Tên sản phẩm: ${orderItem.bird.bird_name}</span>
                                                                                <span>Số lượng: 1</span>
                                                                                <span>Giá tiền: ${orderItem.bird.price}</span>
                                                                            </c:when>
                                                                            <c:when test="$${orderItem.accessory != null}">
                                                                                <span>Tên sản phẩm: ${orderItem.accessory.accessory_name}</span>
                                                                                <span>Số lượng: ${orderItem.accessory.stock_quantity}</span>
                                                                                <span>Giá tiền: ${orderItem.accessory.unit_price}</span>
                                                                            </c:when>
                                                                            <c:when test="$${orderItem.birdNest != null}">
                                                                                <span>Tên sản phẩm: ${orderItem.birdNest.nest_name}</span>
                                                                                <span>Số lượng: ${orderItem.birdNest.baby_quantity}</span>
                                                                                <span>Giá tiền: ${orderItem.birdNest.price}</span>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <span>Tên sản phẩm: ${orderItem.birdPair.male_bird.bird_id} lai với ${orderItem.birdPair.female_bird.bird_id}</span>
                                                                                <span>Số lượng: ${orderItem.birdPair.number_young_bird}</span>
                                                                                <span>Giá tiền: 2,000,000</span>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                </c:forEach>
                                                        </div>
                                                    </c:forEach> --%>
                                                        <table class="table table-striped table-hover scrollable-list w-100">
                                                            <thead>
                                                                <tr>
                                                                    <th>Mã đơn hàng</th>
                                                                    <th>Tên người nhận</th>
                                                                    <th>Số điện thoại</th>
                                                                    <th>Địa chỉ</th>
                                                                    <th>Tổng hóa đơn</th>
                                                                    <th>Điểm đã dùng</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach items="${ITEMMAP}" var="item" varStatus="counter">
                                                                <tr class="${counter.count % 2 == 0 ? 'even' : 'odd'}" onclick="toggleList('cc')">
                                                                    <td>${item.key.order_id}</td>
                                                                    <td>${item.key.name_receiver}</td>
                                                                    <td>${item.key.phone_receiver}</td>
                                                                    <td>${item.key.address_receiver}</td>
                                                                    <td>${item.key.total_price}</td>
                                                                    <td>${item.key.point}</td>
                                                                </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
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
            </div>
        </main>
        <!-- Start Footer -->
        <%@include file="../layout/footer.jsp" %>
        <!-- End Footer -->
        <script>
            function toggleList(listId) {
                var list = document.getElementById(listId);
                if (list.style.display === "none" || list.style.display === "") {
                    list.style.display = "block";
                } else {
                    list.style.display = "none";
                }
            }
        </script>
    </body>
</html>