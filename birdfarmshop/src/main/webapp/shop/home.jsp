<%-- 
    Document   : home
    Created on : Sep 13, 2023, 7:25:56 PM
    Author     : tlminh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="LOGIN_USER" scope="session" value="${sessionScope.LOGIN_USER}" />

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

        <title>V.E.T - Thế giới Vẹt Cảnh</title>

        <!-- Additional CSS Files -->
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">
        <link rel="stylesheet" href="assets/css/owl-carousel.css">
        <link rel="stylesheet" href="assets/css/lightbox.css">
        <style>
            .breed-img,
            .category-img
            {
                width: 100%;
                height: 370px;
            }
            .breed-name,
            .category-name
            {
                text-align: center;
            }
        </style>

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
                                            <li><a href="${pageScope.toProfile}">Cá nhân</a></li>
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
        <div class="main-banner" id="top">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="left-content">
                            <div class="thumb">
                                <div class="inner-content">
                                    <h4>Bird Farm Shop</h4>
                                    <span>Đặt niềm yêu thú cưng của bạn vào tay chuyên gia về chim vẹt.</span>
                                    <div class="main-border-button">
                                        <a href="#">Tìm hiểu ngay!</a>
                                    </div>
                                </div>
                                <img src="assets/images/left-banner-image.jpg" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="right-content">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="right-first-image">
                                        <div class="thumb">
                                            <div class="inner-content">
                                                <h4>Chim vẹt</h4>
                                                <span>Bạn Đồng Hành Tuyệt Vời Cho Người Mê Thú Cưng</span>
                                            </div>
                                            <div class="hover-content">
                                                <div class="inner">
                                                    <h4>Chim vẹt</h4>
                                                    <p>Khám phá thế giới đầy màu sắc với các loài chim vẹt từ khắp nơi trên thế giới!</p>
                                                    <div class="main-border-button">
                                                        <a href="#">Xem thêm</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <img src="assets/images/baner-right-image-01.jpg">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="right-first-image">
                                        <div class="thumb">
                                            <div class="inner-content">
                                                <h4>Phụ kiện</h4>
                                                <span>Vật phẩm hàng đầu cho loài lông vũ</span>
                                            </div>
                                            <div class="hover-content">
                                                <div class="inner">
                                                    <h4>Phụ kiện</h4>
                                                    <p>Tự hào giới thiệu bộ sưu tập phụ kiện cho chim vẹt!</p>
                                                    <div class="main-border-button">
                                                        <a href="#">Xem thêm</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <img src="assets/images/baner-right-image-02.jpg">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="right-first-image">
                                        <div class="thumb">
                                            <div class="inner-content">
                                                <h4>Tổ chim non</h4>
                                                <span>Các tổ chim đang trong quá trình nuôi dưỡng</span>
                                            </div>
                                            <div class="hover-content">
                                                <div class="inner">
                                                    <h4>Tổ chim non</h4>
                                                    <p>Hãy khám phá các tổ chim non đáng yêu của chúng tôi!</p>
                                                    <div class="main-border-button">
                                                        <a href="#">Xem thêm</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <img src="assets/images/baner-right-image-03.jpg">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="right-first-image">
                                        <div class="thumb">
                                            <div class="inner-content">
                                                <h4>Ghép cặp</h4>
                                                <span>Nhân giống chim vẹt theo yêu cầu</span>
                                            </div>
                                            <div class="hover-content">
                                                <div class="inner">
                                                    <h4>Ghép cặp</h4>
                                                    <p>Cùng nhau tạo ra cá thể vẹt mới đầy sự đáng yêu, độc đáo.</p>
                                                    <div class="main-border-button">
                                                        <a href="#">Xem thêm</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <img src="assets/images/baner-right-image-04.jpg">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ***** Main Banner Area End ***** -->

        <!-- ***** Bird Breeds Area Starts ***** -->
        <section class="section" id="men">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="section-heading">
                            <h2>Đa dạng chủng loài</h2>
                            <span>Đắm chìm trong vẻ đẹp và sự quý giá của những chú vẹt tại cửa hàng của chúng tôi!</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="men-item-carousel">
                            <div class="owl-men-item owl-carousel">
                                <c:forEach var="breed" items="${requestScope.BIRD_BREEDS}">
                                    <div class="item">
                                        <div class="thumb">
                                            <div class="hover-content">
                                                <ul>
                                                    <li><a href="single-product.html"><i class="fa fa-eye"></i></a></li>
                                                </ul>
                                            </div>
                                            <img class="breed-img" src="${breed.breed_thumbnail}" alt="">
                                        </div>
                                        <div class="down-content">
                                            <h4 class="breed-name">${breed.breed_name}</h4>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ***** Bird Breeds Area Ends ***** -->

        <!-- ***** Accessories Area Starts ***** -->
        <section class="section" id="women">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="section-heading">
                            <h2>Thế giới phụ kiện</h2>
                            <span>Những sản phẩm chăm sóc thú cưng được tin dùng bởi giới mê vẹt cảnh.</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="women-item-carousel">
                            <div class="owl-women-item owl-carousel">
                                <c:forEach var="category" items="${requestScope.ACCESSORY_CATEGORIES}">
                                    <div class="item">
                                        <div class="thumb">
                                            <div class="hover-content">
                                                <ul>
                                                    <li><a href="single-product.html"><i class="fa fa-eye"></i></a></li>
                                                </ul>
                                            </div>
                                            <img class="category-img" src="${category.category_thumbnail}" alt="">
                                        </div>
                                        <div class="down-content">
                                            <h4 class="category-name">${category.category_name}</h4>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ***** Accessories Area Ends ***** -->

        <!-- ***** Explore Area Starts ***** -->
        <section class="section" id="explore">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="left-content">
                            <h2>Các sản phẩm và dịch vụ tại Bird Farm Shop</h2>
                            <span>Chào mừng đến với Shop Bán Chim Cảnh - nơi bạn có thể khám phá một thế giới tuyệt vời của động vật cưng với sự đa dạng loài chim độc đáo và dịch vụ chất lượng hàng đầu. Với hơn một thập kỷ kinh nghiệm trong việc nuôi và chăm sóc chim, chúng tôi tự hào là địa chỉ đáng tin cậy cho những người yêu thú cưng lông mịn.</span>
                            <div class="quote">
                                <i class="fa fa-quote-left"></i><p>Chúng tôi cam kết cung cấp các con vật cưng khỏe mạnh và được nuôi dưỡng cẩn thận, để bạn có thể đón những người bạn mới vào gia đình mình.</p>
                            </div>
                            <p>Bên cạnh việc bán chim, chúng tôi còn cung cấp các sản phẩm chất lượng để giúp bạn chăm sóc chim cưng của mình, từ lồng cho đến thức ăn và đồ chơi.</p>
                            <p>Chúng tôi luôn sẵn sàng tư vấn và hỗ trợ bạn trong việc nuôi dưỡng và chăm sóc chim cảnh của mình. Bạn cũng có thể yên tâm về việc giao hàng, với dịch vụ vận chuyển an toàn và đảm bảo đến tận tay bạn.</p>
                            <div class="main-border-button">
                                <a href="">Tìm hiểu thêm</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="right-content">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="leather">
                                        <h4>Đa dạng giống loài</h4>
                                        <span>Gần 100 cá thể vẹt quý giá</span>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="first-image">
                                        <img src="assets/images/explore-image-01.jpg" alt="">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="second-image">
                                        <img src="assets/images/explore-image-02.jpg" alt="">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="types">
                                        <h4>Thế giới phụ kiện</h4>
                                        <span>Hơn 50 dòng sản phẩm</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ***** Explore Area Ends ***** -->

        <!-- ***** Subscribe Area Starts ***** -->
        <div class="subscribe">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="section-heading">
                            <h2>Đăng ký thông tin để có cơ hội nhận ưu đãi lên đến 30%</h2>
                            <span>Ưu đãi và tích lũy điểm thưởng giúp bạn mua sắm thả ga tại Bird Farm Shop.</span>
                        </div>
                        <form id="subscribe" action="" method="get">
                            <div class="row">
                                <div class="col-lg-5">
                                    <fieldset>
                                        <input name="name" type="text" id="name" placeholder="Họ và tên của bạn" required="">
                                    </fieldset>
                                </div>
                                <div class="col-lg-5">
                                    <fieldset>
                                        <input name="email" type="text" id="email" pattern="[^ @]*@[^ @]*" placeholder="Địa chỉ email của bạn" required="">
                                    </fieldset>
                                </div>
                                <div class="col-lg-2">
                                    <fieldset>
                                        <button type="submit" id="form-submit" class="main-dark-button"><i class="fa fa-paper-plane"></i></button>
                                    </fieldset>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-lg-4">
                        <div class="row">
                            <div class="col-6">
                                <ul>
                                    <li>Địa chỉ:<br><span>284 Pasteur, P.8 Q.3, TP.HCM</span></li>
                                    <li>Điện thoại:<br><span>0913-244-567</span></li>
                                    <li>Kênh thông tin:<br><span><a href="#">Facebook</a>, <a href="#">Instagram</a>, <a href="#">Zalo</a>, <a href="#">Shopee</a></span></li>
                                </ul>
                            </div>
                            <div class="col-6">
                                <ul>
                                    <li>Giờ làm việc:<br><span>07:30 - 19:30 <br>Từ T2 đến T6</span></li>
                                    <li>Email:<br><span>birdfarmshop@petshop.com</span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ***** Subscribe Area Ends ***** -->

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
                            <li><a href="#">Vẹt cảnh</a></li>
                            <li><a href="#">Tổ chim non</a></li>
                            <li><a href="#">Phụ kiện</a></li>
                            <li><a href="#">So sánh</a></li>
                            <li><a href="#">Nhân giống</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3">
                        <h4>Đường dẫn hữu ích</h4>
                        <ul>
                            <li><a href="#">Trang chủ</a></li>
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
            });

        </script>

    </body>
</html>
