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
        .form-add img {
                float: right;
                width: 100px;
                height: 75px;
                border: 1px solid;
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
                            <h2>Thêm mới vẹt cảnh</h2>
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
                    <div style="padding: 20px">
                            
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
                                <select name="txtBirdBreed" class="input form-control" style="color: #0c5460;" id="mySelect" onchange="toggleInput()" required>
                                    <option value="" disabled selected>Chọn giống loài</option>
                                    <c:forEach var="breed" items="${requestScope.BREED}">
                                    <option ${requestScope.txtBirdBreed == breed.key ? "selected":""} value="${breed.key}">${breed.value}</option>
                                    </c:forEach>
                                    <option value="other">Khác</option>
                                </select>
                            </div>
                            <div class="form-add mb-3">
                                <label>Ngày Sinh</label>
                                <input id="birthday" style="float: right; width: 50%;" type="date" name="txtBirdDate" value="${requestScope.txtBirdDate}" required/>
                            </div>
                            <div class="form-add mb-3">
                                <label>Giới tính</label>
                                <select name="txtBirdGender" class="input form-control" style="color: #0c5460;" required>
                                    <option value="" disabled selected>Chọn giới tính</option>
                                    <option ${requestScope.txtBirdGender == 'Đực' ? "selected":""} value="Đực" id="gender-1">Trống</option>
                                    <option ${requestScope.txtBirdGender == 'Cái' ? "selected":""} value="Cái" id="gender-0">Mái</option>
                                </select>
                            </div>
                            <div class="form-add mb-3">
                                <label>Mã vẹt cảnh (VD: ID123)</label>
                                <input type="text" name="txtBirdId" class="input form-control" pattern="[A-Z]{2}\d{3}" value="${requestScope.txtBirdId}" required/>
                            </div>
                            <div class="form-add mb-3">
                                <label>Tên vẹt cảnh</label>
                                <input type="text" name="txtBirdName" class="input form-control" title="Vui lòng chỉ nhập chữ cái" value="${requestScope.txtBirdName}" required/>                          
                            </div>
                            <div class="form-add mb-3">
                                <label>Màu sắc</label>
                                <input type="text" name="txtBirdColor" class="input form-control" value="${requestScope.txtBirdColor}" required/>      
                            </div>
                        </div>
                        <div class="col-lg-6 form-custom">
                            <div class="form-add mb-3">
                                <label>Thành tích thi đấu</label>
                                <textarea rows="5" name="txtBirdAchievement" class="input form-control" value="" required>${requestScope.txtBirdAchievement}</textarea>
                            </div>
                            <div class="form-add mb-3">
                                <label>Mô tả chi tiết</label>
                                <textarea rows="5" name="txtBirdDescription" class="input form-control" value="" required>${requestScope.txtBirdDescription}</textarea>
                            </div>
                            <div class="form-add mb-3 column-container">
                                <label>Giá bán</label>
                                <div style="width: 100%; position: relative;">
                                    <input style="width: 80%;" type="number" min="0" name="txtBirdPrice" class="input form-control" pattern="^[0-9]+$" onkeydown="if(event.key === '-') event.preventDefault();" title="Vui lòng chỉ nhập chữ số lớn hơn 0" value="${requestScope.txtBirdPrice}" required/>
                                    <span style="position: absolute; right: 37px; top: 50%; transform: translateY(-50%);">₫</span>
                                </div>
                                <div style="margin-top: 15px;">
                                    <label>Tuổi trưởng thành</label>
                                    <div style="width: 100%; position: relative;">
                                        <input style="width: 80%;" type="number" min="1" name="txtBirdGrownAge" class="input form-control" pattern="^[0-9]+$" onkeydown="if(event.key === '-') event.preventDefault();" title="Vui lòng chỉ nhập chữ số lớn hơn 0" value="${requestScope.txtBirdGrownAge}" required/>
                                        <span style="position: absolute; right: 8px; top: 50%; transform: translateY(-50%);">tháng</span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-add mb-3 column-container">
                                <label>Giảm giá</label>
                                <div style="width: 100%; position: relative;">
                                    <input style="width: 80%;" type="number" min="0" max="99" name="txtBirdDiscount" class="input form-control" pattern="^(?:[0-9]|[1-9][0-9])$" onkeydown="if(event.key === '-') event.preventDefault();" title="Vui lòng chỉ nhập chữ số lớn hơn 0" value="${requestScope.txtBirdDiscount}" required/>
                                    <span style="position: absolute; right: 36px; top: 50%; transform: translateY(-50%);">%</span>
                                </div>
                                <div style="margin-top: 15px;">
                                    <label>Lịch sử sinh sản</label>
                                    <div style="width: 100%; position: relative;">
                                        <input style="width: 80%;" type="number" min="0" name="txtBirdReproduction_history" class="input form-control" pattern="^[0-9]+$" onkeydown="if(event.key === '-') event.preventDefault();" title="Vui lòng chỉ nhập chữ số lớn hơn 0" value="${txtBirdReproduction_history}" required/>
                                        <span style="position: absolute; right: 27px; top: 50%; transform: translateY(-50%);">lứa</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-add mb-3">
                                <label>Hình ảnh sản phẩm 1(Bắt buộc)</label>
                                <img style="display: none;" id="image-preview-1" src=""/>
                                <input type="file" name="txtImage_1" accept="image/jpeg, image/png, image/gif" onchange="previewImage(1)" required/>
                            </div>
                            <div class="form-add mb-3">
                                <label>Hình ảnh sản phẩm 2</label>
                                <img style="display: none;" id="image-preview-2" src=""/>
                                <input type="file" name="txtImage_2" accept="image/jpeg, image/png, image/gif" onchange="previewImage(2)" required/>
                            </div>
                            <div class="form-add mb-3">
                                <label>Hình ảnh sản phẩm 3</label>
                                <img style="display: none;" id="image-preview-3" src=""/>
                                <input type="file" name="txtImage_3" accept="image/jpeg, image/png, image/gif" onchange="previewImage(3)" required/>
                            </div>
                        </div>
                        <div class="col-lg-12" style="margin-top: 15px;">
                            <button style="float: right; margin-left: 10px;" onclick="return checkUser(this)" type="submit" class="btn btn-danger button-submit" formnovalidate>Hủy bỏ</button>
                            <button class="btn-primary button-submit" style="margin-left: 10px;" type="submit" name="btAction" value="Add"><span style="color:white;">Lưu và tiếp tục</span></button>
                            <button class="btn-success button-submit" type="submit" name="btAction" value="Add&Return">
                                <span style="color:white;">Lưu và đóng</span>    
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <section id="confirm-remove" class="container-fluid">
            <div class="vh-100 row">
                <div class="h-100 m-auto d-flex align-items-center">
                    <div class="box-remove bg-white p-4">
                        <h4>Xác nhận</h4>
                        <p class="mb-4 mt-4">
                            Bạn có muốn thực hiện thao tác này không ?
                        </p>
                        <div class="float-right">
                            <a type="button" id="btn-confirrm" href="MainController?action=NavToBird" class="btn btn-group-sm btn-primary">Xác nhận</a>
                            <button  onclick="cancelRemove()" class="btn btn-group-sm btn-secondary">Hủy</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>                                
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
    </body>
    <script>
            function previewImage(imageNumber) {
                var input = document.querySelector('input[name="txtImage_' + imageNumber + '"]');
                var imagePreview = document.getElementById('image-preview-' + imageNumber);

                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        imagePreview.src = e.target.result;
                        imagePreview.style.display = 'block';
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }
            function checkUser(event) {
                $('#confirm-remove').css('display', 'block');
                let idForm = event.form.id;
                $('#btn-confirrm').attr('data-value', idForm);
                return false;
            }
            function cancelRemove() {
                $('#confirm-remove').css('display', 'none');
            }
            var dateInput = document.getElementById("birthday");
            var today = new Date();
            dateInput.addEventListener("change", function () {
                var selectedDate = new Date(dateInput.value);
                if (selectedDate > today) {
                  alert("Ngày được chọn không thể là một ngày trong tương lai. Vui lòng chọn lại.");
                  dateInput.value = "";
                }
            });
    </script>
</html>
