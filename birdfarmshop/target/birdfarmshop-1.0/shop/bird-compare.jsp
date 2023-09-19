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
        <title>Product Comparison</title>
        <style>
            /* Styles for the main content */
            .comparison-container {
                display: flex;
                justify-content: space-between;
                align-items: flex-start;
                margin: 20px;
            }

            .comparison-column {
                flex: 1;
                margin: 10px;
                padding: 20px;
                border: 1px solid #ccc;
                box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
            }

            /* Styles for the combo boxes */
            .combo-box {
                width: 100%;
                margin-bottom: 10px;
            }

            /* Styles for the bird image */
            .bird-image {
                max-width: 100%;
                height: auto;
                margin: 10px 0;
            }

            /* Styles for the information rows */
            .info-row {
                display: flex;
                justify-content: space-between;
                margin-bottom: 10px;
            }

            /* Add more styling as needed */
        </style>
    </style>
    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">
    <link rel="stylesheet" href="assets/css/owl-carousel.css">
    <link rel="stylesheet" href="assets/css/lightbox.css">
</head>

<body>
    <c:url var="toHome" value="MainController?action=NavToHome"/>
    <c:url var="toCompare" value="MainController?action=NavToCompare"/>
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
                            <li class="scroll-to-section"><a href="${pageScope.toHome}">Home</a></li>
                                <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.role == 'customer' || sessionScope.LOGIN_USER.role == 'staff'}">
                                <li class="submenu"><a href="">Products</a>
                                    <ul>
                                        <li><a href="birds.jsp">Birds</a></li>
                                        <li><a href="bird-nest.jsp">Bird Nests</a></li>
                                        <li><a href="accessories.jsp">Accessories</a></li>
                                    </ul>
                                </li>
                                <li class="scroll-to-section"><a href="#" class="active">Bird Compare</a></li>
                                    <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.role == 'customer'}">
                                    <li class="scroll-to-section"><a href="">Breed Select</a></li>
                                    <li class="scroll-to-section"><a href="cart-view.jsp">Cart</a></li>
                                        <c:if test="${sessionScope.LOGIN_USER.role == 'staff'}">
                                        <li class="scroll-to-section"><a href="">Orders</a></li>
                                        </c:if>
                                        <c:if test="${sessionScope.LOGIN_USER == null}">
                                        <li  class="scroll-to-section"> <a href="MainController?action=NavToLogin">Login</a></li>
                                        </c:if>
                                    </c:if>
                                </c:if>
                                <c:if test="${sessionScope.LOGIN_USER.role == 'admin' || sessionScope.LOGIN_USER.role == 'manager'}">
                                <li class="submenu"><a href="birds.jsp">Birds</a>
                                    <ul>
                                        <li><a href="#">Add a bird</a></li>
                                    </ul>
                                </li>
                                <li class="submenu"><a href="accessories.jsp">Accessories</a>
                                    <ul>
                                        <li><a href="#">Add an accessory</a></li>
                                    </ul>
                                </li>
                                <li class="scroll-to-section"><a href="bird-compare.jsp">Bird Compare</a></li>
                                <li class="scroll-to-section"><a href="">Orders</a></li>
                                <li class="scroll-to-section"><a href="bird-compare.jsp">Accounts</a>
                                    <ul>
                                        <li><a href="#">Create an account</a></li>
                                    </ul>
                                </li>
                                <li class="scroll-to-section"><a href="reports.jsp">Reports</a></li>
                                </c:if>
                                <c:if test="${sessionScope.LOGIN_USER != null}">
                                <li class="submenu"><span>${sessionScope.LOGIN_USER.name}</span>
                                    <ul>
                                        <li><a href="#">Profile</a></li>
                                        <li><a href="#">Sign out</a></li>
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
    <main>
        <h1>Bird Comparison</h1>
        <div class="comparison-container">
            <!-- First Column -->
            <div class="comparison-column">
                <h2>Select a bird</h2>

                <!-- EL to populate the category combo box -->
                <select class="combo-box" onchange="showBirdNames(this.value, 'birdSelect1')">
                    <option value="">Select A Breed</option>
                    <c:forEach items="${BIRD_BREEDS}" var="breed">
                        <option value="${breed}">${breed}</option>
                    </c:forEach>
                </select>

                <!-- EL to populate the bird name combo box -->
                <select class="combo-box" id="birdSelect1">
                    <option value="">Select A Bird</option>
                    <c:forEach items="${birdNames1}" var="birdName">
                        <option value="${birdName}">${birdName}</option>
                    </c:forEach>
                </select>

                <img class="bird-image" src="bird1.jpg" alt="Bird 1 Image">
                <div class="info-row">
                    <div>Color: Blue</div>
                    <div>Achievement: Gold Medal</div>
                </div>
                <div class="info-row">
                    <div>Age: 3 years</div>
                    <div>Price: $200</div>
                </div>
            </div>

            <!-- Second Column -->
            <div class="comparison-column">
                <h2>Select a bird</h2>

                <!-- EL to populate the category combo box -->
                <select class="combo-box" onchange="showBirdNames(this.value, 'birdSelect2')">
                    <option value="">Select Category</option>
                    <c:forEach items="${categories}" var="category">
                        <option value="${category}">${category}</option>
                    </c:forEach>
                </select>

                <!-- EL to populate the bird name combo box -->
                <select class="combo-box" id="birdSelect2">
                    <option value="">Select Bird</option>
                    <c:forEach items="${birdNames2}" var="birdName">
                        <option value="${birdName}">${birdName}</option>
                    </c:forEach>
                </select>
                <img class="bird-image" src="bird2.jpg" alt="Bird 2 Image">
                <div class="info-row">
                    <div>Color: Green</div>
                    <div>Achievement: Silver Medal</div>
                </div>
                <div class="info-row">
                    <div>Age: 2 years</div>
                    <div>Price: $150</div>
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
                            <li><a href="#">16501 Collins Ave, Sunny Isles Beach, FL 33160, United States</a></li>
                            <li><a href="#">hexashop@company.com</a></li>
                            <li><a href="#">010-020-0340</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3">
                    <h4>Shopping &amp; Categories</h4>
                    <ul>
                        <li><a href="#">Men’s Shopping</a></li>
                        <li><a href="#">Women’s Shopping</a></li>
                        <li><a href="#">Kid's Shopping</a></li>
                    </ul>
                </div>
                <div class="col-lg-3">
                    <h4>Useful Links</h4>
                    <ul>
                        <li><a href="#">Homepage</a></li>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Help</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
                <div class="col-lg-3">
                    <h4>Help &amp; Information</h4>
                    <ul>
                        <li><a href="#">Help</a></li>
                        <li><a href="#">FAQ's</a></li>
                        <li><a href="#">Shipping</a></li>
                        <li><a href="#">Tracking ID</a></li>
                    </ul>
                </div>
                <div class="col-lg-12">
                    <div class="under-footer">
                        <p>Copyright © 2022 HexaShop Co., Ltd. All Rights Reserved. 

                            <br>Design: <a href="https://templatemo.com" target="_parent" title="free css templates">TemplateMo</a></p>
                        <ul>
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fa fa-behance"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>

