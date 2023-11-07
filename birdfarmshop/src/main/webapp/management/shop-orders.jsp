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
            #updateOrder {
                border: 1px solid #000;
                border-radius: 5px;
                background-color: white;
            }
            #updateOrder:hover {
                background-color: #f0f0f0 !important;
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
            .button-style {
                padding: 13px 40px !important;
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
                        <%
                            String requestURL = "MainController";
                            String queryString = request.getQueryString();
                            String fullURL = requestURL + "?" + queryString;
                            if(fullURL.contains("startDay=&")) {
                                fullURL = fullURL.replace("startDay=&", "");
                            }
                            if(fullURL.contains("endDay=&")) {
                                fullURL = fullURL.replace("endDay=&", "");
                            }
                            if(fullURL.contains("search=&")) {
                                fullURL = fullURL.replace("search=&", "");
                            }
                            String dateReq = "date=" + (String) request.getAttribute("date");
                            if(fullURL.contains("&"+dateReq)) {
                                dateReq = "&"+dateReq;
                            }
                            String statusReq = "filterStatus=" + (String) request.getAttribute("filterStatus");
                            if(fullURL.contains("&"+statusReq)) {
                                statusReq = "&"+statusReq;
                            }
                            String startDayReq = "startDay=" + (String) request.getAttribute("startDay");
                            if(fullURL.contains("&"+startDayReq)) {
                                startDayReq = "&"+startDayReq;
                            }
                            String endDayReq = "&endDay=" + (String) request.getAttribute("endDay");
                            String searchReq = "&search=" + (String) request.getAttribute("search");
                            String pageReq = "&page=" + (String) request.getAttribute("page");
                        %>
                        <form style="float: right;" action="MainController" method="GET">
                            <h3 style="color: #006699;">Theo thời gian</h3>
                            <c:if test="${requestScope.date != null}">
                                <input type="hidden" name="date" value="${requestScope.date}"/>
                            </c:if>
                            <ul>
                                <li><a class="bordered-link" href="<%= fullURL.replace(dateReq, "") %>&date=today"><span>Hôm nay</span></a></li>
                                <li><a class="bordered-link" href="<%= fullURL.replace(dateReq, "") %>&date=yesterday"><span>Hôm qua</span></a></li>
                                <li><a class="bordered-link" href="<%= fullURL.replace(dateReq, "") %>&date=thisWeek"><span>Tuần này</span></a></li>
                                <li><a class="bordered-link" href="<%= fullURL.replace(dateReq, "") %>&date=thisMonth"><span>Tháng này</span></a></li>
                                <li><a class="bordered-link" href="<%= fullURL.replace(dateReq, "") %>&date=thisYear"><span>Năm nay</span></a></li>
                                <li>
                                <label>Từ ngày:</label>
                                <input id="startDay" type="date" name="startDay" value="${requestScope.startDay}"/>
                                <label>Đến ngày:</label>
                                <input id="endDay" type="date" name="endDay" value="${requestScope.endDay}"/>
                                <button type="submit" name="action" value="NavToShopOrders"><span>Chọn</span></button>
                                </li>
                            </ul>
                            <h3 style="color: #006699;">Theo trạng thái</h3>
                            <input type="hidden" name="filterStatus" value="${requestScope.filterStatus}"/>
                            <ul>
                                <li><a class="bordered-link" href="<%= fullURL.replace(statusReq, "") %>&filterStatus=wait"><span>Chờ xử lý</span></a></li>
                                <li><a class="bordered-link" href="<%= fullURL.replace(statusReq, "") %>&filterStatus=inProgress"><span>Đang xử lý</span></a></li>
                                <li><a class="bordered-link" href="<%= fullURL.replace(statusReq, "") %>&filterStatus=delivering"><span>Đang giao hàng</span></a></li>
                                <li><a class="bordered-link" href="<%= fullURL.replace(statusReq, "") %>&filterStatus=delivered"><span>Đã giao hàng</span></a></li>
                                <li><a class="bordered-link" href="<%= fullURL.replace(statusReq, "") %>&filterStatus=rated"><span>Đã đánh giá</span></a></li>
                                <li><a class="bordered-link" href="<%= fullURL.replace(statusReq, "") %>&filterStatus=cancel"><span>Đã hủy</span></a></li>
                            </ul>
                            <div style="background-color: #cccccc;">
                                <a href="MainController?action=NavToShopOrders"><span style="color: #b9130f; margin-left: 10px;">BỎ LỌC</span></a>
                                <br/>
                                <h6 style="margin-left: 10px;">Lọc theo: <br/>
                                    <c:if test="${not empty requestScope.date}">
                                        <a href="<%= fullURL.replace(dateReq, "") %>">
                                            <image style="width: 15px; height: 15px; margin-bottom: 3px;" src='.\assets\images\close.png'/>
                                            <c:choose>
                                                <c:when test="${requestScope.date eq 'today'}">
                                                    <span>Thời gian: Hôm nay</span>
                                                </c:when>
                                                <c:when test="${requestScope.date eq 'yesterday'}">
                                                    <span>Thời gian: Hôm qua</span>
                                                </c:when>
                                                <c:when test="${requestScope.date eq 'thisWeek'}">
                                                    <span>Thời gian: Tuần này</span>
                                                </c:when>
                                                <c:when test="${requestScope.date eq 'thisMonth'}">
                                                    <span>Thời gian: Tháng này</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span>Thời gian: Năm nay</span>
                                                </c:otherwise>    
                                            </c:choose>
                                        </a>
                                        <br/>
                                    </c:if>
                                    <c:set var="dateFormat" value="\\d{4}-\\d{2}-\\d{2}" />
                                    <c:if test="${not empty requestScope.startDay || not empty requestScope.endDay}">
                                        <a href="<%= fullURL.replace(startDayReq, "").replace(endDayReq, "") %>">
                                            <image style="width: 15px; height: 15px; margin-bottom: 3px;" src='.\assets\images\close.png'/>
                                            <span>Khoảng thời gian: Từ ${requestScope.startDay} đến ${requestScope.endDay}</span>
                                        </a>
                                        <br/>
                                    </c:if>
                                    <c:if test="${not empty requestScope.search}">
                                        <a href="<%= fullURL.replace(searchReq, "") %>">
                                            <image style="width: 15px; height: 15px; margin-bottom: 3px;" src='.\assets\images\close.png'/>
                                            <span>Tìm kiếm: ${requestScope.search}</span>
                                        </a>
                                        <br/>
                                    </c:if>
                                    <c:if test="${not empty requestScope.filterStatus}">
                                        <a href="<%= fullURL.replace(statusReq, "") %>">
                                            <image style="width: 15px; height: 15px; margin-bottom: 3px;" src='.\assets\images\close.png'/>
                                            <c:choose>
                                                <c:when test="${requestScope.filterStatus eq 'wait'}">
                                                    <span>Trạng thái: Chờ xử lý</span>
                                                </c:when>
                                                <c:when test="${requestScope.filterStatus eq 'inProgress'}">
                                                    <span>Trạng thái: Đang xử lý</span>
                                                </c:when>
                                                <c:when test="${requestScope.filterStatus eq 'delivering'}">
                                                    <span>Trạng thái: Đang giao hàng</span>
                                                </c:when>
                                                <c:when test="${requestScope.filterStatus eq 'delivered'}">
                                                    <span>Trạng thái: Đã giao hàng</span>
                                                </c:when>
                                                <c:when test="${requestScope.filterStatus eq 'rated'}">
                                                    <span>Trạng thái: Đã đánh giá</span>
                                                </c:when>
                                                <c:when test="${requestScope.filterStatus eq 'cancel'}">
                                                    <span>Trạng thái: Đã hủy</span>
                                                </c:when>
                                                <c:otherwise>
                                                </c:otherwise>    
                                            </c:choose>
                                        </a>
                                        <br/>
                                    </c:if>
                                </h6>
                            </div>
                            <div class="order-bar" style="background-color: #cccccc; margin: 10px 0;">
                                <div style="padding-bottom: 15px;">
                                    <img style="width: 15px; height: 15px; float: left; margin: 5px;" class="icon" src="assets/images/order.png" alt="Đơn hàng"/>
                                    <span style="color: black; float: left;">Đơn hàng</span>
                                </div>
                                <div style="" class="search-bar">
                                    <img src="assets/images/search.png"/>
                                    <input type="text" name="search" placeholder="Tìm kiếm" value="${requestScope.search}">
                                    <button type="submit" name="action" value="NavToShopOrders"><span>Tìm kiếm</span></button>
                                </div>
                                <div id="popup" style="display: none; position: fixed; background-color: white; top: 50%; left: 50%; transform: translate(-50%, -50%); padding: 20px;">
                                    <ul style="padding: 5px 0; white-space: nowrap;" id="update">
                                        <!--                                <ul style="display: none; padding: 5px 0; white-space: nowrap;" id="update">-->
                                        <div id="choosing" style="display: none; white-space: nowrap;">
                                            <li id="status1"><input type="radio" name="status" value="Đã giao hàng" id="option1" checked><label for="option1">Giao hàng thành công</label></li>
                                            <li id="status2"><input type="radio" name="status" value="Đã hủy" id="option2"><label for="option2">Giao hàng thất bại</label></li>
                                        </div>
                                        <div class="flex">
                                            <button class="flex-1 flex align-items-center justify-content-center text-white m-2 px-5 py-3 border-round button-style" id="updateOrder" type="submit" name="action" value="NavToUpdateOrder"><span>Xác nhận</span></button>
                                            <a class="bordered-link flex-1 flex align-items-center justify-content-center text-white m-2 px-5 py-3 border-round" onclick="hide('popup');" style="width: 165px; height: 58px;"><span class="centered-text">Hủy bỏ</span></a>
                                        </div>
                                    </ul>
                                </div>
                                <div id="popupCancel" style="display: none; position: fixed; background-color: white; top: 50%; left: 50%; transform: translate(-50%, -50%); padding: 20px;">
                                    <div style="padding: 5px 0; white-space: nowrap;" id="cancel">
                                        <a class="bordered-link flex-1 flex align-items-center justify-content-center text-white m-2 px-5 py-3 border-round" id="cancelOrder"><span>Xác nhận</span></a>
                                        <a class="bordered-link flex-1 flex align-items-center justify-content-center text-white m-2 px-5 py-3 border-round" onclick="hide('popupCancel');"><span>Hủy bỏ</span></a>
                                    </div>
                                </div>
                                <div class="scrollable-container">
                                    <table id="order-list" class="scrollable-list">
                                        <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th>Order Id</th>
                                                <th>User ID</th>
                                                <th>Ngày đặt hàng</th>
                                                <th>Tình trạng đơn hàng</th>
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
                                                    <tr class="${counter.count % 2 == 0 ? 'even' : 'odd'}" onclick="window.location.href = 'MainController?action=NavToOrderItems&order_id=${order.order_id}'">
                                                        <td>${counter.count}</td>
                                                        <td>${order.order_id}</td>
                                                        <td><a href="MainController?action=NavToProfile&username=${order.customer}">${order.customer}</a></td>
                                                        <td>${order.order_date}</td>
                                                        <td>${order.order_status}</td>
                                                        <td>
                                                            <c:if test="${order.order_status ne 'Đã hủy' && order.order_status ne 'Đã giao hàng' && order.order_status ne 'Đã đánh giá'}">
                                                                <a onclick="show('popup', '${order.order_id}', '${order.order_status}'); event.stopPropagation();" style="color: #007BFF;">Cập nhật</a>
                                                            </c:if>
                                                        </td>
                                                        <td>
                                                            <c:if test="${order.order_status eq 'Chờ xử lý'}">
                                                                <a onclick="showCancel('popupCancel', '${order.order_id}'); event.stopPropagation();" style="color: #007BFF;">Hủy đơn</a>
                                                            </c:if>
                                                        </td>
                                                        <td>${order.name_receiver}</td>
                                                        <td>0${order.phone_receiver}</td>
                                                        <td>${order.address_receiver}</td>
                                                        <td>${order.payment_status}</td>
                                                        <td>${order.total_price}</td>
                                                        <td>${order.point}</td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${empty orderList}">
                                                <tr>
                                                    <td colspan="5">Không tìm thấy đơn hàng</td>
                                                </tr>
                                            </c:if>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="pagination">
                                <c:if test="${requestScope.noOfPages >= 1}">
                                    <ul>
                                        <li>
                                            <a href="<%= fullURL.replace(pageReq, "") %>&page=1"><<</a>
                                        </li>
                                        <c:set var="start" value="${requestScope.page - 2}" />
                                        <c:set var="end" value="${requestScope.page + 2}" />
                                        <c:choose>
                                            <c:when test="${requestScope.noOfPages <= 5}">
                                                <c:forEach begin="1" end="${requestScope.noOfPages}" var="i">
                                                    <li class="${i == requestScope.page ? "active":""}">
                                                        <a href="<%= fullURL.replace(pageReq, "") %>&page=${i}">${i}</a>
                                                    </li>
                                                </c:forEach>
                                            </c:when>
                                            <c:when test="${requestScope.page <= 3}">
                                                <c:forEach begin="1" end="5" var="i">
                                                    <li class="${i == requestScope.page ? "active":""}">
                                                        <a href="<%= fullURL.replace(pageReq, "") %>&page=${i}">${i}</a>
                                                    </li>
                                                </c:forEach>
                                            </c:when>
                                            <c:when test="${requestScope.page >= requestScope.noOfPages - 2}">
                                                <c:forEach begin="${requestScope.noOfPages - 4}" end="${requestScope.noOfPages}" var="i">
                                                    <li class="${i == requestScope.page ? "active":""}">
                                                        <a href="<%= fullURL.replace(pageReq, "") %>&page=${i}">${i}</a>
                                                    </li>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach begin="${start}" end="${end}" var="i">
                                                    <li class="${i == requestScope.page ? "active":""}">
                                                        <a href="<%= fullURL.replace(pageReq, "") %>&page=${i}">${i}</a>
                                                    </li>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                        <li>
                                            <a href="<%= fullURL.replace(pageReq, "") %>&page=${noOfPages}">>></a>
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
                                                        function show(id, orderId, orderStatus) {
                                                            var list = document.getElementById(id);
                                                            list.style.display = "block";

                                                            if (orderStatus === 'Chờ xử lý') {
                                                                const hiddenStatus1 = document.createElement('input');
                                                                hiddenStatus1.type = 'hidden';
                                                                hiddenStatus1.name = 'status';
                                                                hiddenStatus1.value = 'Đang xử lý';
                                                                list.appendChild(hiddenStatus1);
                                                            }
                                                            if (orderStatus === 'Đang xử lý') {
                                                                const hiddenStatus2 = document.createElement('input');
                                                                hiddenStatus2.type = 'hidden';
                                                                hiddenStatus2.name = 'status';
                                                                hiddenStatus2.value = 'Đang giao hàng';
                                                                list.appendChild(hiddenStatus2);
                                                            }
                                                            if (orderStatus === 'Đang giao hàng') {
                                                                var liStatuses = document.getElementById('choosing');
                                                                liStatuses.style.display = "block";
                                                            }
                                                            const inputHidden = document.createElement('input');
                                                            inputHidden.type = 'hidden';
                                                            inputHidden.name = 'order_id';
                                                            inputHidden.value = orderId;
                                                            list.appendChild(inputHidden);
                                                        }
                                                        function showCancel(id, orderId) {
                                                            var list = document.getElementById(id);
                                                            list.style.display = "block";
                                                            var aHref = document.getElementById("cancelOrder");
                                                            aHref.href = "MainController?action=NavToUpdateOrder&order_id=" + orderId + "&status=Đã hủy";
                                                        }
                                                        function hide(id) {
                                                            var list = document.getElementById(id);
                                                            list.style.display = "none";
                                                        }
                                                        var sdateInput = document.getElementById("startDay");
                                                        var edateInput = document.getElementById("endDay");
                                                        var today = new Date();
                                                        sdateInput.addEventListener("change", function () {
                                                            var selectedsDate = new Date(sdateInput.value);
                                                            if (selectedsDate > today) {
                                                                alert("Ngày được chọn không thể là một ngày trong tương lai. Vui lòng chọn lại.");
                                                                sdateInput.value = "";
                                                            }
                                                        });
                                                        edateInput.addEventListener("change", function () {
                                                            var selectedsDate = new Date(sdateInput.value);
                                                            var selectedeDate = new Date(edateInput.value);
                                                            if (selectedeDate > today) {
                                                                alert("Ngày được chọn không thể là một ngày trong tương lai. Vui lòng chọn lại.");
                                                                edateInput.value = "";
                                                            }
                                                            if (selectedsDate > selectedeDate) {
                                                                alert("Ngày kết thúc phải sau ngày bắt đầu. Vui lòng chọn lại");
                                                                sdateInput.value = "";
                                                                edateInput.value = "";
                                                            }
                                                        });
        </script>
    </body>
</html>
