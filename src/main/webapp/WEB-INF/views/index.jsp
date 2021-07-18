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

<script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
  <script src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>	
	
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>

    <script src=" <c:url value='/assets/js/html5shiv.min.js'/>"></script>
    <script src=" <c:url value='/assets/js/respond.min.js'/>"></script>
   <![endif]-->
<style>
                                           .city, .town{width: 100%;}
                                           .f1{float:left;margin-left:5px;margin-right:5px;width:calc(5% - 10px)}
                                           .f2{float:left;margin-left:5px;margin-right:5px;width:calc(10% - 10px)}
                                           .f3{float:left;margin-left:5px;margin-right:5px;width:calc(15% - 10px)}
                                           .f4{float:left;margin-left:5px;margin-right:5px;width:calc(20% - 10px)}
                                           .f5{float:left;margin-left:5px;margin-right:5px;width:calc(25% - 10px)}
                                           .f6{float:left;margin-left:5px;margin-right:5px;width:calc(30% - 10px)}
                                           .f7{float:left;margin-left:5px;margin-right:5px;width:calc(35% - 10px)}
                                           .f8{float:left;margin-left:5px;margin-right:5px;width:calc(40% - 10px)}
                                           .f9{float:left;margin-left:5px;margin-right:5px;width:calc(45% - 10px)}
                                           .f10{float:left;margin-left:5px;margin-right:5px;width:calc(50% - 10px)}
                                           .f11{float:left;margin-left:5px;margin-right:5px;width:calc(55% - 10px)}
                                           .f12{float:left;margin-left:5px;margin-right:5px;width:calc(60% - 10px)}
                                           .f13{float:left;margin-left:5px;margin-right:5px;width:calc(65% - 10px)}
                                           .f14{float:left;margin-left:5px;margin-right:5px;width:calc(70% - 10px)}
                                           .f15{float:left;margin-left:5px;margin-right:5px;width:calc(75% - 10px)}
                                           .f16{float:left;margin-left:5px;margin-right:5px;width:calc(80% - 10px)}
                                           .f17{float:left;margin-left:5px;margin-right:5px;width:calc(85% - 10px)}
                                           .f18{float:left;margin-left:5px;margin-right:5px;width:calc(90% - 10px)}
                                           .f19{float:left;margin-left:5px;margin-right:5px;width:calc(95% - 10px)}
                                           .f20{float:left;margin-left:5px;margin-right:5px;width:calc(100% - 10px)}
                                       </style>
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
        <div style="width: 800px;">
        
          <form action="<c:url value="/searchClinic" />">
<!--             <div class="form-group search-location"> -->
<!--               <input type="text" class="form-control" placeholder="Search Location"> -->
<!--               <span class="form-text">選擇縣市</span> -->
<!--             </div> -->
<!--             <div class="form-group search-info"> -->
<!--               <input type="text" class="form-control" placeholder="Search Doctors, Clinics, Hospitals, Diseases Etc"> -->
<!--               <span class="form-text">選擇市區</span> -->
<!--             </div> -->
              <div id="zipcode" style="margin-left: 110px" class="form-group">
                  <span class="f10" data-role="county" style="width: 100px"></span>
                  <span class="f10" data-role="district" style="width: 150px"></span>
                  <input name="likeString" style="width: 200px;display: inline;" type="text" placeholder="搜尋" class="form-control">
                  <button type="submit" class="btn btn-primary search-btn"><i class="fas fa-search"></i> <span>Search</span></button>
              </div>
            
          </form>
        </div>
        
<!--                                        <div class="col-12 col-md-4"> -->
<!--                                        <div id="zipcode" class="form-group"> -->
<!--                                            <span class="f10" data-role="county"></span> -->
<!--                                            <span class="f10" data-role="district" style="width: 300px"></span> -->
<!--                                        </div> -->
                                       <script>
                                           $("#zipcode").twzipcode({
                                               "zipcodeIntoDistrict": true,
                                               "css": ["city form-control", "town form-control"],
                                               "countyName": "clinicCity", // 指定城市 select name
                                               "districtName": "clinicDist" // 指定地區 select name
                                           });
                                       </script>
                                       
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
<%-- <script src="<c:url value='/assets/js/jquery.min.js'/>"></script> --%>

<!-- Bootstrap Core JS -->
<script src="<c:url value='/assets/js/popper.min.js'/>"></script>
<script src="http://cdn.bootstrapmb.com/bootstrap/4.4.0/js/bootstrap.min.js"></script>

<!-- Slick JS -->
<script src="<c:url value='/assets/js/slick.js'/>"></script>

<!-- Custom JS -->
<script src="<c:url value='/assets/js/script.js'/>"></script>
</body>
</html>
