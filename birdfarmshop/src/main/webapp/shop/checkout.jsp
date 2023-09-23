<%-- 
    Document   : checkout
    Created on : Sep 13, 2023, 11:26:14 PM
    Author     : tlminh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
       <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

        <title>Bird Farm Shop - Phụ Kiện</title>

        <!-- Additional CSS Files -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="../assets/css/checkout.css">
        <link rel="stylesheet" href="assets/css/templatemo-hexashop.css">
        <link rel="stylesheet" href="assets/css/owl-carousel.css">
        <link rel="stylesheet" href="assets/css/lightbox.css">

    </head>
<body>
               
<div class="container">
  <form action="/action_page.php">

    <div class="row">
      <div class="col-50">
        <h3>Địa chỉ thanh toán</h3>
        <label for="fname"><i class="fa fa-user"></i>Họ và tên</label>
        <input type="text" id="fname" name="firstname" placeholder="Lâm Trường Thọ">
        <label for="adr"><i class="fa fa-address-card-o"></i> Địa chỉ</label>
        <input type="text" id="adr" name="address" placeholder="Phường Uyên Hưng, thành phố Tân Uyên, tỉnh Bình Dương">


      <div>
        <h3>Phương thức thanh toán</h3>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
            <label class="form-check-label" for="exampleRadios1">
              Tiền mặt
            </label>
          </div>
          <div class="form-check">
            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
            <label class="form-check-label" for="exampleRadios2">
              Chuyển khoản
            </label>
          </div>
          <div class="form-check">
            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="option3">
            <label class="form-check-label" for="exampleRadios3">
              Ship COD
            </label>
          </div>
      </div>

    </div>
    
<div class="col-25">
    <div class="container">
      <h4>Giỏ Hàng
        <span class="price" style="color:black">
          <i class="fa fa-shopping-cart"></i>
        </span>
      </h4>
      <p><a href="#">sản phẩm 1</a> <span class="price">$15</span></p>
      <p><a href="#">sản phẩm 2</a> <span class="price">$5</span></p>
      <p><a href="#">sản phẩm 3</a> <span class="price">$8</span></p>
      <p><a href="#">sản phẩm 4</a> <span class="price">$2</span></p>
      <hr>
      <p>Thành tiền <span class="price" style="color:black"><b>$30</b></span></p>
    </div>
    </div>
    <input type="submit" value="Continue to checkout" class="btn">
  </form>
</div>



</body>
</html>
