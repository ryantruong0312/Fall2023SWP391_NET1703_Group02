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
                display: flex;
            }
            .price,
            .discount {
                flex: 0 0 49%;
                margin-right: 5px;
            }
            .display-price {
                display: flex;
                align-items: center;
                width: 100%;
            }
            .display-discount {
                float: right !important;
            }
            .column-container input {
                flex: 1;
                box-sizing: border-box;
                width: calc(100% - 20px);
            }
            .column-container span {
                margin-left: 5px;
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
                            <h2>Cập nhật vẹt cảnh</h2>                           
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
                        <div class="col-lg-6 form-custom" style="margin-top: 8px;">
                            <input type="hidden" name="bird_id" value="${birdDetails.bird_id}"/>
                            <div class="form-add mb-3">
                                <label>Tên vẹt cảnh</label>
                                <input type="text" name="bird_name" class="input form-control" value="${name}" required/>      
                            </div>
                            <div class="form-add mb-3 column-container">
                                <div class="price">
                                    <label>Giá bán</label>
                                    <div class="display-price">
                                        <input type="number" min="0" name="txtBirdPrice" class="input form-control" pattern="[0-9]+" title="Vui lòng chỉ nhập chữ số" value="${birdDetails.price}" required />
                                        <span>₫</span>
                                    </div>
                                </div>
                                <div class="discount">
                                    <label>Giảm giá</label>
                                    <div class="display-price">
                                        <input type="number" min="0" max="100" name="txtBirdDiscount" class="input form-control" pattern="[0-9]+" title="Vui lòng chỉ nhập chữ số" value="${birdDetails.discount}" required/>
                                        <span>%</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-add mb-3">
                                <label>Màu sắc</label>
                                <input type="text" name="txtBirdColor" class="input form-control" value="${birdDetails.color}" required/>      
                            </div>
                            
                             <div class="form-add mb-3">
                                <label>Thành tích thi đấu</label>
                                <textarea rows="4" name="txtBirdAchievement" class="input form-control" value="">${birdDetails.achievement}</textarea>
                            </div>
                            
                            <div class="form-add mb-3">
                                <label>Trạng thái</label>
                                <select name="txtStatus" class="input form-control" style="color: #0c5460;">
                                    <option value="${birdDetails.status}">${birdDetails.status}</option>
                                    <c:if test="${birdDetails.status ne 'Còn hàng'}">
                                        <option value="Còn hàng">Còn hàng</option>
                                    </c:if>
                                    <c:if test="${birdDetails.status ne 'Hết hàng'}">
                                        <option value="Hết hàng">Hết hàng</option>
                                    </c:if>
                                    <c:if test="${birdDetails.status ne 'Đang ghép cặp'}">
                                        <option value="Đang ghép cặp">Đang ghép cặp</option>
                                    </c:if>
                                    <c:if test="${birdDetails.status ne 'Đang sinh sản'}">
                                        <option value="Đang sinh sản">Đang sinh sản</option>
                                    </c:if>
                                </select>
                            </div>

                        </div>
                        <div class="col-lg-6 form-custom">

                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-outline mt-2">
                                        <label>Mã vẹt mẹ</label>
                                        <select name="txtBirdMom" class="input form-control" style="color: #0c5460;">
                                            <c:if test="${BIRD.mom_id == null}">
                                                <option value="${BIRD.mom_id}">Chưa có</option>
                                            </c:if>
                                            <c:if test="${BIRD.mom_id != null}">
                                                <option value="${BIRD.mom_id}">${BIRD.mom_id}</option>
                                            </c:if>
                                            <c:forEach items="${listMom}" var="ac">
                                                <c:if test="${ac.bird_id ne BIRD.mom_id && ac.reproduction_history > 0 && ac.bird_id ne BIRD.bird_id && ac.breed_id eq BIRD.breed_id}">
                                                    <option value="${ac.bird_id}">${ac.bird_id}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-lg-6">
                                    <div class="form-outline mt-2">
                                        <label>Mã vẹt cha</label>
                                        <select name="txtBirdDad" class="input form-control" style="color: #0c5460;">
                                            <c:if test="${BIRD.dad_id == null}">
                                                <option value="${BIRD.dad_id}">Chưa có</option>
                                            </c:if>
                                            <c:if test="${BIRD.dad_id != null}">
                                                <option value="${BIRD.dad_id}">${BIRD.dad_id}</option>
                                            </c:if>
                                            <c:forEach items="${listDad}" var="ac">
                                                <c:if test="${ac.bird_id ne BIRD.dad_id && ac.reproduction_history > 0 && ac.bird_id ne BIRD.bird_id && ac.breed_id eq BIRD.breed_id}">
                                                    <option value="${ac.bird_id}">${ac.bird_id}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                                                     
                            <div class="form-add mb-3">
                                <label>Mô tả chi tiết</label>
                                <textarea rows="7" name="txtBirdDescription" class="input form-control" value="" required="">${birdDetails.description}</textarea>
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
                        </div>
                        <div class="col-lg-12" style="margin-top: 15px;">
                            <button style="float: right;" onclick="return checkUser(this)" type="submit" class="btn btn-danger button-submit">Hủy bỏ</button>
                            <button style="margin-right: 10px; float: right;" class="button-submit btn-primary" type="submit" name="btAction" value="Update"><span>Cập nhật</span></button>
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
                            <a type="button" id="btn-confirrm" href="MainController?action=NavToBirdDetails&bird_id=${birdDetails.bird_id}" class="btn btn-group-sm btn-primary">Xác nhận</a>
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
                                var dateInput = document.getElementById("birthday");
                                var birdDate = document.getElementById("birdDate");
                                var today = new Date();
                                dateInput.addEventListener("change", function () {
                                    var selectedDate = new Date(dateInput.value);
                                    if (selectedDate > today) {
                                        alert("Ngày được chọn không thể là một ngày trong tương lai. Vui lòng chọn lại.");
                                        dateInput.value = birdDate.value;
                                    }
                                });
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
