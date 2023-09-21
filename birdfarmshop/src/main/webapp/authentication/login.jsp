<%-- 
    Document   : login
    Created on : Sep 13, 2023, 11:27:34 PM
    Author     : tlminh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="assets/css/font-awesome.css"/>
        <link rel="stylesheet" href="assets/css/templatemo-hexashop.css"/>
    </head>
    <body>
        <!-- ***** Preloader Start ***** -->
        <div id="preloader">
            <div class="jumper">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>  
        <!-- ***** Preloader End ***** -->
        <section class="vh-100">
            <div class="container py-5 h-100">
                <div class="row d-flex h-100 justify-content-center align-items-center">
                    <div class="col-md-8 col-lg-7 col-xl-6 text-center">
                        <img src="assets/images/login.jpg"
                             class="img-fluid" style="height: 90%"; width="90%" alt="Bird image">
                    </div>
                    <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
                        <form action="MainController?action=login" class="form-login" method="POST">
                            <!-- Email input -->
                            <div class="form-outline mb-4 text-center">
                                <a href="MainController?action=NavToHome">
                                    <img src="assets/images/logo.png"
                                         class="img-fluid"  alt="Logo image">
                                </a>
                            </div>

                            <div class="form-outline mb-3">
                                <input type="text" id="account" name="account" class="input form-control form-control-lg" required=""/>
                                <label class="form-label" for="account">Email/Tên đăng nhập</label>
                            </div>

                            <!-- Password input -->
                            <div class="form-outline mb-2">
                                <input type="password" id="password" name="password" class="input form-control form-control-lg" required=""/>
                                <label class="form-label" for="password">Mật khẩu</label>
                                <div class="show-password">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                </div>
                            </div>
                            <p class="error-notification" style="color: red"><c:out value="${requestScope.error}" /></p>
                            <div class="d-flex justify-content-around align-items-center mb-4">
                                <!-- Checkbox -->
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="checkbox" value="" id="form1Example3"/>
                                    <label class="form-check-label" for="form1Example3"> Ghi nhớ đăng nhập </label>
                                </div>
                                <a href="#!">Quên mật khẩu?</a>
                            </div>

                            <!-- Submit button -->
                            <button type="submit" class="btn btn-primary btn-lg btn-block">Đăng nhập</button>
                            <div class="mt-2">Bạn mới biết đến BirdFarmShop ?   <a href="MainController?action=NavToRegister">Đăng kí</a></div>
                            <div class="divider d-flex align-items-center my-4">
                                <p class="text-center fw-bold mx-3 mb-0 text-muted">OR</p>
                            </div>
                            <div class="d-flex item-login">
                                <div class="col-md-12 col-lg-6 col-xl-6 text-center mb-3">
                                    <a class="btn btn-md  btn-block border btn-custom"href="https://www.facebook.com/v13.0/dialog/oauth?client_id=334333278988069&redirect_uri=http://localhost:8080/birdfarmshop/LoginFacebookController&scope=email"
                                       role="button">
                                        <div class="d-flex align-items-center justify-content-center">
                                            <img src="assets/images/facebook.png" alt="facebook icon"/>
                                            <p class="ml-2">Facebook</p>
                                        </div>
                                    </a>    
                                </div>  
                                <div class="col-md-12 col-lg-6 col-xl-6 text-center">
                                    <a class="btn btn-md btn-block border btn-custom"href="https://accounts.google.com/o/oauth2/auth?scope=https://www.googleapis.com/auth/userinfo.profile+https://www.googleapis.com/auth/userinfo.email
                                       &redirect_uri=http://localhost:8080/birdfarmshop/LoginGoogleController&response_type=code
                                       &client_id=911997830678-hnnf8alt3ehncr0mdo75f4kc2ckkdm6q.apps.googleusercontent.com&approval_prompt=force"
                                       role="button">
                                        <div class="d-flex align-items-center justify-content-center">
                                            <img src="assets/images/google.png" alt="facebook icon"/> 
                                            <p class="ml-2">Google</p>
                                        </div>
                                    </a>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <script src="assets/js/jquery-3.7.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/jquery.validate.min.js" ></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/js/birdshop.js"></script>
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
</html>
