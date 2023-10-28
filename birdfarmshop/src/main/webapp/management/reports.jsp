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
            <div class="row my-3 ml-1">
                <button class="btn btn-primary mr-2 active">Tất cả</button>
                <button id="today" class="btn btn-primary mr-2">Hôm nay</button>
                <button id="week" class="btn btn-primary mr-2">Tuần này</button>
                <button id="month" class="btn btn-primary mr-2">Tháng này</button>
                <button id="quarter" class="btn btn-primary mr-2">Quý này</button>
                <button id="year" class="btn btn-primary mr-2">Năm này</button>
                <div class="dropdown show" style="display: inline-block">
                    <a
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
                            <form action="index.php">
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
                                    type="submit"
                                    value="Tìm"
                                    class="btn btn-primary form-control"
                                    />
                            </form>
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
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                                        40,000 ₫
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
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">215</div>
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
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">215</div>
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
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">1200</div>
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
                                <div></div>
                                <h6 class="m-0 font-weight-bold text-primary">Chim</h6>
                            </div>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="chart-pie pt-4 pb-2">
                                <canvas id="myPieChartBird"></canvas>
                            </div>
                            <div class="mt-4 text-center small">
                                <span class="mr-2">
                                    <i class="fa fa-circle text-primary"></i> Còn hàng
                                </span>
                                <span class="mr-2">
                                    <i class="fa fa-circle text-success"></i> Đang ghép cặp
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
            <div class="row">
                <div class="col-sm-12 col-md-8">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Đơn hàng</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4"><div class="row">
                                        <div class="col-sm-12 col-md-2">
                                            <div class="dataTables_length d-flex align-items-center" id="dataTable_length">
                                                <label class="m-0 mr-2">Hiện</label>
                                                <select style="width: 200px;" name="dataTable_length" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm">
                                                    <option value="10">10</option>
                                                    <option value="25">25</option>
                                                    <option value="50">50</option>
                                                    <option value="100">100</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-4 offset-6 mb-3">
                                            <div id="dataTable_filter" class="dataTables_filter d-flex align-items-center">
                                                <label style="width: 150px" class="m-0">Tìm kiếm</label>
                                                <input type="search" class="form-control form-control-sm" placeholder="" aria-controls="dataTable">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                                                <thead>
                                                    <tr role="row"><th class="sorting sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 115.2px;">Mã đơn hàng</th><th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 181.2px;">Tài khoản</th><th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending" style="width: 80.2px;">Office</th><th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" style="width: 30.2px;">Age</th><th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 75.2px;">Start date</th><th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 66.2px;">Salary</th></tr>
                                                </thead>
                                                <tbody>
                                                    <tr class="odd">
                                                        <td class="sorting_1">Airi Satou</td>
                                                        <td>Accountant</td>
                                                        <td>Tokyo</td>
                                                        <td>33</td>
                                                        <td>2008/11/28</td>
                                                        <td>$162,700</td>
                                                    </tr><tr class="even">
                                                        <td class="sorting_1">Angelica Ramos</td>
                                                        <td>Chief Executive </td>
                                                        <td>London</td>
                                                        <td>47</td>
                                                        <td>2009/10/09</td>
                                                        <td>$1,200,000</td>
                                                    </tr><tr class="odd">
                                                        <td class="sorting_1">Ashton Cox</td>
                                                        <td>Junior Technical Author</td>
                                                        <td>San Francisco</td>
                                                        <td>66</td>
                                                        <td>2009/01/12</td>
                                                        <td>$86,000</td>
                                                    </tr><tr class="even">
                                                        <td class="sorting_1">Bradley Greer</td>
                                                        <td>Software Engineer</td>
                                                        <td>London</td>
                                                        <td>41</td>
                                                        <td>2012/10/13</td>
                                                        <td>$132,000</td>
                                                    </tr><tr class="odd">
                                                        <td class="sorting_1">Brenden Wagner</td>
                                                        <td>Software Engineer</td>
                                                        <td>San Francisco</td>
                                                        <td>28</td>
                                                        <td>2011/06/07</td>
                                                        <td>$206,850</td>
                                                    </tr><tr class="even">
                                                        <td class="sorting_1">Brielle </td>
                                                        <td>Integration Specialist</td>
                                                        <td>New York</td>
                                                        <td>61</td>
                                                        <td>2012/12/02</td>
                                                        <td>$372,000</td>
                                                    </tr><tr class="odd">
                                                        <td class="sorting_1">Bruno Nash</td>
                                                        <td>Software Engineer</td>
                                                        <td>London</td>
                                                        <td>38</td>
                                                        <td>2011/05/03</td>
                                                        <td>$163,500</td>
                                                    </tr><tr class="even">
                                                        <td class="sorting_1">Caesar Vance</td>
                                                        <td>Pre-Sales Support</td>
                                                        <td>New York</td>
                                                        <td>21</td>
                                                        <td>2011/12/12</td>
                                                        <td>$106,450</td>
                                                    </tr><tr class="odd">
                                                        <td class="sorting_1">Cara Stevens</td>
                                                        <td>Sales Assistant</td>
                                                        <td>New York</td>
                                                        <td>46</td>
                                                        <td>2011/12/06</td>
                                                        <td>$145,600</td>
                                                    </tr><tr class="even">
                                                        <td class="sorting_1">Cedric Kelly</td>
                                                        <td>Senior Javascript Developer</td>
                                                        <td>Edinburgh</td>
                                                        <td>22</td>
                                                        <td>2012/03/29</td>
                                                        <td>$433,060</td>
                                                    </tr></tbody>
                                            </table></div></div><div class="row"><div class="col-sm-12 col-md-5"><div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">Hiện 1 tới 10 của 57 đơn</div></div><div class="col-sm-12 col-md-7"><div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate"><ul class="pagination"><li class="paginate_button page-item previous disabled" id="dataTable_previous"><a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li><li class="paginate_button page-item active"><a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">1</a></li><li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">2</a></li><li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="3" tabindex="0" class="page-link">3</a></li><li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="4" tabindex="0" class="page-link">4</a></li><li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="5" tabindex="0" class="page-link">5</a></li><li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="6" tabindex="0" class="page-link">6</a></li><li class="paginate_button page-item next" id="dataTable_next"><a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">Next</a></li></ul></div></div></div></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-4">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Tài khoản</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4"><div class="row">
                                        <div class="col-sm-12 col-md-2">
                                            <div class="dataTables_length d-flex align-items-center" id="dataTable_length">
                                                <label class="m-0 mr-2">Hiện</label>
                                                <select style="width: 200px;" name="dataTable_length" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm">
                                                    <option value="10">10</option>
                                                    <option value="25">25</option>
                                                    <option value="50">50</option>
                                                    <option value="100">100</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-6 offset-4 mb-3">
                                            <div id="dataTable_filter" class="dataTables_filter d-flex align-items-center">
                                                <label style="width: 150px" class="mr-2">Tìm kiếm</label>
                                                <input type="search" class="form-control form-control-sm" placeholder="" aria-controls="dataTable">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                                                <thead>
                                                    <tr role="row"><th class="sorting sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 115.2px;">Tài khoản</th><th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 181.2px;">Ngày tạo</th>   </tr>
                                                </thead>
                                                <tbody>
                                                    <tr class="odd">
                                                        <td>Accountant</td>
                                                        <td>Tokyo</td>
                                                    </tr>
                                                    <tr class="even">
                                                        <td>Chief Executive </td>
                                                        <td>London</td>
                                                    </tr>
                                                    <tr class="even">
                                                        <td>Chief Executive </td>
                                                        <td>London</td>
                                                    </tr>
                                                    <tr class="even">
                                                        <td>Chief Executive </td>
                                                        <td>London</td>
                                                    </tr>
                                                    <tr class="even">
                                                        <td>Chief Executive </td>
                                                        <td>London</td>
                                                    </tr>
                                                    <tr class="even">
                                                        <td>Chief Executive </td>
                                                        <td>London</td>
                                                    </tr>
                                                    <tr class="even">
                                                        <td>Chief Executive </td>
                                                        <td>London</td>
                                                    </tr>
                                                    <tr class="even">
                                                        <td>Chief Executive </td>
                                                        <td>London</td>
                                                    </tr>
                                                    <tr class="even">
                                                        <td>Chief Executive </td>
                                                        <td>London</td>
                                                    </tr>
                                                    <tr class="even">
                                                        <td>Chief Executive </td>
                                                        <td>London</td>
                                                    </tr>
                                            </table></div></div><div class="row"><div class="col-sm-12 col-md-5"><div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">Hiện 1 tới 10</div></div><div class="col-sm-12 col-md-7"><div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate"><ul class="pagination"><li class="paginate_button page-item previous disabled" id="dataTable_previous"><a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li><li class="paginate_button page-item active"><a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">1</a></li></ul></div></div></div></div>
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
            const dataQuantity = [200, 30, 60, 80];

            const labelBird = ["Còn hàng", "Đang ghép cặp", "Đã bán"];
            const nodeBird = document.getElementById("myPieChartBird");
            const colorBird = ["#4e73df", "#1cc88a", "#e74a3b"];
            const hoverColorBird = ["#2e59d9", "#17a673", "#B52517"];
            const dataBird = [20, 60, 20];

            const labelAccessory = ["Còn hàng", "Hết hàng"];
            const nodeAccessory = document.getElementById("myPieChartAccessory");
            const colorAccessory = ["#4e73df", "#e74a3b"];
            const hoverColorAccessory = ["#2e59d9", "#B52517"];
            const dataAccessory = [40, 60];

            const labelBirdPair = ["Chờ lấy chim", "Đang ghép cặp", "Đã sinh sản", "Đã ấp nở"];
            const nodeBirdPair = document.getElementById("myPieChartBirdPair");
            const colorBirdPair = ["#EF89F1", "#1cc88a", "#36b9cc", "#FAF356"];
            const hoverColorBirdPair = ["#CE55D0", "#17a673", "#2c9faf", "#A4A038"];
            const dataBirdPair = [20, 60, 10, 10];
            function pie(nodePie, label, color, hoverColor, data) {
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
            }
            pie(nodeQuantity, labelQuantity, colorQuantity, hoverColorQuantity, dataQuantity);
            pie(nodeBird, labelBird, colorBird, hoverColorBird, dataBird);
            pie(nodeAccessory, labelAccessory, colorAccessory, hoverColorAccessory, dataAccessory);
            pie(nodeBirdPair, labelBirdPair, colorBirdPair, hoverColorBirdPair, dataBirdPair);
            $('#report .stock-quatity1 .stock').click(function () {
                $('#report .stock-quatity1 h6').html('Số lượng sản phẩm trong kho');
                $('#report .stock-quatity1 .sale').removeClass('active');
                $('#report .stock-quatity1 .stock').addClass('active');
                pie(nodeQuantity, labelQuantity, colorQuantity, hoverColorQuantity, dataQuantity);
            });
            $('#report .stock-quatity1 .sale').click(function () {
                $('#report .stock-quatity1 h6').html('Số lượng sản phẩm đã bán');
                $('#report .stock-quatity1 .stock').removeClass('active');
                $('#report .stock-quatity1 .sale').addClass('active');
                pie(nodeQuantity, labelQuantity, colorQuantity, hoverColorQuantity, dataQuantity);
            });

        </script>
    </body>
</html>
