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
        ::placeholder {
            color: blue; /* Đặt màu chữ cho placeholder thành màu xanh */
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
                <form action="AddAccessoryController" method="GET">
                    <div class="row">
                        <div class="col-lg-6" style="margin-top: 10px;">
                            <div class="form-outline">
                                <label>ID của phụ kiện (Bao gồm 2 chữ hoa và 3 chữ số)</label>
                                <input style="color: #0c5460;;" type="text" name="txtAccessoryID" class="input form-control" pattern="[A-Z]{2}\d{3}" placeholder="Nhập ID của phụ kiện" value="" required/>
                            </div>

                            <div class="form-outline mt-2">
                                <label>Tên</label>
                                <input style="color: #0c5460;;" type="text" name="txtAccessoryName" class="input form-control" placeholder="Nhập tên phụ kiện" required/>
                            </div>

                            <div class="form-outline mt-2">
                                <label>Loại phụ kiện</label>
                                <select name="txtCategoryID" class="input form-control" style="color: #0c5460;">
                                    <option value="" disabled selected>Chọn phụ kiện</option>
                                    <c:forEach items="${ac}" var="a">
                                        <option value="${a.category_id}">${a.category_name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-outline mt-2">
                                <label>Giá</label>
                                <input style="color: #0c5460;;" type="number" name="txtPrice" min="0" class="input form-control" placeholder="Nhập giá của phụ kiện" required value=""/>
                            </div>

                            <div class="form-outline mt-2">
                                <label>Số lượng</label>
                                <input style="color: #0c5460;;" value="" type="number" name="txtStockQuantity" min="0" class="input form-control" placeholder="Nhập số lượng phụ kiện" required/>
                            </div>

                            <div class="form-outline mt-2">
                                <label>Giảm giá (%)</label>
                                <input style="color: #0c5460;;" type="number" name="txtDiscount" min="0" class="input form-control" placeholder="Nhập giảm giá phụ kiện"/>                            
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-outline mt-2">
                                <label for="txtDescribe">Mô tả</label><br>
                                <textarea class="form-control" id="txtDescribe" name="txtDescribe" rows="5" cols="50" style="width: 100%; height: 232px; color: #0c5460;;" placeholder="Nhập mô tả phụ kiện"></textarea>
                            </div>
                            <div class="form-outline mt-2">
                                <label>Hình ảnh sản phẩm 1 (Bắt buộc)</label>
                                <input style="color: blue;" type="text" name="txtImage_1" class="input form-control" value="" placeholder="URL" pattern="^(http|https|ftp)://[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}(:[0-9]+)?(/.*)?$" required/>
                            </div>

                            <div class="form-outline mt-2">
                                <label>Hình ảnh sản phẩm 2</label>
                                <input style="color: #0c5460;;" type="text" name="txtImage_2" class="input form-control" value="" placeholder="URL" pattern="^(http|https|ftp)://[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}(:[0-9]+)?(/.*)?$" required=""/>
                            </div>

                            <div class="form-outline mt-2">
                                <label>Hình ảnh sản phẩm 3</label>
                                <input style="color: #0c5460;;" type="text" name="txtImage_3" class="input form-control" value="" placeholder="URL" pattern="^(http|https|ftp)://[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}(:[0-9]+)?(/.*)?$"/>
                            </div>
                        </div>
                        <c:if test="${requestScope.reminder != null}">
                            <div>${reminder}</div>
                        </c:if>

                        <div class="col-lg-12">
                            <button class="button-submit" type="submit">Tạo mới</button>
                        </div>
                    </div>
                </form>
            </div>
        </section>
    <script>
        $(document).ready(function () {
            // Get a reference to the search input element
            var searchInput = $("#searchInput");
            // Add an event listener for input changes
            searchInput.on("input", function () {
                var keyword = searchInput.val().toLowerCase();

                // Loop through each row in the table
                $("tbody tr").each(function () {
                    var row = $(this);
                    // Check if any cell in the row contains the keyword
                    if (row.text().toLowerCase().includes(keyword)) {
                        row.show(); // Show the row if keyword found
                    } else {
                        row.hide(); // Hide the row if keyword not found
                    }
                });
            });

            // Show the modal when the "Cấp mới tài khoản" button is clicked
            $("#createAccountBtn").click(function () {
                $("#createAccountModal").modal("show");
            });
            // Handle form submission
            $("#submitAccountBtn").click(function () {
                // Get the form data
                const fullname = $("#fullname").val();
                const username = $("#username").val();

                // You can perform validation here if needed

                // Close the modal
                $("#createAccountModal").modal("hide");

                // Send the form data to the server via AJAX or perform any desired action
            });
        });
    </script>

    <script>
        function submitForm() {
            // Get the form element by its ID
            var form = document.getElementById("createAccountForm");

            // Define the controller URL
            var controllerUrl = "/birdfarmshop/MainController";

            // Set the form's action attribute to the controller URL
            form.action = controllerUrl;


        document.querySelector('input[name=txtAccessoryName]').addEventListener('input', function () {
            var input = this;
            if (input.value.length > 50) {
                input.setCustomValidity("Tên phụ kiện không được dài hơn 50 ký tự.");
            } else {
                input.setCustomValidity("");
            }
        });
    </script>
</html>
