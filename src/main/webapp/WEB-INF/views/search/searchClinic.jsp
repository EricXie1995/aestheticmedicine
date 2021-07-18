<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>診所搜尋</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

  <!-- Favicons -->
<link href="<c:url value='/assets/img/favicon.png'></c:url>" rel="icon">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="http://cdn.bootstrapmb.com/bootstrap/4.4.0/css/bootstrap.min.css">
<!-- Fontawesome CSS -->
<link rel="stylesheet"
	href="<c:url value='/assets/plugins/fontawesome/css/fontawesome.min.css'></c:url>">
<link rel="stylesheet"
	href="<c:url value='/assets/plugins/fontawesome/css/all.min.css'></c:url>">

<!-- Datetimepicker CSS -->
		<link rel="stylesheet" href="<c:url value='/assets/css/bootstrap-datetimepicker.min.css'></c:url>">
<!-- Select2 CSS -->
	<link rel="stylesheet" href="<c:url value='/assets/plugins/select2/css/select2.min.css' />">
<!-- Fancybox CSS -->
	<link rel="stylesheet" href="<c:url value='/assets/plugins/fancybox/jquery.fancybox.min.css' />">
	<!-- Main CSS -->
<link rel="stylesheet"
	href="<c:url value='/assets/css/style.css'></c:url>">
	
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>
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
						<a href="<c:url value='/'/>" class="navbar-brand logo">
							<img src="assets/img/logo.png" class="img-fluid" alt="Logo">
						</a>
					</div>
					<div class="main-menu-wrapper">
						<div class="menu-header">
							<a href="index.html" class="menu-logo">
								<img src="assets/img/logo.png" class="img-fluid" alt="Logo">
							</a>
							<a id="menu_close" class="menu-close" href="javascript:void(0);">
								<i class="fas fa-times"></i>
							</a>
						</div>
						<ul class="main-nav">
							<li>
								<a href="index.html">Home</a>
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
									<li class="active"><a href="search.html">Search Doctor</a></li>
									<li><a href="doctor-profile.html">Doctor Profile</a></li>
									<li><a href="booking.html">Booking</a></li>
									<li><a href="checkout.html">Checkout</a></li>
									<li><a href="booking-success.html">Booking Success</a></li>
									<li><a href="patient-dashboard.html">Patient Dashboard</a></li>
									<li><a href="favourites.html">Favourites</a></li>
									<li><a href="chat.html">Chat</a></li>
									<li><a href="profile-settings.html">Profile Settings</a></li>
									<li><a href="change-password.html">Change Password</a></li>
								</ul>
							</li>	
							<li class="has-submenu">
								<a href="">Pages <i class="fas fa-chevron-down"></i></a>
								<ul class="submenu">
									<li><a href="voice-call.html">Voice Call</a></li>
									<li><a href="video-call.html">Video Call</a></li>
									<li><a href="search.html">Search Doctors</a></li>
									<li><a href="calendar.html">Calendar</a></li>
									<li><a href="components.html">Components</a></li>
									<li class="has-submenu">
										<a href="invoices.html">Invoices</a>
										<ul class="submenu">
											<li><a href="invoices.html">Invoices</a></li>
											<li><a href="invoice-view.html">Invoice View</a></li>
										</ul>
									</li>
									<li><a href="blank-page.html">Starter Page</a></li>
									<li><a href="login.html">Login</a></li>
									<li><a href="register.html">Register</a></li>
									<li><a href="forgot-password.html">Forgot Password</a></li>
								</ul>
							</li>
							<li>
								<a href="admin/index.html" target="_blank">Admin</a>
							</li>
							<li class="login-link">
								<a href="login.html">Login / Signup</a>
							</li>
						</ul>
					</div>		 
					<ul class="nav header-navbar-rht">
<!-- 						<li class="nav-item contact-item"> -->
<!-- 							<div class="header-contact-img"> -->
<!-- 								<i class="far fa-hospital"></i>							 -->
<!-- 							</div> -->
<!-- 							<div class="header-contact-detail"> -->
<!-- 								<p class="contact-header">Contact</p> -->
<!-- 								<p class="contact-info-header"> +1 315 369 5943</p> -->
<!-- 							</div> -->
<!-- 						</li> -->
						<li class="nav-item">
							<a class="nav-link header-login" href="login.html">login / Signup </a>
						</li>
					</ul>
				</nav>
			</header>
			<!-- /Header -->
			
			<!-- Breadcrumb -->
			<div class="breadcrumb-bar">
				<div class="container-fluid">
					<div class="row align-items-center">
						<div class="col-md-8 col-12">
							<nav aria-label="breadcrumb" class="page-breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">Search</li>
								</ol>
							</nav>
							<h2 class="breadcrumb-title">2245 matches found for : Dentist In Bangalore</h2>
						</div>
<!-- 						<div class="col-md-4 col-12 d-md-block d-none"> -->
<!-- 							<div class="sort-by"> -->
<!-- 								<span class="sort-title">Sort by</span> -->
<!-- 								<span class="sortby-fliter"> -->
<!-- 									<select class="select"> -->
<!-- 										<option>Select</option> -->
<!-- 										<option class="sorting">Rating</option> -->
<!-- 										<option class="sorting">Popular</option> -->
<!-- 										<option class="sorting">Latest</option> -->
<!-- 										<option class="sorting">Free</option> -->
<!-- 									</select> -->
<!-- 								</span> -->
<!-- 							</div> -->
<!-- 						</div> -->
					</div>
				</div>
			</div>
			<!-- /Breadcrumb -->
			
			<!-- Page Content -->
			<div class="content">
				<div class="container-fluid">

					<div class="row">
						<div class="col-md-12 col-lg-4 col-xl-3 theiaStickySidebar">
<!-- 						<div id="zipcode" style="margin-left: 110px"> -->
<!--                   <span class="f10" data-role="county" style="width: 100px"></span> -->
<!--                   <span class="f10" data-role="district" style="width: 150px"></span> -->
<!--               </div> -->
							<!-- Search Filter -->
							<div class="card search-filter">
							<form action="<c:url value="/searchClinic" />">
								<div class="card-header">
									<h4 class="card-title mb-0">Search Filter</h4>
								</div>
								<div class="card-body">
								<div class="filter-widget">
										<div id="zipcode" style="margin-bottom: 10px">
                  <span class="f10" data-role="county"></span>
                  <span class="f10" data-role="district"></span>
              </div>
              <input type="hidden" name="likeString" value="">
								</div>
								<div class="filter-widget">
								
									<h4 style="margin-top: 10px">五官美容</h4>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="gender" value="臉廓整形">
											<span class="checkmark"></span> 臉廓整形
										</label>
									</div>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="gender" value="鼻部整形">
											<span class="checkmark"></span> 鼻部整形
										</label>
									</div>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="gender" value="眼部整形">
											<span class="checkmark"></span> 眼部整形
										</label>
									</div>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="gender" value="口唇整形">
											<span class="checkmark"></span> 口唇整形
										</label>
									</div>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="gender" value="耳部整形">
											<span class="checkmark"></span> 耳部整形
										</label>
									</div>
									
									<h4>美體美容</h4>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="gender" value="胸部整形">
											<span class="checkmark"></span> 胸部整形
										</label>
									</div>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="gender" value="吸脂瘦身">
											<span class="checkmark"></span> 吸脂瘦身
										</label>
									</div>
											
									
									<h4>皮膚美容</h4>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="gender" value="祛斑美膚">
											<span class="checkmark"></span> 祛斑美膚
										</label>
									</div>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="gender" value="凈膚抗敏">
											<span class="checkmark"></span> 凈膚抗敏
										</label>
									</div>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="gender" value="嫩膚美白">
											<span class="checkmark"></span> 嫩膚美白
										</label>
									</div>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="gender" value="永久脫毛">
											<span class="checkmark"></span> 永久脫毛
										</label>
									</div>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="gender" value="除皺緊膚">
											<span class="checkmark"></span> 除皺緊膚
										</label>
									</div>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="gender" value="藝術紋繡">
											<span class="checkmark"></span> 藝術紋繡
										</label>
									</div>
									
									<h4>無創美容</h4>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="gender" value="微整形">
											<span class="checkmark"></span> 微整形
										</label>
									</div>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="gender" value="抗衰老">
											<span class="checkmark"></span> 抗衰老
										</label>
									</div>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="gender" value="年輕化">
											<span class="checkmark"></span> 年輕化
										</label>
									</div>

									
									<h4>口腔美容</h4>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="gender" value="明星美牙">
											<span class="checkmark"></span> 明星美牙
										</label>
									</div>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="gender" value="牙齒正畸">
											<span class="checkmark"></span> 牙齒正畸
										</label>
									</div>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="gender" value="活動義齒修復">
											<span class="checkmark"></span> 活動義齒修復
										</label>
									</div>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="gender" value="口腔治療">
											<span class="checkmark"></span> 口腔治療
										</label>
									</div>

									<h4>其他美容</h4>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="gender" value="私處整形">
											<span class="checkmark"></span> 私處整形
										</label>
									</div>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="gender" value="處女膜修復">
											<span class="checkmark"></span> 處女膜修復
										</label>
									</div>
									
								</div>
								<div class="filter-widget">
								</div>
									<div class="btn-search">
										<button type="submit" class="btn btn-block">Search</button>
									</div>	
								</div>
								</form>
							</div>
							<!-- /Search Filter -->
							
						</div>
						
						<div class="col-md-12 col-lg-8 col-xl-9">

							<!-- Doctor Widget -->
							<c:forEach var="clinic" items="${page.content}">
							<div class="card">
								<div class="card-body">
									<div class="doctor-widget">
										<div class="doc-info-left">
											<div class="doctor-img">
												<a href="doctor-profile.html">
													<img src="<c:url value='${clinic.clinicImage}' />" class="img-fluid" alt="User Image">
												</a>
											</div>
											<div class="doc-info-cont">
												<h4 class="doc-name"><a href="doctor-profile.html"></a>${clinic.clinicName}</h4><br>
												<p class="doc-speciality">電話: ${clinic.clinicPhone}</p>
												<div class="clinic-details">
													<p class="doc-location"><i class="fas fa-map-marker-alt"></i>地址: ${clinic.clinicAddress}</p>
													<p class="doc-speciality">營業時間: ${clinic.BHours}</p>
<!-- 													<ul class="clinic-gallery"> -->
<!-- 														<li> -->
<!-- 															<a href="assets/img/features/feature-01.jpg" data-fancybox="gallery"> -->
<!-- 																<img src="assets/img/features/feature-01.jpg" alt="Feature"> -->
<!-- 															</a> -->
<!-- 														</li> -->
<!-- 														<li> -->
<!-- 															<a href="assets/img/features/feature-02.jpg" data-fancybox="gallery"> -->
<!-- 																<img  src="assets/img/features/feature-02.jpg" alt="Feature"> -->
<!-- 															</a> -->
<!-- 														</li> -->
<!-- 														<li> -->
<!-- 															<a href="assets/img/features/feature-03.jpg" data-fancybox="gallery"> -->
<!-- 																<img src="assets/img/features/feature-03.jpg" alt="Feature"> -->
<!-- 															</a> -->
<!-- 														</li> -->
<!-- 														<li> -->
<!-- 															<a href="assets/img/features/feature-04.jpg" data-fancybox="gallery"> -->
<!-- 																<img src="assets/img/features/feature-04.jpg" alt="Feature"> -->
<!-- 															</a> -->
<!-- 														</li> -->
<!-- 													</ul> -->
											</div>
												<div class="clinic-services">
													<c:forEach var="type" items="${fn:split(clinic.clinicType, ',')}">
														<span>${type}</span>
													</c:forEach>
												</div>
											</div>
										</div>
										<div class="doc-info-right">
										
												<ul class="clinic-gallery">
														<li style="list-style-type:none;">
															<a href="assets/img/features/feature-01.jpg" data-fancybox="gallery">
																<img style="width: 60px;height: 60px" src="assets/img/features/feature-01.jpg" alt="Feature">
															</a>
<!-- 														</li> -->
<!-- 														<li> --> &nbsp;
															<a href="assets/img/features/feature-02.jpg" data-fancybox="gallery">
																<img style="width: 60px;height: 60px" src="assets/img/features/feature-02.jpg" alt="Feature">
															</a>
														</li>
														<br>
														<li style="list-style-type:none;">
															<a href="assets/img/features/feature-03.jpg" data-fancybox="gallery">
																<img style="width: 60px;height: 60px" src="assets/img/features/feature-03.jpg" alt="Feature">
															</a>
<!-- 														</li> -->
<!-- 														<li> --> &nbsp;
															<a href="assets/img/features/feature-04.jpg" data-fancybox="gallery">
																<img style="width: 60px;height: 60px" src="assets/img/features/feature-04.jpg" alt="Feature">
															</a>
														</li>
													</ul>
<!-- 											<div class="clini-infos"> -->
<!-- 												<ul> -->
<!-- 													<li><i class="far fa-thumbs-up"></i> 98%</li> -->
<!-- 													<li><i class="far fa-comment"></i> 17 Feedback</li> -->
<!-- 													<li><i class="fas fa-map-marker-alt"></i> Florida, USA</li> -->
<!-- 													<li><i class="far fa-money-bill-alt"></i> $300 - $1000 <i class="fas fa-info-circle" data-toggle="tooltip" title="Lorem Ipsum"></i> </li> -->
<!-- 												</ul> -->
<!-- 											</div> -->
											<div class="clinic-booking">
												<a class="view-pro-btn" href="doctor-profile.html">前往網站</a>
												
												<a class="apt-btn" href="<c:url value="/appointment/appointment1" />">預約</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /Doctor Widget -->
							</c:forEach>


<!-- 							<div class="load-more text-center"> -->
<!-- 								<a class="btn btn-primary btn-sm" href="javascript:void(0);">Load More</a>	 -->
<!-- 							</div>	 -->
						</div>
					</div>

				</div>

			</div>		
			<!-- /Page Content -->
			
			<div class="containerpage" style="margin-left: 700px">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<%--                 <c:if test="${!page.first}"> --%>
						<li><a class="page-link"
							href="<c:url value='/searchClinic?page=0&gender=${checkType}&clinicCity=${city}&clinicDist=${dist}&likeString=${like}' />"
							aria-label="Previous"> <span aria-hidden="true">&lt;&lt;</span>
						</a></li>
						<%--                  </c:if> --%>
						<c:if test="${!page.first}">
							<li class="disable"><a class="page-link"
								href="<c:url value='/searchClinic?page=${page.number-1}&gender=${checkType}&clinicCity=${city}&clinicDist=${dist}&likeString=${like}' />"
								aria-label="Previous"> <span aria-hidden="true">&lt;</span>
							</a></li>
						</c:if>

						<c:forEach begin="0" end="${(page.totalPages-1) > 0 ? page.totalPages-1:0}" var="i" step="1">
							<c:if test="${i==page.number}">
								<li style="opacity:0.4"><a class="page-link"
									href="<c:url value='/searchClinic?page=${i}&gender=${checkType}&clinicCity=${city}&clinicDist=${dist}&likeString=${like}' />">${i+1}</a>
								</li>
							</c:if>
							<c:if test="${i!=page.number}">
								<li><a class="page-link"
									href="<c:url value='/searchClinic?page=${i}&gender=${checkType}&clinicCity=${city}&clinicDist=${dist}&likeString=${like}' />">${i+1}</a>
								</li>
							</c:if>
						</c:forEach>

						<c:if test="${!page.last}">
							<li><a class="page-link"
								href="<c:url value='/searchClinic?page=${page.number+1}&gender=${checkType}&clinicCity=${city}&clinicDist=${dist}&likeString=${like}' />"
								aria-label="Next"> <span aria-hidden="true">&gt;</span>
							</a></li>
						</c:if>
						<%--                     <c:if test="${!page.last}"> --%>
						<li><a class="page-link"
							href="<c:url value='/searchClinic?page=${page.totalPages-1}&gender=${checkType}&clinicCity=${city}&clinicDist=${dist}&likeString=${like}' />"
							aria-label="Next"> <span aria-hidden="true">&gt;&gt;</span>
						</a></li>
						<%--                     </c:if> --%>
					</ul>
				</nav>
			</div>
   
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
										<img src="assets/img/footer-logo.png" alt="logo">
									</div>
									<div class="footer-about-content">
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
										<div class="social-icon">
											<ul>
												<li>
													<a href="#" target="_blank"><i class="fab fa-facebook-f"></i> </a>
												</li>
												<li>
													<a href="#" target="_blank"><i class="fab fa-twitter"></i> </a>
												</li>
												<li>
													<a href="#" target="_blank"><i class="fab fa-linkedin-in"></i></a>
												</li>
												<li>
													<a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
												</li>
												<li>
													<a href="#" target="_blank"><i class="fab fa-dribbble"></i> </a>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<!-- /Footer Widget -->
								
							</div>
							
							<div class="col-lg-3 col-md-6">
							
								<!-- Footer Widget -->
								<div class="footer-widget footer-menu">
									<h2 class="footer-title">For Patients</h2>
									<ul>
										<li><a href="search.html"><i class="fas fa-angle-double-right"></i> Search for Doctors</a></li>
										<li><a href="login.html"><i class="fas fa-angle-double-right"></i> Login</a></li>
										<li><a href="register.html"><i class="fas fa-angle-double-right"></i> Register</a></li>
										<li><a href="booking.html"><i class="fas fa-angle-double-right"></i> Booking</a></li>
										<li><a href="patient-dashboard.html"><i class="fas fa-angle-double-right"></i> Patient Dashboard</a></li>
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
										<li><a href="login.html"><i class="fas fa-angle-double-right"></i> Login</a></li>
										<li><a href="doctor-register.html"><i class="fas fa-angle-double-right"></i> Register</a></li>
										<li><a href="doctor-dashboard.html"><i class="fas fa-angle-double-right"></i> Doctor Dashboard</a></li>
									</ul>
								</div>
								<!-- /Footer Widget -->
								
							</div>
							
							<div class="col-lg-3 col-md-6">
							
								<!-- Footer Widget -->
								<div class="footer-widget footer-contact">
									<h2 class="footer-title">Contact Us</h2>
									<div class="footer-contact-info">
										<div class="footer-address">
											<span><i class="fas fa-map-marker-alt"></i></span>
											<p> 3556  Beech Street, San Francisco,<br> California, CA 94108 </p>
										</div>
										<p>
											<i class="fas fa-phone-alt"></i>
											+1 315 369 5943
										</p>
										<p class="mb-0">
											<i class="fas fa-envelope"></i>
											doccure@example.com
										</p>
									</div>
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


<!-- jQuery -->
	<script src="<c:url value='/assets/js/jquery.min.js' />"></script>
	<!-- Bootstrap Core JS -->
	<script src="<c:url value='/assets/js/popper.min.js' />"></script>
	<script
		src="http://cdn.bootstrapmb.com/bootstrap/4.4.0/js/bootstrap.min.js"></script>
	<!-- Sticky Sidebar JS -->
	<script
		src="<c:url value='/assets/plugins/theia-sticky-sidebar/ResizeSensor.js' />"></script>
	<script
		src="<c:url value='/assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js' />"></script>
	
<!-- 	<!-- Select2 JS --> 
		<script src="<c:url value='/assets/plugins/select2/js/select2.min.js' />"></script>
		<!-- Datetimepicker JS -->
		<script src="<c:url value='/assets/js/moment.min.js' />"></script>
		<script src="<c:url value='/assets/js/bootstrap-datetimepicker.min.js' />"></script>
		
		<!-- Fancybox JS -->
		<script src="<c:url value='/assets/plugins/fancybox/jquery.fancybox.min.js' />"></script>
		<!-- Custom JS -->
	<script src="<c:url value='/assets/js/script.js' />"></script>
	  <script src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>
	   <script>
                                           $("#zipcode").twzipcode({
                                               "zipcodeIntoDistrict": true,
                                               "css": ["city form-control", "town form-control"],
                                               "countyName": "clinicCity", // 指定城市 select name
                                               "districtName": "clinicDist" // 指定地區 select name
                                           });
                                       </script>
</body>
</html>