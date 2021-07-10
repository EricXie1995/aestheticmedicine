<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.containerpage{
    display: flex;
    justify-content: center; 
    align-items: center; 
}
</style>
<meta charset="UTF-8">
<title>個人中心</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0">
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
<!-- Main CSS -->
<link rel="stylesheet"
	href="<c:url value='/assets/css/style.css'></c:url>">
<!-- Datetimepicker CSS -->
		<link rel="stylesheet" href="<c:url value='/assets/css/bootstrap-datetimepicker.min.css'></c:url>">
<!-- Select2 CSS -->
	<link rel="stylesheet" href="<c:url value='/assets/plugins/select2/css/select2.min.css' />">
<!-- Fancybox CSS -->
	<link rel="stylesheet" href="<c:url value='/assets/plugins/fancybox/jquery.fancybox.min.css' />">
	
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

<!-- <link rel="stylesheet" -->
<!--           href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" -->
<!--           integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" -->
<!--           crossorigin="anonymous"> -->
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
						src="<c:url value='/assets/img/logo.png' />" class="img-fluid" alt="Logo">
					</a>
				</div>
				<div class="main-menu-wrapper">
					<div class="menu-header">
						<a href="index.html" class="menu-logo"> <img
							src="<c:url value='/assets/img/logo.png' />" class="img-fluid" alt="Logo">
						</a> <a id="menu_close" class="menu-close" href="javascript:void(0);">
							<i class="fas fa-times"></i>
						</a>
					</div>
					<ul class="main-nav">
						<li><a href="index.html">Home</a></li>
						<li class="has-submenu"><a href="">Doctors <i
								class="fas fa-chevron-down"></i></a>
							<ul class="submenu">
								<li><a href="doctor-dashboard.html">Doctor Dashboard</a></li>
								<li class="active"><a href="appointments.html">Appointments</a></li>
								<li><a href="schedule-timings.html">Schedule Timing</a></li>
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
								<li class="has-submenu"><a href="<c:url value='/forum/-1' />"><b>討論板</b><i
									class="fas fa-chevron-down"></i></a>
									<ul class="submenu">
								<li><a href="<c:url value='/personal/questions' />">個人中心</a></li>
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
								src="<c:url value='/assets/img/doctors/doctor-thumb-02.jpg' />" width="31"
								alt="Darren Elder">
						</span>
					</a>
						<div class="dropdown-menu dropdown-menu-right">
							<div class="user-header">
								<div class="avatar avatar-sm">
									<img src="<c:url value='/assets/img/doctors/doctor-thumb-02.jpg' />"
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
						<div class="col-md-1 col-12">
							<nav aria-label="breadcrumb" class="page-breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page"><a href="<c:url value='/forum/-1' />">討論版</a></li>
								</ol>
							</nav>
							<h2 class="breadcrumb-title">個人中心</h2>
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
										<a href="<c:url value='/personal/questions' />" class="booking-doc-img">
											<img src="<c:url value='/images/testimg.jpg' />" alt="User Image">
										</a>
										<div class="profile-det-info">
											<h3>${member.memberName}</h3>
										</div>
									</div>
								</div>
								<div class="dashboard-widget">
									<nav class="dashboard-menu">
										<ul>
										<li style="text-align:center">
													<i></i>
													<c:if test="${section=='questions'}">
													<h3>我的問題</h3>
													</c:if>
													<c:if test="${section=='information'}">
													<h3>我的消息</h3>
													</c:if>
													<c:if test="${section=='favorites'}">
													<h3>我的收藏</h3>
													</c:if>
										</li>
										<c:if test="${section=='questions'}">
										<li>
							                <a href="<c:url value="/personal/questions" />" class="list-group-item active">
							                    <span>我的問題</span>
							                </a>
							             </li>
							            </c:if>
							            <c:if test="${section!='questions'}">
										<li>
							                <a href="<c:url value="/personal/questions" />" class="list-group-item">
							                    <span>我的問題</span>
							                </a>
							             </li>
							            </c:if>
							            
							            <c:if test="${section=='information'}">
										<li>
							                <a href="<c:url value="/personal/information" />" class="list-group-item active">
							                    <span>我的消息</span><span class="badge badge-success badge-pill">${unreadnum}</span>
							                </a>
							             </li>
							            </c:if>
							            <c:if test="${section!='information'}">
										<li>
							                <a href="<c:url value="/personal/information" />" class="list-group-item">
							                    <span>我的消息</span><span class="badge badge-success badge-pill">${unreadnum}</span>
							                </a>
							             </li>
							            </c:if>
							            
							            <c:if test="${section=='favorites'}">
										<li>
							                <a href="<c:url value="/personal/favorites" />" class="list-group-item active">
							                    <span>我的收藏</span>
							                </a>
							             </li>
							            </c:if>
							            <c:if test="${section!='favorites'}">
										<li>
							                <a href="<c:url value="/personal/favorites" />" class="list-group-item">
							                    <span>我的收藏</span>
							                </a>
							             </li>
							            </c:if>
										</ul>
									</nav>
								</div>
							</div>
							<!-- /Profile Sidebar -->		
									
						</div>
						
						<div class="col-md-7 col-lg-8 col-xl-9">
							<div class="appointments">
							<!-- Appointment List -->
							
							<!-- 分頁展示我的問題 -->
							<c:if test="${section == 'questions'}">
							<div style="text-align:right;">${page.number+1} / 共${page.totalPages}頁</div>
							</c:if>
							<c:if test="${section == 'questions'}">
							<c:forEach var="question" items="${page.content}">
								<div class="appointment-list">
									<div class="profile-info-widget">
										<a href="<c:url value='/question/${question.questionPkId}' />" class="booking-doc-img">
											<img src="<c:url value='/images/testimg.jpg' />" alt="User Image">
										</a>
										<div class="profile-det-info">
											<h5 style="color: gray">版塊•${question.type.typeName}</h5>
											<h2><a href="<c:url value='/question/${question.questionPkId}' />">${question.title}</a></h2>
											<div class="patient-details">
												<h5><i class="fa fa-user"></i>發問人: ${question.member.memberName}</h5>
												<h5><i class="far fa-clock"></i><fmt:formatDate
														value="${question.createtime}" type="both" /></h5>
											</div>
										</div>
									</div>
									<div class="appointment-action">
										<a href="#" class="btn btn-sm bg-info-light" data-toggle="modal" data-target="#appt_details">
											<i class="far fa-eye"></i> 瀏覽數 ${question.viewcount}<c:if test="${question.viewcount==null}">0</c:if>
										</a>
										<a href="javascript:void(0);" class="btn btn-sm bg-success-light">
											<i class="fa fa-comment"></i> 回覆數 ${question.qcommentcount}<c:if test="${question.qcommentcount==null}">0</c:if>
										</a>
										<a href="javascript:void(0);" class="btn btn-sm bg-danger-light">
											<i class="fa fa-heart"></i> 收藏數 ${question.favoritecount}<c:if test="${question.favoritecount==null}">0</c:if>
										</a>
									</div>
								</div>
							</c:forEach>
								<!-- 顯示底部的頁碼 -->
								<div class="containerpage">
									<nav aria-label="Page navigation">
										<ul class="pagination">
											<%--                 <c:if test="${!page.first}"> --%>
											<li><a class="page-link"
												href="<c:url value='/personal/${section}?page=0' />' />"
												aria-label="Previous"> <span aria-hidden="true">&lt;&lt;</span>
											</a></li>
											<%--                  </c:if> --%>
											<c:if test="${!page.first}">
												<li class="disable"><a class="page-link"
													href="<c:url value='/personal/${section}?page=${page.number-1}' />"
													aria-label="Previous"> <span aria-hidden="true">&lt;</span>
												</a></li>
											</c:if>
					
											<c:forEach begin="0" end="${page.totalPages-1}" var="i" step="1">
												<c:if test="${i==page.number}">
													<li style="opacity:0.4"><a class="page-link"
														href="<c:url value='/personal/${section}?page=${i}' />">${i+1}</a>
													</li>
												</c:if>
												<c:if test="${i!=page.number}">
													<li><a class="page-link"
														href="<c:url value='/personal/${section}?page=${i}' />">${i+1}</a>
													</li>
												</c:if>
											</c:forEach>
					
											<c:if test="${!page.last}">
												<li><a class="page-link"
													href="<c:url value='/personal/${section}?page=${page.number+1}' />"
													aria-label="Next"> <span aria-hidden="true">&gt;</span>
												</a></li>
											</c:if>
											<%--                     <c:if test="${!page.last}"> --%>
											<li><a class="page-link"
												href="<c:url value='/personal/${section}?page=${page.totalPages-1}' />"
												aria-label="Next"> <span aria-hidden="true">&gt;&gt;</span>
											</a></li>
											<%--                     </c:if> --%>
										</ul>
									</nav>
								</div>
							<!-- /顯示底部的頁碼 -->
							</c:if>
							
							<!-- 分頁展示我的消息 -->
							<c:if test="${section == 'information'}">
							<div style="text-align:right;">${page.number+1} / 共${page.totalPages}頁</div>
							</c:if>
							<c:if test="${section == 'information'}">
							<button class="btn btn-primary" onclick="clearAllStatus()"><b>清除所有未讀</b></button>
							<button class="btn btn-danger" onclick="DelAllNot()"><b>刪除所有通知</b></button>
							<hr>							
							<c:forEach var="notification" items="${page.content}">
							<span><fmt:formatDate value="${notification.createtime}" type="both"/></span>
								<div class="appointment-list">
									<div class="profile-info-widget">
										
										<div class="profile-det-info">
											<c:if test="${notification.status==0}"><span class="badge badge-danger">未讀</span></c:if>
											<br>
											<span><b>${notification.reply.member.memberName}</b></span>
											<c:if test="${notification.reply.type==1}">
						                    <span>回覆了你的問題 :【<b style="color: red">${notification.question.title}</b>】</span>
						                    </c:if>
						                    <c:if test="${notification.reply.type==2}">
						                    <span>回覆了你對問題 <b>${notification.question.title}</b> 的評論 : ⌜<b style="color: red">${notification.selfReplyContent}</b>⌟</span>
						                    </c:if>
						                    <br>
						                    <a href="<c:url value="/notification/${notification.notificationPkId}" />">
						                        <span>回覆內容 : ⌜${notification.reply.content}⌟</span>
						                    </a>
						                    
										</div>
									</div>
									<div class="appointment-action">
										<div class="table-action">
										<c:if test="${notification.status==0}">	
											<a href="javascript:void(0);" class="btn btn-sm bg-success-light" onclick="clearNotIdStatus(this)" data-id="${notification.notificationPkId}">
												<i class="fas fa-check"></i> 設為已讀
											</a>
										</c:if>
											<a href="javascript:void(0);" class="btn btn-sm bg-danger-light" onclick="delNotByNotid(this)" data-id="${notification.notificationPkId}">
												<i class="fas fa-times"></i> 刪除通知
											</a>
										</div>
									</div>
								</div>
							</c:forEach>
								<!-- 顯示底部的頁碼 -->
								<div class="containerpage">
									<nav aria-label="Page navigation">
										<ul class="pagination">
<%-- 											                <c:if test="${!page.first}"> --%>
											<li><a class="page-link"
												href="<c:url value='/personal/${section}?page=0' />' />"
												aria-label="Previous"> <span aria-hidden="true">&lt;&lt;</span>
											</a></li>
<%-- 											                 </c:if> --%>
											<c:if test="${!page.first}">
												<li class="disable"><a class="page-link"
													href="<c:url value='/personal/${section}?page=${page.number-1}' />"
													aria-label="Previous"> <span aria-hidden="true">&lt;</span>
												</a></li>
											</c:if>
					
											<c:forEach begin="0" end="${page.totalPages-1}" var="i" step="1">
												<c:if test="${i==page.number}">
													<li style="opacity:0.4"><a class="page-link"
														href="<c:url value='/personal/${section}?page=${i}' />">${i+1}</a>
													</li>
												</c:if>
												<c:if test="${i!=page.number}">
													<li><a class="page-link"
														href="<c:url value='/personal/${section}?page=${i}' />">${i+1}</a>
													</li>
												</c:if>
											</c:forEach>
					
											<c:if test="${!page.last}">
												<li><a class="page-link"
													href="<c:url value='/personal/${section}?page=${page.number+1}' />"
													aria-label="Next"> <span aria-hidden="true">&gt;</span>
												</a></li>
											</c:if>
<%-- 											                    <c:if test="${!page.last}"> --%>
											<li><a class="page-link"
												href="<c:url value='/personal/${section}?page=${page.totalPages-1}' />"
												aria-label="Next"> <span aria-hidden="true">&gt;&gt;</span>
											</a></li>
<%-- 											                    </c:if> --%>
										</ul>
									</nav>
								</div>
							<!-- /顯示底部的頁碼 -->
							</c:if>
							
							<!-- 分頁展示我的收藏 -->
							<c:if test="${section == 'favorites'}">
							<div style="text-align:right;">${page.number+1} / 共${page.totalPages}頁</div>
							</c:if>
							<c:if test="${section == 'favorites'}">
							<c:forEach var="favorites" items="${page.content}">
								<div class="appointment-list">
									<div class="profile-info-widget">
										<a href="<c:url value='/question/${favorites.question.questionPkId}' />" class="booking-doc-img">
											<img src="<c:url value='/images/testimg.jpg' />" alt="User Image">
										</a>
										<div class="profile-det-info">
											<h5 style="color: gray">版塊•${favorites.question.type.typeName}</h5>
											<h2><a href="<c:url value='/question/${favorites.question.questionPkId}' />">${favorites.question.title}</a></h2>
											<div class="patient-details">
												<h5><i class="fa fa-user"></i>發問人: ${favorites.question.member.memberName}</h5>
												<h5><i class="far fa-clock"></i><fmt:formatDate
														value="${favorites.question.createtime}" type="both" /></h5>
											</div>
										</div>
									</div>
									<div class="appointment-action">
										<a href="#" class="btn btn-sm bg-info-light" data-toggle="modal" data-target="#appt_details">
											<i class="far fa-eye"></i> 瀏覽數 ${favorites.question.viewcount}<c:if test="${favorites.question.viewcount==null}">0</c:if>
										</a>
										<a href="javascript:void(0);" class="btn btn-sm bg-success-light">
											<i class="fa fa-comment"></i> 回覆數 ${favorites.question.qcommentcount}<c:if test="${favorites.question.qcommentcount==null}">0</c:if>
										</a>
										<a href="javascript:void(0);" class="btn btn-sm bg-danger-light">
											<i class="fa fa-heart"></i> 收藏數 ${favorites.question.favoritecount}<c:if test="${favorites.question.favoritecount==null}">0</c:if>
										</a>
									</div>
								</div>
							</c:forEach>
								<!-- 顯示底部的頁碼 -->
								<div class="containerpage">
									<nav aria-label="Page navigation">
										<ul class="pagination">
											<%--                 <c:if test="${!page.first}"> --%>
											<li><a class="page-link"
												href="<c:url value='/personal/${section}?page=0' />' />"
												aria-label="Previous"> <span aria-hidden="true">&lt;&lt;</span>
											</a></li>
											<%--                  </c:if> --%>
											<c:if test="${!page.first}">
												<li class="disable"><a class="page-link"
													href="<c:url value='/personal/${section}?page=${page.number-1}' />"
													aria-label="Previous"> <span aria-hidden="true">&lt;</span>
												</a></li>
											</c:if>
					
											<c:forEach begin="0" end="${page.totalPages-1}" var="i" step="1">
												<c:if test="${i==page.number}">
													<li style="opacity:0.4"><a class="page-link"
														href="<c:url value='/personal/${section}?page=${i}' />">${i+1}</a>
													</li>
												</c:if>
												<c:if test="${i!=page.number}">
													<li><a class="page-link"
														href="<c:url value='/personal/${section}?page=${i}' />">${i+1}</a>
													</li>
												</c:if>
											</c:forEach>
					
											<c:if test="${!page.last}">
												<li><a class="page-link"
													href="<c:url value='/personal/${section}?page=${page.number+1}' />"
													aria-label="Next"> <span aria-hidden="true">&gt;</span>
												</a></li>
											</c:if>
											<%--                     <c:if test="${!page.last}"> --%>
											<li><a class="page-link"
												href="<c:url value='/personal/${section}?page=${page.totalPages-1}' />"
												aria-label="Next"> <span aria-hidden="true">&gt;&gt;</span>
											</a></li>
											<%--                     </c:if> --%>
										</ul>
									</nav>
								</div>
							<!-- /顯示底部的頁碼 -->
							</c:if>
							
							<!-- /Appointment List -->
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
										<img src="<c:url value='/assets/img/footer-logo.png' />" alt="logo">
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
	<!-- Custom JS -->
	<script src="<c:url value='/assets/js/script.js' />"></script>
<!-- 	<!-- Select2 JS --> -->
		<script src="<c:url value='/assets/plugins/select2/js/select2.min.js' />"></script>
		<!-- Datetimepicker JS -->
		<script src="<c:url value='/assets/js/moment.min.js' />"></script>
		<script src="<c:url value='/assets/js/bootstrap-datetimepicker.min.js' />"></script>
		
		<!-- Fancybox JS -->
		<script src="<c:url value='/assets/plugins/fancybox/jquery.fancybox.min.js' />"></script>
        
<script type="text/javascript">
function clearAllStatus() {
        $.ajax({
            type: "POST",
            url: "/beauty/notification/clearunread",
            contentType: 'application/json',
            success: function (data) {
                if (data.code == 200) {
                    window.location.reload();
                } else {
                    alert("出現了錯誤");
                }
            },
            dataType: "json"
        });
}

function clearNotIdStatus(e) {
	var notificationid = e.getAttribute("data-id");
    $.ajax({
        type: "POST",
        url: "/beauty/notification/clearunread",
        contentType: 'application/json',
        data: JSON.stringify({
            "notificationPkId": notificationid,
        }),
        success: function (data) {
            if (data.code == 200) {
                window.location.reload();
            } else {
                alert("出現了錯誤");
            }
        },
        dataType: "json"
    });
}

function delNotByNotid(e) {
	var notificationid = e.getAttribute("data-id");
    $.ajax({
        type: "POST",
        url: "/beauty/notification/delete",
        contentType: 'application/json',
        data: JSON.stringify({
            "notificationPkId": notificationid,
        }),
        success: function (data) {
            if (data.code == 200) {
                window.location.reload();
            } else {
                alert("出現了錯誤");
            }
        },
        dataType: "json"
    });
}

function DelAllNot() {
    $.ajax({
        type: "POST",
        url: "/beauty/notification/delete",
        contentType: 'application/json',
        success: function (data) {
            if (data.code == 200) {
                window.location.reload();
            } else {
                alert("出現了錯誤");
            }
        },
        dataType: "json"
    });
}
</script>
</body>
</html>