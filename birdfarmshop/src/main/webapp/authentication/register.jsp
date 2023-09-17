<%-- 
    Document   : register
    Created on : Sep 13, 2023, 11:29:01 PM
    Author     : tlminh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="assets/css/font-awesome.css"/>
        <link rel="stylesheet" href="assets/css/templatemo-hexashop.css"/>
    </head>
    <body
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
                <div class="row d-flex h-100 justify-content-center align-items-center test">
                    <div class="col-md-8 col-lg-7 col-xl-6 text-center">
                        <img src="assets/images/register.jpg"
                             class="img-fluid" style="height: 90%"; width="90%" alt="Logo image">
                    </div>
                    <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
                        <form action="#" class="form-register" method="POST">  
                            <div class="form-outline d-flex align-items-center justify-content-between mb-4">
                                <a href="MainController?action=NavToHome">
                                    <img src="assets/images/logo.png"
                                         class="img-fluid"  alt="Bird image">
                                </a>
                                <div class="d-flex align-items-center logo-register">
                                    <!--                             <p>Sign up</p>-->
                                    <a href="#">
                                        <img src="assets/images/facebook.png"
                                             class="img-fluid logo"  alt="Bird image">
                                    </a>
                                    <a href="#">
                                        <img src="assets/images/google.png"
                                             class="img-fluid logo"  alt="Bird image">
                                    </a>
                                </div>
                            </div>
                            <!-- name input -->
                            <div class="form-outline">
                                <input type="text" id="name" name="name" class="input form-control form-control-lg" required=""/>
                                <label class="form-label" for="name">Full name</label>
                            </div>
                            <!-- email input -->
                            <div class="form-outline mt-3">
                                <input type="text" id="email" name="email" class="input form-control form-control-lg" required=""/>
                                <label class="form-label" for="email">Email</label>
                            </div>
                            <!-- mobile input -->
                            <div class="form-outline mt-3">
                                <input type="text" id="mobile" name="mobile" class="input form-control form-control-lg" required=""/>
                                <label class="form-label" for="mobile">Phone</label>
                            </div>
                            <!-- user input -->
                            <div class="form-outline mt-2">
                                <input type="text" id="account" name="account" class="input form-control form-control-lg" required=""/>
                                <label class="form-label" for="account">User name</label>
                            </div>

                            <!-- Password input -->
                            <div class="form-outline  mt-3">
                                <input type="password" id="password" name="password" class="input form-control form-control-lg" required=""/>
                                <label class="form-label" for="password">Password</label>
                                <div class="show-password">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                </div>
                            </div>
                            <!--Password input -->
                            <div class="form-outline mt-3">
                                <input type="password" id="re-password" name="re-password" class="input form-control form-control-lg" required=""/>
                                <label class="form-label" for="re-password">Enter password again</label>
                                <div class="show-re-password">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                </div>
                            </div>
                            <!-- Submit button -->
                            <button type="submit" class="btn btn-primary btn-lg btn-block mt-2">Sign up</button>
                            <div class="mt-2">If you have an account already?   <a href="MainController?action=Login">Login</a></div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <script src="assets/js/jquery-3.7.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/jquery.validate.min.js" ></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="https://www.google.com/recaptcha/api.js"></script>
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
