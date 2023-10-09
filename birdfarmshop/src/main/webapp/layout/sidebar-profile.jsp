<%-- 
    Document   : sidebar-profile
    Created on : Oct 9, 2023, 3:51:49 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
    <div class="card h-100">
        <div class="card-body">
            <div class="account-settings">
                <div class="user-profile">
                    <div class="user-avatar">
                        <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Maxwell Admin">
                    </div>
                    <h5>${sessionScope.LOGIN_USER.fullName}</h5>
                </div>
                <div class="about">
                    <ul>
                        <li class="${param.action == "NavToProfile" ? "active-profile":""
                                     || param.action == "NavToUpdatePassword" ? "active-profile":""
                                     || param.action == "NavToEditProfile" ? "active-profile":""   }"> 
                            <a href="MainController?action=NavToProfile" class="profile-link">
                                <img class="icon" src="assets/images/user.png" alt="avatar"/>
                                <span>Thông tin người dùng</span>
                            </a>
                        </li>
                        <li class="${param.action == "NavToOrderCustomer" ? "active-profile":""}">
                            <a href="#" class="order-link">
                                <img class="icon" src="assets/images/test.png" alt="Đơn hàng"/>
                                <span>Đơn hàng</span>
                            </a>
                        </li>
                        <li class="${param.action == "NavToBirdCustomer" ? "active-profile":""}">
                            <a href="MainController?action=NavToBirdCustomer" class="order-link">
                                <img class="icon" src="assets/images/bird-customer.png" alt="Chim của khách hàng"/>
                                <span>Chim khách hàng</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>