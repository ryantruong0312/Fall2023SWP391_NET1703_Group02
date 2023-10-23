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
        .form-add{
            position: relative
        }
        .input{
            font-size: 15px;
            height: 50px;
            background-color: transparent;
        }
        .form-add .input:focus
        {
            color: #3b71d1;
            border: 2px solid #3b71ca !important;
            box-shadow: none;
            background-color: white;
        }
        label.error  {
            color: red;
            font-size: 0.8rem;
            margin-bottom: -10px;
        }
        .btn-custom {
            line-height: 30px;
        }
        .btn-custom img{
            height: 20px;
            width: 20px;
        }
        @media (max-width: 992px){
            .home-custom{
                max-width: 730px;
            }
        }
        .col-lg-12 .product-part {
            margin: 0 0 10px 10px;
        }
        .col-lg-12 input {
            margin-bottom: 10px;
            width: 50%;
        }
        .col-lg-12 span {
            margin-top: 100px;
            color: black;
        }
        li input[type="radio"] + label {
            margin-left: 5px;
        }
        .custom-columns {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .custom-columns li {
            flex: 0 0 calc(50% - 20px);
        }

        .column-container {
            display: inline-block;
            flex-direction: row;
            width: 49.5%;
        }
        .column-container input {
            width: 100%;
        }
        .col-lg-12 #back {
            border: 1px solid #000;
            border-radius: 5px;
            height: 30px;
            padding: 5px;
            background-color: #E0E0E0;
        }
    </style>

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
                            <h2>Vẹt cảnh</h2>
                            <span>Những chú vẹt thông minh và đáng yêu nhất đã có mặt tại V.E.T</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ***** Main Banner Area End ***** -->

        <!-- ***** Products Area Starts ***** -->
        <section class="section" id="products">
            <div class="container">
                <div class="row">
                    <div style="padding: 50px 0;" class="col-lg-12">
                            <a style="float: left; margin-left: 15px;" id="back" href="MainController?action=NavToBird">
                                <i style="color: white; font-size: 1rem; width: 30px;" class="fa fa-arrow-left"></i>
                                <span>Quay lại</span>
                            </a>
                            <h2 style="text-align: center;">Thêm mới sản phẩm</h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <c:if test="${MESSAGE != null}">
                    <script>
                        alert("${MESSAGE}");
                    </script>
                </c:if>
                <form action="AddNewBirdController" method="POST" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-lg-6 form-custom">
                            <div class="form-add mb-3">
                                <label>Giống loài</label>
                                <ol class="custom-columns" required>
                                    <c:forEach var="breed" items="${requestScope.BREED}" varStatus="counter">
                                        <li><input type="radio" id="${breed.key}" name="txtBirdBreed" value="${breed.key}" onclick="hideInput()"/><label for="${breed.key}">${breed.value}</label></li>
                                        </c:forEach>
                                    <li><input type="radio" id="other" onclick="showInput()" name="txtBirdBreed"/><label for="other">Khác</label></li>
                                </ol>
                                <div id="otherInput" style="display: none;">    
                                    <input type="text" class="input form-control"  name="txtOtherBreed_name" pattern="[A-Za-z]+" value="" placeholder="Nhập giống loài khác" />
                                </div>
                            </div>
                            <div class="form-add mb-3">
                                <label>Ngày Sinh</label>
                                <input style="float: right; width: 50%;" type="date" name="txtBirdDate" value="${txtBirdDate}" required/>
                            </div>
                            <div class="form-add mb-3">
                                <label>Giới tính</label>
                                <select name="txtBirdGender" class="input form-control" style="color: #0c5460;" required>
                                    <option value="" disabled selected>Chọn giới tính</option>
                                    <option value="Đực" id="gender-1">Trống</option>
                                    <option value="Cái" id="gender-0">Mái</option>
                                </select>
                            </div>
                            <div class="form-add mb-3">
                                <label>ID của chim (Bao gồm 2 chữ hoa và 3 chữ số)</label>
                                <input type="text" name="txtBirdId" class="input form-control" pattern="[A-Z]{2}\d{3}" value="${txtBirdId}"/>
                            </div>
                            <div class="form-add mb-3">
                                <label>Tên</label>
                                <input type="text" name="txtBirdName" class="input form-control" title="Vui lòng chỉ nhập chữ cái" value="${txtBirdName}"/>                          
                            </div>
                            <div class="form-add mb-3">
                                <label>Màu Sắc</label>
                                <input type="text" name="txtBirdColor" class="input form-control" value="${txtBirdColor}"/>      
                            </div>
                        </div>
                        <div class="col-lg-6 form-custom">
                            <div class="form-add mb-3">
                                <label>Thành tựu</label>
                                <textarea rows="5" name="txtBirdAchievement" class="input form-control" value="${txtBirdAchievement}"></textarea>
                            </div>
                            <div class="form-add mb-3">
                                <label>Mô tả</label>
                                <textarea rows="5" name="txtBirdDescription" class="input form-control" value="${txtBirdDescription}"></textarea>
                            </div>
                            <div class="form-add mb-3 column-container">
                                <label>Giá bán</label>
                                <div style="width: 100%; position: relative;">
                                    <input style="width: 80%;" type="number" min="0" name="txtBirdPrice" class="input form-control" pattern="[0-9]+" title="Vui lòng chỉ nhập chữ số" value="${txtBirdPrice}" required>
                                    <span style="position: absolute; right: 37px; top: 50%; transform: translateY(-50%);">₫</span>
                                </div>

                                <div style="margin-top: 15px;">
                                    <label>Tuổi trưởng thành</label>
                                    <div style="width: 100%; position: relative;">
                                        <input style="width: 80%;" type="number" name="txtBirdGrownAge" class="input form-control" pattern="[0-9]+" title="Vui lòng chỉ nhập chữ số" value="${txtBirdGrownAge}" required/>
                                        <span style="position: absolute; right: 8px; top: 50%; transform: translateY(-50%);">tháng</span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-add mb-3 column-container">
                                <label>Giảm giá</label>
                                <div style="width: 100%; position: relative;">
                                    <input style="width: 80%;" type="number" min="0" name="txtBirdDiscount" class="input form-control" pattern="^(?:[0-9]|[1-9][0-9])$" title="Vui lòng chỉ nhập chữ số" value="${txtBirdDiscount}" />
                                    <span style="position: absolute; right: 36px; top: 50%; transform: translateY(-50%);">%</span>
                                </div>

                                <div style="margin-top: 15px;">
                                    <label>Lịch sử sinh sản</label>
                                    <div style="width: 100%; position: relative;">
                                        <input style="width: 80%;" type="number" min="0" name="txtBirdReproduction_history" class="input form-control" pattern="[0-9]+" title="Vui lòng chỉ nhập chữ số" value="${txtBirdReproduction_history}"/>
                                        <span style="position: absolute; right: 27px; top: 50%; transform: translateY(-50%);">lứa</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-outline mt-2">
                                <label>Chọn hình ảnh của chim</label>
                                <input type="file" name="filePicture" multiple accept="image/jpeg, image/png, image/gif" required/>
                            </div>
                            <button style="float: right; margin-top: 20px;" type="submit" name="btAction" value="Add"><span>Lưu và tiếp tục</span></button>
                            <button style="float: right; margin: 20px 20px 0 0;" type="submit" name="btAction" value="Add">
                                <input type="hidden" name="noMore" value=""/>
                                <span>Lưu và đóng</span>    
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </section><!--
        <!-- ***** Products Area Ends ***** -->
        <%@include file="../layout/footer.jsp" %>
        <%@include file="../layout/message.jsp" %>
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
        <script src="assets/js/slick.js"></script> 
        <script src="assets/js/lightbox.js"></script> 
        <script src="assets/js/isotope.js"></script> 
        <!-- Global Init -->
        <script src="assets/js/custom.js"></script>

        <script>
                                        function showInput() {
                                            var otherInput = document.getElementById('otherInput');
                                            otherInput.style.display = 'block';
                                        }

                                        function hideInput() {
                                            var otherInput = document.getElementById('otherInput');
                                            otherInput.style.display = 'none';
                                        }
        </script>
    </body>
</html>
