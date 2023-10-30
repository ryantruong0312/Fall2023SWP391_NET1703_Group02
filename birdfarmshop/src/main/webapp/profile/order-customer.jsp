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
            .nav-link span {
                font-size: 12px;
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
            
            div {
                display: block;
            }
            .order-info {
                margin: 12px 0;
                border: 1px skyblue double;
                box-shadow: 0 1px 1px 0 rgba(0,0,0,.05);
                border-radius: 0.125rem;
                width: 100%;
            }
            .order-detail:first-child {
                padding-top: 24px;
            }
            .order-detail {
                padding: 12px 24px;
                background: #fff;
            }
            .order-bar {
                padding: 0 0 12px;
                justify-content: space-between;
                display: flex;
                align-items: center;
            }
            .order-id {
                display: flex;
                align-items: center;
                white-space: nowrap;
            }
            .order-status {
                float: right;
                line-height: 24px;
                color: #ee4d2d;
                text-align: right;
                text-transform: uppercase;
                white-space: nowrap;
            }
            .detail-inner-1:first-child {
                margin: 0;
                border: 0;
            }
            .detail-inner-1 {
                margin: 10px 0 0;
                border-top: 1px solid rgba(0,0,0,.09);
            }
            .info {
                display: flex;
                word-wrap: break-word;
                padding: 12px 0 0;
                align-items: center;
                flex-wrap: nowrap;
                color: rgba(0,0,0,.87);
            }
            .info-left {
                display: flex;
                word-wrap: break-word;
                padding: 0 12px 0 0;
                flex: 1;
                align-items: flex-start;
                flex-wrap: nowrap;
            }
            .product-image {
                width: 80px;
                height: 80px;
                flex-shrink: 0;
                border: 1px solid #e1e1e1;
                background: #e1e1e1;
            }
            .showAll {
                min-width: 0;
                padding: 0 0 0 12px;
                display: flex;
                flex: 1;
                flex-direction: column;
                align-items: flex-start;
                word-wrap: break-word;
            }
            .product-name {
                overflow: hidden;
                display: -webkit-box;
                text-overflow: ellipsis;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 2;
                margin: 0 0 5px;
                font-size: 16px;
                line-height: 22px;
                max-height: 48px;
            }
            .product-category {
                margin: 0 0 5px;
                color: rgba(0,0,0,.54);
            }
            .product-quantity {
                margin: 0 0 5px;
            }
            .info-right {
                text-align: right;
            }
            .price{
                margin-left: 12px;
            }
            .old-price {
                margin: 0 4px 0 0;
                -webkit-text-decoration-line: line-through;
                -moz-text-decoration-line: line-through;
                text-decoration: line-through;
                color: #000;
                opacity: .26;
                overflow: hidden;
                text-overflow: ellipsis;
                vertical-align: middle;
                font-size: 14px;
                line-height: 16px;
                color: rgba(0,0,0,.87);
            }
            .new-price {
                vertical-align: middle;
                font-size: 14px;
                line-height: 16px;
                color: rgba(0,0,0,.87);
            }
            .boundary {
                width: 100%;
                height: 0;
                border-bottom: 1px dotted rgba(0,0,0,.09);
                position: relative;
            }
            .boundary-1 {
                left: 0;
                -webkit-transform: translate(-50%,-50%);
                transform: translate(-50%,-50%);
            }
            .boundary-2 {
                right: 0;
                -webkit-transform: translate(50%,-50%);
                transform: translate(50%,-50%);
            }
            .boundary-both {
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                background: #f5f5f5;
                width: 0.4375rem;
                height: 0.4375rem;
                border-radius: 50%;
                z-index: 1;
                position: absolute;
                top: 0;
            }
            .total-price {
                padding: 24px 24px 12px;
                background: #fffefb;
            }
            .show-price {
                display: flex;
                justify-content: flex-end;
                align-items: center;
            }
            .show-price span {
                cursor: pointer; 
            }
            .show-price label {
                margin: 0 10px 0 0;
                font-size: 14px;
                line-height: 20px;
                color: rgba(0,0,0,.8);
            }
            .total {
                color: #ee4d2d;
                font-size: 24px;
                line-height: 30px;
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
                                                <a class="nav-link active" data-toggle="tab" href="#allOrder"><span>Tất cả</span></a>
                                            </li>
                                            <li class="nav-item col">
                                                <a class="nav-link" data-toggle="tab" href="#wait"><span>Chờ xử lý</span></a>
                                            </li>
                                            <li class="nav-item col">
                                                <a class="nav-link" data-toggle="tab" href="#inProgress"><span>Đang xử lý</span></a>
                                            </li>
                                            <li class="nav-item col">
                                                <a class="nav-link" data-toggle="tab" href="#delivering"><span>Đang giao</span></a>
                                            </li>
                                            <li class="nav-item col">
                                                <a class="nav-link" data-toggle="tab" href="#delivered"><span>Đã giao</span></a>
                                            </li>
                                            <li class="nav-item col">
                                                <a class="nav-link" data-toggle="tab" href="#rated"><span>Đã đánh giá</span></a>
                                            </li>
                                            <li class="nav-item col">
                                                <a class="nav-link" data-toggle="tab" href="#cancel"><span>Đã hủy</span></a>
                                            </li>
                                        </ul>
                                        <div class="tab-content">
                                            <div class="tab-pane fade show active" id="allOrder">
                                                <div class="row"><!-- all orders -->
                                                    <c:forEach items="${itemMap}" var="map">
                                                    <c:set value="${map.key}" var="order"/>
                                                    <c:set value="${map.value}" var="itemList"/>
                                                    <div class="order-info"><!-- display order -->
                                                        <div style="width: 100%;"><!-- cover product, status -->
                                                            <div class="order-detail"><!-- small div product, status -->
                                                                <section style="display: block;">
                                                                    <div class="order-bar">
                                                                        <!-- order id -->
                                                                        <div class="order-id"><img style="width: 25px; height: 25px;" src="assets\images\order.png"/>${order.order_id}</div>
                                                                        <!-- order status -->
                                                                        <div class="order-status">${order.order_status}</div>
                                                                    </div>
                                                                </section>
                                                                <div class="seperate"></div>
                                                                <section>
                                                                    <h3></h3>
                                                                    <a href="#">
                                                                        <div>
                                                                            <div class="detail-inner-1">
                                                                                <div class="detail-inner-2">
                                                                                    <div>
                                                                                <c:forEach items="${itemList}" var="orderItem">
                                                                                    <c:choose>
                                                                                        <c:when test="${orderItem.bird != null}">
                                                                                        <section>
                                                                                            <div class="info">
                                                                                                <div class="info-left">
                                                                                                    <img src="${orderItem.bird.image_url}" class="product-image" alt="" />
                                                                                                    <div class="showAll">
                                                                                                        <div>
                                                                                                            <div class="product-name"><span>${orderItem.bird.bird_name}</span></div>
                                                                                                        </div>
                                                                                                        <div>
                                                                                                            <div class="product-category"><span></span></div>
                                                                                                            <div class="product-quantity"><span>x1</span></div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="info-right">
                                                                                                    <div class="price">
                                                                                                        <span class="old-price">${orderItem.bird.price}đ</span>
                                                                                                        <span class="new-price">${orderItem.bird.price * (1 - orderItem.bird.discount/100)}đ</span>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </section>
                                                                                        </c:when>
                                                                                        <c:when test="${orderItem.accessory != null}">
                                                                                        <section>
                                                                                            <div class="info">
                                                                                                <div class="info-left">
                                                                                                    <img src="${orderItem.accessory.image_url}" class="product-image" alt="" />
                                                                                                    <div class="showAll">
                                                                                                        <div>
                                                                                                            <div class="product-name"><span>${orderItem.accessory.accessory_name}</span></div>
                                                                                                        </div>
                                                                                                        <div>
                                                                                                            <div class="product-category"><span></span></div>
                                                                                                            <div class="product-quantity"><span>x${orderItem.accessory.stock_quantity}</span></div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="info-right">
                                                                                                    <div class="price">
                                                                                                        <span class="old-price">${orderItem.accessory.unit_price}đ</span>
                                                                                                        <span class="new-price">${orderItem.accessory.unit_price * (1 - orderItem.accessory.discount/100)}đ</span>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </section>
                                                                                        </c:when>
                                                                                        <c:when test="${orderItem.birdNest != null}">
                                                                                        <section>
                                                                                            <div class="info">
                                                                                                <div class="info-left">
                                                                                                    <img src="${orderItem.birdNest.image_url}" class="product-image" alt="" />
                                                                                                    <div class="showAll">
                                                                                                        <div>
                                                                                                            <div class="product-name"><span>${orderItem.birdNest.nest_name}</span></div>
                                                                                                        </div>
                                                                                                        <div>
                                                                                                            <div class="product-category"><span></span></div>
                                                                                                            <div class="product-quantity"><span>x${orderItem.birdNest.baby_quantity}</span></div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="info-right">
                                                                                                    <div class="price">
                                                                                                        <span class="old-price">${orderItem.birdNest.price}đ</span>
                                                                                                        <span class="new-price">${orderItem.birdNest.price * (1 - orderItem.birdNest.discount/100)}đ</span>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </section>
                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                        <section>
                                                                                            <div class="info">
                                                                                                <div class="info-left">
                                                                                                    <img src="" class="product-image" alt="" />
                                                                                                    <div class="showAll">
                                                                                                        <div>
                                                                                                            <div class="product-name"><span>${orderItem.birdPair.male_bird.bird_name} lai với ${orderItem.birdPair.female_bird.bird_name}</span></div>
                                                                                                        </div>
                                                                                                        <div>
                                                                                                            <div class="product-category">${orderItem.birdPair.status}<span></span></div>
                                                                                                            <div class="product-quantity">x${orderItem.birdPair.number_young_bird}<span></span></div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="info-right">
                                                                                                    <div class="price">
                                                                                                        <span class="old-price">${orderItem.birdPair.price}đ</span>
                                                                                                        <span class="new-price">${orderItem.birdPair.price * (1 - orderItem.birdPair.discount/100)}đ</span>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </section>
                                                                                        </c:otherwise>
                                                                                    </c:choose>
                                                                                </c:forEach>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </section>
                                                            </div>
                                                        </div>
                                                        <div class="boundary">
                                                            <div class="boundary-1 boundary-both"></div>
                                                            <div class="boundary-2 boundary-both"></div>
                                                        </div>
                                                        <div class="total-price">
                                                            <div class="show-price">
                                                                <img style="height: 20px; width: 15px;" src="assets\images\th.jfif"/>
                                                                <label>Thành tiền: </label>
                                                                <div class="total">đ ${order.total_price}</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </c:forEach>
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