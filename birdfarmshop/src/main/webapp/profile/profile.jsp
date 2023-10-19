

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
            .about .active-profile a
            {
                color:  orange;
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
                padding: 20px;
            }
        </style>

    </head>

    <body>
        <!-- Header Start -->
        <%@include file="../layout/header.jsp" %>
        <!-- Header End -->
        <main>
            <c:set value="${requestScope.ORDERLIST_PENDING}" var="orderListPending"/>
            <c:set value="${requestScope.ORDERLIST_PROGRESS}" var="orderListProgress"/>
            <c:set value="${requestScope.ORDERLIST_DELIVERING}" var="orderListDelivering"/>
            <c:set value="${requestScope.ORDERLIST_DELIVERED}" var="orderListDelivered"/>
            <c:set value="${requestScope.ORDERLIST_CANCEL}" var="orderListCancel"/>

            <div class="container">
                <div class="row gutters">
                    <%@include file="../layout/sidebar-profile.jsp" %>
                    <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                        <div class="card h-100">
                            <div class="card-body profile-section">
                                <form action="MainController">
                                    <div class="row gutters">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <h6 class="mb-2 text-primary">Thông tin cá nhân</h6>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label>Họ tên</label>
                                                <input type="text" disabled="" class="form-control" placeholder="${requestScope.USER.fullName}">
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label>Email</label>
                                                <input type="text" disabled="" class="form-control" placeholder="${requestScope.USER.email}">
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label>Số điện thoại</label>
                                                <input type="text" disabled="" class="form-control" placeholder="${requestScope.USER.phone}">
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label>Địa chỉ</label>
                                                <textarea disabled="" class="form-control" placeholder="${requestScope.USER.address}"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row gutters">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <h6 class="mb-2 text-primary">Thông tin tài khoản</h6>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label>Tên tài khoản</label>
                                                <input type="text" disabled="" class="form-control" placeholder="${requestScope.USER.username}">
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label>Mật khẩu</label>
                                                <input type="text" disabled="" class="form-control" placeholder="${requestScope.USER.password}">
                                            </div>
                                        </div>
                                        <c:if test="${requestScope.USER.role == 'customer'}">
                                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="form-group">
                                                    <label>Điểm tích lũy</label>
                                                    <input type="text" disabled="" class="form-control" placeholder="${requestScope.USER.point}">
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="row gutters">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="text-center register-date">
                                                Thành viên của V.E.T từ ${requestScope.USER.registerDate}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row gutters">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="text-right">
                                                <a href="${pageScope.toUpdatePassword}" class="btn btn-primary">Đổi mật khẩu</a>   
                                                <a href="${pageScope.toEditProfile}&username=${requestScope.USER.username}" class="btn btn-primary">Chỉnh sửa</a>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <div class="card-body order-section">
                                <!-- Tab buttons -->
                                <ul class="nav nav-tabs" id="orderTabs">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="tab" href="#pendingTab">Chờ xử lý</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#processedTab">Đang đóng hàng</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#inTransitTab">Đang giao hàng</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#deliveredTab">Đã giao hàng</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#cancelTab">Đã hủy</a>
                                    </li>
                                </ul>
                                <!-- Tab content -->
                                <div class="tab-content">
                                    <!-- Pending Orders Tab -->
                                    <div class="tab-pane fade show active" id="pendingTab">
                                        <div class="row">
                                            <!-- Card components for pending orders -->
                                            <div class="col-12">
                                                <div class="card w-100"> <!-- Add the w-100 class to make the card expand to full width -->
                                                    <div class="card-body">


                                                        <!-- Table-like structure for order items -->
                                                        <div class="scrollable-container">
                                                            <table id="order-list" class="scrollable-list">
                                                                <thead>
                                                                    <tr>
                                                                        <th>STT</th>
                                                                        <th>Order Id</th>
                                                                        <th>Ngày đặt hàng</th>
                                                                        <th>Tên người nhận</th>
                                                                        <th>Sđt người nhận</th>
                                                                        <th>Địa chỉ nhận hàng</th>
                                                                        <th>Tình trạng thanh toán</th>
                                                                        <th>Tổng đơn hàng</th>
                                                                        <th>Điểm đã dùng</th>
                                                                        <th>Chi tiết</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>

                                                                    <c:if test="${orderListPending.size() > 0 && orderListPending != null}">
                                                                        <c:forEach items="${orderListPending}" var="order" varStatus="counter">
                                                                            <tr class="${counter.count % 2 == 0 ? 'even' : 'odd'}">
                                                                                <td>${counter.count}</td>
                                                                                <td>${order.order_id}</td>
                                                                                <td>${order.order_date}</td>
                                                                                <td>${order.name_receiver}</td>
                                                                                <td>${order.phone_receiver}</td>
                                                                                <td>${order.address_receiver}</td>
                                                                                <td>${order.payment_status}</td>
                                                                                <td>${order.total_price}</td>
                                                                                <td>${order.point}</td>
                                                                                <td><a href="MainController?action=NavToCustomerOrderItem&order_id=${order.order_id}"><span>Chi tiết</span></a></td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:if>
                                                                    <c:if test="${orderListPending.size() == 0 || orderListPending == null}">
                                                                        <tr class="${counter.count % 2 == 0 ? 'even' : 'odd'}">
                                                                            <td colspan="10">Chưa có đơn hàng</td>
                                                                        </tr>
                                                                    </c:if>       
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                    <!-- Processed Orders Tab -->
                                    <div class="tab-pane fade" id="processedTab">
                                        <!-- Similar structure as the Pending Orders Tab -->
                                        <div class="row">
                                            <!-- Card components for pending orders -->
                                            <div class="col-12">
                                                <div class="card w-100"> <!-- Add the w-100 class to make the card expand to full width -->
                                                    <div class="card-body">


                                                        <!-- Table-like structure for order items -->
                                                        <div class="scrollable-container">
                                                            <table id="order-list" class="scrollable-list">
                                                                <thead>
                                                                    <tr>
                                                                        <th>STT</th>
                                                                        <th>Order Id</th>
                                                                        <th>Ngày đặt hàng</th>
                                                                        <th>Tên người nhận</th>
                                                                        <th>Sđt người nhận</th>
                                                                        <th>Địa chỉ nhận hàng</th>
                                                                        <th>Tình trạng thanh toán</th>
                                                                        <th>Tổng đơn hàng</th>
                                                                        <th>Điểm đã dùng</th>
                                                                        <th>Chi tiết</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>

                                                                    <c:if test="${orderListProgress.size() > 0 && orderListProgress != null}">
                                                                        <c:forEach items="${orderListProgress}" var="order" varStatus="counter">
                                                                            <tr class="${counter.count % 2 == 0 ? 'even' : 'odd'}">
                                                                                <td>${counter.count}</td>
                                                                                <td>${order.order_id}</td>
                                                                                <td>${order.order_date}</td>
                                                                                <td>${order.name_receiver}</td>
                                                                                <td>${order.phone_receiver}</td>
                                                                                <td>${order.address_receiver}</td>
                                                                                <td>${order.payment_status}</td>
                                                                                <td>${order.total_price}</td>
                                                                                <td>${order.point}</td>
                                                                                <td><a href="MainController?action=NavToCustomerOrderItem&order_id=${order.order_id}"><span>Chi tiết</span></a></td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:if>
                                                                    <c:if test="${orderListProgress.size() == 0 || orderListProgress == null}">
                                                                        <tr class="${counter.count % 2 == 0 ? 'even' : 'odd'}">
                                                                            <td colspan="10">Chưa có đơn hàng</td>
                                                                        </tr>
                                                                    </c:if>       
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- In-transit Orders Tab -->
                                    <div class="tab-pane fade" id="inTransitTab">
                                        <!-- Similar structure as the Pending Orders Tab -->
                                        <div class="row">
                                            <!-- Card components for pending orders -->
                                            <div class="col-12">
                                                <div class="card w-100"> <!-- Add the w-100 class to make the card expand to full width -->
                                                    <div class="card-body">


                                                        <!-- Table-like structure for order items -->
                                                        <div class="scrollable-container">
                                                            <table id="order-list" class="scrollable-list">
                                                                <thead>
                                                                    <tr>
                                                                        <th>STT</th>
                                                                        <th>Order Id</th>
                                                                        <th>Ngày đặt hàng</th>
                                                                        <th>Tên người nhận</th>
                                                                        <th>Sđt người nhận</th>
                                                                        <th>Địa chỉ nhận hàng</th>
                                                                        <th>Tình trạng thanh toán</th>
                                                                        <th>Tổng đơn hàng</th>
                                                                        <th>Điểm đã dùng</th>
                                                                        <th>Chi tiết</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>

                                                                    <c:if test="${orderListDelivering.size() > 0 && orderListDelivering != null}">
                                                                        <c:forEach items="${orderListDelivering}" var="order" varStatus="counter">
                                                                            <tr class="${counter.count % 2 == 0 ? 'even' : 'odd'}">
                                                                                <td>${counter.count}</td>
                                                                                <td>${order.order_id}</td>
                                                                                <td>${order.order_date}</td>
                                                                                <td>${order.name_receiver}</td>
                                                                                <td>${order.phone_receiver}</td>
                                                                                <td>${order.address_receiver}</td>
                                                                                <td>${order.payment_status}</td>
                                                                                <td>${order.total_price}</td>
                                                                                <td>${order.point}</td>
                                                                                <td><a href="MainController?action=NavToCustomerOrderItem&order_id=${order.order_id}"><span>Chi tiết</span></a></td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:if>
                                                                    <c:if test="${orderListDelivering.size() == 0 || orderListDelivering == null}">
                                                                        <tr class="${counter.count % 2 == 0 ? 'even' : 'odd'}">
                                                                            <td colspan="10">Chưa có đơn hàng</td>
                                                                        </tr>
                                                                    </c:if>       
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Delivered Orders Tab -->
                                    <div class="tab-pane fade" id="deliveredTab">
                                        <!-- Similar structure as the Pending Orders Tab -->
                                        <div class="row">
                                            <!-- Card components for pending orders -->
                                            <div class="col-12">
                                                <div class="card w-100"> <!-- Add the w-100 class to make the card expand to full width -->
                                                    <div class="card-body">


                                                        <!-- Table-like structure for order items -->
                                                        <div class="scrollable-container">
                                                            <table id="order-list" class="scrollable-list">
                                                                <thead>
                                                                    <tr>
                                                                        <th>STT</th>
                                                                        <th>Order Id</th>
                                                                        <th>Ngày đặt hàng</th>
                                                                        <th>Tên người nhận</th>
                                                                        <th>Sđt người nhận</th>
                                                                        <th>Địa chỉ nhận hàng</th>
                                                                        <th>Tình trạng thanh toán</th>
                                                                        <th>Tổng đơn hàng</th>
                                                                        <th>Điểm đã dùng</th>
                                                                        <th>Chi tiết</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>

                                                                    <c:if test="${orderListDelivered.size() > 0 && orderListDelivered != null}">
                                                                        <c:forEach items="${orderListDelivered}" var="order" varStatus="counter">
                                                                            <tr class="${counter.count % 2 == 0 ? 'even' : 'odd'}">
                                                                                <td>${counter.count}</td>
                                                                                <td>${order.order_id}</td>
                                                                                <td>${order.order_date}</td>
                                                                                <td>${order.name_receiver}</td>
                                                                                <td>${order.phone_receiver}</td>
                                                                                <td>${order.address_receiver}</td>
                                                                                <td>${order.payment_status}</td>
                                                                                <td>${order.total_price}</td>
                                                                                <td>${order.point}</td>
                                                                                <td><a href="MainController?action=NavToCustomerOrderItem&order_id=${order.order_id}"><span>Chi tiết</span></a></td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:if>
                                                                    <c:if test="${orderListDelivered.size() == 0 || orderListDelivered == null}">
                                                                        <tr class="${counter.count % 2 == 0 ? 'even' : 'odd'}">
                                                                            <td colspan="10">Chưa có đơn hàng</td>
                                                                        </tr>
                                                                    </c:if>       
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Cancelled Orders Tab -->
                                    <div class="tab-pane fade" id="cancelTab">
                                        <!-- Similar structure as the Pending Orders Tab -->
                                        <div class="row">
                                            <!-- Card components for pending orders -->
                                            <div class="col-12">
                                                <div class="card w-100"> <!-- Add the w-100 class to make the card expand to full width -->
                                                    <div class="card-body">


                                                        <!-- Table-like structure for order items -->
                                                        <div class="scrollable-container">
                                                            <table id="order-list" class="scrollable-list">
                                                                <thead>
                                                                    <tr>
                                                                        <th>STT</th>
                                                                        <th>Order Id</th>
                                                                        <th>Ngày đặt hàng</th>
                                                                        <th>Tên người nhận</th>
                                                                        <th>Sđt người nhận</th>
                                                                        <th>Địa chỉ nhận hàng</th>
                                                                        <th>Tình trạng thanh toán</th>
                                                                        <th>Tổng đơn hàng</th>
                                                                        <th>Điểm đã dùng</th>
                                                                        <th>Chi tiết</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>

                                                                    <c:if test="${orderListCancel.size() > 0 && orderListCancel != null}">
                                                                        <c:forEach items="${orderListCancel}" var="order" varStatus="counter">
                                                                            <tr class="${counter.count % 2 == 0 ? 'even' : 'odd'}">
                                                                                <td>${counter.count}</td>
                                                                                <td>${order.order_id}</td>
                                                                                <td>${order.order_date}</td>
                                                                                <td>${order.name_receiver}</td>
                                                                                <td>${order.phone_receiver}</td>
                                                                                <td>${order.address_receiver}</td>
                                                                                <td>${order.payment_status}</td>
                                                                                <td>${order.total_price}</td>
                                                                                <td>${order.point}</td>
                                                                                <td><a href="MainController?action=NavToCustomerOrderItem&order_id=${order.order_id}"><span>Chi tiết</span></a></td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:if>
                                                                    <c:if test="${orderListCancel.size() == 0 || orderListCancel == null}">
                                                                        <tr class="${counter.count % 2 == 0 ? 'even' : 'odd'}">
                                                                            <td colspan="10">Chưa có đơn hàng</td>
                                                                        </tr>
                                                                    </c:if>       
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
            </div>
        </main>
        <!-- Start Footer -->
        <%@include file="../layout/footer.jsp" %>
        <!-- End Footer -->
        <script>
            // Function to show the profile section and hide the order section
            function showProfileSection() {
                document.querySelector('.profile-section').style.display = 'block';
                document.querySelector('.order-section').style.display = 'none';
            }

            // Function to show the order section and hide the profile section
            function showOrderSection() {
                document.querySelector('.profile-section').style.display = 'none';
                document.querySelector('.order-section').style.display = 'block';
            }

            // Initially, show the profile section (you can change this based on your default behavior)
            showProfileSection();

            // Add click event listeners to the links in the .about section
            document.querySelector('.about .profile-link').addEventListener('click', showProfileSection);
            document.querySelector('.about .order-link').addEventListener('click', showOrderSection);
        </script>
    </body>
</html>
