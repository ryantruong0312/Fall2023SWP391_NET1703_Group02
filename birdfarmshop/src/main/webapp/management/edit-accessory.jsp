<%-- 
    Document   : edit-accessory
    Created on : Sep 13, 2023, 11:53:57 PM
    Author     : tlminh
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

        <title>V.E.T - Cập nhật thông tin phụ kiện</title>

        <!-- Additional CSS Files -->
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">
        <link rel="stylesheet" href="assets/css/owl-carousel.css">
        <link rel="stylesheet" href="assets/css/lightbox.css">

    </head>

    <style>
        .col-lg-12 .product-part {
            margin: 0 0 10px 10px;
        }
        .col-lg-12 input {
            margin-bottom: 10px;
            width: 50%;
        }
        .col-lg-12 span {
            margin-top: 100px;
        }
        .form-left{
            padding-top: 8px;
        }
        .button-submit{
            margin-top: 15px;
            width: 175px;
            font-size: 25px;
            height: 50px;
            border-radius: 10px;
            background-color: #0c5460;
            color: white;
        }
        #id{
            height: 100px;
        }
        .form-outline input{
            width: 554px;
        }
    </style>

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
                                    <li class="scroll-to-section"><a href="${pageScope.toShopOrders}">Đơn hàng</a></li>
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
        <section class="section" id="products">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-heading">
                            <h2>Chỉnh sửa sản phẩm</h2>
                        </div>
                    </div>
                    <form action="UpdateAccessoryController" method="GET">
                        <div class="col-lg-12 form-left">

                            <div class="form-outline">
                                <label>ID của phụ kiện (Bao gồm 2 chữ hoa và 3 chữ số)</label>
                                <input style="color: blue;" type="text" name="txtAccessoryID" class="input form-control" pattern="[A-Z]{2}\d{3}" value="${a.accessory_id}" readonly=""/>
                            </div>

                            <div class="form-outline mt-2">
                                <label>Tên</label>
                                <input style="color: blue;" type="text" name="txtAccessoryName" class="input form-control" value="${a.accessory_name}" required/>
                            </div>

                            <div class="form-outline mt-2">
                                <label>Loại phụ kiện</label>
                                <select name="txtCategoryID">
                                    <c:forEach items="${ac}" var="ac">
                                        <option style="color: blue;" value="${ac.category_id}">${ac.category_name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-outline mt-2">
                                <label>Giá</label>
                                <input style="color: blue;" type="number" name="txtPrice" min="0" class="input form-control" value="${a.unit_price}" required/>
                            </div>

                            <div class="form-outline mt-2">
                                <label>Số lượng</label>
                                <input style="color: blue;" type="number" name="txtStockQuantity" min="0" class="input form-control" value="${a.stock_quantity}" required/>
                            </div>

                            <div class="form-outline mt-2">
                                <label for="txtDescribe">Mô tả</label><br>
                                <textarea class="form-control" id="txtDescribe" name="txtDescribe" rows="5" cols="50" style="width: 554px; height: 75px; color: blue;">${a.description}</textarea>
                            </div>

                            <div class="form-outline mt-2">
                                <label>Giảm giá (%)</label>
                                <input style="color: blue;" type="number" name="txtDiscount" min="0" class="input form-control" value="${a.discount}"/>                            
                            </div>

                            <div class="form-outline mt-2">
                                <label>Hình ảnh sản phẩm (Bắt buộc)</label>
                                <input style="color: blue;" type="text" name="txtImage_1"  class="input form-control" value="${url_thumnail}" pattern="^(http|https|ftp)://[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}(:[0-9]+)?(/.*)?$" required/>
                            </div>

                            <c:if test="${requestScope.list != null}">
                                <c:forEach var="image" items="${list}" varStatus="loop">
                                    <div class="form-outline mt-2">
                                        <label>Hình ảnh sản phẩm</label>
                                        <input style="color: blue;" type="text" name="txtImage_${loop.index + 2}" class="input form-control" value="${image}" pattern="^(http|https|ftp)://[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}(:[0-9]+)?(/.*)?$" required/>
                                    </div>
                                </c:forEach>
                            </c:if>

                        </div>
                            
                                <c:if test="${requestScope.MESSAGE != null}">
                                    <div>${MESSAGE}}</div>
                                </c:if>
                                <c:if test="${requestScope.Error != null}">
                                    <div>${error}}</div>
                                </c:if>

                        <div class="col-lg-12">
                            <button class="button-submit" type="submit">Hoàn tất</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>


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
</html>

