<%-- 
    Document   : account-list
    Created on : Sep 13, 2023, 11:30:02 PM
    Author     : tlminh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" type="image/png" href="assets/images/logo-title-bar.png"/>
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

        <title>V.E.T - Danh sách tài khoản</title>

        <!-- Additional CSS Files -->
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">
        <link rel="stylesheet" href="assets/css/owl-carousel.css">
        <link rel="stylesheet" href="assets/css/lightbox.css">
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
                                    <li class="scroll-to-section"><a href="${pageScope.toShopOrders}">Đơn hàng</a></li>
                                    <li class="scroll-to-section"><a href="${pageScope.toAccounts}" class="active">Tài khoản</a></li>
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
                            <c:if test="${sessionScope.LOGIN_USER.role == 'manager'}">
                                <h2>Danh sách tài khoản nhân viên</h2>
                                <span>Thông tin tài khoản của tất cả nhân viên trên hệ thống V.E.T</span>
                            </c:if>
                            <c:if test="${sessionScope.LOGIN_USER.role == 'admin'}">
                                <h2>Danh sách tài khoản</h2>
                                <span>Thông tin tài khoản của tất cả người dùng trên hệ thống V.E.T</span>
                            </c:if>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ***** Main Banner Area End ***** -->
        <main class="py-5 mb-5" style="width: 80%; margin: 0 auto;">
            <div class="mt-3">
                <div class="row">
                    <div class="col-md-4">
                    </div>
                    <div class="col-md-6 my-2">
                        <div class="input-group">
                            <form class="d-flex w-100" action="RenderAccountsController" method="POST">
                                <div class="input-group-prepend">
                                    <button class="input-group-text"><img src="assets/images/search-icon.png"></button>
                                 
                                </div>                  
                                   <input type="text" class="form-control" id="searchInput" name="search" placeholder="Tìm kiếm..." value="${requestScope.SEARCH}">
                            </form>
                        </div>
                    </div>
                    <div class="col-md-2 text-center">
                        <!-- Button "Cấp mới tài khoản" -->
                        <button class="btn btn-success mb-3 p-3" id="createAccountBtn">Cấp mới tài khoản</button>
                    </div>
                </div>
            </div>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Tên người dùng</th>
                        <th>Tên tài khoản</th>
                        <th>Nhóm người dùng</th>
                        <th>Trạng thái</th>
                        <th style="text-align: center;">Khóa tài khoản</th>
                        <th style="text-align: center;">Cấp lại mật khẩu</th>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${sessionScope.LOGIN_USER.role == 'admin'}">
                        <c:forEach var="user" items="${requestScope.ACCOUNT_LIST}" varStatus="loop">
                            <tr>
                                <td>${loop.index + 1}</td>
                                <td><a href="MainController?action=NavToProfile&username=${user.username}">${user.fullName}</a></td>
                                <td>${user.username}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${user.role == 'admin'}">
                                            Quản trị viên
                                        </c:when>
                                        <c:when test="${user.role == 'manager'}">
                                            Quản lý
                                        </c:when>
                                        <c:when test="${user.role == 'staff'}">
                                            Nhân viên 
                                        </c:when>
                                        <c:otherwise>
                                            Khách hàng
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${user.status == 'active'}">
                                            Đang hoạt động 
                                        </c:when>
                                        <c:when test="${user.status == 'inactive'}">
                                            Chưa kích hoạt
                                        </c:when>
                                        <c:otherwise>
                                            Đã bị khóa  
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td style="text-align: center;">
                                    <c:if test="${user.role != 'admin'}">
                                        <c:choose>
                                            <c:when test="${user.status == 'active'}">
                                                <form action="MainController" method="POST">
                                                    <input type="hidden" name="action" value="UpdateActivity"/>
                                                    <input type="hidden" name="username" value="${user.username}"/>
                                                    <input type="hidden" name="type" value="lock"/>
                                                    <button type="submit" class="btn btn-danger">Khóa</button>
                                                </form>
                                            </c:when>
                                            <c:when test="${user.status == 'lock'}">
                                                <form action="MainController" method="POST">
                                                    <input type="hidden" name="action" value="UpdateActivity"/>
                                                    <input type="hidden" name="username" value="${user.username}"/>
                                                    <input type="hidden" name="type" value="open"/>
                                                    <button type="submit" class="btn btn-danger">Mở Khóa</button>
                                                </form>
                                            </c:when>
                                        </c:choose>
                                    </c:if>
                                </td>
                                <td style="text-align: center;">
                                    <c:if test="${user.role != 'admin'}">
                                        <form action="MainController" method="POST">
                                            <input type="hidden" name="action" value="UpdateActivity"/>
                                            <input type="hidden" name="username" value="${user.username}"/>
                                            <input type="hidden" name="type" value="reset"/>
                                            <button class="btn btn-primary">Cấp lại MK</button>
                                        </form>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    <c:if test="${sessionScope.LOGIN_USER.role == 'manager'}">
                        <c:set var="count" value="0"/>
                        <c:forEach var="userMG" items="${requestScope.ACCOUNT_LIST}">
                            <c:if test="${userMG.role == 'staff'}">
                                <tr>
                                    <c:set var="count" value="${count + 1}"/>
                                    <td>${count}</td>
                                    <td>${userMG.username}</td>
                                    <td>${userMG.fullName}</td>
                                    <td>
                                        <c:if test="${userMG.role == 'staff'}">
                                            Nhân viên
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${userMG.status == 'active'}">
                                                Đang hoạt động 
                                            </c:when>
                                            <c:when test="${userMG.status == 'inactive'}">
                                                Chưa kích hoạt
                                            </c:when>
                                            <c:otherwise>
                                                Đã bị khóa  
                                            </c:otherwise>
                                        </c:choose>   
                                    </td>
                                    <c:choose>
                                        <c:when test="${userMG.status == 'active'}">
                                            <td style="text-align: center;">
                                                <form action="MainController" method="POST">
                                                    <input type="hidden" name="action" value="UpdateActivity"/>
                                                    <input type="hidden" name="username" value="${userMG.username}"/>
                                                    <input type="hidden" name="type" value="lock"/>
                                                    <button type="submit" class="btn btn-danger">Khóa</button>
                                                </form>
                                            </td>
                                        </c:when>
                                        <c:when test="${userMG.status == 'lock'}">
                                            <td style="text-align: center;">
                                                <form action="MainController" method="POST">
                                                    <input type="hidden" name="action" value="UpdateActivity"/>
                                                    <input type="hidden" name="username" value="${userMG.username}"/>
                                                    <input type="hidden" name="type" value="open"/>
                                                    <button type="submit" class="btn btn-danger">Mở Khóa</button>
                                                </form>
                                            </td>
                                        </c:when>
                                        <c:otherwise>
                                            <td style="text-align: center;"></td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td style="text-align: center;">
                                        <form action="MainController" method="POST">
                                            <input type="hidden" name="action" value="UpdateActivity"/>
                                            <input type="hidden" name="username" value="${userMG.username}"/>
                                            <input type="hidden" name="type" value="reset"/>
                                            <button class="btn btn-primary">Cấp lại MK</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </tbody>
            </table>
            <c:if test="${noOfPages != 1}">
                <div class="d-flex float-right align-items-center page-pagination">
                    <c:set var="numberOfPage" value="${requestScope.currentPage}"/>
                    <input type="hidden" name="numberOfPage" value="${requestScope.noOfPages}"/>
                    <input type="hidden" name="page" value="${numberOfPage}"/>
                    <c:if test="${noOfPages >= 1 && noOfPages <= 5}">  
                        <div onclick="PrevPage()" class="page-prev ${numberOfPage <= 1 ? "page-disable":""}"><i class="fa fa-angle-left" aria-hidden="true"></i></i></div>
                        <c:forEach begin="1" end="${noOfPages}" var="i">
                            <div onclick="NavToNewPage(this)" class="page-navTo ${i == requestScope.currentPage ? "page-active":""}" data-value="${i}">${i}</div>       
                        </c:forEach>
                        <div onclick="NextPage()" class="page-next ml-3 ${numberOfPage >= noOfPages ? "page-disable":""}"><i class="fa fa-angle-right" aria-hidden="true"></i></i></div>
                    </c:if>    
                    <c:if test="${noOfPages > 5}">
                        <c:if test="${numberOfPage > 2}">
                            <div onclick="PrevPage()" class="page-prev ${numberOfPage <= 1 ? "page-disable":""}"><i class="fa fa-angle-left" aria-hidden="true"></i></i></div>
                            <c:if test="${numberOfPage + 2 < noOfPages}">
                                <c:set var="beginItem" value="${numberOfPage - 2 }"/>
                                <c:set var="endItem" value="${numberOfPage + 2 }"/>
                            </c:if>
                            <c:if test="${numberOfPage + 2 >= noOfPages}">
                                <c:set var="beginItem" value="${noOfPages - 4}"/>
                                <c:set var="endItem" value="${noOfPages}"/>
                            </c:if>
                            <c:forEach begin="${beginItem}" end="${endItem}" var="i">
                                <div onclick="NavToNewPage(this)" class="page-navTo ${i == requestScope.currentPage ? "page-active":""}" data-value="${i}">${i}</div>      
                            </c:forEach>
                            <div onclick="NextPage()" class="page-next ml-3 ${numberOfPage >= noOfPages ? "page-disable":""}"><i class="fa fa-angle-right" aria-hidden="true"></i></i></div>
                        </c:if>
                        <c:if test="${numberOfPage <= 2}">
                            <div onclick="PrevPage()" class="page-prev ${numberOfPage <= 1 ? "page-disable":""}"><i class="fa fa-angle-left" aria-hidden="true"></i></i></div>
                            <c:forEach var="i" begin="1" end="5">
                                <div onclick="NavToNewPage(this)" class="page-navTo ${i == requestScope.currentPage ? "page-active":""}" data-value="${i}">${i}</div>           
                            </c:forEach>                   
                            <div onclick="NextPage()" class="page-next ml-3 ${numberOfPage >= noOfPages ? "page-disable":""}"><i class="fa fa-angle-right" aria-hidden="true"></i></i></div>
                        </c:if>        
                    </c:if>
                </div>
            </c:if>
        </main>

        <!-- Bootstrap Modal for Creating New Account -->
        <div class="modal fade vertical-alignment" id="createAccountModal" tabindex="-1" role="dialog" aria-labelledby="createAccountModalLabel" aria-hidden="true" data-backdrop="false">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="createAccountModalLabel">Tạo tài khoản nhân viên</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form id="createAccountForm" action="MainController" method="POST">
                        <input type="hidden" name="action" value="CreateAccount"/>
                        <div class="modal-body">
                            <!-- Form for Creating New Account -->

                            <div class="form-group">
                                <label for="fullName">Họ và tên:</label>
                                <input type="text" class="form-control" id="fullName" name="fullname" value="${param.fullname}" required="">
                            </div>
                            <div class="form-group">
                                <label for="username">Tên tài khoản:</label>
                                <input type="text" class="form-control" id="username" name="username" value="${param.username}" required="">
                            </div>
                            <!-- Radio Button Options -->
                            <div class="form-group">
                                <c:if test="${sessionScope.LOGIN_USER.role == 'admin'}">
                                    <label>Nhóm người dùng:</label><br>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="role" id="role2" checked="" value="staff">
                                        <label class="form-check-label" for="role2">Nhân viên</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="role" id="role3" value="manager">
                                        <label class="form-check-label" for="role3">Quản lý</label>
                                    </div>
                                </c:if>
                                <c:if test="${sessionScope.LOGIN_USER.role == 'manager'}">
                                    <label>Nhóm người dùng:</label><br>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="role" id="role2" checked="" value="staff">
                                        <label class="form-check-label" for="role2">Nhân viên</label>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                            <button type="button" class="btn btn-secondary reset">Đặt lại</button>
                            <button type="submit" class="btn btn-primary">Tạo tài khoản</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- jQuery -->
        <%@include file="../layout/message.jsp" %>
        <script src="assets/js/jquery-3.7.1.min.js"></script>
        <script src="assets/js/jquery.validate.min.js"></script>
        <script src="assets/js/birdshop.js"></script>
        <!-- Bootstrap -->
        <script src="assets/js/popper.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- Plugins -->
        <script src="assets/js/owl-carousel.js"></script>
        <script src="assets/js/accordions.js"></script>
        <script src="assets/js/datepicker.js"></script>
        <script src="assets/js/scrollreveal.min.js"></script>
        <script src="assets/js/imgfix.min.js"></script> 
        <script src="assets/js/slick.js"></script> 
        <script src="assets/js/lightbox.js"></script> 
        <script src="assets/js/isotope.js"></script> 

        <!-- Global Init -->
        <script src="assets/js/custom.js"></script>

        <script>

                                // Show the modal when the "Cấp mới tài khoản" button is clicked
                                $("#createAccountBtn").click(function () {
                                    $("#createAccountModal").modal("show");
                                });
                                $('.reset').click(function () {
                                $('input[name=fullname]').val("");
                                        $('input[name=username]').val("");
                                });
       
                                function NavToNewPage(event) {
                                    let page = $(event).attr('data-value');
                                    if (page) {
                                        window.location.href = "MainController?action=NavToAccounts&page=" + page;
                                    }
                                }

                                function PrevPage() {
                                    let page = $('input[name=page]').val();
                                    let prevPage = Number(page) - 1;
                                    if (prevPage > 0) {
                                        window.location.href = "MainController?action=NavToAccounts&page=1";
                                    }
                                }

                                function NextPage() {
                                    let page = $('input[name=page]').val();
                                    let limitPage = $('input[name=numberOfPage]').val();
                                    let amountPage = Number(limitPage);
                                    let nextPage = Number(page) + 1;
                                    if (nextPage <= amountPage) {
                                        window.location.href = "MainController?action=NavToAccounts&page=" + amountPage;
                                    }
                                }
        </script>
    </body>
</html>
