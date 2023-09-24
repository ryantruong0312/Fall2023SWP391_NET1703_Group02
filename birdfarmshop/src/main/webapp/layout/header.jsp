<%-- 
    Document   : header
    Created on : Sep 21, 2023, 9:52:26 PM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url var="toCompare" value="MainController?action=NavToCompare"/>
<c:url var="toLogin" value="MainController?action=NavToLogin"/>
<c:url var="logout" value="MainController?action=Logout"/>
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
                                    <li><a href="MainController?action=NavToBird&amount=0">Chim vẹt</a></li>
                                    <li><a href="shop/bird-nest.jsp">Tổ chim non</a></li>
                                    <li><a href="MainController?action=NavToAccessory">Phụ kiện</a></li>
                                </ul>
                            </li>
                            <li class="scroll-to-section"><a href="${pageScope.toCompare}">So sánh</a></li>
                            <c:if test="${sessionScope.LOGIN_USER.role == 'staff'}">
                                <li class="scroll-to-section"><a href="">Đơn hàng</a></li>
                            </c:if>
                            <c:if test="${LOGIN_USER == null || LOGIN_USER.role == 'customer'}">
                                <li class="scroll-to-section"><a href="">Ghép cặp</a></li>
                                <li class="scroll-to-section"><a href="">Giỏ hàng</a></li>

                                <c:if test="${sessionScope.LOGIN_USER == null}">
                                    <li  class="scroll-to-section"> <a href="${pageScope.toLogin}">Đăng nhập</a></li>
                                </c:if>
                            </c:if>
                        </c:if>
                        <c:if test="${LOGIN_USER.role == 'admin' || LOGIN_USER.role == 'manager'}">
                            <li class="submenu"><a href="">Products</a>
                                <ul>
                                    <li><a href="#">Sản phẩm</a></li>
                                    <li><a href="#">Tổ chim non</a></li>
                                    <li><a href="MainController?action=NavToAccessory">Phụ kiện</a></li>
                                </ul>
                            </li>
                            <li class="scroll-to-section"><a href="${pageScope.toCompare}">So sánh</a></li>
                            <li class="scroll-to-section"><a href="">Đơn hàng</a></li>
                            <li class="scroll-to-section"><a href="shop/accounts.jsp">Tài khoản</a></li>
                            <li class="scroll-to-section"><a href="shop/reports.jsp">Thống kê</a></li>
                        </c:if>
                        <c:if test="${sessionScope.LOGIN_USER != null}">
                            <li class="submenu"><a class="user-name text-right" href="#">${LOGIN_USER.fullName}</a>
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
