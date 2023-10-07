<%-- 
    Document   : home
    Created on : Sep 13, 2023, 7:25:56 PM
    Author     : tlminh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" type="image/png" href="assets/images/logo-title-bar.png"/>
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

        <title>V.E.T - Thế giới Vẹt Cảnh</title>

        <!-- Additional CSS Files -->
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">
        <link rel="stylesheet" href="assets/css/owl-carousel.css">
        <link rel="stylesheet" href="assets/css/lightbox.css">
    </head>

    <body>
        <c:url var="toCompare" value="MainController?action=NavToCompare"/>
        <c:url var="toLogin" value="MainController?action=NavToLogin"/>
        <c:url var="logout" value="MainController?action=Logout"/>
        <c:url var="toAccessories" value="MainController?action=NavToAccessory&amount=0"/>
        <c:url var="toBirds" value="MainController?action=NavToBird&page=1"/>
        <c:url var="toBirdNests" value="MainController?action=NavToBirdNests"/>
        <c:url var="toCart" value="MainController?action=NavToCart"/>
        <c:url var="toProfile" value="MainController?action=NavToProfile"/>
        <c:url var="toOrders" value="MainController?action=NavToOrders"/>
        <c:url var="toShopOrders" value="MainController?action=NavToShopOrders"/>
        <c:url var="toAccounts" value="MainController?action=NavToAccounts"/>
        <c:url var="toReports" value="MainController?action=NavToReports"/>
        <c:url var="toPair" value="MainController?action=NavToPairBirds"/>


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
                                <li class="scroll-to-section"><a href="#" class="active">Trang chủ</a></li>
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
                                            <div class="cart-amount">${sessionScope.CART.totalItem}</div>

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


        <!-- ***** Subscribe Area Starts ***** -->
        <div class="main-banner" style="border-bottom: none" id="top">
            <main id="maincontent" class="page-checkout">
                <div class="container">
                    <form id="form-order" action="MainController" method="POST">
                        <input type="hidden" name="action" value="NavToPayment">
                        <div class="row">
                            <div class="col-lg-7">
                                <h5 class="font-weight-bold mb-3">Giỏ hàng của bạn</h5>
                                <div class="box-cart">
                                    <c:forEach items="${sessionScope.CART.birdList}" var="bird">
                                        <div class="item-cart pr-3 my-3">
                                            <div class="d-flex align-items-center py-3 mx-3">
                                                <div class="image-item">
                                                    <img src="${bird.value.bird.image_url}" alt="${bird.value.bird.bird_name}" />
                                                </div>
                                                <div class="infor-item px-5">
                                                    <h5>${bird.value.bird.bird_name}</h5>
                                                    <div class="mt-2">
                                                        <p> 1
                                                            <span style="font-size: 13px; margin-right: 5px">x</span>
                                                            <c:choose>
                                                                <c:when test="${bird.value.bird.discount > 0}">
                                                                <p style="font-size: 14px;">  <fmt:formatNumber value="${bird.value.bird.price - bird.value.bird.price * bird.value.bird.discount / 100}" pattern="#,###"/> ₫</p>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <p class="mb-0" style="font-size: 14px; color: black; display: inline-block"><fmt:formatNumber value="${bird.value.bird.price}" pattern="#,###"/> ₫</p>
                                                            </c:otherwise>
                                                        </c:choose> 
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="price-item ml-4 px-3">
                                                    <c:choose>
                                                        <c:when test="${bird.value.bird.discount > 0}">
                                                            <p class="float-right" style="font-size: 19px;font-weight: bold; position: relative "><fmt:formatNumber value="${bird.value.bird.price - bird.value.bird.price * bird.value.bird.discount / 100}" pattern="#,###"/> ₫</p>
                                                            <p style="position: absolute;top: -25px;right: -13px; display: inline-block; border-radius: 10px; background-color: #cccccc; padding: 0 5px 0 5px; color: black;"> -${bird.value.bird.discount}%</p>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <p class="mb-0 float-right" style="font-size: 20px; font-weight: bold; display: inline-block"><fmt:formatNumber value="${bird.value.bird.price}" pattern="#,###"/> ₫</p>
                                                        </c:otherwise>
                                                    </c:choose> 
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item-cart pr-3 my-3">
                                            <div class="d-flex align-items-center py-3 mx-3">
                                                <div class="image-item">
                                                    <img src="${bird.value.cage.image_url}" alt="${bird.value.cage.accessory_name}" />
                                                </div>
                                                <div class="infor-item px-5">
                                                    <h5>${bird.value.cage.accessory_name}</h5>
                                                    <div class="mt-2">
                                                        <p> 1
                                                            <span style="font-size: 13px; margin-right: 5px">x</span>
                                                            <c:choose>
                                                                <c:when test="${bird.value.cage.discount > 0}">
                                                                <p style="font-size: 14px;">  <fmt:formatNumber value="${bird.value.cage.unit_price - bird.value.cage.unit_price * bird.value.cage.discount / 100}" pattern="#,###"/> ₫</p>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <p class="mb-0" style="font-size: 14px; color: black; display: inline-block"><fmt:formatNumber value="${bird.value.cage.unit_price}" pattern="#,###"/> ₫</p>
                                                            </c:otherwise>
                                                        </c:choose> 
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="price-item ml-4 px-3">
                                                    <c:choose>
                                                        <c:when test="${bird.value.cage.discount > 0}">
                                                            <p class="float-right"style="font-size: 19px;font-weight: bold; position: relative "><fmt:formatNumber value="${bird.value.cage.unit_price - bird.value.cage.unit_price * bird.value.cage.discount / 100}" pattern="#,###"/> ₫</p>
                                                            <p style="position: absolute;top: -25px;right: -13px; display: inline-block; border-radius: 10px; background-color: #cccccc; padding: 0 5px 0 5px; color: black;"> -${bird.value.cage.discount}%</p>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <p class="mb-0 float-right" style="font-size: 20px; font-weight: bold; display: inline-block"><fmt:formatNumber value="${bird.value.cage.unit_price}" pattern="#,###"/> ₫</p>
                                                        </c:otherwise>
                                                    </c:choose> 
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <c:forEach items="${sessionScope.CART.accessoryList}" var="accessory">
                                        <div class="item-cart pr-3 my-3">
                                            <div class="d-flex align-items-center justify-content-between py-3 mx-3">
                                                <div class="image-item">
                                                    <img src="${accessory.value.accessory.image_url}" alt="${accessory.value.accessory.accessory_name}" />
                                                </div>
                                                <div class="infor-item px-5">
                                                    <h5>${accessory.value.accessory.accessory_name}</h5>
                                                    <div class="mt-2">
                                                        <p>${accessory.value.order_quantity}
                                                            <span style="font-size: 13px; margin-right: 5px">x</span>
                                                            <c:choose>
                                                                <c:when test="${accessory.value.accessory.discount > 0}">
                                                                <p style="font-size: 14px;">  <fmt:formatNumber value="${accessory.value.accessory.unit_price - accessory.value.accessory.unit_price * accessory.value.accessory.discount / 100}" pattern="#,###"/> ₫</p>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <p class="mb-0" style="font-size: 14px; color: black; display: inline-block"><fmt:formatNumber value="${accessory.value.accessory.unit_price}" pattern="#,###"/> ₫</p>
                                                            </c:otherwise>
                                                        </c:choose> 
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="price-item ml-4 px-3">
                                                    <c:choose>
                                                        <c:when test="${accessory.value.accessory.discount > 0}">
                                                            <p class="float-right" style="font-size: 19px;font-weight: bold; position: relative "><fmt:formatNumber value="${accessory.value.order_quantity * accessory.value.accessory.unit_price - accessory.value.accessory.unit_price * accessory.value.accessory.discount / 100}" pattern="#,###"/> ₫</p>
                                                            <p style="position: absolute;top: -25px;right: -13px; display: inline-block; border-radius: 10px; background-color: #cccccc; padding: 0 5px 0 5px; color: black;"> -${accessory.value.accessory.discount}%</p>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <p class="mb-0 float-right" style="font-size: 20px; font-weight: bold; display: inline-block"><fmt:formatNumber value="${accessory.value.accessory.unit_price}" pattern="#,###"/> ₫</p>
                                                        </c:otherwise>
                                                    </c:choose> 
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>

                                </div>
                            </div>
                            <div class="col-lg-5 info-checkout mt-3">
                                <div class="form-group mt-3">
                                    <label for="user-receiver">Tên người nhận hàng:</label>
                                    <input id="user-receiver" class="input form-control" type="text" name="name" value="${sessionScope.LOGIN_USER.fullName}" required=""/>
                                </div>
                                <div class="form-group">
                                    <label for="mobile">Số điện thoại nhận hàng:</label>
                                    <input id="mobile" class="input form-control" type="text" name="mobile" value="${sessionScope.LOGIN_USER.phone}" required=""/>
                                </div>
                                <div class="form-group">
                                    <label for="address">Địa chỉ nhận hàng:</label>
                                    <input id="address" class="input form-control" type="text" name="address" value="${sessionScope.LOGIN_USER.address}" required=""/>
                                </div>
                                <div class="overall-menoy">
                                    <h5 class="mt-3">Tổng tiền thanh toán</h5>
                                    <div class="d-flex mt-3 total-items">
                                        <div class="d-flex align-items-center">
                                            <p>Số lượng sản phẩm: </p>
                                            <span style="font-weight: bold; font-size: 20px" class="ml-3">${sessionScope.CART.getTotalItem()}</span>
                                        </div>
                                    </div>
                                    <div class="d-flex mt-3 total-money">
                                        <div class="d-flex align-items-center">
                                            <p>Tổng tiền: </p>
                                            <span class="ml-3"><fmt:formatNumber value="${sessionScope.CART.cartTotalPrice}" pattern="#,###"/> ₫</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="payment-method mt-5">
                                    <h5 class="mt-3">Chọn phương thức thanh toán</h5>
                                    <table class="mt-3">
                                        <tr>
                                            <td><input id="money" class="" type="radio" name="method" value="" checked=""/></td>
                                            <td><i class="fa fa-money ml-3 icon-money" aria-hidden="true"></i></td>
                                            <td><label for="money" class="ml-3">Thanh toán khi nhận hàng</label></td>
                                        </tr>
                                        <tr class="credit-payment">
                                            <td><input id="credit" class="" type="radio" name="method" value=""/></td>
                                            <td><i class="fa fa-credit-card ml-3 icon-credit" aria-hidden="true"></i></td>
                                            <td><label for="credit" class="ml-3">Thanh toán qua thẻ tín dụng</label></td>
                                        </tr>
                                    </table>
                                </div>
                                <button type="submit" class="mt-4 btn btn-primary w-100">Đặt hàng</button>
                            </div>
                        </div>
                    </form>
            </main>
        </div>   
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
                                <li><a href="#">thegioivetcanh@gmail.com</a></li>
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
        <%@include file="../layout/message.jsp" %>
        <!-- jQuery -->
        <script src="assets/js/jquery-2.1.0.min.js"></script>
        <!-- Bootstrap -->
        <script src="assets/js/popper.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.validate.min.js"></script>
        <script src="assets/js/birdshop.js"></script>
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

        <script>

            $(function () {
                var selectedClass = "";
                $("p").click(function () {
                    selectedClass = $(this).attr("data-rel");
                    $("#portfolio").fadeTo(50, 0.1);
                    $("#portfolio div").not("." + selectedClass).fadeOut();
                    setTimeout(function () {
                        $("." + selectedClass).fadeIn();
                        $("#portfolio").fadeTo(50, 1);
                    }, 500);

                });
               $('.credit-payment').click(function (e){
                    e.preventDefault();
                    toast({
                        title: 'Lỗi',
                        message: 'Tính năng đang bị lỗi',
                        type: 'error',
                        duration: 3000  
                        });
               });
            });

        </script>

    </body>
</html>
