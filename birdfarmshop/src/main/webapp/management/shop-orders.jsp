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
            .col-lg-12 span, label {
                color: black;
            }
            .col-lg-12 li, form {
                margin: 10px 0;
                display: inline-block;
                padding: 0;
            }
            .col-lg-12 ul {
                display: inline-block;
            }
            
            .bordered-link {
                border: 1px solid #000;
                border-radius: 5px;
                height: 30px;
                padding: 5px;
                background-color: #E0E0E0;
            }

            .bordered-link:hover {
                background-color: #f0f0f0;
            }
            
            .order-bar {
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
                padding: 20px;
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
        <c:url var="toCompare" value="MainController?action=NavToCompare"/>
        <c:url var="toHome" value="MainController?action=NavToHome"/>
        <c:url var="toLogin" value="MainController?action=NavToLogin"/>
        <c:url var="logout" value="MainController?action=Logout"/>
        <c:url var="toAccessories" value="MainController?action=NavToAccessory&amount=0"/>
        <c:url var="toBirds" value="MainController?action=NavToBird&amount=0"/>
        <c:url var="toBirdNests" value="MainController?action=NavToBirdNests"/>
        <c:url var="toCart" value="MainController?action=NavToCart"/>
        <c:url var="toProfile" value="MainController?action=NavToProfile"/>
        <c:url var="toOrders" value="MainController?action=NavToOrders"/>
        <c:url var="toShopOrders" value="MainController?action=NavToShopOrders"/>
        <c:url var="toAccounts" value="MainController?action=NavToAccounts"/>
        <c:url var="toReports" value="MainController?action=NavToReports"/>
        <c:url var="toPair" value="MainController?action=NavToPairBirds"/>

        <!-- ***** Preloader Start ***** -->
        <div id="preloader">
            <div class="jumper">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>  
        <!-- ***** Preloader End ***** -->

        <!-- ***** Header Area Start ***** -->
        <header class="header-area header-sticky">
            <div class="container home-custom">
                <div class="row">
                    <div class="col-12">
                        <nav class="main-nav">
                            <!-- ***** Logo Start ***** -->
                            <a href="#" class="logo scroll-to-section">
                                <img src="assets/images/logo.png">
                            </a>
                            <!-- ***** Logo End ***** -->
                            <!-- ***** Menu Start ***** -->
                            <ul class="nav">
                                <li class="scroll-to-section"><a href="${pageScope.toHome}" >Trang chủ</a></li>
                                    <c:if test="${LOGIN_USER == null || LOGIN_USER.role == 'customer' || LOGIN_USER.role == 'staff'}">
                                    <li class="submenu"><a href="">Sản phẩm</a>
                                        <ul>
                                            <li><a href="${pageScope.toBirds}">Vẹt cảnh</a></li>
                                            <li><a href="${pageScope.toBirdNests}">Tổ chim non</a></li>
                                            <li><a href="${pageScope.toAccessories}">Phụ kiện</a></li>
                                        </ul>
                                    </li>
                                    <li class="scroll-to-section"><a href="${pageScope.toCompare}">So sánh</a></li>
                                        <c:if test="${sessionScope.LOGIN_USER.role == 'staff'}">
                                        <li class="scroll-to-section"><a href="${pageScope.toShopOrders}">Đơn hàng</a></li>
                                        </c:if>
                                        <c:if test="${LOGIN_USER == null || LOGIN_USER.role == 'customer'}">
                                        <li class="scroll-to-section"><a href="${pageScope.toPair}">Nhân giống</a></li>
                                        <li id="show-cart" class="scroll-to-section">
                                            <a href="${pageScope.toCart}"><i style="font-size: 25px" class="fa fa-shopping-cart" aria-hidden="true"></i></a>
                                            <div class="cart-amount">8</div>
                                        </li>

                                        <c:if test="${sessionScope.LOGIN_USER == null}">
                                            <li  class="scroll-to-section"> <a href="${pageScope.toLogin}">Đăng nhập</a></li>
                                            </c:if>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${LOGIN_USER.role == 'admin' || LOGIN_USER.role == 'manager'}">
                                    <li class="submenu"><a href="">Sản phẩm</a>
                                        <ul>
                                            <li><a href="${pageScope.toBirds}">Vẹt cảnh</a></li>
                                            <li><a href="${pageScope.toBirdNests}">Tổ chim non</a></li>
                                            <li><a href="${pageScope.toAccessories}">Phụ kiện</a></li>
                                        </ul>
                                    </li>
                                    <li class="scroll-to-section"><a href="${pageScope.toCompare}">So sánh</a></li>
                                    <li class="scroll-to-section"><a href="${pageScope.toShopOrders}" class="active">Đơn hàng</a></li>
                                    <li class="scroll-to-section"><a href="${pageScope.toAccounts}">Tài khoản</a></li>
                                    <li class="scroll-to-section"><a href="${pageScope.toReports}">Thống kê</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.LOGIN_USER != null}">
                                    <li class="submenu"><a class="user-name text-right" href="#">${LOGIN_USER.fullName}</a>
                                        <ul>
                                            <li><a href="${pageScope.toProfile}&username=${sessionScope.LOGIN_USER.username}">Cá nhân</a></li>
                                            <li><a href="${pageScope.logout}">Đăng xuất</a></li>
                                        </ul>
                                    </li>
                                </c:if>
                            </ul>           
                            <a class='menu-trigger'>
                                <span>Menu</span>
                            </a>
                            <!-- ***** Menu End ***** -->
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <!-- ***** Header Area End ***** -->
        
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
            <c:set value="${requestScope.ORDERLIST}" var="orderList"/>
            <div class="container">
                <div class="col-lg-12">
                    <%
                        String requestURL = "MainController";
                        String queryString = request.getQueryString();
                        String fullURL = requestURL + "?" + queryString + "&";
                    %>
                    <h1 style="text-align: center; margin-top: 20px 0;">Danh sách đơn hàng</h1>
                    <div style="background-color: #cccccc;">
                        
                        <a href="MainController?action=NavToShopOrders"><span style="color: #009999;">** BỎ LỌC **</span></a>
                        <h6>Lọc theo: 
                            <c:if test="${requestScope.date != null}">| Thời gian |</c:if>
                            <c:if test="${requestScope.startDay != null || requestScope.endDay != null}">| Khoảng thời gian |</c:if>
                            <c:if test="${requestScope.search != null}">| Tìm kiếm |</c:if>
                            <c:if test="${requestScope.status != null}">| Trạng thái |</c:if>
                        </h6>
                    </div>
                    <h3 style="color: #006699; margin-top: 10px;">Theo thời gian</h3>
                    <ul id="date">
                        <li><a class="bordered-link" name="dateTime" href="<%= fullURL %>date=today"><span>Hôm nay</span></a></li>
                        <li><a class="bordered-link" name="dateTime" href="<%= fullURL %>date=yesterday"><span>Hôm qua</span></a></li>
                        <li><a class="bordered-link" name="dateTime" href="<%= fullURL %>date=thisWeek"><span>Tuần này</span></a></li>
                        <li><a class="bordered-link" name="dateTime" href="<%= fullURL %>date=thisMonth"><span>Tháng này</span></a></li>
                        <li><a class="bordered-link" name="dateTime" href="<%= fullURL %>date=thisYear"><span>Năm nay</span></a></li>
                        <form style="float: right;" action="MainController" method="GET">
                            <input type="hidden" name="action" value="NavToShopOrders"/>
                            <input type="hidden" name="param" value="<%= fullURL.replace("MainController?action=NavToShopOrders&", "") %>" />
                            <label for="start-date">Ngày bắt đầu:</label>
                            <input type="date" name="startDay" value="${requestScope.startDay}">

                            <label for="end-date">Ngày kết thúc:</label>
                            <input type="date" name="endDay" value="${requestScope.endDay}">
                            <button type="submit"><span>Chọn</span></button>
                        </form>
                    </ul>
                    <h3 style="color: #006699;">Theo trạng thái</h3>
                    <ul id="status">
                        <li><a class="bordered-link" href="<%= fullURL %>status=wait"><span>Chờ xử lý</span></a></li>
                        <li><a class="bordered-link" href="<%= fullURL %>status=inProgress"><span>Đang xử lý</span></a></li>
                        <li><a class="bordered-link" href="<%= fullURL %>status=delivering"><span>Đang vận chuyển</span></a></li>
                        <li><a class="bordered-link" href="<%= fullURL %>status=delivered"><span>Đã giao hàng</span></a></li>
                        <li><a class="bordered-link" href="<%= fullURL %>status=notRated"><span>Chưa đánh giá</span></a></li>
                        <li><a class="bordered-link" href="<%= fullURL %>status=rated"><span>Đã đánh giá</span></a></li>
                        <li><a class="bordered-link" href="<%= fullURL %>status=cancel"><span>Đã hủy</span></a></li>
                    </ul>
                </div>
                
                <div class="col-lg-12">
                    <div class="order-bar" style="background-color: #cccccc; text-align: center;">
                        <div style="background-color: #cccccc;">
                        <img style="width: 15px; height: 15px; float: left; margin: 5px;" class="icon" src="assets/images/test.png" alt="Đơn hàng"/>
                        <span style="color: black; float: left;">Đơn hàng</span>
                        <br>
                        </div>
                        <div style="background-color: white; padding: 0; margin: 0;">
                            <form style="padding: 10px 0;" action="MainController" method="GET">
                                <div class="search-bar">
                                    <input type="hidden" name="action" value="NavToShopOrders"/>
                                    <input type="hidden" name="param" value="<%= fullURL.replace("MainController?action=NavToShopOrders&", "") %>" />
                                    <img style="width: 15px; height: 15px;" src="assets/images/search.png"/>
                                    <input type="text" name="search" placeholder="Tìm kiếm" value="${requestScope.search}">
                                    <input type="submit" value="Tìm kiếm">
                                </div>
                            </form>
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
                                    <c:forEach items="${orderList}" var="order" varStatus="counter">
                                        <tr class="${counter.count % 2 == 0 ? 'even' : 'odd'}">
                                            <td>${counter.count}</td>
                                            <td>${order.order_id}</td>
                                            <td>${order.customer}</td>
                                            <td>${order.order_date}</td>
                                            <td>${order.order_status}</td>
                                            <td>${order.name_receiver}</td>
                                            <td>${order.phone_receiver}</td>
                                            <td>${order.address_receiver}</td>
                                            <td>${order.payment_status}</td>
                                            <td>${order.total_price}</td>
                                            <td>${order.point}</td>
                                            <td><a href="MainController?action=NavToOrderItems&order_id=${order.order_id}"><span>Chi tiết</span></a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="pagination">
                        <c:if test="${page > 1}">
                            <ul>
                                <li>
                                    <a href="MainController?action=NavToOrderItems&page=1"><<</a>
                                </li>
                                <c:forEach begin="1" end="${page}" var="i">
                                <li><a href="MainController?action=NavToOrderItems&page=${i}">${i}</a></li>
                                </c:forEach>
                                <li>
                                    <a href="MainController?action=NavToOrderItems&page=${page}">>></a>
                                </li>
                            </ul>
                        </c:if>
                    </div>
                </div>
            </div>
        </main>
        
        <!-- ***** Footer Start ***** -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="first-item">
                            <div class="logo">
                                <img src="assets/images/logo.png" alt="hexashop ecommerce templatemo">
                            </div>
                            <ul>
                                <li><a href="#">284 Pasteur, P.8 Q.3, TP.HCM</a></li>
                                <li><a href="#">thegioivetcanh@petshop.com</a></li>
                                <li><a href="#">0913-244-567</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <h4>Sản phẩm và dịch vụ</h4>
                        <ul>
                            <li><a href="${pageScope.toBirds}">Vẹt cảnh</a></li>
                            <li><a href="${pageScope.toBirdNests}">Tổ chim non</a></li>
                            <li><a href="${pageScope.toAccessories}">Phụ kiện</a></li>
                            <li><a href="${pageScope.toCompare}">So sánh</a></li>
                            <li><a href="${pageScope.toPair}">Nhân giống</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3">
                        <h4>Đường dẫn hữu ích</h4>
                        <ul>
                            <li><a href="${pageScope.toHome}">Trang chủ</a></li>
                            <li><a href="#">Về chúng tôi</a></li>
                            <li><a href="#">Hỗ trợ</a></li>
                            <li><a href="#">Liên hệ</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3">
                        <h4>Thông tin hỗ trợ</h4>
                        <ul>
                            <li><a href="#">Hỗ trợ</a></li>
                            <li><a href="#">Câu hỏi thường gặp</a></li>
                            <li><a href="#">Giao hàng</a></li>
                            <li><a href="#">Theo dõi đơn hàng</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-12">
                        <div class="under-footer">
                            <p>Copyright © 2023 V.E.T Co., Ltd. All Rights Reserved. 

                            <ul>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- ***** Footer Area Ends ***** -->
        
        <!-- jQuery -->
        <script src="assets/js/jquery-2.1.0.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <!-- Bootstrap -->
        <script src="assets/js/popper.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- Plugins -->
        <script src="assets/js/owl-carousel.js"></script>
        <script src="assets/js/accordions.js"></script>
        <script src="assets/js/datepicker.js"></script>
        <script src="assets/js/scrollreveal.min.js"></script>
        <script src="assets/js/waypoints.min.js"></script>
        <script src="assets/js/jquery.counterup.min.js"></script>
        <script src="assets/js/imgfix.min.js"></script> 
        <script src="assets/js/slick.js"></script> 
        <script src="assets/js/lightbox.js"></script> 
        <script src="assets/js/isotope.js"></script> 

        <!-- Global Init -->
        <script src="assets/js/custom.js"></script>
    </body>
        <script>
        </script>
</html>
