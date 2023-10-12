<%-- 
    Document   : test
    Created on : Sep 23, 2023, 12:08:39 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../assets/css/font-awesome.css">
        <link rel="stylesheet" href="../assets/css/templatemo-hexashop.css">
        <link rel="stylesheet" href="../assets/css/owl-carousel.css">
        <link rel="stylesheet" href="../assets/css/lightbox.css">
        <style>
            .page-checkout .image-item img{
                height: 100px;
                width: 100px;
            }
            .page-checkout .item-cart{
                border-radius: 20px;
                border: 1px solid #e9e9ed; 
            }
            .payment-method,
            .overall-menoy
            {
                border-top: 1px solid
            }
            .payment-method .icon-money{
                font-size: 23px;
                color: green;
            }
            .payment-method .icon-credit{
                font-size: 20px;
                color: blue;
            }
            .payment-method tr{
                height: 40px;
            }
            .payment-method tr label{
                font-size: 16px;
                margin: 0;
                cursor: pointer;
            }
            .infor-item p{
                display: inline-block;
            }
            .infor-item span{
                font-size: 8px; 
            }
            .info-checkout  h5{
                font-weight: 600;
            }
            .total-money span{
                color: #ff424e;
                font-weight: 600;
                font-size: 25px;
            }
            .box-order{
                min-height: 700px;
                overflow-y: scroll;
            }
        </style>
    <body>
                <table border="0" cellpadding="0" cellspacing="0" style="border-collapse:collapse;border:0;max-width:750px;background:#f8f9fa; margin: auto; margin-top: 40px"width="100%">
                    <tbody>
                        <tr>
                            <td style="text-align:center;border-bottom-color:orange;border-bottom-style:solid;border-bottom-width:10px;border-top-width:0; padding-top: 15px; padding-bottom: 10px;">
                                <img src="../assets/images/logo.png" alt="V.E.T"/>
                            </td>
                        </tr>
                        <tr style="padding-top: 10px">
                            <td style="padding-top: 30px;padding-left: 20px; font-weight: bold;">
                                Xin chào Gia Phong,  
                            </td>
                        </tr>
                         <tr style="padding-top: 10px">
                            <td style="padding-top: 30px; padding-right: 40px ;padding-left: 20px;">
                                Cảm ơn Quý khách đã tin tưởng & sử dụng sản phẩm của V.E.T - Thế giới vẹt cảnh
                            </td>
                        </tr>
                        <tr style="padding-top: 10px">
                            <td style="padding-top: 15px; padding-right: 40px ;padding-left: 20px;">
                               Đơn mua hàng của Quý khách đã được phát hành. 
                            </td>
                        </tr>
                        <tr style="padding-top: 10px">
                            <td style="padding-top: 30px; padding-right: 40px ;padding-left: 20px;">
                                <p style="display: inline-block; font-weight: bold;font-size: 17px;">Sản phẩm: </p>  
                            </td>
                        </tr>
                        <tr style="padding-top: 10px">
                            <td style="padding-top: 15px; padding-right:40px ;padding-left: 20px;">
                                - <p style="display: inline-block"> 1 </p><p style="display: inline-block;margin-left: 3px;"> lồng chim inox abc</p> - <p style="display: inline-block"> 5,000,000đ </p>  
                            </td>
                        </tr>
                         <tr style="padding-top: 10px">
                            <td style="padding-top: 30px; padding-right: 40px ;padding-left: 20px;">
                                <p style="display: inline-block; font-weight: bold;font-size: 17px;"> Tổng giá trị đơn hàng: </p> 
                                <p style="display: inline-block; font-size: 19px; color: red; margin-left: 5px;">5,000,000đ</p> 
                            </td>
                        </tr>
                        <tr style="padding-top: 10px">
                            <td style="padding-top: 30px; padding-right: 40px ;padding-left: 20px;">
                                <p style="display: inline-block; font-weight: bold;font-size: 17px;">Hình thức thanh toán: </p> 
                                <p style="display: inline-block;font-size: 15px">Thanh toán khi nhận hàng</p>
                            </td>
                        </tr>

                        <tr style="padding-top: 10px">
                            <td style="padding-top: 30px; padding-right: 40px ;padding-left: 20px;">
                                <p style="display: inline-block; font-weight: bold;font-size: 17px;">Tên người nhận: </p> 
                                <p style="display: inline-block;font-size: 15px">Thoogn tin dág</p>
                            </td>
                        </tr>
                        <tr style="padding-top: 10px">
                            <td style="padding-top: 30px; padding-right: 40px ;padding-left: 20px;">
                               <p style="display: inline-block; font-weight: bold;font-size: 17px;">Số liên lạc: </p> 
                                <p style="display: inline-block;font-size: 15px">09420625</p>
                            </td>
                        </tr>
                        <tr style="padding-top: 10px">
                            <td style="padding-top: 30px; padding-right: 40px ;padding-left: 20px;">
                                <p style="display: inline-block; font-weight: bold;font-size: 17px;"> Địa chỉ giao hàng: </p> 
                                <p style="display: inline-block;font-size: 15px">Thông 4 - Nâm N'</p>
                            </td>
                        </tr>
                        <tr style="padding-top: 10px">
                            <td style="padding-top: 30px; padding-right: 40px ;padding-left: 20px;">
                              Quý khách vui lòng chờ giao hàng trong vòng 3-5 ngày kể từ ngày phát hành đơn mua hàng.
                            </td>
                        </tr>
                          <tr style="padding-top: 10px">
                            <td style="padding-top: 15px; padding-right: 40px ;padding-left: 20px;">
                               Nếu có vấn đề cần hỗ trợ Quý khách vui lòng liên hệ: Điện thoại: 19006955  email: thegioivetcanh@gmail.com
                            </td>
                        </tr>        
                        <tr style="padding-top: 10px">
                            <td style="padding-top: 50px; padding-right: 40px ;padding-left: 20px; text-align: center; padding-bottom: 20px">
                                <a href="MainController?action=active&token="><button style="background-color: orange; border:none; line-height: 40px; color: white; font-weight: bold; padding: 0 10px; cursor: pointer">Xem đơn hàng</button></a>
                            </td>
                        </tr>
                        
                        <tr style="padding-top: 10px;">
                            <td style="padding-top: 30px; padding-right: 40px ;padding-left: 20px; padding-bottom: 40px">
                                Chúc Quý khách sức khoẻ và thành công!,
                                <br>
                                V.E.T
                            </td>
                        </tr>
                    </tbody>
                </table>
        <script src="../assets/js/birdshop.js"></script>
        <script src="../assets/js/jquery-3.7.1.min.js"></script>
        <script src="../assets/js/popper.min.js"></script>
    </body>
</html>
