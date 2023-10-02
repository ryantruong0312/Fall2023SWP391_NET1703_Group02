<%-- 
    Document   : test
    Created on : Sep 23, 2023, 12:08:39 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../assets/css/font-awesome.css">
        <link rel="stylesheet" href="../assets/css/templatemo-hexashop.css">
        <link rel="stylesheet" href="../assets/css/owl-carousel.css">
        <link rel="stylesheet" href="../assets/css/lightbox.css">
    </head>
    <body>
        <!--        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse:collapse;border:0;max-width:600px;background:#f8f9fa; margin: auto; margin-top: 40px"width="100%">
                    <tbody>
                        <tr>
                            <td style="text-align:center;border-bottom-color:orange;border-bottom-style:solid;border-bottom-width:10px;border-top-width:0; padding-top: 15px; padding-bottom: 10px;">
                                <h3>BFS</h3>    
                            </td>
                        </tr>
                        <tr style="padding-top: 10px">
                            <td style="padding-top: 30px;padding-left: 20px; font-weight: bold;">
                                Xin chào Gia Phong,  
                            </td>
                        </tr>
                        <tr style="padding-top: 10px">
                            <td style="padding-top: 30px; padding-right: 40px ;padding-left: 20px;">
                                Chào mừng bạn đã đến cửa hàng bán vẹt của chúng tôi để sử dụng tài khoản vui lòng bấm núi bên dưới để kích hoạt tài khoản:
                            </td>
                        </tr>
                        <tr style="padding-top: 10px">
                            <td style="padding-top: 50px; padding-right: 40px ;padding-left: 20px; text-align: center; padding-bottom: 20px">
                                <a href="MainController?action=active&token="><button style="background-color: orange; border:none; line-height: 40px; color: white; font-weight: bold; padding: 0 10px; cursor: pointer">Kích hoạt tài khoản</button></a>
                            </td>
                        </tr>
                        <tr style="padding-top: 10px;">
                            <td style="padding-top: 30px; padding-right: 40px ;padding-left: 20px; padding-bottom: 40px">
                                Cảm ơn bạn đến với của hàng,
                                <br>
                                Bird Farm Shop
                            </td>
                        </tr>
                    </tbody>
                </table>-->
        <div>
                <form action="../UploadController" method="POST" enctype="multipart/form-data">
                  <input type="text" name="description"  />
                <label>Uploadfile</label>
                <input type="file" name="filepicture"  />
                <button type="submit">Submit</button>
            </form>           
         <img src="https://birdfarmshop.s3.amazonaws.com/baner-right-image-01.jpg" alt="Your Image">
        </div>
        <script src="../assets/js/birdshop.js"></script>
        <script src="../assets/js/jquery-3.7.1.min.js"></script>
        <script src="../assets/js/popper.min.js"></script>
    </body>
</html>
