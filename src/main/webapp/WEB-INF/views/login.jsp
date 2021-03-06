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
                            <li><a href="doctor-register.html">Doctor <c:url value='/register'/></a></li>
                        </ul>
                    </li>
                    <li class="has-submenu active">
                        <a href="">Patients <i class="fas fa-chevron-down"></i></a>
                        <ul class="submenu">
<%--                            <li><a href="search.html">Search Doctor</a></li>--%>
<%--                            <li><a href="doctor-profile.html">Doctor Profile</a></li>--%>
<%--                            <li><a href="booking.html">Booking</a></li>--%>
<%--                            <li><a href="checkout.html">Checkout</a></li>--%>
<%--                            <li><a href="booking-success.html">Booking Success</a></li>--%>
<%--                            <li><a href="patient-dashboard.html">Patient Dashboard</a></li>--%>
<%--                            <li><a href="favourites.html">Favourites</a></li>--%>
                            <li  class="active"><a href="<c:url value='/member/photo_settings/${member.memberPkId}'/>">Photo Settings</a></li>
                            <li><a href="<c:url value='/member/basic_settings/${member.memberPkId}'/>">Basic Settings</a></li>
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
                <li class="nav-item">
                    <a class="nav-link header-login" href="<c:url value='/member/login'/>">login / Signup </a>
                </li>
            </ul>
        </nav>
    </header>
    <!-- /Header -->

    <!-- Page Content -->
    <div class="content">
        <div class="container-fluid">

            <div class="row">
                <div class="col-md-8 offset-md-2">

                    <!-- Login Tab Content -->
                    <div class="account-content">
                        <div class="row align-items-center justify-content-center">
                            <div class="col-md-7 col-lg-6 login-left">
                                <img src="<c:url value='/assets/img/login-banner.png'/>" class="img-fluid" alt="Doccure Login">
                            </div>
                            <div class="col-md-12 col-lg-6 login-right">
                                <div class="login-header">
                                    <h3>Login <span>Doccure</span></h3>
                                </div>
                                <div class="text-danger">
                                    <c:if test="${message != null}">
                                        <p>${message}</p>
                                    </c:if>
                                    <c:if test="${error != null}">
                                        <p>${error}</p>
                                    </c:if>
                                </div>

                                <div class="text-danger">
                                    <c:if test="${param.error}">
<%--                                        <p>${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}</p>--%>
                                        <p>Account or password error, please enter again</p>
                                    </c:if>
                                </div>

                                <div class="text-warning">
                                    <c:if test="${param.logout}">
                                        <p>You have been logged out</p>
                                    </c:if>
                                </div>
                                <form action="<c:url value='/member/login'/>" method="post">
                                    <div class="form-group form-focus">
                                        <input type="email" name="memberAccount" class="form-control floating">
                                        <label class="focus-label">Email</label>
                                    </div>
                                    <div class="form-group form-focus">
                                        <input type="password" name="memberPwd" class="form-control floating">
                                        <label class="focus-label">Password</label>
                                    </div>
                                    <p>
                                        <input type="checkbox" name="remember-me" />&nbsp;Remember Me
                                    </p>
                                    <div class="text-right">
                                        <a class="forgot-link" href="<c:url value='/forgot_password'/>">Forgot Password ?</a>
                                    </div>
                                    <button class="btn btn-primary btn-block btn-lg login-btn" type="submit">Login</button>
                                    <div class="login-or">
                                        <span class="or-line"></span>
                                        <span class="span-or">or</span>
                                    </div>
                                    <div class="row form-row social-login">
<%--                                        <div class="col-6">--%>
<%--                                            <a href="#" class="btn btn-facebook btn-block"><i class="fab fa-facebook-f mr-1"></i> Login</a>--%>
<%--                                        </div>--%>
                                        <div class="col-12">
                                            <a href="<c:url value='/oauth2/authorization/google'/>" class="btn btn-google btn-block"><i class="fab fa-google mr-1"></i> Login</a>
                                        </div>
                                    </div>
                                    <div class="text-center dont-have">Don???t have an account? <a href="<c:url value='/register'/>">Register</a></div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- /Login Tab Content -->

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
                                <li><a href="chat.html"><i class="fas fa-angle-double-right"></i> Chat</a></li>
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
<!-- /Main Wrapper -->
<script src="<c:url value='/assets/js/jquery.min.js'/>"></script>

<!-- Bootstrap Core JS -->

<script src="<c:url value='/assets/js/popper.min.js'/>"></script>
<script src="http://cdn.bootstrapmb.com/bootstrap/4.4.0/js/bootstrap.min.js"></script>

<!-- Custom JS -->
<script src="<c:url value='/assets/js/script.js'/>"></script>

</body>
</html>
