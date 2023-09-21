<%-- 
    Document   : compair-birds
    Created on : Sep 13, 2023, 11:23:00 PM
    Author     : tlminh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Bird Farm Shop - So sánh</title>
        <!-- Additional CSS Files -->
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">
        <link rel="stylesheet" href="assets/css/owl-carousel.css">
        <link rel="stylesheet" href="assets/css/lightbox.css">
        <link rel="stylesheet" href="assets/css/bird-compare.css">
    </head>

    <body>
        <c:url var="toHome" value="MainController?action=NavToHome"/>
        <c:url var="toLogin" value="MainController?action=NavToLogin"/>
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
                                            <li><a href="shop/birds.jsp">Chim vẹt</a></li>
                                            <li><a href="shop/bird-nest.jsp">Tổ chim non</a></li>
                                            <li><a href="shop/accessories.jsp">Phụ kiện</a></li>
                                        </ul>
                                    </li>
                                    <li class="scroll-to-section"><a href="#" class="active">So sánh</a></li>
                                        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.role == 'customer'}">
                                            <c:if test="${sessionScope.LOGIN_USER.role == 'staff'}">
                                            <li class="scroll-to-section"><a href="">Đơn hàng</a></li>
                                            </c:if>
                                        <li class="scroll-to-section"><a href="">Ghép cặp</a></li>
                                        <li class="scroll-to-section"><a href="../cart-view.jsp">Giỏ hàng</a></li>
                                            <c:if test="${sessionScope.LOGIN_USER == null}">
                                            <li  class="scroll-to-section"> <a href="${pageScope.toLogin}">Đăng nhập</a></li>
                                            </c:if>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${sessionScope.LOGIN_USER.role == 'admin' || sessionScope.LOGIN_USER.role == 'manager'}">
                                    <li class="submenu"><a href="">Products</a>
                                        <ul>
                                            <li><a href="#">Sản phẩm</a></li>
                                            <li><a href="#">Tổ chim non</a></li>
                                            <li><a href="#">Phụ kiện</a></li>
                                        </ul>
                                    </li>
                                    <li class="scroll-to-section"><a href="${pageScope.toCompare}">So sánh</a></li>
                                    <li class="scroll-to-section"><a href="">Đơn hàng</a></li>
                                    <li class="scroll-to-section"><a href="../shop/accounts.jsp">Tài khoản</a></li>
                                    <li class="scroll-to-section"><a href="shop/reports.jsp">Thống kê</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.LOGIN_USER != null}">
                                    <li class="submenu"><a href="#">${LOGIN_USER.fullName}</a>
                                        <ul>
                                            <li><a href="#">Cá nhân</a></li>
                                            <li><a href="${logout}">Đăng xuất</a></li>
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
            <div class="comparison-container">
                <!-- First Column -->
                <div class="comparison-column">
                    <div class="column-content">
                        <h2>Chọn loài vẹt</h2>

                        <!-- EL to populate the category combo box -->
                        <select class="combo-box" id="breedSelect1" onchange="updateBirdNames1()">
                            <option>Chọn giống vẹt</option>
                            <c:forEach items="${requestScope.BIRD_BREEDS}" var="breed">
                                <option value="${breed.breed_id}">${breed.breed_name}</option>
                            </c:forEach>
                        </select>

                        <!-- EL to populate the bird name combo box -->
                        <select class="combo-box" id="birdSelect1">
                            <!-- This is initially empty and will be populated dynamically based on the selected breed -->
                        </select>

                        <!-- Additional rows to display bird information -->
                        <div id="birdInformation1">
                            <div class="bird-info-row">
                                <!-- Placeholder for bird image -->
                                <img id="birdImage1" src="assets/images/bird-compare-1.jpg" alt="Bird Image">
                            </div>
                            <div class="bird-info-row">
                                <span id="birdAge1"></span>
                            </div>
                            <div class="bird-info-row">
                                <pre id="birdAchievement1"></pre>
                            </div>
                            <div class="bird-info-row">
                                <p id="birdReproductionHistory1"></p>
                            </div>
                            <div class="bird-info-row">
                                <p id="birdStatus1"></p>
                            </div>
                            <div class="bird-info-row">
                                <p id="birdPrice1"></p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Second Column -->
                <div class="comparison-column">
                    <div class="column-content">
                        <h2>Chọn loài vẹt</h2>

                        <!-- EL to populate the category combo box -->
                        <select class="combo-box" id="breedSelect2" onchange="updateBirdNames2()">
                            <option>Chọn giống vẹt</option>
                            <c:forEach items="${requestScope.BIRD_BREEDS}" var="breed">
                                <option value="${breed.breed_id}">${breed.breed_name}</option>
                            </c:forEach>
                        </select>

                        <!-- EL to populate the bird name combo box -->
                        <select class="combo-box" id="birdSelect2">
                            <!-- This is initially empty and will be populated dynamically based on the selected breed -->
                        </select>

                        <!-- Additional rows to display bird information -->
                        <div id="birdInformation2">
                            <div class="bird-info-row">
                                <!-- Placeholder for bird image -->
                                <img id="birdImage2" src="assets/images/bird-compare-2.jpg" alt="Bird Image">
                            </div>
                            <div class="bird-info-row">
                                <span id="birdAge2"></span>
                            </div>
                            <div class="bird-info-row">
                                <pre id="birdAchievement2"></pre>
                            </div>
                            <div class="bird-info-row">
                                <p id="birdReproductionHistory2"></p>
                            </div>
                            <div class="bird-info-row">
                                <p id="birdStatus2"></p>
                            </div>
                            <div class="bird-info-row">
                                <p id="birdPrice2"></p>
                            </div>
                        </div>
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
                                <img src="assets/images/white-logo.png" alt="hexashop ecommerce templatemo">
                            </div>
                            <ul>
                                <li><a href="#">284 Pasteur, P.8 Q.3, TP.HCM</a></li>
                                <li><a href="#">birdfarmshop@petshop.com</a></li>
                                <li><a href="#">0913-244-567</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <h4>Sản phẩm và dịch vụ</h4>
                        <ul>
                            <li><a href="#">Chim vẹt</a></li>
                            <li><a href="#">Tổ chim non</a></li>
                            <li><a href="#">Phụ kiện</a></li>
                            <li><a href="#">So sánh</a></li>
                            <li><a href="#">Ghép cặp</a></li>
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
                            <p>Copyright © 2023 BirdFarmShop Co., Ltd. All Rights Reserved. 

                                <br>Design: <a href="https://templatemo.com" target="_parent" title="free css templates">TemplateMo</a></p>
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
    </body>
    <script>
        var birdData1 = []; // Initialize an empty JavaScript array
        var birdData2 = [];
        // Use JSTL to populate the JavaScript array from ${requestScope.BIRDS}
        <c:forEach items="${requestScope.BIRDS}" var="bird">
        birdData1.push({
            birdId: "${bird.bird_id}",
            breedId: "${bird.breed_id}", // Assuming 'breedId' is the property in Bird class
            birdName: "${bird.bird_name}", // Assuming 'name' is the property in Bird class
            birdAge: "${bird.age}", // Assuming 'age' is the property in Bird class
            birdAchievement: "${bird.achievement}", // Assuming 'achievement' is the property in Bird class
            birdReproductionHistory: "${bird.reproduction_history}", // Assuming 'reproductionHistory' is the property in Bird class
            birdStatus: "${bird.status}", // Assuming 'status' is the property in Bird class
            birdPrice: "${bird.price}" // Assuming 'price' is the property in Bird class
        });
        birdData2.push({
            birdId: "${bird.bird_id}",
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
            document.getElementById("birdImage1").src = "assets/images/bird-compare-1.jpg";
            document.getElementById("birdAge1").textContent = "";
            document.getElementById("birdAchievement1").textContent = "";
            document.getElementById("birdReproductionHistory1").textContent = "";
            document.getElementById("birdStatus1").textContent = "";
            document.getElementById("birdPrice1").textContent = "";

            // Populate the bird name combo box based on the selected breed
            for (var i = 0; i < birdData1.length; i++) {
                var birdEntry = birdData1[i];
                if (birdEntry.breedId === selectedBreedId) {
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
            document.getElementById("birdImage2").src = "assets/images/bird-compare-2.jpg";
            document.getElementById("birdAge2").textContent = "";
            document.getElementById("birdAchievement2").textContent = "";
            document.getElementById("birdReproductionHistory2").textContent = "";
            document.getElementById("birdStatus2").textContent = "";
            document.getElementById("birdPrice2").textContent = "";

            // Populate the bird name combo box based on the selected breed
            for (var i = 0; i < birdData2.length; i++) {
                var birdEntry = birdData2[i];
                if (birdEntry.breedId === selectedBreedId) {
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
            // Find the corresponding bird data in birdData array
            var selectedBird = birdData1.find(function (birdEntry) {
                return birdEntry.birdId === selectedBirdId;
            });
            // Update the information in the bird-information div
            //        document.getElementById("birdImage1").src = selectedBird.birdImage;
            document.getElementById("birdAge1").textContent = "Age: " + selectedBird.birdAge;
            document.getElementById("birdAchievement1").textContent = "Achievement: " + selectedBird.birdAchievement;
            document.getElementById("birdReproductionHistory1").textContent = "Reproduction History: " + selectedBird.birdReproductionHistory;
            document.getElementById("birdStatus1").textContent = "Status: " + selectedBird.birdStatus;
            document.getElementById("birdPrice1").textContent = "Price: " + selectedBird.birdPrice;
        });

        // Add an event handler for the birdSelect2 element
        var birdSelect2 = document.getElementById("birdSelect2");
        birdSelect2.addEventListener("change", function () {
            var selectedBirdId = birdSelect2.options[birdSelect2.selectedIndex].value;
            // Find the corresponding bird data in birdData array
            var selectedBird = birdData2.find(function (birdEntry) {
                return birdEntry.birdId === selectedBirdId;
            });
            // Update the information in the bird-information div
            //        document.getElementById("birdImage1").src = selectedBird.birdImage;
            document.getElementById("birdAge2").textContent = "Age: " + selectedBird.birdAge;
            document.getElementById("birdAchievement2").textContent = "Achievement: " + selectedBird.birdAchievement;
            document.getElementById("birdReproductionHistory2").textContent = "Reproduction History: " + selectedBird.birdReproductionHistory;
            document.getElementById("birdStatus2").textContent = "Status: " + selectedBird.birdStatus;
            document.getElementById("birdPrice2").textContent = "Price: " + selectedBird.birdPrice;
        });
    </script>
</html>

