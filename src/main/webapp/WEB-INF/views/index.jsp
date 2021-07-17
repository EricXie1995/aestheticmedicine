<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
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
        <a href="<c:url value=''/>" class="navbar-brand logo">
          <img src="<c:url value='/assets/img/logo.png'/>" class="img-fluid" alt="Logo">
        </a>
      </div>
      <div class="main-menu-wrapper">
        <div class="menu-header">
          <a href="<c:url value=''/>" class="menu-logo">

            <img src=" <c:url value='/assets/img/logo.png'/>" class="img-fluid" alt="Logo">
          </a>
          <a id="menu_close" class="menu-close" href="javascript:void(0);">
            <i class="fas fa-times"></i>
          </a>
        </div>
        <ul class="main-nav">
          <li>
            <a href="<c:url value=''/>">Home</a>
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
          <a class="nav-link header-login" href="<c:url value='/member/login'/>">login / Signup</a>
        </li>
      </ul>
    </nav>
  </header>
  <!-- /Header -->

  <!-- Home Banner -->
  <section class="section section-search">
    <div class="container-fluid">
      <div class="banner-wrapper">
        <div class="banner-header text-center">
          <h1>Search Doctor, Make an Appointment</h1>
          <p>Discover the best doctors, clinic & hospital the city nearest to you.</p>
        </div>

        <!-- Search -->
        <div class="search-box">
          <form action="search.html">
            <div class="form-group search-location">
              <input type="text" class="form-control" placeholder="Search Location">
              <span class="form-text">Based on your Location</span>
            </div>
            <div class="form-group search-info">
              <input type="text" class="form-control" placeholder="Search Doctors, Clinics, Hospitals, Diseases Etc">
              <span class="form-text">Ex : Dental or Sugar Check up etc</span>
            </div>
            <button type="submit" class="btn btn-primary search-btn"><i class="fas fa-search"></i> <span>Search</span></button>
          </form>
        </div>
        <!-- /Search -->

      </div>
    </div>
  </section>
  <!-- /Home Banner -->


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
                <li><a href="<c:url value='/member/login'/>"><i class="fas fa-angle-double-right"></i> Login</a></li>
                <li><a href="<c:url value='/register'/>"><i class="fas fa-angle-double-right"></i> Register</a></li>
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
                <li><a href="<c:url value='/member/login'/>"><i class="fas fa-angle-double-right"></i> Login</a></li>
                <li><a href="doctor-register.html"><i class="fas fa-angle-double-right"></i> Register</a></li>
                <li><a href="doctor-dashboard.html"><i class="fas fa-angle-double-right"></i> Doctor Dashboard</a></li>
              </ul>
            </div>
            <!-- /Footer Widget -->
          </div>
          <div class="col-lg-3 col-md-6">
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
<!-- jQuery -->
<script src="<c:url value='/assets/js/jquery.min.js'/>"></script>

<!-- Bootstrap Core JS -->
<script src="<c:url value='/assets/js/popper.min.js'/>"></script>
<script src="http://cdn.bootstrapmb.com/bootstrap/4.4.0/js/bootstrap.min.js"></script>

<!-- Slick JS -->
<script src="<c:url value='/assets/js/slick.js'/>"></script>

<!-- Custom JS -->
<script src="<c:url value='/assets/js/script.js'/>"></script>
</body>
</html>
