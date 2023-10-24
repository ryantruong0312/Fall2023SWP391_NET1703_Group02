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
            #id{
                height: 100px;
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
                            <h2>Chỉnh sửa sản phẩm</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ***** Main Banner Area End ***** -->


        <section class="section" id="products">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <c:if test="${requestScope.MESSAGE != null}">
                            <h4 style="text-align: center; color: red;"><c:out value="${requestScope.MESSAGE}"/></h4>
                        </c:if>
                        <c:if test="${requestScope.Error != null}">
                            <h4 style="text-align: center; color: red;"><c:out value="${requestScope.Error}"/></h4>
                        </c:if>
                    </div>
                </div>
                <form action="MainController" method="POST" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-outline mt-2">
                                <label>ID của phụ kiện</label>
                                <input style="color: #0c5460;" type="text" name="txtAccessoryID" class="input form-control" pattern="[A-Z]{2}\d{3}" value="${a.accessory_id}" readonly=""/>
                            </div>

                            <div class="form-outline mt-2">
                                <label>Tên</label>
                                <input style="color: #0c5460;" type="text" name="txtAccessoryName" class="input form-control" value="${a.accessory_name}" required/>
                            </div>

                            <div class="form-outline mt-2">
                                <label>Loại phụ kiện</label>
                                <select name="txtCategoryID" class="input form-control" style="color: #0c5460;">
                                    <option value="${category_id}">${categoryname}</option>
                                    <c:forEach items="${ac}" var="ac">
                                        <c:if test="${category_id ne ac.category_id && categoryname ne ac.category_name}">
                                            <option value="${ac.category_id}">${ac.category_name}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-outline mt-2">
                                        <label>Giá bán</label>
                                        <div style="position: relative">
                                            <input style="color: #0c5460; width: 80%;" type="number" name="txtPrice" min="0" class="input form-control" value="${a.unit_price}" required/>
                                            <span style="position: absolute; right: 35px; top: 50%; transform: translateY(-50%);">₫</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-6">
                                    <div class="form-outline mt-2">
                                        <label>Giảm giá (%)</label>
                                        <div style="position: relative">
                                            <input style="color: #0c5460; width: 80%;" type="number" name="txtDiscount" min="0" class="input form-control" value="${a.discount}"/>                            
                                            <span style="position: absolute; right: 28px; top: 50%; transform: translateY(-50%);">%</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-outline mt-2">
                                <label>Số lượng</label>
                                <input style="color: #0c5460;" type="number" name="txtStockQuantity" min="0" class="input form-control" value="${a.stock_quantity}" required/>
                            </div>


                        </div>
                        <div class="col-lg-6">
                            <div class="form-outline mt-2">
                                <label for="txtDescribe">Mô tả</label><br>
                                <textarea class="form-control" id="txtDescribe" name="txtDescribe" rows="5" cols="50" style="width: 100%px; height: 142px; color: #0c5460;">${a.description}</textarea>
                            </div>

                            <div class="form-outline mt-2">
                                <label>Hình ảnh sản phẩm (Bắt buộc)</label>
                                <input style="color: #0c5460;" type="file" accept="image/*" name="txtImage"  class="input form-control" value="${url_thumnail}" pattern="^(http|https|ftp)://[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}(:[0-9]+)?(/.*)?$" required/>
                            </div>

                            <c:if test="${requestScope.list != null}">
                                <c:forEach var="image" items="${list}" varStatus="loop">
                                    <div class="form-outline mt-2">
                                        <label>Hình ảnh sản phẩm</label>
                                        <input style="color: #0c5460;" type="file" accept="image/*" name="txtImage_${loop.index + 1}" class="input form-control" value="${image.image_url}" required/>
                                        <input type="hidden" name="Image_id_${loop.index + 1}" value="${image.image_id}">
                                    </div>
                                </c:forEach>
                            </c:if>
                            
                        </div>
                    </div>
                    <input type="hidden" name="btAction" value="Update">
                    <div class="col-lg-12" style="margin-top: 10px;">                       
                        <a type="button" class="btn-danger button-submit" href="RenderAccessoryDetailsController?id=${a.accessory_id}">Hủy bỏ</a>
                        <button style="margin-right: 10px;" class="button-submit btn-primary" type="submit" name="action" value="NavToUpdateAccessory">Hoàn tất</button>
                    </div>
                </form>
            </div>
        </section>


        <!-- ***** Footer Start ***** -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="first-item">
                            <div class="logo">
                                <img src="assets/images/logo.png" alt="hexashop ecommerce templatemo">
                            </div>
                            <ul>
                                <li><a href="#">284 Pasteur, P.8 Q.3, TP.HCM</a></li>
                                <li><a href="#">thegioivetcanh@petshop.com</a></li>
                                <li><a href="#">0913-244-567</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <h4>Sản phẩm và dịch vụ</h4>
                        <ul>
                            <li><a href="${pageScope.toBirds}">Vẹt cảnh</a></li>
                            <li><a href="${pageScope.toBirdNests}">Tổ chim non</a></li>
                            <li><a href="${pageScope.toAccessories}">Phụ kiện</a></li>
                            <li><a href="${pageScope.toCompare}">So sánh</a></li>
                            <li><a href="${pageScope.toPair}">Nhân giống</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3">
                        <h4>Đường dẫn hữu ích</h4>
                        <ul>
                            <li><a href="${pageScope.toHome}">Trang chủ</a></li>
                            <li><a href="#">Về chúng tôi</a></li>
                            <li><a href="#">Hỗ trợ</a></li>
                            <li><a href="#">Liên hệ</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3">
                        <h4>Thông tin hỗ trợ</h4>
                        <ul>
                            <li><a href="#">Hỗ trợ</a></li>
                            <li><a href="#">Câu hỏi thường gặp</a></li>
                            <li><a href="#">Giao hàng</a></li>
                            <li><a href="#">Theo dõi đơn hàng</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-12">
                        <div class="under-footer">
                            <p>Copyright © 2023 V.E.T Co., Ltd. All Rights Reserved. 

                            <ul>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- ***** Footer Area Ends ***** -->

        <!-- jQuery -->
        <script src="assets/js/jquery-2.1.0.min.js"></script>

        <!-- Bootstrap -->
        <script src="assets/js/popper.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

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

