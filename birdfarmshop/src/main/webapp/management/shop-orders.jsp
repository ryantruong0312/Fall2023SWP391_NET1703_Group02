<%-- 
    Document   : shop-orders
    Created on : Sep 25, 2023, 11:10:46 AM
    Author     : tlminh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
            .col-lg-12 form {
                width: 100%;
                margin: 0 auto;
            }
            .col-lg-12 span, label {
                color: black;
            }
            .col-lg-12 li, ul {
                margin: 10px 0;
                display: inline-block;
                padding: 0;
            }

            .bordered-link {
                border: 1px solid #000;
                border-radius: 5px;
                height: 30px;
                padding: 5px;
            }

            .bordered-link:hover {
                background-color: #f0f0f0;
            }
            #submit {
                background-color: #cccccc;
                border: 1px solid #000;
                border-radius: 5px;
                padding: 2px 5px;
            }
            #submit:hover {
                background-color: #f0f0f0;
            }
            span:hover {
                color: #2a2a2a;
            }

            .order-bar {
                border: 1px solid #cccccc;
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
                width: 25%;
                white-space: nowrap;
                background-color: white;
                margin: 0 auto;
            }
            .search-bar button {
                border: 0;
                background: none;
            }
            .search-bar img, .search-bar input, .search-bar button {
                margin: 0;
                padding: 0;
                background-color: inherit;
                border-radius: 8px;
            }
            .search-bar input[type=text] {
                border: 0;
                background: none;
                outline: none;
                width: 60%;
            }
            .search-bar img {
                margin-left: 5px;
                width: 15px;
                height: 15px;
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
                padding: 20px 10px;
            }
            .scrollable-list td {
                width: auto;
                padding: 20px 10px;
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
                            <h2>Danh sách đơn hàng</h2>
                            <span>Những chú vẹt thông minh và đáng yêu nhất đã có mặt tại V.E.T</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ***** Main Banner Area End ***** -->

        <c:set value="${requestScope.ORDERLIST}" var="orderList"/>
        <section class="section" id="products">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <c:if test="${requestScope.MESSAGE != null}">
                            <script>
                                alert("${requestScope.MESSAGE}");
                            </script>
                        </c:if>
                        <c:if test="${requestScope.UPDATED != null}">
                            <script>
                                alert("${requestScope.UPDATED}");
                            </script>
                        </c:if>
                        <%
                            String requestURL = "MainController";
                            String queryString = request.getQueryString();
                            String fullURL = requestURL + "?" + queryString + "&";
                        %>
                        <form style="float: right;" action="MainController" method="GET">
                            <h3 style="color: #006699;">Theo thời gian</h3>
                            <input type="hidden" name="date" value="${requestScope.date}"/>
                            <ul>
                                <li><a class="bordered-link" href="<%= fullURL %>date=today"><span>Hôm nay</span></a></li>
                                <li><a class="bordered-link" href="<%= fullURL %>date=yesterday"><span>Hôm qua</span></a></li>
                                <li><a class="bordered-link" href="<%= fullURL %>date=thisWeek"><span>Tuần này</span></a></li>
                                <li><a class="bordered-link" href="<%= fullURL %>date=thisMonth"><span>Tháng này</span></a></li>
                                <li><a class="bordered-link" href="<%= fullURL %>date=thisYear"><span>Năm nay</span></a></li>
                                <label for="start-date">Từ ngày:</label>
                                <input type="date" name="startDay" value="${requestScope.startDay}">
                                <label for="end-date">Đến ngày:</label>
                                <input type="date" name="endDay" value="${requestScope.endDay}">
                                <button type="submit" name="action" value="NavToShopOrders"><span>Chọn</span></button>
                            </ul>
                            <h3 style="color: #006699;">Theo trạng thái</h3>
                            <input type="hidden" name="status" value="${requestScope.status}"/>
                            <ul>
                                <c:forEach items="${requestScope.statuses}" var="status_choosing">
                                    <li><a class="bordered-link" href="<%= fullURL %>status=${status_choosing}"><span>${status_choosing}</span></a></li>
                                            </c:forEach>
                            </ul>
                            <div style="background-color: #cccccc;">
                                <a href="MainController?action=NavToShopOrders"><span style="color: #009999; margin-left: 10px;">** BỎ LỌC **</span></a>
                                <h6 style="margin-left: 10px;">Lọc theo: 
                                    <c:if test="${requestScope.date != null}">| Thời gian: ${requestScope.date} |</c:if>
                                    <c:if test="${requestScope.startDay != null || requestScope.endDay != null}">| Khoảng thời gian: Từ ${requestScope.startDay} đến ${requestScope.endDay} |</c:if>
                                    <c:if test="${requestScope.search != null}">| Tìm kiếm: ${requestScope.search} |</c:if>
                                    <c:if test="${requestScope.status != null}">| Trạng thái: ${requestScope.status} |</c:if>
                                    </h6>
                                </div>
                                <div class="order-bar" style="background-color: #cccccc; margin: 10px 0;">
                                    <div style="padding-bottom: 15px;">
                                        <img style="width: 15px; height: 15px; float: left; margin: 5px;" class="icon" src="assets/images/test.png" alt="Đơn hàng"/>
                                        <span style="color: black; float: left;">Đơn hàng</span>
                                    </div>
                                    <div style="" class="search-bar">
                                        <img src="assets/images/search.png"/>
                                        <input type="text" name="search" placeholder="Tìm kiếm" value="${requestScope.search}">
                                    <button type="submit" name="action" value="NavToShopOrders"><span>Tìm kiếm</span></button>
                                </div>

                                <ul style="display: none; padding: 5px 0;" id="update">
                                    <c:forEach items="${requestScope.statuses}" var="status_choosing">
                                        <li><input type="radio" name="status" value="${status_choosing}" id="${status_choosing}"><label for="${status_choosing}">${status_choosing}</label></li>
                                        </c:forEach>
                                    <button id="submit" name="action" value="NavToUpdateOrder"><span>Đồng ý</span></button>
                                    <a class="bordered-link" onclick="hide('update');"><span>Hủy bỏ</span></a>
                                </ul>
                                <div class="scrollable-container">
                                    <table id="order-list" class="scrollable-list">
                                        <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th>Order Id</th>
                                                <th>User ID</th>
                                                <th>Ngày đặt hàng</th>
                                                <th>Tình trạng đơn hàng</th>
                                                <th>Chi tiết</th>
                                                <th>Cập nhật</th>
                                                <th>Hủy bỏ</th>
                                                <th>Tên người nhận</th>
                                                <th>Sđt người nhận</th>
                                                <th>Địa chỉ nhận hàng</th>
                                                <th>Tình trạng thanh toán</th>
                                                <th>Tổng đơn hàng</th>
                                                <th>Điểm đã dùng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${not empty orderList}">
                                                <c:forEach items="${orderList}" var="order" varStatus="counter">
                                                    <tr class="${counter.count % 2 == 0 ? 'even' : 'odd'}">
                                                        <td>${counter.count}</td>
                                                        <td>${order.order_id}</td>
                                                        <td><a href="MainController?action=NavToProfile?user_id=${order.customer}">${order.customer}</a></td>
                                                        <td>${order.order_date}</td>
                                                        <td>${order.order_status}</td>
                                                        <td><a href="MainController?action=NavToOrderItems&order_id=${order.order_id}">Chi tiết</a></td>
                                                        <td onclick="show('update', '${order.order_id}')"><span style="color: #007BFF;">Cập nhật</span></td>
                                                        <td>
                                                            <a href="MainController?action=NavToUpdateOrder&order_id=${order.order_id}&status=cancel">Hủy đơn</a>
                                                        </td>
                                                        <td>${order.name_receiver}</td>
                                                        <td>${order.phone_receiver}</td>
                                                        <td>${order.address_receiver}</td>
                                                        <td>${order.payment_status}</td>
                                                        <td>${order.total_price}</td>
                                                        <td>${order.point}</td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${empty orderList}">
                                                <tr>
                                                    <td colspan="10">Không tìm thấy đơn hàng    </td>
                                                </tr>
                                            </c:if>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="pagination">
                                <c:if test="${requestScope.noOfPages > 1}">
                                    <ul>
                                        <li>
                                            <a href="<%= fullURL %>page=1"><<</a>
                                        </li>
                                        <c:forEach begin="1" end="${requestScope.noOfPages}" var="i">
                                            <li><a href="<%= fullURL %>page=${i}">${i}</a></li>
                                            </c:forEach>
                                        <li>
                                            <a href="<%= fullURL %>page=${noOfPages}">>></a>
                                        </li>
                                    </ul>
                                </c:if>
                            </div>
                        </form>  
                    </div>
                </div>
            </div>                     
        </section>
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
        <script>
                                                            function show(id, orderId) {
                                                                var list = document.getElementById(id);
                                                                list.style.display = "block";

                                                                const inputHidden = document.createElement('input');
                                                                inputHidden.type = 'hidden';
                                                                inputHidden.name = 'order_id';
                                                                inputHidden.value = orderId;
                                                                list.appendChild(inputHidden);
                                                            }
                                                            function hide(id) {
                                                                var list = document.getElementById(id);
                                                                list.style.display = "none";
                                                            }
        </script>
    </body>
</html>
