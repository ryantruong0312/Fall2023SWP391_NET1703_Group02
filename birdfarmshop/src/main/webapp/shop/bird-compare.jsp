<%-- 
    Document   : compair-birds
    Created on : Sep 13, 2023, 11:23:00 PM
    Author     : tlminh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>V.E.T - So sánh</title>
        <link rel="icon" type="image/png" href="assets/images/logo-title-bar.png"/>
        <!-- Additional CSS Files -->
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">
        <link rel="stylesheet" href="assets/css/owl-carousel.css">
        <link rel="stylesheet" href="assets/css/lightbox.css">
        <link rel="stylesheet" href="assets/compare-bird/css/style.css"> <!-- Resource style -->
        <script src="assets/compare-bird/js/modernizr.js"></script> <!-- Modernizr -->
    </head>

    <body>
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
                                    <li class="submenu"><a href="">Sản phẩm</a>
                                        <ul>
                                            <li><a href="${pageScope.toBirds}">Vẹt cảnh</a></li>
                                            <li><a href="${pageScope.toBirdNests}">Tổ chim non</a></li>
                                            <li><a href="${pageScope.toAccessories}">Phụ kiện</a></li>
                                        </ul>
                                    </li>
                                    <li class="scroll-to-section"><a href="#" class="active">So sánh</a></li>
                                        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.role == 'customer'}">
                                            <c:if test="${sessionScope.LOGIN_USER.role == 'staff'}">
                                            <li class="scroll-to-section"><a href="${pageScope.toShopOrders}">Đơn hàng</a></li>
                                            </c:if>
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
                                    <c:if test="${sessionScope.LOGIN_USER.role == 'admin' || sessionScope.LOGIN_USER.role == 'manager'}">
                                    <li class="submenu"><a href="">Sản phẩm</a>
                                        <ul>
                                            <li><a href="${pageScope.toBirds}">Vẹt cảnh</a></li>
                                            <li><a href="${pageScope.toBirdNests}">Tổ chim non</a></li>
                                            <li><a href="${pageScope.toAccessories}">Phụ kiện</a></li>
                                        </ul>
                                    </li>
                                    <li class="scroll-to-section"><a href="#" class="active">So sánh</a></li>
                                    <li class="scroll-to-section"><a href="${pageScope.toShopOrders}">Đơn hàng</a></li>
                                    <li class="scroll-to-section"><a href="${pageScope.toAccounts}">Tài khoản</a></li>
                                    <li class="scroll-to-section"><a href="${pageScope.toReports}">Thống kê</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.LOGIN_USER != null}">
                                    <li class="submenu"><a href="">${LOGIN_USER.fullName}</a>
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
        <div class="page-heading" id="top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="inner-content">
                            <h2>So sánh thông tin</h2>
                            <span>Xem và đánh giá sự tương quan giữa hai cá thể vẹt của shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ***** Main Banner Area End ***** -->
        
        <main>
            <section class="cd-products-comparison-table">
                <header>
                    <div class="actions">
                        <a href="#0" class="reset">Mặc định</a>
                        <a href="#0" class="filter">Gộp so sánh</a>
                    </div>
                </header>

                <div class="cd-products-table">
                    <div class="features">
                        <div class="top-info"></div>
                        <ul class="cd-features-list">
                            <li>Vẹt cảnh</li>
                            <li>Giá bán</li>
                            <li>Tuổi</li>
                            <li>Số lứa sinh sản</li>
                            <li>Thành tích</li>
                            <li>Tình trạng</li>
                            <li></li>
                        </ul>
                    </div> <!-- .features -->


                    <div class="cd-products-wrapper">
                        <ul class="cd-products-columns">
                            <c:forEach var="i" begin="1" end="6">
                                <li class="product">
                                    <div class="top-info">
                                        <div class="check"></div>
                                    </div>
                                    <ul class="cd-features-list">
                                        <li>
                                            <select class="combo-box" id="breedSelect${i}" onchange="updateBirdNames${i}()">
                                                <option>Chọn giống vẹt</option>
                                                <c:forEach items="${requestScope.BIRD_BREEDS}" var="breed">
                                                    <option value="${breed.breed_id}">${breed.breed_name}</option>
                                                </c:forEach>
                                            </select>
                                            <select class="combo-box" id="birdSelect${i}">
                                                <!-- This is initially empty and will be populated dynamically based on the selected breed -->
                                            </select>
                                            <img id="birdImage${i}" src="assets/images/bird-compare-1.jpg" alt="product image">
                                            <h3 id="birdName${i}" class="info-name"> </h3>
                                        </li>
                                        <li id="birdPrice${i}"> </li>
                                        <li id="birdAge${i}"> </li>
                                        <li id="birdReproductionHistory${i}"> </li>
                                        <li id="birdAchievement${i}"> </li>
                                        <li id="birdStatus${i}"> </li>
                                        <li><button class="detail-info" onclick="redirectToBirdDetails${i}()">Xem chi tiết</button></a></li>
                                    </ul>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                    <ul class="cd-table-navigation">
                        <li><a href="#0" class="prev inactive">Prev</a></li>
                        <li><a href="#0" class="next">Next</a></li>
                    </ul>
                </div> <!-- .cd-products-table -->
            </section> <!-- .cd-products-comparison-table -->
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

        <script>
            var birdData1 = [];
            var birdData2 = [];
            var birdData3 = [];
            var birdData4 = [];
            var birdData5 = [];
            var birdData6 = [];

            var selectedBirdId1 = null;
            var selectedBirdId2 = null;
            var selectedBirdId3 = null;
            var selectedBirdId4 = null;
            var selectedBirdId5 = null;
            var selectedBirdId6 = null;

            <c:forEach items="${requestScope.BIRDS}" var="bird">
            birdData1.push({
                birdId: "${bird.bird_id}",
                birdImage: "${bird.image_url}",
                breedId: "${bird.breed_id}",
                birdName: "${bird.bird_name}",
                birdAge: "${bird.age}",
                birdAchievement: "${bird.achievement}",
                birdReproductionHistory: "${bird.reproduction_history}",
                birdStatus: "${bird.status}",
                birdPrice: "${bird.price}"
            });
            birdData2.push({
                birdId: "${bird.bird_id}",
                birdImage: "${bird.image_url}",
                breedId: "${bird.breed_id}", // Assuming 'breedId' is the property in Bird class
                birdName: "${bird.bird_name}", // Assuming 'name' is the property in Bird class
                birdAge: "${bird.age}", // Assuming 'age' is the property in Bird class
                birdAchievement: "${bird.achievement}", // Assuming 'achievement' is the property in Bird class
                birdReproductionHistory: "${bird.reproduction_history}", // Assuming 'reproductionHistory' is the property in Bird class
                birdStatus: "${bird.status}", // Assuming 'status' is the property in Bird class
                birdPrice: "${bird.price}" // Assuming 'price' is the property in Bird class
            });
            birdData3.push({
                birdId: "${bird.bird_id}",
                birdImage: "${bird.image_url}",
                breedId: "${bird.breed_id}", // Assuming 'breedId' is the property in Bird class
                birdName: "${bird.bird_name}", // Assuming 'name' is the property in Bird class
                birdAge: "${bird.age}", // Assuming 'age' is the property in Bird class
                birdAchievement: "${bird.achievement}", // Assuming 'achievement' is the property in Bird class
                birdReproductionHistory: "${bird.reproduction_history}", // Assuming 'reproductionHistory' is the property in Bird class
                birdStatus: "${bird.status}", // Assuming 'status' is the property in Bird class
                birdPrice: "${bird.price}" // Assuming 'price' is the property in Bird class
            });
            birdData4.push({
                birdId: "${bird.bird_id}",
                birdImage: "${bird.image_url}",
                breedId: "${bird.breed_id}", // Assuming 'breedId' is the property in Bird class
                birdName: "${bird.bird_name}", // Assuming 'name' is the property in Bird class
                birdAge: "${bird.age}", // Assuming 'age' is the property in Bird class
                birdAchievement: "${bird.achievement}", // Assuming 'achievement' is the property in Bird class
                birdReproductionHistory: "${bird.reproduction_history}", // Assuming 'reproductionHistory' is the property in Bird class
                birdStatus: "${bird.status}", // Assuming 'status' is the property in Bird class
                birdPrice: "${bird.price}" // Assuming 'price' is the property in Bird class
            });
            birdData5.push({
                birdId: "${bird.bird_id}",
                birdImage: "${bird.image_url}",
                breedId: "${bird.breed_id}", // Assuming 'breedId' is the property in Bird class
                birdName: "${bird.bird_name}", // Assuming 'name' is the property in Bird class
                birdAge: "${bird.age}", // Assuming 'age' is the property in Bird class
                birdAchievement: "${bird.achievement}", // Assuming 'achievement' is the property in Bird class
                birdReproductionHistory: "${bird.reproduction_history}", // Assuming 'reproductionHistory' is the property in Bird class
                birdStatus: "${bird.status}", // Assuming 'status' is the property in Bird class
                birdPrice: "${bird.price}" // Assuming 'price' is the property in Bird class
            });
            birdData6.push({
                birdId: "${bird.bird_id}",
                birdImage: "${bird.image_url}",
                breedId: "${bird.breed_id}", // Assuming 'breedId' is the property in Bird class
                birdName: "${bird.bird_name}", // Assuming 'name' is the property in Bird class
                birdAge: "${bird.age}", // Assuming 'age' is the property in Bird class
                birdAchievement: "${bird.achievement}", // Assuming 'achievement' is the property in Bird class
                birdReproductionHistory: "${bird.reproduction_history}", // Assuming 'reproductionHistory' is the property in Bird class
                birdStatus: "${bird.status}", // Assuming 'status' is the property in Bird class
                birdPrice: "${bird.price}" // Assuming 'price' is the property in Bird class
            });
            </c:forEach>

            function updateBirdNames1() {
                var breedSelect = document.getElementById("breedSelect1");
                var selectedBreedId = breedSelect.options[breedSelect.selectedIndex].value;
                var birdSelect = document.getElementById("birdSelect1");
                birdSelect.innerHTML = ""; // Clear existing options

                // Reset all information fields
                document.getElementById("birdName1").textContent = "";
                document.getElementById("birdImage1").src = "assets/images/bird-compare-1.jpg";
                document.getElementById("birdAge1").textContent = "";
                document.getElementById("birdAchievement1").textContent = "";
                document.getElementById("birdReproductionHistory1").textContent = "";
                document.getElementById("birdStatus1").textContent = "";
                document.getElementById("birdPrice1").textContent = "";
                // Populate the bird name combo box based on the selected breed
                var option = document.createElement("option");
                option.text = "Chọn tên chú vẹt";
                birdSelect.appendChild(option);
                for (var i = 0; i < birdData1.length; i++) {
                    var birdEntry = birdData1[i];
                    if (birdEntry.breedId === selectedBreedId && birdEntry.birdId !== selectedBirdId2 && birdEntry.birdId !== selectedBirdId3
                            && birdEntry.birdId !== selectedBirdId4 && birdEntry.birdId !== selectedBirdId5 && birdEntry.birdId !== selectedBirdId6) {
                        var option = document.createElement("option");
                        option.text = birdEntry.birdName;
                        option.value = birdEntry.birdId;
                        birdSelect.appendChild(option);
                    }
                }
            }

            function updateBirdNames2() {
                var breedSelect = document.getElementById("breedSelect2");
                var selectedBreedId = breedSelect.options[breedSelect.selectedIndex].value;
                var birdSelect = document.getElementById("birdSelect2");
                birdSelect.innerHTML = ""; // Clear existing options

                // Reset all information fields
                document.getElementById("birdName2").textContent = "";
                document.getElementById("birdImage2").src = "assets/images/bird-compare-2.jpg";
                document.getElementById("birdAge2").textContent = "";
                document.getElementById("birdAchievement2").textContent = "";
                document.getElementById("birdReproductionHistory2").textContent = "";
                document.getElementById("birdStatus2").textContent = "";
                document.getElementById("birdPrice2").textContent = "";
                // Populate the bird name combo box based on the selected breed
                var option = document.createElement("option");
                option.text = "Chọn tên chú vẹt";
                birdSelect.appendChild(option);
                for (var i = 0; i < birdData2.length; i++) {
                    var birdEntry = birdData2[i];
                    if (birdEntry.breedId === selectedBreedId && birdEntry.birdId !== selectedBirdId1 && birdEntry.birdId !== selectedBirdId3
                            && birdEntry.birdId !== selectedBirdId4 && birdEntry.birdId !== selectedBirdId5 && birdEntry.birdId !== selectedBirdId6) {
                        var option = document.createElement("option");
                        option.text = birdEntry.birdName;
                        option.value = birdEntry.birdId;
                        birdSelect.appendChild(option);
                    }
                }
            }

            function updateBirdNames3() {
                var breedSelect = document.getElementById("breedSelect3");
                var selectedBreedId = breedSelect.options[breedSelect.selectedIndex].value;
                var birdSelect = document.getElementById("birdSelect3");
                birdSelect.innerHTML = ""; // Clear existing options

                // Reset all information fields
                document.getElementById("birdName3").textContent = "";
                document.getElementById("birdImage3").src = "assets/images/bird-compare-1.jpg";
                document.getElementById("birdAge3").textContent = "";
                document.getElementById("birdAchievement3").textContent = "";
                document.getElementById("birdReproductionHistory3").textContent = "";
                document.getElementById("birdStatus3").textContent = "";
                document.getElementById("birdPrice3").textContent = "";
                // Populate the bird name combo box based on the selected breed
                var option = document.createElement("option");
                option.text = "Chọn tên chú vẹt";
                birdSelect.appendChild(option);
                for (var i = 0; i < birdData3.length; i++) {
                    var birdEntry = birdData3[i];
                    if (birdEntry.breedId === selectedBreedId && birdEntry.birdId !== selectedBirdId1 && birdEntry.birdId !== selectedBirdId2
                            && birdEntry.birdId !== selectedBirdId4 && birdEntry.birdId !== selectedBirdId5 && birdEntry.birdId !== selectedBirdId6) {
                        var option = document.createElement("option");
                        option.text = birdEntry.birdName;
                        option.value = birdEntry.birdId;
                        birdSelect.appendChild(option);
                    }
                }
            }
            function updateBirdNames4() {
                var breedSelect = document.getElementById("breedSelect4");
                var selectedBreedId = breedSelect.options[breedSelect.selectedIndex].value;
                var birdSelect = document.getElementById("birdSelect4");
                birdSelect.innerHTML = ""; // Clear existing options

                // Reset all information fields
                document.getElementById("birdName4").textContent = "";
                document.getElementById("birdImage4").src = "assets/images/bird-compare-1.jpg";
                document.getElementById("birdAge4").textContent = "";
                document.getElementById("birdAchievement4").textContent = "";
                document.getElementById("birdReproductionHistory4").textContent = "";
                document.getElementById("birdStatus4").textContent = "";
                document.getElementById("birdPrice4").textContent = "";
                // Populate the bird name combo box based on the selected breed
                var option = document.createElement("option");
                option.text = "Chọn tên chú vẹt";
                birdSelect.appendChild(option);
                for (var i = 0; i < birdData4.length; i++) {
                    var birdEntry = birdData4[i];
                    if (birdEntry.breedId === selectedBreedId && birdEntry.birdId !== selectedBirdId1 && birdEntry.birdId !== selectedBirdId2
                            && birdEntry.birdId !== selectedBirdId3 && birdEntry.birdId !== selectedBirdId5 && birdEntry.birdId !== selectedBirdId6) {
                        var option = document.createElement("option");
                        option.text = birdEntry.birdName;
                        option.value = birdEntry.birdId;
                        birdSelect.appendChild(option);
                    }
                }
            }
            function updateBirdNames5() {
                var breedSelect = document.getElementById("breedSelect5");
                var selectedBreedId = breedSelect.options[breedSelect.selectedIndex].value;
                var birdSelect = document.getElementById("birdSelect5");
                birdSelect.innerHTML = ""; // Clear existing options

                // Reset all information fields
                document.getElementById("birdName5").textContent = "";
                document.getElementById("birdImage5").src = "assets/images/bird-compare-1.jpg";
                document.getElementById("birdAge5").textContent = "";
                document.getElementById("birdAchievement5").textContent = "";
                document.getElementById("birdReproductionHistory5").textContent = "";
                document.getElementById("birdStatus5").textContent = "";
                document.getElementById("birdPrice5").textContent = "";
                // Populate the bird name combo box based on the selected breed
                var option = document.createElement("option");
                option.text = "Chọn tên chú vẹt";
                birdSelect.appendChild(option);
                for (var i = 0; i < birdData5.length; i++) {
                    var birdEntry = birdData5[i];
                    if (birdEntry.breedId === selectedBreedId && birdEntry.birdId !== selectedBirdId1 && birdEntry.birdId !== selectedBirdId2
                            && birdEntry.birdId !== selectedBirdId3 && birdEntry.birdId !== selectedBirdId4 && birdEntry.birdId !== selectedBirdId6) {
                        var option = document.createElement("option");
                        option.text = birdEntry.birdName;
                        option.value = birdEntry.birdId;
                        birdSelect.appendChild(option);
                    }
                }
            }
            function updateBirdNames6() {
                var breedSelect = document.getElementById("breedSelect6");
                var selectedBreedId = breedSelect.options[breedSelect.selectedIndex].value;
                var birdSelect = document.getElementById("birdSelect6");
                birdSelect.innerHTML = ""; // Clear existing options

                // Reset all information fields
                document.getElementById("birdName6").textContent = "";
                document.getElementById("birdImage6").src = "assets/images/bird-compare-1.jpg";
                document.getElementById("birdAge6").textContent = "";
                document.getElementById("birdAchievement6").textContent = "";
                document.getElementById("birdReproductionHistory6").textContent = "";
                document.getElementById("birdStatus6").textContent = "";
                document.getElementById("birdPrice6").textContent = "";
                // Populate the bird name combo box based on the selected breed
                var option = document.createElement("option");
                option.text = "Chọn tên chú vẹt";
                birdSelect.appendChild(option);
                for (var i = 0; i < birdData6.length; i++) {
                    var birdEntry = birdData6[i];
                    if (birdEntry.breedId === selectedBreedId && birdEntry.birdId !== selectedBirdId1 && birdEntry.birdId !== selectedBirdId2
                            && birdEntry.birdId !== selectedBirdId3 && birdEntry.birdId !== selectedBirdId4 && birdEntry.birdId !== selectedBirdId5) {
                        var option = document.createElement("option");
                        option.text = birdEntry.birdName;
                        option.value = birdEntry.birdId;
                        birdSelect.appendChild(option);
                    }
                }
            }

            // Add an event handler for the birdSelect1 element
            var birdSelect1 = document.getElementById("birdSelect1");
            birdSelect1.addEventListener("change", function () {
                var selectedBirdId = birdSelect1.options[birdSelect1.selectedIndex].value;
                selectedBirdId1 = selectedBirdId;
                // Find the corresponding bird data in birdData array
                var selectedBird = birdData1.find(function (birdEntry) {
                    return birdEntry.birdId === selectedBirdId;
                });
                // Update the information in the bird-information div
                document.getElementById("birdImage1").src = selectedBird.birdImage;
                document.getElementById("birdName1").textContent = selectedBird.birdName;
                document.getElementById("birdAge1").textContent = selectedBird.birdAge + " tháng";
                document.getElementById("birdAchievement1").textContent = selectedBird.birdAchievement;
                document.getElementById("birdReproductionHistory1").textContent = selectedBird.birdReproductionHistory;
                document.getElementById("birdStatus1").textContent = selectedBird.birdStatus;
                document.getElementById("birdPrice1").textContent = selectedBird.birdPrice + " ₫";
            });

            // Add an event handler for the birdSelect2 element
            var birdSelect2 = document.getElementById("birdSelect2");
            birdSelect2.addEventListener("change", function () {
                var selectedBirdId = birdSelect2.options[birdSelect2.selectedIndex].value;
                selectedBirdId2 = selectedBirdId;
                // Find the corresponding bird data in birdData array
                var selectedBird = birdData2.find(function (birdEntry) {
                    return birdEntry.birdId === selectedBirdId;
                });
                // Update the information in the bird-information div
                document.getElementById("birdImage2").src = selectedBird.birdImage;
                document.getElementById("birdName2").textContent = selectedBird.birdName;
                document.getElementById("birdAge2").textContent = selectedBird.birdAge + " tháng";
                document.getElementById("birdAchievement2").textContent = selectedBird.birdAchievement;
                document.getElementById("birdReproductionHistory2").textContent = selectedBird.birdReproductionHistory;
                document.getElementById("birdStatus2").textContent = selectedBird.birdStatus;
                document.getElementById("birdPrice2").textContent = selectedBird.birdPrice + " ₫";
            });

            // Add an event handler for the birdSelect3 element
            var birdSelect3 = document.getElementById("birdSelect3");
            birdSelect3.addEventListener("change", function () {
                var selectedBirdId = birdSelect3.options[birdSelect3.selectedIndex].value;
                selectedBirdId3 = selectedBirdId;
                // Find the corresponding bird data in birdData array
                var selectedBird = birdData3.find(function (birdEntry) {
                    return birdEntry.birdId === selectedBirdId;
                });
                // Update the information in the bird-information div
                document.getElementById("birdImage3").src = selectedBird.birdImage;
                document.getElementById("birdName3").textContent = selectedBird.birdName;
                document.getElementById("birdAge3").textContent = selectedBird.birdAge + " tháng";
                document.getElementById("birdAchievement3").textContent = selectedBird.birdAchievement;
                document.getElementById("birdReproductionHistory3").textContent = selectedBird.birdReproductionHistory;
                document.getElementById("birdStatus3").textContent = selectedBird.birdStatus;
                document.getElementById("birdPrice3").textContent = selectedBird.birdPrice + " ₫";
            });
            
            // Add an event handler for the birdSelect4 element
            var birdSelect4 = document.getElementById("birdSelect4");
            birdSelect4.addEventListener("change", function () {
                var selectedBirdId = birdSelect4.options[birdSelect4.selectedIndex].value;
                selectedBirdId4 = selectedBirdId;
                // Find the corresponding bird data in birdData array
                var selectedBird = birdData4.find(function (birdEntry) {
                    return birdEntry.birdId === selectedBirdId;
                });
                // Update the information in the bird-information div
                document.getElementById("birdImage4").src = selectedBird.birdImage;
                document.getElementById("birdName4").textContent = selectedBird.birdName;
                document.getElementById("birdAge4").textContent = selectedBird.birdAge + " tháng";
                document.getElementById("birdAchievement4").textContent = selectedBird.birdAchievement;
                document.getElementById("birdReproductionHistory4").textContent = selectedBird.birdReproductionHistory;
                document.getElementById("birdStatus4").textContent = selectedBird.birdStatus;
                document.getElementById("birdPrice4").textContent = selectedBird.birdPrice + " ₫";
            });
            
            // Add an event handler for the birdSelect5 element
            var birdSelect5 = document.getElementById("birdSelect5");
            birdSelect5.addEventListener("change", function () {
                var selectedBirdId = birdSelect5.options[birdSelect5.selectedIndex].value;
                selectedBirdId5 = selectedBirdId;
                // Find the corresponding bird data in birdData array
                var selectedBird = birdData5.find(function (birdEntry) {
                    return birdEntry.birdId === selectedBirdId;
                });
                // Update the information in the bird-information div
                document.getElementById("birdImage5").src = selectedBird.birdImage;
                document.getElementById("birdName5").textContent = selectedBird.birdName;
                document.getElementById("birdAge5").textContent = selectedBird.birdAge + " tháng";
                document.getElementById("birdAchievement5").textContent = selectedBird.birdAchievement;
                document.getElementById("birdReproductionHistory5").textContent = selectedBird.birdReproductionHistory;
                document.getElementById("birdStatus5").textContent = selectedBird.birdStatus;
                document.getElementById("birdPrice5").textContent = selectedBird.birdPrice + " ₫";
            });
            
            // Add an event handler for the birdSelect6 element
            var birdSelect6 = document.getElementById("birdSelect6");
            birdSelect6.addEventListener("change", function () {
                var selectedBirdId = birdSelect6.options[birdSelect6.selectedIndex].value;
                selectedBirdId6 = selectedBirdId;
                // Find the corresponding bird data in birdData array
                var selectedBird = birdData6.find(function (birdEntry) {
                    return birdEntry.birdId === selectedBirdId;
                });
                // Update the information in the bird-information div
                document.getElementById("birdImage6").src = selectedBird.birdImage;
                document.getElementById("birdName6").textContent = selectedBird.birdName;
                document.getElementById("birdAge6").textContent = selectedBird.birdAge + " tháng";
                document.getElementById("birdAchievement6").textContent = selectedBird.birdAchievement;
                document.getElementById("birdReproductionHistory6").textContent = selectedBird.birdReproductionHistory;
                document.getElementById("birdStatus6").textContent = selectedBird.birdStatus;
                document.getElementById("birdPrice6").textContent = selectedBird.birdPrice + " ₫";
            });

            function redirectToBirdDetails1() {
                if (selectedBirdId1 !== null) {
                    // Construct the URL
                    var url = 'MainController?action=NavToBirdDetails&bird_id=' + selectedBirdId1;
                    // Redirect to the URL
                    window.location.href = url;
                }
            }

            function redirectToBirdDetails2() {
                if (selectedBirdId2 !== null) {
                    // Construct the URL
                    var url = 'MainController?action=NavToBirdDetails&bird_id=' + selectedBirdId2;
                    // Redirect to the URL
                    window.location.href = url;
                }
            }

            function redirectToBirdDetails3() {
                if (selectedBirdId3 !== null) {
                    // Construct the URL
                    var url = 'MainController?action=NavToBirdDetails&bird_id=' + selectedBirdId3;
                    // Redirect to the URL
                    window.location.href = url;
                }
            }
            function redirectToBirdDetails4() {
                if (selectedBirdId4 !== null) {
                    // Construct the URL
                    var url = 'MainController?action=NavToBirdDetails&bird_id=' + selectedBirdId4;
                    // Redirect to the URL
                    window.location.href = url;
                }
            }
            function redirectToBirdDetails5() {
                if (selectedBirdId5 !== null) {
                    // Construct the URL
                    var url = 'MainController?action=NavToBirdDetails&bird_id=' + selectedBirdId5;
                    // Redirect to the URL
                    window.location.href = url;
                }
            }
            function redirectToBirdDetails6() {
                if (selectedBirdId6 !== null) {
                    // Construct the URL
                    var url = 'MainController?action=NavToBirdDetails&bird_id=' + selectedBirdId6;
                    // Redirect to the URL
                    window.location.href = url;
                }
            }
        </script>

        <script src="assets/compare-bird/js/jquery-2.1.4.js"></script>
        <script src="assets/compare-bird/js/main.js"></script>

    </body>
</html>

