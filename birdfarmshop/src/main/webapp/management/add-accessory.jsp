<%-- 
    Document   : add-bird
    Created on : Sep 13, 2023, 11:53:46 PM
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

        <title>V.E.T - Cập nhật thông tin vẹt cảnh</title>

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
            border-radius: 10px;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            float: right;
        }
        #id{
            height: 100px;
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
                                            <div class="cart-amount">
                                                <c:choose>
                                                    <c:when test="${sessionScope.CART == null}">0</c:when>
                                                    <c:otherwise>${sessionScope.CART.totalItem}</c:otherwise>
                                                </c:choose>
                                            </div>
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

        <!-- ***** Main Banner Area Start ***** -->
        <div class="page-heading" id="top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="inner-content">
                            <h2>Thêm mới sản phẩm</h2>                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ***** Main Banner Area End ***** -->


        <!-- ***** Products Area Starts ***** -->
        <section class="section" id="products">           
            <div class="container">
                <form action="AddAccessoryController" method="POST" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-lg-6" style="margin-top: 10px;">
                            <div class="form-outline">
                                <label>Mã phụ kiện (Bao gồm 2 chữ hoa và 3 chữ số)</label>
                                <input style="color: #0c5460;;" type="text" name="txtAccessoryID" class="input form-control" pattern="[A-Z]{2}\d{3}" placeholder="Nhập ID của phụ kiện" value="" required/>
                            </div>

                            <c:if test="${requestScope.MESSAGEERROR != null}">
                                <script>
                                    alert("${requestScope.MESSAGEERROR}");
                                </script>
                            </c:if>

                            <c:if test="${requestScope.MESSAGE != null}">
                                <script>
                                    alert("${requestScope.MESSAGE}");
                                </script>
                            </c:if>

                            <div class="form-outline mt-2">
                                <label>Tên</label>
                                <input style="color: #0c5460;;" type="text" id="createAccountForm" name="txtAccessoryName" class="input form-control" placeholder="Nhập tên phụ kiện" required/>
                            </div>

                            <div class="form-outline mt-2">
                                <label>Loại phụ kiện</label>
                                <select name="txtCategoryID" class="input form-control" style="color: #0c5460;">
                                    <option value="" disabled selected>Chọn phụ kiện</option>
                                    <c:forEach items="${ac}" var="a">
                                        <option value="${a.category_id}">${a.category_name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="row">
                                <div class="col-lg-6" style="width: 100%;">
                                    <div class="form-outline mt-2">
                                        <label>Giá bán</label>
                                        <div style="position: relative;">
                                            <input style="color: #0c5460;width: 80%;" type="number" name="txtPriceNew" min="0" class="input form-control" placeholder="Nhập giá của phụ kiện" required value=""/>
                                            <span style="position: absolute; right: 35px; top: 50%; transform: translateY(-50%);">₫</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-6" style="width: 100%;">
                                    <div class="form-outline mt-2">
                                        <label>Giảm giá</label>
                                        <div style="position: relative;">
                                            <input style="color: #0c5460; width: 80%;" type="number" name="txtDiscount" min="0" max="100" class="input form-control" placeholder="Nhập giảm giá phụ kiện"/>                            
                                            <span style="position: absolute; right: 28px; top: 50%; transform: translateY(-50%);">%</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-outline mt-2">
                                <label>Số lượng</label>                               
                                <input style="color: #0c5460;" value="" class="input form-control" type="number" name="txtStockQuantity" min="0" class="input form-control" placeholder="Nhập số lượng phụ kiện" required/>                                                                   
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-outline mt-2">
                                <label for="txtDescribe">Mô tả</label><br>
                                <textarea class="form-control" id="txtDescribe" name="txtDescribe" rows="5" cols="50" style="width: 100%; height: 142px; color: #0c5460;;" placeholder="Nhập mô tả phụ kiện"></textarea>
                            </div>

                            <div class="form-outline mt-2">
                                <label>Hình ảnh sản phẩm 1 (Bắt buộc)</label>
                                <input style="color: #0c5460;" type="file" name="txtImage_1" class="input form-control" accept="image/*" required/>
                            </div>

                            <div class="form-outline mt-2">
                                <label>Hình ảnh sản phẩm 2</label>
                                <!--<input style="color: #0c5460;" type="file" name="txtImage_2" class="input form-control" value="" required=""/>-->
                                <input style="color: #0c5460;" type="file" name="txtImage_2" class="input form-control" accept="image/*" required/>
                            </div>

                            <div class="form-outline mt-2">
                                <label>Hình ảnh sản phẩm 3</label>
                                <!--<input style="color: #0c5460;;" type="file" name="txtImage_3" class="input form-control" value="" placeholder="URL" pattern="^(http|https|ftp)://[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}(:[0-9]+)?(/.*)?$"/>-->
                                <input style="color: #0c5460;" type="file" name="txtImage_3" class="input form-control" accept="image/*" required/>
                            </div>
                        </div>
                        <div class="col-lg-12" style="margin-top: 15px;">

                            <input type="hidden" name="btAction" value="add">
                            <a type="button" class="btn-danger button-submit" style="margin-left: 10px; color: white;" href="MainController?action=NavToAccessory">Hủy bỏ</a>
                            <button class="btn-primary button-submit" style="margin-left: 10px;" type="submit" name="type" value="continue">Lưu và tiếp tục</button>
                            <button class="btn-success button-submit" type="submit" name="type" value="close">Lưu và đóng</button>

                        </div>
                    </div>
                </form>
            </div>
        </section>

        <!-- ***** Products Area Ends ***** -->

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

    <script>
                                    $(document).ready(function () {
                                        // Get a reference to the search input element
                                        var searchInput = $("#searchInput");
                                        // Add an event listener for input changes
                                        searchInput.on("input", function () {
                                            var keyword = searchInput.val().toLowerCase();

                                            // Loop through each row in the table
                                            $("tbody tr").each(function () {
                                                var row = $(this);
                                                // Check if any cell in the row contains the keyword
                                                if (row.text().toLowerCase().includes(keyword)) {
                                                    row.show(); // Show the row if keyword found
                                                } else {
                                                    row.hide(); // Hide the row if keyword not found
                                                }
                                            });
                                        });

                                        // Show the modal when the "Cấp mới tài khoản" button is clicked
                                        $("#createAccountBtn").click(function () {
                                            $("#createAccountModal").modal("show");
                                        });
                                        // Handle form submission
                                        $("#submitAccountBtn").click(function () {
                                            // Get the form data
                                            const fullname = $("#fullname").val();
                                            const username = $("#username").val();

                                            // You can perform validation here if needed

                                            // Close the modal
                                            $("#createAccountModal").modal("hide");

                                            // Send the form data to the server via AJAX or perform any desired action
                                        });
                                    });
    </script>

    <script>
        function submitForm() {
            // Get the form element by its ID
            var form = document.getElementById("createAccountForm");

            // Define the controller URL
            var controllerUrl = "/birdfarmshop/MainController";

            // Set the form's action attribute to the controller URL
            form.action = controllerUrl;


            document.querySelector('input[name=txtAccessoryName]').addEventListener('input', function () {
                var input = this;
                if (input.value.length > 50) {
                    input.setCustomValidity("Tên phụ kiện không được dài hơn 50 ký tự.");
                } else {
                    input.setCustomValidity("");
                }
            }
            );
    </script>
</html>
