<%-- 
    Document   : pair-birds
    Created on : Sep 13, 2023, 11:23:22 PM
    Author     : tlminh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V.E.T - Nhân giống</title>
        <link rel="icon" type="image/png" href="assets/images/logo-title-bar.png"/>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">
        <link rel="stylesheet" href="assets/css/owl-carousel.css">
        <link rel="stylesheet" href="assets/css/lightbox.css">
        <link rel="stylesheet" href="assets/css/bird-pair.css">
    </head>

    <body>
        <!-- Header Start -->
        <%@include file="../layout/header.jsp" %>
        <!-- Header End -->
        <!-- ***** Main Banner Area Start ***** -->
        <div class="page-heading" id="top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="inner-content">
                            <h2>Nhân giống sinh sản</h2>
                            <span>Ghép cặp và tạo ra những cá thể vẹt cảnh đôc đáo, mang lại giá trị cao</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ***** Main Banner Area End ***** -->
        <main class="type-pair py-5">
            <div class="container">
                <div class="row d-flex justify-content-around align-content-center h-100">
                    <div class="box-chose type-customer">
                        <div class="d-flex">
                            <div class="box box-top--left"></div>
                            <div class="box-middle"></div>
                            <div class="box box-top--right"></div>
                        </div>
                        <div class="d-flex">
                            <div class="box"></div>
                            <div class="box-middle box-content">Chim của khách hàng</div>
                            <div class="box"></div>
                        </div>
                        <div class="d-flex">
                            <div class="box box-bottom--left"></div>
                            <div class="box-middle"></div>
                            <div class="box box-bottom--right"></div>
                        </div>
                    </div>
                    <div class="line-pagination"></div>
                    <div class="box-chose type-shop">
                        <div class="d-flex">
                            <div class="box box-top--left"></div>
                            <div class="box-middle"></div>
                            <div class="box box-top--right"></div>
                        </div>
                        <div class="d-flex">
                            <div class="box"></div>
                            <div class="box-middle box-content">Chim trong cửa hàng</div>
                            <div class="box"></div>
                        </div>
                        <div class="d-flex">
                            <div class="box box-bottom--left"></div>
                            <div class="box-middle"></div>
                            <div class="box box-bottom--right"></div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <main class="my-5 bird-shop">
            <div class="back-choose py-4">
                <h5>Chọn phương pháp ghép cặp</h5>
            </div>
            <div class="comparison-container mx-3">
                <!-- First Column -->
                <div class="comparison-column">
                    <div class="column-content">
                        <h2>Chọn một chú vẹt trống</h2>

                        <!-- EL to populate the category combo box -->
                        <select class="combo-box" id="breedSelect1">
                            <option value = "">Chọn giống vẹt</option>
                            <c:forEach items="${requestScope.BIRD_BREEDS}" var="breed">
                                <option value="${breed.breed_id}">${breed.breed_name}</option>
                            </c:forEach>
                        </select>

                        <!-- EL to populate the bird name combo box -->
                        <select class="combo-box" id="birdSelect1">
                        </select>

                        <!-- Additional rows to display bird information -->
                        <div id="birdInformation1">         
                            <div class="bird-info-row">
                                <!-- Placeholder for bird image -->
                                <img id="birdImage1" src="assets/images/bird-compare-1.jpg" alt="Bird Image">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Second Column -->
                <div class="comparison-column">
                    <div class="column-content">
                        <h2>Chọn một chú vẹt mái</h2>        
                        <!-- EL to populate the category combo box -->
                        <select class="combo-box" id="breedSelect2">
                            <option value = "">Chọn giống vẹt</option>
                            <c:forEach items="${requestScope.BIRD_BREEDS}" var="breed">
                                <option value="${breed.breed_id}">${breed.breed_name}</option>
                            </c:forEach>
                        </select>

                        <!-- EL to populate the bird name combo box -->
                        <select class="combo-box" id="birdSelect2"  >
                        </select>

                        <!-- Additional rows to display bird information -->
                        <div id="birdInformation2"> 
                            <div class="bird-info-row">
                                <!-- Placeholder for bird image -->
                                <img id="birdImage1" src="assets/images/bird-compare-1.jpg" alt="Bird Image">
                            </div>
                        </div>
                    </div>
                </div>  
            </div>
            <div class="box-button-pair">
                <button id="pair-shop" class="button-pair">Tiến hành ghép</button>  
            </div>
        </main>
        <main class="my-5 bird-customer">
            <c:set var="user" value="${sessionScope.LOGIN_USER}"/>
            <input type="hidden" name="username" value="${not empty user ? user.username:''}">
            <div class="back-choose py-4">
                <h5>Chọn phương pháp ghép cặp</h5>
            </div>
            <div class="comparison-container mx-3">
                <!-- First Column -->
                <div class="comparison-column customer-select--bird">
                    <form action="MainController">
                        <input type="hidden" name="action" value="NavToCreateBirdCustomer" />
                        <button type="submit" class="button-create">Thêm vẹt mới</button>
                    </form>
                    <div class="column-content">
                        <h2>Chọn một chú vẹt của khách</h2>

                        <!-- EL to populate the category combo box -->
                        <select class="combo-box" id="breedSelect3">
                            <option value = "">Chọn giống vẹt</option>
                            <c:forEach items="${requestScope.BIRD_BREEDS}" var="breed">
                                <option value="${breed.breed_id}">${breed.breed_name}</option>
                            </c:forEach>
                        </select>

                        <!-- EL to populate the bird name combo box -->
                        <select class="combo-box" id="birdSelect3"  >
                        </select>
                        <!-- Additional rows to display bird information -->
                        <div id="birdInformation3">         
                            <div class="bird-info-row">
                                <!-- Placeholder for bird image -->
                                <img id="birdImage1" src="assets/images/bird-compare-1.jpg" alt="Bird Image">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Second Column -->
                <div class="comparison-column second-box">
                    <div class="column-content">
                        <h2>Chọn một chú vẹt của cửa hàng</h2>

                        <!-- EL to populate the category combo box -->
                        <select class="combo-box" id="breedSelect4" disabled>
                            <option value = "">Chọn giống vẹt</option>
                            <c:forEach items="${requestScope.BIRD_BREEDS}" var="breed">
                                <option value="${breed.breed_id}">${breed.breed_name}</option>
                            </c:forEach>
                        </select>

                        <!-- EL to populate the bird name combo box -->
                        <select class="combo-box" id="birdSelect4">
                        </select>  

                        <!-- Additional rows to display bird information -->
                        <div id="birdInformation4"> 
                            <div class="bird-info-row">
                                <!-- Placeholder for bird image -->
                                <img id="birdImage1" src="assets/images/bird-compare-1.jpg" alt="Bird Image">
                            </div>
                        </div>
                    </div>
                </div>  
            </div>
            <div class="box-button-pair">
                <button id="pair-customer" class="button-pair">Tiến hành ghép</button>  
            </div>
        </main>
        <section id="confirm-remove" class="container-fluid">
            <div class="vh-100 row">
                <div class="h-100 m-auto d-flex align-items-center">
                    <div class="box-remove bg-white p-4">
                        <h4>Xác nhận</h4>
                        <p class="mb-4 mt-4">
                            Vui lòng xác nhận vẹt đã đủ tuổi sinh sản (12 tháng tuổi)?
                        </p>
                        <div class="float-right">
                            <button id="btn-confirrm" data-value="" class="btn btn-group-sm btn-primary">Có</button>
                            <button  id="btn-cancel" class="btn btn-group-sm btn-secondary">Không</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Start Footer -->
        <%@include file="../layout/footer.jsp" %>
        <!-- End Footer -->
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
                $('#btn-confirrm').click(function () {
                    $('#confirm-remove').css('display', 'none');
                    let birdId = $(this).attr('data-value');
                    $.ajax({
                        url: 'MainController?action=NavToPairBirds',
                        type: 'POST',
                        data: {birdCustomerId: birdId},
                        success: function (data) {
                            $('#birdInformation3').html(data);
                            let gender = $('input[name=gender]').val();
                            if (gender) {
                                let breedId = $('main #breedSelect4').val();
                                $.ajax({
                                    url: 'MainController?action=NavToPairBirds',
                                    type: 'POST',
                                    data: {breedId: breedId, gender: gender},
                                    success: function (data) {
                                        $('#birdSelect4').html(data);
                                    }
                                });
                            }
                        }
                    });

                });
                $('#btn-cancel').click(function () {
                    $('#confirm-remove').css('display', 'none');
                    $('#birdSelect3').val("");
                });
                $('#pair-shop').click(function () {
                    let selectBirdMale = $('#birdSelect1').val();
                    let selectBirdFemale = $('#birdSelect2').val();
                    if (selectBirdMale) {
                        if (selectBirdFemale) {
                            $.ajax({
                                url: 'AddBirdPairToCartController',
                                type: 'POST',
                                data: {bird_male_id: selectBirdMale, bird_female_id: selectBirdFemale},
                                success: function (data) {
                                    console.log(data);
                                    if (data == 0) {
                                        toast({
                                            title: 'Lỗi',
                                            message: 'Sản phẩm này đã có trong giỏ hàng',
                                            type: 'error',
                                            duration: 3000
                                        });
                                    } else {
                                        toast({
                                            title: 'Thành công',
                                            message: 'Thêm sản phẩm vào giỏ hàng thành công',
                                            type: 'success',
                                            duration: 3000
                                        });
                                        $.ajax({
                                            url: "AddBirdToCartController",
                                            type: 'POST',
                                            success: function (data) {
                                                $('.cart-amount').html(data);
                                            }
                                        });
                                    }
                                }
                            });
                        } else {
                            toast({title: 'Lỗi', message: 'Vui lòng chọn vẹt mái', type: 'error', duration: 3000});
                        }
                    } else {
                        toast({title: 'Lỗi', message: 'Vui lòng chọn vẹt trống', type: 'error', duration: 3000});
                    }
                });
                $('#pair-customer').click(function () {
                    let selectBirdCustomer = $('#birdSelect3').val();
                    let selectBirdShop = $('#birdSelect4').val();
                    if (selectBirdCustomer) {
                        if (selectBirdShop) {
                            $.ajax({
                                url: 'AddBirdPairToCartController',
                                type: 'POST',
                                data: {bird_shop_id: selectBirdShop, bird_customer_id: selectBirdCustomer},
                                success: function (data) {
                                    console.log(data);
                                    if (data == 0) {
                                        toast({
                                            title: 'Lỗi',
                                            message: 'Sản phẩm này đã có trong giỏ hàng',
                                            type: 'error',
                                            duration: 3000
                                        });
                                    } else {
                                        toast({
                                            title: 'Thành công',
                                            message: 'Thêm sản phẩm vào giỏ hàng thành công',
                                            type: 'success',
                                            duration: 3000
                                        });
                                        $.ajax({
                                            url: "AddBirdToCartController",
                                            type: 'POST',
                                            success: function (data) {
                                                $('.cart-amount').html(data);
                                            }
                                        });
                                    }
                                }
                            });
                        } else {
                            toast({title: 'Lỗi', message: 'Vui lòng chọn vẹt của bạn', type: 'error', duration: 3000});
                        }
                    } else {
                        toast({title: 'Lỗi', message: 'Vui lòng chọn vẹt của cửa hàng', type: 'error', duration: 3000});
                    }
                });
            });
        </script>
    </body>
</html>