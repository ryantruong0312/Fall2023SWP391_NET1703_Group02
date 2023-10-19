<%-- 
    Document   : edit-accessory
    Created on : Sep 13, 2023, 11:53:57 PM
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

        <title>V.E.T - Cập nhật thông tin phụ kiện</title>

        <!-- Additional CSS Files -->
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">
        <link rel="stylesheet" href="assets/css/owl-carousel.css">
        <link rel="stylesheet" href="assets/css/lightbox.css">

        <style>
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
            .form-left{
                padding-top: 8px;
            }
            .button-submit{
                margin-top: 15px;
                width: 175px;
                font-size: 25px;
                height: 50px;
                border-radius: 10px;
                background-color: #0c5460;
                color: white;
            }
            #id{
                height: 100px;
            }
            .form-outline input{
                width: 554px;
            }
        </style>
    </head>

    <body>
        <!-- Header Start -->
        <%@include file="../layout/header.jsp" %>
        <!-- Header End -->
        <section class="section" id="products">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-heading">
                            <h2>Chỉnh sửa sản phẩm</h2>
                        </div>
                    </div>
                    <form action="UpdateAccessoryController" method="GET">
                        <div class="col-lg-12 form-left">
                            <div class="form-outline">
                                <label>ID của phụ kiện (Bao gồm 2 chữ hoa và 3 chữ số)</label>
                                <input style="color: blue;" type="text" name="txtAccessoryID" class="input form-control" pattern="[A-Z]{2}\d{3}" value="${a.accessory_id}" readonly=""/>
                            </div>

                            <div class="form-outline mt-2">
                                <label>Tên</label>
                                <input style="color: blue;" type="text" name="txtAccessoryName" class="input form-control" value="${a.accessory_name}" required/>
                            </div>

                            <div class="form-outline mt-2">
                                <label>Loại phụ kiện</label>
                                <select name="txtCategoryID">
                                    <c:forEach items="${ac}" var="ac">
                                        <option style="color: blue;" value="${ac.category_id}">${ac.category_name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-outline mt-2">
                                <label>Giá</label>
                                <input style="color: blue;" type="number" name="txtPrice" min="0" class="input form-control" value="${a.unit_price}" required/>
                            </div>

                            <div class="form-outline mt-2">
                                <label>Số lượng</label>
                                <input style="color: blue;" type="number" name="txtStockQuantity" min="0" class="input form-control" value="${a.stock_quantity}" required/>
                            </div>

                            <div class="form-outline mt-2">
                                <label for="txtDescribe">Mô tả</label><br>
                                <textarea class="form-control" id="txtDescribe" name="txtDescribe" rows="5" cols="50" style="width: 554px; height: 125px; color: blue;">${a.description}</textarea>
                            </div>

                            <div class="form-outline mt-2">
                                <label>Giảm giá (%)</label>
                                <input style="color: blue;" type="number" name="txtDiscount" min="0" class="input form-control" value="${a.discount}"/>                            
                            </div>

                            <div class="form-outline mt-2">
                                <label>Hình ảnh sản phẩm (Bắt buộc)</label>
                                <input style="color: blue;" type="text" name="txtImage"  class="input form-control" value="${url_thumnail}" pattern="^(http|https|ftp)://[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}(:[0-9]+)?(/.*)?$" required/>
                            </div>

                            <c:if test="${requestScope.list != null}">
                                <c:forEach var="image" items="${list}" varStatus="loop">
                                    <div class="form-outline mt-2">
                                        <label>Hình ảnh sản phẩm</label>
                                        <input style="color: blue;" type="text" name="txtImage_${loop.index + 1}" class="input form-control" value="${image.image_url}" required/>
                                        <input type="hidden" name="Image_id_${loop.index + 1}" value="${image.image_id}">
                                    </div>
                                </c:forEach>
                            </c:if>

                        </div>

                        <c:if test="${requestScope.MESSAGE != null}">
                            <div>${MESSAGE}</div>
                        </c:if>
                        <c:if test="${requestScope.Error != null}">
                            <div>${error}</div>
                        </c:if>

                        <div class="col-lg-12">
                            <button class="button-submit" type="submit">Hoàn tất</button>
                        </div>
                    </form>
                </div>
            </div>
        </section>
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
</html>

