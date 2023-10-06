<%-- 
    Document   : add-birdCustomer
    Created on : Oct 4, 2023, 7:33:16 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V.E.T - Chim khách khàng</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">
        <link rel="stylesheet" href="assets/css/owl-carousel.css">
        <link rel="stylesheet" href="assets/css/lightbox.css">
        <link rel="stylesheet" href="assets/css/bird-pair.css">
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
            <div class="container">
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
                                <li class="scroll-to-section"><a href="${pageScope.toHome}">Trang chủ</a></li>
                                    <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.role == 'customer' || sessionScope.LOGIN_USER.role == 'staff'}">
                                    <li class="submenu"><a style="user-select: none;" onclick="preventdefault()">Sản phẩm</a>
                                        <ul>
                                            <li><a href="${pageScope.toBirds}">Vẹt cảnh</a></li>
                                            <li><a href="${pageScope.toBirdNests}">Tổ chim non</a></li>
                                            <li><a href="${pageScope.toAccessories}">Phụ kiện</a></li>
                                        </ul>
                                    </li>
                                    <li class="scroll-to-section"><a href="${pageScope.toCompare}">So sánh</a></li>
                                        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.role == 'customer'}">
                                            <c:if test="${sessionScope.LOGIN_USER.role == 'staff'}">
                                            <li class="scroll-to-section"><a href="${pageScope.toShopOrders}">Đơn hàng</a></li>
                                            </c:if>
                                        <li class="scroll-to-section"><a href="#" class="active">Nhân giống</a></li>
                                        <li id="show-cart" class="scroll-to-section">
                                            <a href="${pageScope.toCart}"><i style="font-size: 25px" class="fa fa-shopping-cart" aria-hidden="true"></i></a>
                                            <div class="cart-amount">${sessionScope.CART.totalItem}</div>

                                        </li>
                                        <c:if test="${sessionScope.LOGIN_USER == null}">
                                            <li  class="scroll-to-section"> <a href="${pageScope.toLogin}">Đăng nhập</a></li>
                                            </c:if>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${sessionScope.LOGIN_USER.role == 'admin' || sessionScope.LOGIN_USER.role == 'manager'}">
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
                                    <li class="submenu"><a href="">${LOGIN_USER.fullName}</a>
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
                            <h2>Nhân giống sinh sản</h2>
                            <span>Ghép cặp và tạo ra những cá thể vẹt cảnh đôc đáo, mang lại giá trị cao</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ***** Main Banner Area End ***** -->
        <main class="bird-customer new-bird">
            <div class="comparison-column customer-create--bird">
                <a href="MainController?action=NavToPairBirds"><button id="button-back" class="button-create px-4">Quay lại</button></a>
                <div class="column-content">
                    <h2>Thêm một chú vẹt mới</h2>
                    <form id="form-createBird" action="CreateBirdCustomer" method="POST" enctype="multipart/form-data"> 
                        <!-- EL to populate the category combo box -->
                        <select class="combo-box" name="txtBreedId" id="breedSelect3">
                            <option value = "">Chọn giống vẹt</option>
                            <c:forEach items="${requestScope.BIRD_BREEDS}" var="breed">
                                <option value="${breed.breed_id}" ${requestScope.BREEDID == breed.breed_id ? "selected":""}>${breed.breed_name}</option>
                            </c:forEach>
                        </select>
                        <!-- EL to populate the bird name combo box -->
                        <div class="mt-3">
                            <label class="mb-1" style="color: black; width: 150px" for="name">Tên con vẹt: </label>
                            <input type="text" id="account" class="form-control" name="nameBird" value="${requestScope.NAMEBIRD}" required="">          
                        </div> 
                        <div class="mt-3 d-flex align-items-center">
                            <label for="gender-1" class="mb-1" class="mr-4">Giới tính: </label>
                            <input id="gender-1" class="ml-4 mr-1" type="radio" name="gender" value="1" checked=""/><label for="gender-1">Trống</label>
                            <p style="display: inline-block; width: 30px"></p>
                            <input id="gender-2" class="mr-1"type="radio" name="gender" value="0" ${requestScope.GENDER == 0 ? "checked":""}/><label for="gender-2">Mái</label>
                        </div>
                        <div class="mt-3">
                            <label style="color: black; width: 150px"  for="imageBird">Ảnh con vẹt: </label>
                            <input style="background: none; border: none" type="file" id="imageBird" class="form-control mt-2" name="filePicture" required="">          
                        </div>  
                        
                        <!-- Additional rows to display bird information -->
                        <div id="birdInformation3">         
                            <div class="bird-info-row">
                                <!-- Placeholder for bird image -->
                                <img id="birdImage1" src="assets/images/bird-compare-1.jpg" alt="Bird Image">
                            </div>
                        </div>
                </div>
            </div>
        </div>
        <div class="box-button-create">
            <button type="submit" class="button-createBird">Thêm vẹt mới</button>  
        </div>
    </from>
</main>
<!-- ***** Footer Start ***** -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="first-item">
                    <div class="logo">
                        <img src="assets/images/logo.png">
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
<script src="assets/js/jquery-3.7.1.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/jquery.validate.min.js" ></script>
<script src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/birdshop.js"></script>
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
                                            $('#breedSelect3').change(function () {
                                                let breedId = $(this).val();
                                                $('input[type=file]').val('');
                                                $('#birdInformation3').html(`<div class="bird-info-row">
                                                            <img id="birdImage1" src="assets/images/bird-compare-1.jpg" alt="Bird Image">
                                                        </div>`);
                                            });
                                            $('input[type=file]').change(function (e) {
                                                let file = e.target.files[0];
                                                if (file) {
                                                    var reader = new FileReader();
                                                    reader.onload = function (e) {
                                                        $('#birdImage1').attr('src', e.target.result);
                                                    };
                                                    reader.readAsDataURL(file);
                                                }
                                            });
                                        });
</script>
</body>
</html>