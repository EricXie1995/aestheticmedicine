<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>Doccure</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

    <!-- Favicons -->
    <link href="<c:url value='/assets/img/favicon.png'/>" rel="icon">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="http://cdn.bootstrapmb.com/bootstrap/4.4.0/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="<c:url value='/assets/plugins/fontawesome/css/fontawesome.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/assets/plugins/fontawesome/css/all.min.css'/>">

    <!-- Main CSS -->
    <link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>

    <script src=" <c:url value='/assets/js/html5shiv.min.js'/>"></script>
    <script src=" <c:url value='/assets/js/respond.min.js'/>"></script>
    <![endif]-->
</head>
<body>
<!-- Main Wrapper -->
<div class="main-wrapper">

    <!-- Header -->
    <header class="header">
        <nav class="navbar navbar-expand-lg header-nav">
            <div class="navbar-header">
                <a id="mobile_btn" href="javascript:void(0);">
							<span class="bar-icon">
								<span></span>
								<span></span>
								<span></span>
							</span>
                </a>
                <a href="<c:url value='/'/>" class="navbar-brand logo">
                    <img src="<c:url value='/assets/img/logo.png'/>" class="img-fluid" alt="Logo">
                </a>
            </div>
            <div class="main-menu-wrapper">
                <div class="menu-header">
                    <a href="<c:url value='/'/>" class="menu-logo">

                        <img src=" <c:url value='/assets/img/logo.png'/>" class="img-fluid" alt="Logo">
                    </a>
                    <a id="menu_close" class="menu-close" href="javascript:void(0);">
                        <i class="fas fa-times"></i>
                    </a>
                </div>
                <ul class="main-nav">
                    <li>
                        <a href="<c:url value='/'/>">Home</a>
                    </li>
                    <li class="has-submenu">
                        <a href="">Doctors <i class="fas fa-chevron-down"></i></a>
                        <ul class="submenu">
                            <li><a href="doctor-dashboard.html">Doctor Dashboard</a></li>
                            <li><a href="appointments.html">Appointments</a></li>
                            <li><a href="schedule-timings.html">Schedule Timing</a></li>
                            <li><a href="my-patients.html">Patients List</a></li>
                            <li><a href="patient-profile.html">Patients Profile</a></li>
                            <li><a href="chat-doctor.html">Chat</a></li>
                            <li><a href="invoices.html">Invoices</a></li>
                            <li><a href="doctor-profile-settings.html">Profile Settings</a></li>
                            <li><a href="reviews.html">Reviews</a></li>
                            <li><a href="doctor-register.html">Doctor Register</a></li>
                        </ul>
                    </li>
                    <li class="has-submenu active">
                        <a href="">Patients <i class="fas fa-chevron-down"></i></a>
                        <ul class="submenu">
                            <li><a href="<c:url value='/member/photo_settings/${member.memberPkId}'/>">Photo Settings</a></li>
                            <li  class="active"><a href="<c:url value='/member/basic_settings/${member.memberPkId}'/>">Basic Settings</a></li>
                            <li><a href="<c:url value='/memberDetails/profile_settings/${member.memberDetails.memberDetailsPkId}'/>">Profile Settings</a></li>
                            <li><a href="<c:url value='/change_password'/>">Change Password</a></li>
                            <li><a href="<c:url value='/logout'/>">Logout</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="admin/index.html" target="_blank">Admin</a>
                    </li>
                    <li class="login-link">
                        <a href="login">Login / Signup</a>
                    </li>
                </ul>
            </div>
            <ul class="nav header-navbar-rht">
                <!-- User Menu -->
                <li class="nav-item dropdown has-arrow logged-item">
                    <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
								<span class="user-img">
									<img class="rounded-circle" src="<c:url value='${member.photosImagePath}' />" onerror="this.src='<c:url value="/assets/img/DefaultPhoto.jpg"/>'" width="31">
								</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <div class="user-header">
                            <div class="avatar avatar-sm">
                                <img src="<c:url value='${member.photosImagePath}' />" onerror="this.src='<c:url value="/assets/img/DefaultPhoto.jpg"/>'" alt="User Image" class="avatar-img rounded-circle">
                            </div>
                            <div class="user-text">
                                <h6>${member.memberName}</h6>
                                <p class="text-muted mb-0">Patient</p>
                            </div>
                        </div>
<%--                        <a class="dropdown-item" href="patient-dashboard.html">Dashboard</a>--%>
                        <a class="dropdown-item" href="<c:url value='/member/photo_settings/${member.memberPkId}'/>">Photo Settings</a>
                        <a class="dropdown-item" href="<c:url value='/member/basic_settings/${member.memberPkId}'/>">Basic Settings</a>
                        <a class="dropdown-item" href="<c:url value='/memberDetails/profile_settings/${member.memberDetails.memberDetailsPkId}'/>">Profile Settings</a>
                        <a class="dropdown-item" href="<c:url value='/change_password'/>">Change Password</a>
                        <a class="dropdown-item" href="<c:url value='/logout'/>">Logout</a>
                    </div>
                </li>
                <!-- /User Menu -->

            </ul>
        </nav>
    </header>
    <!-- /Header -->

    <!-- Breadcrumb -->
    <div class="breadcrumb-bar">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col-md-12 col-12">
                    <nav aria-label="breadcrumb" class="page-breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Basic Settings</li>
                        </ol>
                    </nav>
                    <h2 class="breadcrumb-title">Basic Settings</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- /Breadcrumb -->

    <!-- Page Content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <!-- Profile Sidebar -->
                <div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">
                    <div class="profile-sidebar">
                        <div class="widget-profile pro-widget-content">
                            <div class="profile-info-widget">
                                <a href="#" class="booking-doc-img">
                                    <img src="<c:url value='${member.photosImagePath}' />" onerror="this.src='<c:url value="/assets/img/DefaultPhoto.jpg"/>'" alt="User Image">
                                </a>
                                <div class="profile-det-info">
                                    <h3>${member.memberName}</h3>
                                </div>
                            </div>
                        </div>
                        <div class="dashboard-widget">
                            <nav class="dashboard-menu">
                                <ul>
                                    <li>
                                        <a href="<c:url value='/member/photo_settings/${member.memberPkId}'/>">
                                            <i class="far fa-grin-squint-tears"></i>
                                            <span>Photo Settings</span>
                                        </a>
                                    </li>
                                    <li class="active">
                                        <a href="<c:url value='/member/basic_settings/${member.memberPkId}'/>">
                                            <i class="far fa-address-card"></i>
                                            <span>Basic Settings</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="<c:url value='/memberDetails/profile_settings/${member.memberDetails.memberDetailsPkId}'/>">
                                            <i class="fas fa-user-cog"></i>
                                            <span>Profile Settings</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="<c:url value='/change_password'/>">
                                            <i class="fas fa-lock"></i>
                                            <span>Change Password</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="<c:url value='/logout'/>">
                                            <i class="fas fa-sign-out-alt"></i>
                                            <span>Logout</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>

                    </div>
                </div>
                <!-- /Profile Sidebar -->

                <div class="col-md-7 col-lg-8 col-xl-9">
                    <div class="card">
                        <div class="card-body">

                            <!-- Profile Settings Form -->
                            <form action="<c:url value='/member/save'/>" method="post" enctype="multipart/form-data" >
                                <f class="row form-row">
                                    <div class="col-12 col-md-6" hidden="hidden">
                                        <div class="form-group">
                                            <label>Member PkId</label>
                                            <input type="text" class="form-control" name="memberPkId"  value="${member.memberPkId}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6" hidden="hidden">
                                        <div class="form-group">
                                            <label>Member PkId</label>
                                            <input type="text" class="form-control" name="memberDetails"  value="${member.memberDetails.memberDetailsPkId}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6" hidden="hidden">
                                        <div class="form-group">
                                            <label>Member PkId</label>
                                            <input type="text" class="form-control" name="enabled"  value="${member.enabled}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6" hidden="hidden">
                                        <div class="form-group">
                                            <label>Member Account</label>
                                            <input type="text" class="form-control" name="memberAccount"  value="${member.memberAccount}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6" hidden="hidden">
                                        <div class="form-group">
                                            <label>Member Pwd</label>
                                            <input type="text" class="form-control" name="memberPwd"  value="${member.memberPwd}" readonly>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label>Member Name</label>
                                            <input type="text" class="form-control" name="memberName" value="${member.memberName}">
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label>Member IdNumber</label>
                                            <input type="text" class="form-control" name="memberIdNumber" value="${member.memberIdNumber}" >
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label>Member Phone</label>
                                            <input type="text" class="form-control" name="memberPhone" value="${member.memberPhone}" >
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label>Member LineId</label>
                                            <input type="text" class="form-control" name="memberLineId" value="${member.memberLineId}" >
                                        </div>
                                    </div>
<%--                                    <div class="col-12 col-md-4">--%>
<%--                                        <label>Member Address</label>--%>
<%--                                        <div id="zipcode" class="form-group">--%>
<%--                                            <div class="f10" data-role="county"></div>--%>
<%--                                            <div class="f10" data-role="district"></div>--%>
<%--                                        </div>--%>
<%--                                        <script>--%>
<%--                                            $("#zipcode").twzipcode({--%>
<%--                                                "zipcodeIntoDistrict": true,--%>
<%--                                                "css": ["city form-control", "town form-control"],--%>
<%--                                                "countyName": "city", // ???????????? select name--%>
<%--                                                "districtName": "town" // ???????????? select name--%>
<%--                                            });--%>
<%--                                        </script>--%>
<%--                                        <style>--%>
<%--                                            .city, .town{width: 100%;}--%>
<%--                                            .f1{float:left;margin-left:5px;margin-right:5px;width:calc(5% - 10px)}--%>
<%--                                            .f2{float:left;margin-left:5px;margin-right:5px;width:calc(10% - 10px)}--%>
<%--                                            .f3{float:left;margin-left:5px;margin-right:5px;width:calc(15% - 10px)}--%>
<%--                                            .f4{float:left;margin-left:5px;margin-right:5px;width:calc(20% - 10px)}--%>
<%--                                            .f5{float:left;margin-left:5px;margin-right:5px;width:calc(25% - 10px)}--%>
<%--                                            .f6{float:left;margin-left:5px;margin-right:5px;width:calc(30% - 10px)}--%>
<%--                                            .f7{float:left;margin-left:5px;margin-right:5px;width:calc(35% - 10px)}--%>
<%--                                            .f8{float:left;margin-left:5px;margin-right:5px;width:calc(40% - 10px)}--%>
<%--                                            .f9{float:left;margin-left:5px;margin-right:5px;width:calc(45% - 10px)}--%>
<%--                                            .f10{float:left;margin-left:5px;margin-right:5px;width:calc(50% - 10px)}--%>
<%--                                            .f11{float:left;margin-left:5px;margin-right:5px;width:calc(55% - 10px)}--%>
<%--                                            .f12{float:left;margin-left:5px;margin-right:5px;width:calc(60% - 10px)}--%>
<%--                                            .f13{float:left;margin-left:5px;margin-right:5px;width:calc(65% - 10px)}--%>
<%--                                            .f14{float:left;margin-left:5px;margin-right:5px;width:calc(70% - 10px)}--%>
<%--                                            .f15{float:left;margin-left:5px;margin-right:5px;width:calc(75% - 10px)}--%>
<%--                                            .f16{float:left;margin-left:5px;margin-right:5px;width:calc(80% - 10px)}--%>
<%--                                            .f17{float:left;margin-left:5px;margin-right:5px;width:calc(85% - 10px)}--%>
<%--                                            .f18{float:left;margin-left:5px;margin-right:5px;width:calc(90% - 10px)}--%>
<%--                                            .f19{float:left;margin-left:5px;margin-right:5px;width:calc(95% - 10px)}--%>
<%--                                            .f20{float:left;margin-left:5px;margin-right:5px;width:calc(100% - 10px)}--%>
<%--                                        </style>--%>
<%--                                    </div>--%>
                                    <div class="col-12 col-md-6">
                                        <div class="form-group">
                                            <label>Member Address</label>
                                            <input type="text" class="form-control" name="memberAddress" value="${member.memberAddress}" >
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <div class="form-group"></div>
                                    </div>
                                    <div class="submit-section" style="text-align: center">
                                        <button type="submit"  class="btn btn-primary submit-btn">Save Changes</button>
                                        <input class="btn btn-primary" value="??????" type="button" onclick="buttin1()">
                                    </div>
                                </f>
                            </form>
                            <script>
                                function buttin1(){
                                    document.querySelector("body > div.main-wrapper > div.content > div > div > div.col-md-7.col-lg-8.col-xl-9 > div > div > form > f > div:nth-child(6) > div > input").value='???????????????????????????'
                                    document.querySelector("body > div.main-wrapper > div.content > div > div > div.col-md-7.col-lg-8.col-xl-9 > div > div > form > f > div:nth-child(7) > div > input").value='B987654321';
                                    document.querySelector("body > div.main-wrapper > div.content > div > div > div.col-md-7.col-lg-8.col-xl-9 > div > div > form > f > div:nth-child(8) > div > input").value='????????????????????????????????????13-15';
                                    document.querySelector("body > div.main-wrapper > div.content > div > div > div.col-md-7.col-lg-8.col-xl-9 > div > div > form > f > div:nth-child(9) > div > input").value='0987654321';
                                    document.querySelector("body > div.main-wrapper > div.content > div > div > div.col-md-7.col-lg-8.col-xl-9 > div > div > form > f > div:nth-child(10) > div > input").value='shawnhws0306@gmail.com';
                                }
                            </script>

                            <!-- /Profile Settings Form -->
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- /Page Content -->

    <!-- Footer -->
    <footer class="footer">

        <!-- Footer Top -->
        <div class="footer-top">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-md-6">

                        <!-- Footer Widget -->
                        <div class="footer-widget footer-about">
                            <div class="footer-logo">
                                <img src="<c:url value='/assets/img/footer-logo.png'/>" alt="logo">
                            </div>
                        </div>
                        <!-- /Footer Widget -->

                    </div>

                    <div class="col-lg-3 col-md-6">

                        <!-- Footer Widget -->
                        <div class="footer-widget footer-menu">
                            <h2 class="footer-title">For Patients</h2>
                            <ul>
<%--                                <li><a href="search.html"><i class="fas fa-angle-double-right"></i> Search for Doctors</a></li>--%>
                                <li><a href="<c:url value='/member/login'/>"><i class="fas fa-angle-double-right"></i> Login</a></li>
                                <li><a href="<c:url value='/register'/>"><i class="fas fa-angle-double-right"></i> Register</a></li>
<%--                                <li><a href="booking.html"><i class="fas fa-angle-double-right"></i> Booking</a></li>--%>
<%--                                <li><a href="patient-dashboard.html"><i class="fas fa-angle-double-right"></i> Patient Dashboard</a></li>--%>
                            </ul>
                        </div>
                        <!-- /Footer Widget -->

                    </div>

                    <div class="col-lg-3 col-md-6">

                        <!-- Footer Widget -->
                        <div class="footer-widget footer-menu">
                            <h2 class="footer-title">For Doctors</h2>
                            <ul>
                                <li><a href="appointments.html"><i class="fas fa-angle-double-right"></i> Appointments</a></li>
                                <li><a href="<c:url value='/member/basic_settings/${member.memberPkId}'/>"><i class="fas fa-angle-double-right"></i>Basic Settings</a></li>
                                <li><a href="login"><i class="fas fa-angle-double-right"></i> Login</a></li>
                                <li><a href="doctor-register.html"><i class="fas fa-angle-double-right"></i> Register</a></li>
                                <li><a href="doctor-dashboard.html"><i class="fas fa-angle-double-right"></i> Doctor Dashboard</a></li>
                            </ul>
                        </div>
                        <!-- /Footer Widget -->
                    </div>
                </div>
            </div>
        </div>
        <!-- /Footer Top -->

        <!-- Footer Bottom -->
        <div class="footer-bottom">
            <div class="container-fluid">

                <!-- Copyright -->
                <div class="copyright">
                    <div class="row">
                        <div class="col-md-6 col-lg-6">
                            <div class="copyright-text">
                                <p class="mb-0">&copy; 2019 Doccure. All rights <a href="http://www.bootstrapmb.com/" title="bootstrapmb">Reserved</a>.</p>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6">

                            <!-- Copyright Menu -->
                            <div class="copyright-menu">
                                <ul class="policy-menu">
                                    <li><a href="term-condition.html">Terms and Conditions</a></li>
                                    <li><a href="privacy-policy.html">Policy</a></li>
                                </ul>
                            </div>
                            <!-- /Copyright Menu -->

                        </div>
                    </div>
                </div>
                <!-- /Copyright -->

            </div>
        </div>
        <!-- /Footer Bottom -->

    </footer>
    <!-- /Footer -->

</div>
<%--<div class="container text-center" style="margin-top: 50px">--%>
<%--    <div>--%>

<%--        <form action="<c:url value="/logout"/>" method="post">--%>
<%--            <p>--%>
<%--                Welcome ${pageContext.request.userPrincipal.name}--%>
<%--            </p>--%>
<%--            <input type="submit" value="Sign Out"/>--%>
<%--        </form>--%>
<%--    </div>--%>

<%--    <div>--%>
<%--        <h1>List of Users</h1>--%>
<%--    </div>--%>

<%--    <div>--%>
<%--        <table class="table table-striped table-bordered">--%>
<%--            <thead class="thead-dark">--%>
<%--            <tr>--%>
<%--                <th>User ID</th>--%>
<%--                <th>Account</th>--%>
<%--                <th>Name</th>--%>
<%--                <th>Address</th>--%>
<%--                <th>Phone</th>--%>
<%--                <th>LineID</th>--%>
<%--            </tr>--%>
<%--            </thead>--%>
<%--            <tbody>--%>
<%--            <c:forEach var="member" items="${listMembers}">--%>
<%--                <tr>--%>
<%--                    <td>${member.memberPkId}</td>--%>
<%--                    <td>${member.memberAccount}</td>--%>
<%--                    <td>${member.memberName}</td>--%>
<%--                    <td>${member.memberAddress}</td>--%>
<%--                    <td>${member.memberPhone}</td>--%>
<%--                    <td>${member.memberLineId}</td>--%>
<%--                </tr>--%>
<%--            </c:forEach>--%>
<%--            </tbody>--%>
<%--        </table>--%>
<%--    </div>--%>
<%--</div>--%>

<!-- /Main Wrapper -->

<!-- jQuery -->
<script src="<c:url value='/assets/js/jquery.min.js'/>"></script>

<!-- Bootstrap Core JS -->
<script src="<c:url value='/assets/js/popper.min.js'/>"></script>
<script src="http://cdn.bootstrapmb.com/bootstrap/4.4.0/js/bootstrap.min.js"></script>

<!-- Select2 JS -->
<script src="<c:url value='/assets/plugins/select2/js/select2.min.js'/>"></script>

<!-- Datetimepicker JS -->
<script src="<c:url value='/assets/js/moment.min.js'/>"></script>
<script src="<c:url value='/assets/js/bootstrap-datetimepicker.min.js'/>"></script>

<!-- Sticky Sidebar JS -->
<script src="<c:url value='/assets/plugins/theia-sticky-sidebar/ResizeSensor.js'/>"></script>
<script src="<c:url value='/assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js'/>"></script>

<!-- Custom JS -->
<script src="<c:url value='/assets/js/script.js'/>"></script>
</body>
</html>
