<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Doccure</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0">

<!-- Favicons -->
<link type="image/x-icon" href="../assets/img/favicon.png" rel="icon">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="http://cdn.bootstrapmb.com/bootstrap/4.4.0/css/bootstrap.min.css">

<!-- Fontawesome CSS -->
<link rel="stylesheet"
	href="../assets/plugins/fontawesome/css/fontawesome.min.css">
<link rel="stylesheet"
	href="../assets/plugins/fontawesome/css/all.min.css">

<!-- Main CSS -->
<link rel="stylesheet" href="../assets/css/style.css">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->


</head>
<body>


	<!-- Main Wrapper -->
	<div class="main-wrapper">

		<!-- Header -->
		<header class="header">
			<nav class="navbar navbar-expand-lg header-nav">
				<div class="navbar-header">
					<a id="mobile_btn" href="javascript:void(0);"> <span
						class="bar-icon"> <span></span> <span></span> <span></span>
					</span>
					</a> <a href="index.html" class="navbar-brand logo"> <img
						src="../assets/img/logo.png" class="img-fluid" alt="Logo">
					</a>
				</div>
				<div class="main-menu-wrapper">
					<div class="menu-header">
						<a href="index.html" class="menu-logo"> <img
							src="../assets/img/logo.png" class="img-fluid" alt="Logo">
						</a> <a id="menu_close" class="menu-close" href="javascript:void(0);">
							<i class="fas fa-times"></i>
						</a>
					</div>
					<ul class="main-nav">
						<li><a href="index.html">Home</a></li>
						<li class="has-submenu active"><a href="">Doctors <i
								class="fas fa-chevron-down"></i></a>
							<ul class="submenu">
								<li><a href="doctor-dashboard.html">Doctor Dashboard</a></li>
								<li><a href="appointments.html">Appointments</a></li>
								<li class="active"><a href="schedule-timings.html">Schedule
										Timing</a></li>
								<li><a href="my-patients.html">Patients List</a></li>
								<li><a href="patient-profile.html">Patients Profile</a></li>
								<li><a href="chat-doctor.html">Chat</a></li>
								<li><a href="invoices.html">Invoices</a></li>
								<li><a href="doctor-profile-settings.html">Profile
										Settings</a></li>
								<li><a href="reviews.html">Reviews</a></li>
								<li><a href="doctor-register.html">Doctor Register</a></li>
							</ul></li>
						<li class="has-submenu"><a href="">Patients <i
								class="fas fa-chevron-down"></i></a>
							<ul class="submenu">
								<li><a href="search.html">Search Doctor</a></li>
								<li><a href="doctor-profile.html">Doctor Profile</a></li>
								<li><a href="booking.html">Booking</a></li>
								<li><a href="checkout.html">Checkout</a></li>
								<li><a href="booking-success.html">Booking Success</a></li>
								<li><a href="patient-dashboard.html">Patient Dashboard</a></li>
								<li><a href="favourites.html">Favourites</a></li>
								<li><a href="chat.html">Chat</a></li>
								<li><a href="profile-settings.html">Profile Settings</a></li>
								<li><a href="change-password.html">Change Password</a></li>
							</ul></li>
						<li class="has-submenu"><a href="">Pages <i
								class="fas fa-chevron-down"></i></a>
							<ul class="submenu">
								<li><a href="voice-call.html">Voice Call</a></li>
								<li><a href="video-call.html">Video Call</a></li>
								<li><a href="search.html">Search Doctors</a></li>
								<li><a href="calendar.html">Calendar</a></li>
								<li><a href="components.html">Components</a></li>
								<li class="has-submenu"><a href="invoices.html">Invoices</a>
									<ul class="submenu">
										<li><a href="invoices.html">Invoices</a></li>
										<li><a href="invoice-view.html">Invoice View</a></li>
									</ul></li>
								<li><a href="blank-page.html">Starter Page</a></li>
								<li><a href="login.html">Login</a></li>
								<li><a href="register.html">Register</a></li>
								<li><a href="forgot-password.html">Forgot Password</a></li>
							</ul></li>
						<li><a href="admin/index.html" target="_blank">Admin</a></li>
						<li class="login-link"><a href="login.html">Login /
								Signup</a></li>
					</ul>
				</div>
				<ul class="nav header-navbar-rht">
					<li class="nav-item contact-item">
						<div class="header-contact-img">
							<i class="far fa-hospital"></i>
						</div>
						<div class="header-contact-detail">
							<p class="contact-header">Contact</p>
							<p class="contact-info-header">+1 315 369 5943</p>
						</div>
					</li>

					<!-- User Menu -->
					<li class="nav-item dropdown has-arrow logged-item"><a
						href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
							<span class="user-img"> <img class="rounded-circle"
								src="../assets/img/doctors/doctor-thumb-02.jpg" width="31"
								alt="Darren Elder">
						</span>
					</a>
						<div class="dropdown-menu dropdown-menu-right">
							<div class="user-header">
								<div class="avatar avatar-sm">
									<img src="../assets/img/doctors/doctor-thumb-02.jpg"
										alt="User Image" class="avatar-img rounded-circle">
								</div>
								<div class="user-text">
									<h6>Darren Elder</h6>
									<p class="text-muted mb-0">Doctor</p>
								</div>
							</div>
							<a class="dropdown-item" href="doctor-dashboard.html">Dashboard</a>
							<a class="dropdown-item" href="doctor-profile-settings.html">Profile
								Settings</a> <a class="dropdown-item" href="login.html">Logout</a>
						</div></li>
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
								<li class="breadcrumb-item active" aria-current="page">Schedule
									Timings</li>
							</ol>
						</nav>
						<h2 class="breadcrumb-title">Schedule Timings</h2>
					</div>
				</div>
			</div>
		</div>
		<!-- /Breadcrumb -->

		<!-- Page Content -->
		<div class="content">
			<div class="container-fluid">

				<div class="row">
					<div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">

						<!-- Profile Sidebar -->
						<div class="profile-sidebar">
							<div class="widget-profile pro-widget-content">
								<div class="profile-info-widget">
									<a href="#" class="booking-doc-img"> <img
										src="../assets/img/doctors/doctor-thumb-02.jpg"
										alt="User Image">
									</a>
									<div class="profile-det-info">
										<h3>Dr. Darren Elder</h3>

										<div class="patient-details">
											<h5 class="mb-0">BDS, MDS - Oral & Maxillofacial Surgery</h5>
										</div>
									</div>
								</div>
							</div>
							<div class="dashboard-widget">
								<nav class="dashboard-menu">
									<ul>
										<li><a href="doctor-dashboard.html"> <i
												class="fas fa-columns"></i> <span>Dashboard</span>
										</a></li>
										<li><a href="appointments.html"> <i
												class="fas fa-calendar-check"></i> <span>Appointments</span>
										</a></li>
										<li><a href="my-patients.html"> <i
												class="fas fa-user-injured"></i> <span>My Patients</span>
										</a></li>
										<li class="active"><a href="schedule-timings.html"> <i
												class="fas fa-hourglass-start"></i> <span>Schedule
													Timings</span>
										</a></li>
										<li><a href="invoices.html"> <i
												class="fas fa-file-invoice"></i> <span>Invoices</span>
										</a></li>
										<li><a href="reviews.html"> <i class="fas fa-star"></i>
												<span>Reviews</span>
										</a></li>
										<li><a href="chat-doctor.html"> <i
												class="fas fa-comments"></i> <span>Message</span> <small
												class="unread-msg">23</small>
										</a></li>
										<li><a href="doctor-profile-settings.html"> <i
												class="fas fa-user-cog"></i> <span>Profile Settings</span>
										</a></li>
										<li><a href="social-media.html"> <i
												class="fas fa-share-alt"></i> <span>Social Media</span>
										</a></li>
										<li><a href="doctor-change-password.html"> <i
												class="fas fa-lock"></i> <span>Change Password</span>
										</a></li>
										<li><a href="index.html"> <i
												class="fas fa-sign-out-alt"></i> <span>Logout</span>
										</a></li>
									</ul>
								</nav>
							</div>
						</div>
						<!-- /Profile Sidebar -->

					</div>

					<div class="col-md-7 col-lg-8 col-xl-9">

						<div class="row">
							<div class="col-sm-12">
								<div class="card">
									<div class="card-body">








										<h4 class="card-title">開始您的預約</h4>
										<div class="usericon"></div>
										<form style="width: 55%; margin: 10px;">
											<div class="formcontainer">
												<div class="containerf"
													style="width: 80%; padding: 5px; margin: 30px;">
													<h3>
														<i class=""></i>預約資料填寫
													</h3>
													<div>
														<span> <label for="City"><strong>縣市：</strong></label>
														</span> <select name="clinicCity" id="city"
															class="form-control form-control-lg"
															style="display: inline; width: 40%;">
															<option id="clinicCityDefault" disabled selected>請選擇</option>
															<c:forEach var="city" items="${cities}" varStatus="vs">
																<option value="${city.cityPkId}">${city.cityName}</option>
															</c:forEach>
														</select><br> <span> <label for="Dist"><strong>鄉鎮區：</strong></label>
														</span> <select name="clinicDist" id="dist"
															class="form-control form-control-lg"
															style="display: inline; width: 40%">
															<option id="distDefault" value="0" selected disabled>請選擇</option>
														</select> <br>
													</div>
													<span> <label for="date">您想選擇的日期：</label></span> <input
														type="date" id="date" name="appointdate"
														style="width: 40%"> <span><label for="time"><strong>您想預約的時間：</strong></label></span>
													<select name="time" id="time"
														class="form-control form-control-lg"
														style="display: inline; width: 40%">
														<option id="timedefault" selected disabled>請選擇</option>
													</select> <span><label for="item"><strong>治療項目：</strong></label></span>
													<select name="item" id="item"
														class="form-control form-control-lg"
														style="display: inline; width: 40%">
														<option id="itemdefault" selected disabled>請選擇</option>
														<c:forEach var="item" items="${items}">
															<option value="${item.itemPkId}">${item.itemName}</option>
														</c:forEach>
													</select>
												</div>
											</div>

											<button type="button" class="btn btn-dark" id="sdentist"
												style="margin-left: 150px;">搜尋醫生/診所</button>
										</form>


										<!--醫生診所搜尋列表-->
										<div class="modal fade right" id="searchresult">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<div id="close">
															<span class="close">&times;</span>
														</div>
														<h4 id="ctitle" class="modal-title">醫生診所搜尋結果</h4>
														<div id="searchtitle"></div>
													</div>
													<div class="modal-body experimentMakeAnOffer" id="ccontent">
													</div>
													<div id="den"></div>
													<span id="errorMsgSametime"
														style="color: red; text-align: center; display: block;">${errorMsgSametime}</span><br />
													<p id="empty" style="font-size: 25px; text-align: left;">
														<br> <br> <br>唉呀，沒有符合條件的牙醫診所:(
													</p>
													<!-- 利用form:form表單傳值可使用modelAttribute 要加上action=${pageContext.request.contextPath}-->
													<form:form modelAttribute="addAp"
														action="${pageContext.request.contextPath}/addAp"
														id="hiddenForm" method="POST"
														enctype="multipart/form-data">
														<input type="hidden" name="clinicId" value=""
															id="apclinic" />
														<input type="hidden" name="dentistId" value=""
															id="apdentist" />
														<input type="hidden" name="appointdateId" value=""
															id="apappointdate" />
														<input type="hidden" name="timetableId" value=""
															id="aptimetable" />
														<input type="hidden" name="itemId" value="" id="apitem" />
													</form:form>
												</div>
												<div class="modal-footer"></div>
											</div>
										</div>

										<!-- 這裡是界線 -->
										<div class="profile-box">
											<div class="row">

												<div class="col-lg-4">
													<div class="form-group">
														
													</div>
												</div>

											</div>
											<div class="row">
												<div class="col-md-12">
													<div class="card schedule-widget mb-0">

														<!-- Schedule Header -->
														<div class="schedule-header">

															<!-- Schedule Nav -->
															
															<!-- /Schedule Nav -->

														</div>
														<!-- /Schedule Header -->

														<!-- Schedule Content -->
														<div class="tab-content schedule-cont">

															<!-- Sunday Slot -->
															
															<!-- /Sunday Slot -->

															<!-- Monday Slot -->
															

																<!-- Slot List -->
																
																<!-- /Slot List -->

															</div>
															<!-- /Monday Slot -->

															<!-- Tuesday Slot -->
															<div id="slot_tuesday" class="tab-pane fade">
																<h4 class="card-title d-flex justify-content-between">
																	<span>Time Slots</span> <a class="edit-link"
																		data-toggle="modal" href="#add_time_slot"><i
																		class="fa fa-plus-circle"></i> Add Slot</a>
																</h4>
																<p class="text-muted mb-0">Not Available</p>
															</div>
															<!-- /Tuesday Slot -->

															<!-- Wednesday Slot -->
															<div id="slot_wednesday" class="tab-pane fade">
																<h4 class="card-title d-flex justify-content-between">
																	<span>Time Slots</span> <a class="edit-link"
																		data-toggle="modal" href="#add_time_slot"><i
																		class="fa fa-plus-circle"></i> Add Slot</a>
																</h4>
																<p class="text-muted mb-0">Not Available</p>
															</div>
															<!-- /Wednesday Slot -->

															<!-- Thursday Slot -->
															<div id="slot_thursday" class="tab-pane fade">
																<h4 class="card-title d-flex justify-content-between">
																	<span>Time Slots</span> <a class="edit-link"
																		data-toggle="modal" href="#add_time_slot"><i
																		class="fa fa-plus-circle"></i> Add Slot</a>
																</h4>
																<p class="text-muted mb-0">Not Available</p>
															</div>
															<!-- /Thursday Slot -->

															<!-- Friday Slot -->
															<div id="slot_friday" class="tab-pane fade">
																<h4 class="card-title d-flex justify-content-between">
																	<span>Time Slots</span> <a class="edit-link"
																		data-toggle="modal" href="#add_time_slot"><i
																		class="fa fa-plus-circle"></i> Add Slot</a>
																</h4>
																<p class="text-muted mb-0">Not Available</p>
															</div>
															<!-- /Friday Slot -->

															<!-- Saturday Slot -->
															<div id="slot_saturday" class="tab-pane fade">
																<h4 class="card-title d-flex justify-content-between">
																	<span>Time Slots</span> <a class="edit-link"
																		data-toggle="modal" href="#add_time_slot"><i
																		class="fa fa-plus-circle"></i> Add Slot</a>
																</h4>
																<p class="text-muted mb-0">Not Available</p>
															</div>
															<!-- /Saturday Slot -->

														</div>
														<!-- /Schedule Content -->

													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
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
									<img src="../assets/img/footer-logo.png" alt="logo">
								</div>
								<div class="footer-about-content">
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
										sed do eiusmod tempor incididunt ut labore et dolore magna
										aliqua.</p>
									<div class="social-icon">
										<ul>
											<li><a href="#" target="_blank"><i
													class="fab fa-facebook-f"></i> </a></li>
											<li><a href="#" target="_blank"><i
													class="fab fa-twitter"></i> </a></li>
											<li><a href="#" target="_blank"><i
													class="fab fa-linkedin-in"></i></a></li>
											<li><a href="#" target="_blank"><i
													class="fab fa-instagram"></i></a></li>
											<li><a href="#" target="_blank"><i
													class="fab fa-dribbble"></i> </a></li>
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
									<li><a href="search.html"><i
											class="fas fa-angle-double-right"></i> Search for Doctors</a></li>
									<li><a href="login.html"><i
											class="fas fa-angle-double-right"></i> Login</a></li>
									<li><a href="register.html"><i
											class="fas fa-angle-double-right"></i> Register</a></li>
									<li><a href="booking.html"><i
											class="fas fa-angle-double-right"></i> Booking</a></li>
									<li><a href="patient-dashboard.html"><i
											class="fas fa-angle-double-right"></i> Patient Dashboard</a></li>
								</ul>
							</div>
							<!-- /Footer Widget -->

						</div>

						<div class="col-lg-3 col-md-6">

							<!-- Footer Widget -->
							<div class="footer-widget footer-menu">
								<h2 class="footer-title">For Doctors</h2>
								<ul>
									<li><a href="appointments.html"><i
											class="fas fa-angle-double-right"></i> Appointments</a></li>
									<li><a href="chat.html"><i
											class="fas fa-angle-double-right"></i> Chat</a></li>
									<li><a href="login.html"><i
											class="fas fa-angle-double-right"></i> Login</a></li>
									<li><a href="doctor-register.html"><i
											class="fas fa-angle-double-right"></i> Register</a></li>
									<li><a href="doctor-dashboard.html"><i
											class="fas fa-angle-double-right"></i> Doctor Dashboard</a></li>
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
										<p>
											3556 Beech Street, San Francisco,<br> California, CA
											94108
										</p>
									</div>
									<p>
										<i class="fas fa-phone-alt"></i> +1 315 369 5943
									</p>
									<p class="mb-0">
										<i class="fas fa-envelope"></i> doccure@example.com
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
									<p class="mb-0">
										&copy; 2019 Doccure. All rights <a
											href="http://www.bootstrapmb.com/" title="bootstrapmb">Reserved</a>.
									</p>
								</div>
							</div>
							<div class="col-md-6 col-lg-6">

								<!-- Copyright Menu -->
								<div class="copyright-menu">
									<ul class="policy-menu">
										<li><a href="term-condition.html">Terms and
												Conditions</a></li>
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

	<!-- Add Time Slot Modal -->
	<div class="modal fade custom-modal" id="add_time_slot">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Add Time Slots</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="hours-info">
							<div class="row form-row hours-cont">
								<div class="col-12 col-md-10">
									<div class="row form-row">
										<div class="col-12 col-md-6">
											<div class="form-group">
												<label>Start Time</label> <select class="form-control">
													<option>-</option>
													<option>12.00 am</option>
													<option>12.30 am</option>
													<option>1.00 am</option>
													<option>1.30 am</option>
												</select>
											</div>
										</div>
										<div class="col-12 col-md-6">
											<div class="form-group">
												<label>End Time</label> <select class="form-control">
													<option>-</option>
													<option>12.00 am</option>
													<option>12.30 am</option>
													<option>1.00 am</option>
													<option>1.30 am</option>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="add-more mb-3">
							<a href="javascript:void(0);" class="add-hours"><i
								class="fa fa-plus-circle"></i> Add More</a>
						</div>
						<div class="submit-section text-center">
							<button type="submit" class="btn btn-primary submit-btn">Save
								Changes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- /Add Time Slot Modal -->

	<!-- Edit Time Slot Modal -->
	<div class="modal fade custom-modal" id="edit_time_slot">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Edit Time Slots</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="hours-info">
							<div class="row form-row hours-cont">
								<div class="col-12 col-md-10">
									<div class="row form-row">
										<div class="col-12 col-md-6">
											<div class="form-group">
												<label>Start Time</label> <select class="form-control">
													<option>-</option>
													<option selected>12.00 am</option>
													<option>12.30 am</option>
													<option>1.00 am</option>
													<option>1.30 am</option>
												</select>
											</div>
										</div>
										<div class="col-12 col-md-6">
											<div class="form-group">
												<label>End Time</label> <select class="form-control">
													<option>-</option>
													<option>12.00 am</option>
													<option selected>12.30 am</option>
													<option>1.00 am</option>
													<option>1.30 am</option>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="row form-row hours-cont">
								<div class="col-12 col-md-10">
									<div class="row form-row">
										<div class="col-12 col-md-6">
											<div class="form-group">
												<label>Start Time</label> <select class="form-control">
													<option>-</option>
													<option>12.00 am</option>
													<option selected>12.30 am</option>
													<option>1.00 am</option>
													<option>1.30 am</option>
												</select>
											</div>
										</div>
										<div class="col-12 col-md-6">
											<div class="form-group">
												<label>End Time</label> <select class="form-control">
													<option>-</option>
													<option>12.00 am</option>
													<option>12.30 am</option>
													<option selected>1.00 am</option>
													<option>1.30 am</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="col-12 col-md-2">
									<label class="d-md-block d-sm-none d-none">&nbsp;</label><a
										href="#" class="btn btn-danger trash"><i
										class="far fa-trash-alt"></i></a>
								</div>
							</div>

							<div class="row form-row hours-cont">
								<div class="col-12 col-md-10">
									<div class="row form-row">
										<div class="col-12 col-md-6">
											<div class="form-group">
												<label>Start Time</label> <select class="form-control">
													<option>-</option>
													<option>12.00 am</option>
													<option>12.30 am</option>
													<option selected>1.00 am</option>
													<option>1.30 am</option>
												</select>
											</div>
										</div>
										<div class="col-12 col-md-6">
											<div class="form-group">
												<label>End Time</label> <select class="form-control">
													<option>-</option>
													<option>12.00 am</option>
													<option>12.30 am</option>
													<option>1.00 am</option>
													<option selected>1.30 am</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="col-12 col-md-2">
									<label class="d-md-block d-sm-none d-none">&nbsp;</label><a
										href="#" class="btn btn-danger trash"><i
										class="far fa-trash-alt"></i></a>
								</div>
							</div>

						</div>

						<div class="add-more mb-3">
							<a href="javascript:void(0);" class="add-hours"><i
								class="fa fa-plus-circle"></i> Add More</a>
						</div>
						<div class="submit-section text-center">
							<button type="submit" class="btn btn-primary submit-btn">Save
								Changes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- /Edit Time Slot Modal -->



	<!-- jQuery -->
	<script src="../assets/js/jquery.min.js"></script>

	<!-- Bootstrap Core JS -->
	<script src="../assets/js/popper.min.js"></script>
	<script
		src="http://cdn.bootstrapmb.com/bootstrap/4.4.0/js/bootstrap.min.js"></script>

	<!-- Sticky Sidebar JS -->
	<script src="../assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
	<script
		src="../assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

	<!-- Select2 JS -->
	<script src="../assets/plugins/select2/js/select2.min.js"></script>

	<!-- Custom JS -->
	<script src="../assets/js/script.js"></script>
</body>


</html>