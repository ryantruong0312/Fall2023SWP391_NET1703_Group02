<%-- 
    Document   : edit-bird
    Created on : Sep 13, 2023, 11:53:46 PM
    Author     : tlminh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        <style>
            .column-container {
                display: inline-block;
                flex-direction: row;
                width: 49.5%;
            }
            .column-container input {
                width: 100%;
            }
            .form-add img {
                float: right; 
                width: 100px; 
                height: 75px; 
                border: 1px solid;
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
        </style>
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
                            <h2>Cập nhật sản phẩm</h2>
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
                    <div class="col-lg-12">
                        <div class="section-heading">
                            <h2></h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <c:set var="birdDetails" value="${requestScope.BIRD}"/>
                <form action="UpdateBirdController" method="POST" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-lg-6 form-custom">
                            <div class="form-add mb-3">
                                <input type="hidden" name="bird_id" value="${birdDetails.bird_id}"/>
                                <div class="form-add mb-3">
                                    <label>Giống loài</label>
                                    <select name="txtBirdBreed" class="input form-control" style="color: #0c5460;" required>
                                        <c:forEach var="breed" items="${requestScope.BREED}" varStatus="counter">
                                        <option value="${breed.key}" ${birdDetails.breed_id == breed.key ? "selected":""}>${breed.value}</option>
                                        </c:forEach>
                                        <option value="other">Khác</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-add mb-3">
                                <label>Giới tính</label>
                                <select name="txtBirdGender" class="input form-control" style="color: #0c5460;" required>
                                    <option value="" disabled selected>Chọn giới tính</option>
                                    <option value="Đực" ${birdDetails.gender == "Đực" ? "selected":""} name="txtBirdGender" value="Đực">Trống</option>
                                    <option value="Cái" ${birdDetails.gender == "Cái" ? "selected":""} name="txtBirdGender" value="Cái">Mái</option>
                                </select>
                            </div>
                            <div class="form-add mb-3">
                                <label>Trạng thái</label>
                                <select name="txtBirdStatus" class="input form-control" style="color: #0c5460;" required>
                                    <c:forEach var="st" items="${requestScope.STATUS}" >
                                        <option ${birdDetails.status == st ? "selected":""} value="${st}">${st}</li>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-add mb-3">
                                <label>Ngày Sinh</label>
                                <input style="float: right; width: 50%;" type="date" name="txtBirdDate" value="${birdDetails.birthday}" required/>
                                <input type="hidden" name="oldBirdDate" value="${birdDetails.birthday}" />
                            </div>
                            <div class="form-add mb-3">
                                <label>Tên</label>
                                <input type="text" name="txtBirdName" class="input form-control" value="${birdDetails.bird_name}"/>                          
                            </div>
                            <div class="form-add mb-3">
                                <label>Màu sắc</label>
                                <input type="text" name="txtBirdColor" class="input form-control" value="${birdDetails.color}"/>      
                            </div>
                        </div>
                        <div class="col-lg-6 form-custom">
                            <div class="form-add mb-3">
                                <label>Thành tích thi đấu</label>
                                <textarea rows="5" name="txtBirdAchievement" class="input form-control" value="">${birdDetails.achievement}</textarea>
                            </div>
                            <div class="form-add mb-3">
                                <label>Mô tả chi tiết</label>
                                <textarea rows="5" name="txtBirdDescription" class="input form-control" value="">${birdDetails.description}</textarea>
                            </div>
                            <div class="form-add mb-3 column-container">
                                <label>Giá bán</label>
                                <div style="width: 100%; position: relative;">
                                    <input style="width: 80%;" type="number" min="0" name="txtBirdPrice" class="input form-control" pattern="[0-9]+" title="Vui lòng chỉ nhập chữ số" value="${birdDetails.price}" required />
                                    <span style="position: absolute; right: 37px; top: 50%; transform: translateY(-50%);">₫</span>
                                </div>
                                <div style="margin-top: 15px;">
                                    <label>Tuổi trưởng thành</label>
                                    <div style="width: 100%; position: relative;">
                                        <input style="width: 80%;" type="number" name="txtBirdGrownAge" class="input form-control" pattern="[0-9]+" title="Vui lòng chỉ nhập chữ số" value="${birdDetails.grown_age}" required/>
                                        <span style="position: absolute; right: 7px; top: 50%; transform: translateY(-50%);">tháng</span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-add mb-3 column-container">
                                <label>Giảm giá</label>
                                <div style="width: 100%; position: relative;">
                                    <input style="width: 80%;" type="number" min="0" name="txtBirdDiscount" class="input form-control" pattern="^(?:[0-9]|[1-9][0-9])$" title="Vui lòng chỉ nhập chữ số" value="${birdDetails.discount}" />
                                    <span style="position: absolute; right: 37px; top: 50%; transform: translateY(-50%);">%</span>
                                </div>
                                <div style="margin-top: 15px;">
                                    <label>Lịch sử sinh sản</label>
                                    <div style="width: 100%; position: relative;">
                                        <input style="width: 80%;" type="number" min="0" name="txtBirdReproduction_history" class="input form-control" pattern="[0-9]+" title="Vui lòng chỉ nhập chữ số" value="${birdDetails.reproduction_history}"/>
                                        <span style="position: absolute; right: 27px; top: 50%; transform: translateY(-50%);">lứa</span>
                                    </div>
                                </div>
                            </div>
                            <c:set var="image_urls" value="${requestScope.BIRDIMAGES}"/>
                            <div class="form-add mb-3">
                                <label>Hình ảnh sản phẩm 1</label>
                                <c:if test="${image_urls.size() >= 1}">
                                <img class="accessory-image" src="${image_urls.get(0).image_url}"/>
                                </c:if>
                                <img style="display: none;" id="image-preview-1" src=""/>
                                <input type="file" name="txtImage_1" accept="image/jpeg, image/png, image/gif" onchange="previewImage(1)"/>
                            </div>
                            <div class="form-add mb-3">
                                <label>Hình ảnh sản phẩm 2</label>
                                <c:if test="${image_urls.size() >= 2}">
                                <img class="accessory-image" src="${image_urls.get(1).image_url}"/>
                                </c:if>
                                <img style="display: none;" id="image-preview-2" src=""/>
                                <input type="file" name="txtImage_2" accept="image/jpeg, image/png, image/gif" onchange="previewImage(2)"/>
                            </div>
                            <div class="form-add mb-3">
                                <label>Hình ảnh sản phẩm 3</label>
                                <c:if test="${image_urls.size() >= 3}">
                                <img class="accessory-image" src="${image_urls.get(2).image_url}"/>
                                </c:if>
                                <img style="display: none;" id="image-preview-3" src=""/>
                                <input type="file" name="txtImage_3" accept="image/jpeg, image/png, image/gif" onchange="previewImage(3)"/>
                            </div>
                            <div class="col-lg-12" style="margin-top: 15px;">
                                <button style="float: right;" onclick="return checkUser(this)" type="submit" class="btn btn-danger button-submit">Hủy bỏ</button>
                                <button style="margin-right: 10px; float: right;" class="button-submit btn-primary" type="submit" name="btAction" value="Update"><span>Cập nhật</span></button>
                            </div>
                        </div>
                    </div>
                </form>
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
        <script>
            function previewImage(imageNumber) {
                var input = document.querySelector('input[name="txtImage_' + imageNumber + '"]');
                var imagePreview = document.getElementById('image-preview-' + imageNumber);

                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function(e) {
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
        </script>
    </body>
</html>
