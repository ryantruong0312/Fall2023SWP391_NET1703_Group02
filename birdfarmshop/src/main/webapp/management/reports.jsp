<%-- Document : reports Created on : Sep 18, 2023, 9:43:28 PM Author : tlminh
--%> <%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="icon" type="image/png" href="assets/images/logo-title-bar.png" />
        <link
            href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
            rel="stylesheet"
            />

        <title>V.E.T - Báo cáo & Thống kê</title>

        <!-- Additional CSS Files -->
        <link
            rel="stylesheet"
            type="text/css"
            href="assets/css/bootstrap.min.css"
            />
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css" />
        <link rel="stylesheet" href="assets/css/templatemo-hexashop.css" />
        <link rel="stylesheet" href="assets/css/owl-carousel.css" />
        <link rel="stylesheet" href="assets/css/lightbox.css" />
        <link rel="stylesheet" href="assets/admin/css/sb-admin-2.min.css" />
    </head>

    <body>
        <!-- Header Start -->
        <%@include file="../layout/header.jsp" %>
        <!-- Header End -->
        <!-- Begin Page Content -->
        <div id="report" class="container-fluid">
            <!-- Page Heading -->
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">Báo cáo doanh thu</h1>
            </div>
            <div class="row my-3 ml-1 statistic">
                <button id="all" class="btn btn-primary mr-2 active">Tất cả</button>
                <button id="week" class="btn btn-primary mr-2">Tuần này</button>
                <button id="month" class="btn btn-primary mr-2">Tháng này</button>
                <button id="year" class="btn btn-primary mr-2">Năm này</button>
                <div  class="dropdown" style="display: inline-block">
                    <a
                        id="filter"
                        class="btn btn-primary dropdown-toggle"
                        href="#"
                        role="button"
                        id="dropdownMenuLink"
                        data-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="true"
                        ></a>
                    <div
                        class="dropdown-menu mt-2"
                        aria-labelledby="dropdownMenuLink"
                        x-placement="bottom-start"
                        style="
                        position: absolute;
                        will-change: transform;
                        top: 5px;
                        left: 0px;
                        transform: translate3d(0px, 37px, 0px);
                        "
                        >
                        <div style="margin: 20px">
                            Từ ngày
                            <input
                                type="date"
                                class="form-control"
                                name="from_date"
                                required=""
                                value=""
                                />
                            Đến ngày
                            <input
                                type="date"
                                class="form-control"
                                name="to_date"
                                required=""
                                value=""
                                />
                            <br />
                            <input type="hidden" value="custom" name="type" />
                            <input
                                id="search"
                                value="Tìm"
                                class="btn btn-primary form-control"
                                />
                        </div>
                    </div>
                </div>
            </div>
            <!-- Content Row -->
            <div class="row">
                <!-- Earnings (Monthly) Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div
                                        class="text-xs font-weight-bold text-primary text-uppercase mb-1"
                                        >
                                        Doanh thu
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800 money">
                                        <fmt:formatNumber value="${requestScope.REPORT.revenue.get(0)}" pattern="#,###"/>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <img src="assets/images/icon-money.png" alt="Doanh thu" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Earnings (Monthly) Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-success shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div
                                        class="text-xs font-weight-bold text-success text-uppercase mb-1"
                                        >
                                        Đơn hàng
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800 order"><fmt:formatNumber value="${requestScope.REPORT.revenue.get(1)}" pattern="#,###"/></div>
                                </div>
                                <div class="col-auto">
                                    <img src="assets/images/box-order.png" alt="Đơn hàng" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-danger shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div
                                        class="text-xs font-weight-bold text-danger text-uppercase mb-1"
                                        >
                                        Đơn hàng bị hủy
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800 cancel-order"><fmt:formatNumber value="${requestScope.REPORT.revenue.get(2)}" pattern="#,###"/></div>
                                </div>
                                <div class="col-auto">
                                    <img
                                        src="assets/images/cancel-order.png"
                                        alt="Đơ hàng bị hủy"
                                        />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-warning shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div
                                        class="text-xs font-weight-bold text-warning text-uppercase mb-1"
                                        >
                                        Khách hàng
                                    </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800 number-user"><fmt:formatNumber value="${requestScope.REPORT.revenue.get(3)}" pattern="#,###"/></div>
                                </div>
                                <div class="col-auto">
                                    <img src="assets/images/usericon.png" alt="Nguời dùng" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Content Row -->

            <div class="row">
                <!-- Area Chart -->
                <div class="col-xl-8 col-lg-7">
                    <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div
                            class="card-header py-3 d-flex flex-row align-items-center justify-content-between"
                            >
                            <h6 class="m-0 font-weight-bold text-primary">
                                Tổng quan doanh thu
                            </h6>
                            <div class="dropdown no-arrow">
                                <a
                                    class="dropdown-toggle"
                                    href="#"
                                    role="button"
                                    id="dropdownMenuLink"
                                    data-toggle="dropdown"
                                    aria-haspopup="true"
                                    aria-expanded="false"
                                    >
                                    <i class="fa fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                </a>
                                <div
                                    class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                    aria-labelledby="dropdownMenuLink"
                                    >
                                    <div class="dropdown-header">Loại thanh toán:</div>
                                    <a class="dropdown-item active" href="#">Tất cả</a>
                                    <a class="dropdown-item" href="#">Thanh toán chuyển khoản</a>
                                    <a class="dropdown-item" href="#">Thanh toán khi nhận hàng</a>
                                </div>
                            </div>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="chart-area">
                                <canvas id="myAreaChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Pie Chart -->
                <div class="col-xl-4 col-lg-5 stock-quatity1">
                    <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div
                            class="card-header py-3 d-flex flex-row align-items-center justify-content-between"
                            >
                            <h6 class="m-0 font-weight-bold text-primary">
                                Số lượng sản phẩm đã bán
                            </h6>
                            <div class="dropdown no-arrow">
                                <a
                                    class="dropdown-toggle"
                                    href="#"
                                    role="button"
                                    id="dropdownMenuLink"
                                    data-toggle="dropdown"
                                    aria-haspopup="true"
                                    aria-expanded="false"
                                    >
                                    <i class="fa fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                </a>
                                <div
                                    class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                    aria-labelledby="dropdownMenuLink"
                                    >
                                    <div class="dropdown-header">Trạng thái:</div>
                                    <a class="dropdown-item sale active">Đã bán</a>
                                    <a class="dropdown-item stock">Trong kho</a>
                                </div>
                            </div>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="chart-pie pt-4 pb-2">
                                <canvas id="myPieChart"></canvas>
                                <div class="center-text text-black font-weight-bold product-sale"><fmt:formatNumber value="${requestScope.REPORT.totalProduct}" pattern="#,###"/></div>
                            </div>
                            <div class="mt-4 text-center small">
                                <span class="mr-2">
                                    <i class="fa fa-circle text-primary"></i> Chim
                                </span>
                                <span class="mr-2">
                                    <i class="fa fa-circle text-success"></i> Phụ kiện
                                </span>
                                <span class="mr-2">
                                    <i class="fa fa-circle text-info"></i> Nhân giống
                                </span>
                                <span class="mr-2">
                                    <i style="color: #FAF356;" class="fa fa-circle"></i>Tổ chim non
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-4 col-lg-5">
                    <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div
                            class="card-header py-3 d-flex flex-row align-items-center justify-content-between"
                            >
                            <div class="d-flex justify-content-around align-items-center">
                                <h6 class="m-0 font-weight-bold text-primary">Chim</h6>
                            </div>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="chart-pie pt-4 pb-2">
                                <canvas id="myPieChartBird"></canvas>
                                <div class="center-text text-black font-weight-bold"><fmt:formatNumber value="${requestScope.REPORT.totalBird}" pattern="#,###"/></div>
                            </div>
                            <div class="mt-4 text-center small">
                                <span class="mr-2">
                                    <i class="fa fa-circle text-primary"></i> Còn hàng
                                </span>
                                <span class="mr-2">
                                    <i class="fa fa-circle text-success"></i> Đang sinh sản
                                </span>
                                <span class="mr-2">
                                    <i class="fa fa-circle text-danger"></i> Đã bán
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-5">
                    <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div
                            class="card-header py-3 d-flex flex-row align-items-center justify-content-between"
                            >
                            <h6 class="m-0 font-weight-bold text-primary">Phụ kiện</h6>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="chart-pie pt-4 pb-2">
                                <canvas id="myPieChartAccessory"></canvas>
                                <div class="center-text text-black font-weight-bold"><fmt:formatNumber value="${requestScope.REPORT.totalAccessory}" pattern="#,###"/></div>
                            </div>
                            <div class="mt-4 text-center small">
                                <span class="mr-2">
                                    <i class="fa fa-circle text-primary"></i> Còn hàng
                                </span>
                                <span class="mr-2">
                                    <i class="fa fa-circle text-danger"></i> Hết hàng
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-5">
                    <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div
                            class="card-header py-3 d-flex flex-row align-items-center justify-content-between"
                            >
                            <h6 class="m-0 font-weight-bold text-primary">Nhân giống</h6>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="chart-pie pt-4 pb-2">
                                <canvas id="myPieChartBirdPair"></canvas>
                                <div class="center-text text-black font-weight-bold"><fmt:formatNumber value="${requestScope.REPORT.totalBirdPair}" pattern="#,###"/></div>
                            </div>
                            <div class="mt-4 text-center small">
                                <span class="mr-2">
                                    <i style="color: #EF89F1;" class="fa fa-circle"></i> Chờ lấy chim
                                </span>
                                <span class="mr-2">
                                    <i style="color: #faf356;" class="fa fa-circle"></i> Đang ghép cặp
                                </span>
                                <span class="mr-2">
                                    <i class="fa fa-circle text-success"></i> Đã sinh sản
                                </span>
                                <span class="mr-2">
                                    <i class="fa fa-circle text-info"></i> Đã ấp nở
                                </span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- End of Content Wrapper -->

        <%@include file="../layout/message.jsp" %>
        <script src="assets/js/jquery-3.7.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/jquery.validate.min.js"></script>
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
        <!-- End Footer -->

        <!-- Core plugin JavaScript-->
        <script src="assets/admin/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="assets/admin/js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="assets/admin/chart.js/Chart.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="assets/admin/js/chart-area-demo.js"></script>
        <script>
            const labelQuantity = ["Chim", "Phụ kiện", "Nhân giống", "Tổ chim non"];
            const nodeQuantity = document.getElementById("myPieChart");
            const colorQuantity = ["#4e73df", "#1cc88a", "#36b9cc", "#FAF356"];
            const hoverColorQuantity = ["#2e59d9", "#17a673", "#2c9faf", "#A4A038"];
            const dataQuantity = [];
            <c:forEach var="product" items="${requestScope.REPORT.product_sale}">
            dataQuantity.push(${product});
            </c:forEach>


            const labelBird = ["Còn hàng", "Đang sinh sản", "Đã bán"];
            const nodeBird = document.getElementById("myPieChartBird");
            const colorBird = ["#4e73df", "#1cc88a", "#e74a3b"];
            const hoverColorBird = ["#2e59d9", "#17a673", "#B52517"];
            const dataBird = [];
            <c:forEach var="bird" items="${requestScope.REPORT.bird}">
            dataBird.push(${bird});
            </c:forEach>

            const labelAccessory = ["Còn hàng", "Hết hàng"];
            const nodeAccessory = document.getElementById("myPieChartAccessory");
            const colorAccessory = ["#4e73df", "#e74a3b"];
            const hoverColorAccessory = ["#2e59d9", "#B52517"];
            const dataAccessory = [];
            <c:forEach var="accessory" items="${requestScope.REPORT.accessory}">
            dataAccessory.push(${accessory});
            </c:forEach>

            const labelBirdPair = ["Chờ lấy chim", "Đang ghép cặp", "Đã sinh sản", "Đã ấp nở"];
            const nodeBirdPair = document.getElementById("myPieChartBirdPair");
            const colorBirdPair = ["#EF89F1", "#FAF356", "#1cc88a", "#36b9cc"];
            const hoverColorBirdPair = ["#CE55D0", "#A4A038", "#17a673", "#2c9faf"];
            const dataBirdPair = [];
            <c:forEach var="birdPair" items="${requestScope.REPORT.birdPair}">
            dataBirdPair.push(${birdPair});
            </c:forEach>

            const allData = [];
            <c:forEach var="r" items="${requestScope.REPORT.revenue}">
            allData.push(${r});
            </c:forEach>
            function pie(nodePie, label, color, hoverColor, data) {
                if (nodePie && nodePie.chart) {
                    nodePie.chart.destroy();
                }
                var myPieChart = new Chart(nodePie, {
                    type: "doughnut",
                    data: {
                        labels: label,
                        datasets: [
                            {
                                data: data,
                                backgroundColor: color,
                                hoverBackgroundColor: hoverColor,
                                hoverBorderColor: "rgba(234, 236, 244, 1)",
                            },
                        ],
                    },
                    options: {
                        maintainAspectRatio: false,
                        tooltips: {
                            backgroundColor: "rgb(255,255,255)",
                            bodyFontColor: "#858796",
                            borderColor: "#dddfeb",
                            borderWidth: 1,
                            xPadding: 15,
                            yPadding: 15,
                            displayColors: false,
                            caretPadding: 10,
                        },
                        legend: {
                            display: false,
                        },
                        cutoutPercentage: 80,
                    },
                });
                nodePie.chart = myPieChart;
            }
            pie(nodeQuantity, labelQuantity, colorQuantity, hoverColorQuantity, dataQuantity);
            pie(nodeBird, labelBird, colorBird, hoverColorBird, dataBird);
            pie(nodeAccessory, labelAccessory, colorAccessory, hoverColorAccessory, dataAccessory);
            pie(nodeBirdPair, labelBirdPair, colorBirdPair, hoverColorBirdPair, dataBirdPair);
            $('#report .stock-quatity1 .stock').click(function () {
                $('#report .stock-quatity1 h6').html('Số lượng sản phẩm trong kho');
                $('#report .stock-quatity1 .sale').removeClass('active');
                $('#report .stock-quatity1 .stock').addClass('active');
                $('#report .stock-quatity1 .center-text').html(dataBird[0] + dataAccessory[0] +${requestScope.REPORT.stockBirdPair});
                const dataStock = [];
                dataStock.push(dataBird[0]);
                dataStock.push(dataAccessory[0]);
                dataStock.push(${requestScope.REPORT.stockBirdPair});
                pie(nodeQuantity, labelQuantity, colorQuantity, hoverColorQuantity, dataStock);
            });
            $('#report .stock-quatity1 .sale').click(function () {
                $('#report .stock-quatity1 h6').html('Số lượng sản phẩm đã bán');
                $('#report .stock-quatity1 .stock').removeClass('active');
                $('#report .stock-quatity1 .sale').addClass('active');
                pie(nodeQuantity, labelQuantity, colorQuantity, hoverColorQuantity, dataQuantity);
            });
            $('#week').click(function () {
                $('#report .statistic .active').removeClass('active');
                $('#week').addClass('active');
                $.ajax({
                    url: 'RenderReportsController',
                    type: 'POST',
                    data: {filter: 'week'},
                    success: function (data) {
                        const jsonArray = JSON.parse(data);
                        const revenue = jsonArray.revenue;
                        $('.money').html(Number(revenue[0]).toLocaleString('vi-VN'));
                        $('.order').html(revenue[1]);
                        $('.cancel-order').html(revenue[2]);
                        $('.number-user').html(revenue[3]);
                        const dataQuantityWeek = jsonArray.product_sale;
                        pie(nodeQuantity, labelQuantity, colorQuantity, hoverColorQuantity, dataQuantityWeek);
                        $('.product-sale').html(Number(jsonArray.totalProduct).toLocaleString('vi-VN'));
                    }
                });
            });
            $('#month').click(function () {
                $('#report .statistic .active').removeClass('active');
                $('#month').addClass('active');
            });
            $('#year').click(function () {
                $('#report .statistic .active').removeClass('active');
                $('#year').addClass('active');
            });
            $('#all').click(function () {
                $('#report .statistic .active').removeClass('active');
                $('#all').addClass('active');
                $('.money').html(Number(allData[0]).toLocaleString('vi-VN'));
                $('.order').html(allData[1]);
                $('.cancel-order').html(allData[2]);
                $('.number-user').html(allData[3]);
                pie(nodeQuantity, labelQuantity, colorQuantity, hoverColorQuantity, dataQuantity);
            });
            $('#search').click(function () {
                $('#report .statistic .active').removeClass('active');
                $('#filter').addClass('active');
            });
        </script>
    </body>
</html>
