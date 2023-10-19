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
            flex-direction: column;
            width: 49.5%;
        }
        .column-container input {
            width: 100%;
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
                    <div class="col-lg-12">
                        <div class="section-heading">
                            <h2>Thêm mới sản phẩm</h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h4 style="text-align: center; color: red;"><c:out value="${requestScope.MESSAGE}"/></h4>
                    </div>
                </div>
                <form action="MainController" method="GET" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-lg-6 form-custom">
                            <div class="form-add mb-3">
                                <label>Giống loài</label>
                                <ol class="custom-columns">
                                    <c:forEach var="breed" items="${requestScope.BREED}" varStatus="counter">
                                        <li><input type="radio" id="${breed.key}" name="txtBirdBreed" value="${breed.key}" onclick="hideInput()"/><label for="${breed.key}">${breed.value}</label></li>
                                        </c:forEach>
                                    <li><input type="radio" id="other" onclick="showInput()" name="txtBirdBreed"/><label for="other">Khác</label></li>
                                </ol>
                                <div id="otherInput" style="display: none;">    
                                    <input type="text" id="otherBreed" class="input form-control"  name="txtOtherBirdBreed" pattern="[A-Za-z]+" value="" placeholder="Nhập giống loài khác" />
                                </div>
                            </div>
                            <div class="form-add mb-3">
                                <label>Giới tính</label>
                                <ol class="custom-columns">
                                    <li><input type="radio" id="gender-1" name="txtBirdGender" value="Đực"/><label for="gender-1">Trống</label></li>
                                    <li><input type="radio" id="gender-0" name="txtBirdGender" value="Cái"/><label for="gender-0">Mái</label></li>
                                </ol>
                            </div>
                            <div class="form-add mb-3">
                                <label>Trạng thái</label>
                                <ol class="custom-columns">
                                    <c:forEach var="status" items="${requestScope.STATUS}" varStatus="counter">
                                        <li><input type="radio" id="status-${counter.count}" name="txtBirdStatus" value="${status}"/><label for="status-${counter.count}">${status}</label></li>
                                        </c:forEach>
                                </ol>
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
                            <div class="form-add mb-3">
                                <label>Ngày Sinh (20yy-mm-dd)</label>
                                <input type="text" name="txtBirdDate" class="input form-control" pattern="^20([0-2][0-9])-([0][1-9]|1[0-2])-([0-2][0-9]|3[01])$" value="${txtBirdDate}"/>
                            </div>
                            <div class="form-add mb-3">
                                <label>Thành tựu</label>
                                <textarea name="txtBirdAchievement" class="input form-control" value="${txtBirdAchievement}"></textarea>
                            </div>
                        </div>
                        <div class="col-lg-6 form-custom">
                            <div class="form-add mb-3">
                                <label>Mô tả</label>
                                <textarea name="txtBirdDescription" class="input form-control" value="${txtBirdDescription}"></textarea>
                            </div>
                            <div class="form-add mb-3">
                                <label>ID của chim bố</label>
                                <select id="birdMaleList" name="txtBirdDad" class="input form-control">
                                    <option value="">Option 1</option>
                                    <%--                            <c:set var="selectedRadioId" value="${requestScope.selectedRadioId}" />
                                    <c:forEach items="${requestScope.MALEBIRDS}" var="birdDad">
                                        <c:if test="${birdDad.breed_id == selectedRadioId}">
                                            <option value="${birdDad.bird_id}">${birdDad.bird_name}</option>
                                        </c:if>
                                    </c:forEach>
                                    --%>
                                </select>
                            </div>
                            <div class="form-add mb-3">
                                <label>ID của chim mẹ</label>
                                <select id="birdFemaleList" name="txtBirdMom" class="input form-control">
                                    <%--
                                    <c:forEach items="${FEMALEBIRDS}" var="birdMom">
                                        <option value="${birdMom.bird_id}">${birdMom.bird_name}</option>
                                    </c:forEach>
                                    --%>
                                </select>
                            </div>
                            <div class="form-add mb-3 column-container">
                                <label>Tuổi trưởng thành</label>
                                <input type="number" name="txtBirdGrownAge" class="input form-control" pattern="[0-9]+" title="Vui lòng chỉ nhập chữ số" value="${txtBirdGrownAge}"/>
                                <label>Lịch sử sinh sản</label>
                                <input type="number" name="txtBirdReproduction_history" class="input form-control" pattern="[0-9]+" title="Vui lòng chỉ nhập chữ số" value="${txtBirdReproduction_history}"/>
                            </div>
                            <div class="form-add mb-3 column-container">
                                <label>Giá</label>
                                <input type="number" name="txtBirdPrice" class="input form-control" pattern="[0-9]+" title="Vui lòng chỉ nhập chữ số" value="${txtBirdPrice}"/>
                                <label>Giảm giá</label>
                                <input type="number" name="txtBirdDiscount" class="input form-control" pattern="^(?:[0-9]|[1-9][0-9])$" title="Vui lòng chỉ nhập chữ số" value="${txtBirdDiscount}"/>
                            </div>
                            <div class="form-add mb-3">
                                <label>Hình ảnh sản phẩm 1 (Bắt buộc)</label>
                                <input type="text" name="txtImage_1" class="input form-control" placeholder="URL" pattern="^(http|https|ftp)://[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}(:[0-9]+)?(/.*)?$" value="${txtImage_1}" required="" />
                            </div>
                            <div class="form-add mb-3">
                                <label>Hình ảnh sản phẩm 2</label>
                                <input type="text" name="txtImage_2" class="input form-control" placeholder="URL" pattern="^(http|https|ftp)://[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}(:[0-9]+)?(/.*)?$" value="${txtImage_2}"/>
                            </div>
                            <div class="form-add mb-3">
                                <label>Hình ảnh sản phẩm 3</label>
                                <input type="text" name="txtImage_3" class="input form-control" placeholder="URL" pattern="^(http|https|ftp)://[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}(:[0-9]+)?(/.*)?$" value="${txtImage_3}"/>
                            </div>
                            <!--                            <div class="form-outline mt-2">
                                                            <label>Chọn hình ảnh của chim</label>
                                                            <input type="file" name="imageFiles" multiple required>
                                                        </div>-->
                            <input type="hidden" name="btAction" value="Add"/>
                            <button style="float: right;" type="submit" name="action" value="AddNewBird">Tạo mới</button>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <!-- ***** Products Area Ends ***** -->

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

                                        $('input[name=txtBirdBreed]').change(function () {
                                            let selectedRadioId = $(this).val();
                                            $.ajax({
                                                url: 'MainController?action=AddNewBird',
                                                type: 'POST',
                                                data: {maleBird: selectedRadioId},
                                                success: function (data) {
                                                    console.log(data);
                                                    $('#birdMaleList').html(data)
                                                }
                                            });
                                            $.ajax({
                                                url: 'MainController?action=AddNewBird',
                                                type: 'POST',
                                                data: {femaleBird: selectedRadioId},
                                                success: function (data) {
                                                    console.log(data);
                                                    $('#birdFemaleList').html(data)
                                                }
                                            });
                                        });

        </script>
    </body>
</html>
