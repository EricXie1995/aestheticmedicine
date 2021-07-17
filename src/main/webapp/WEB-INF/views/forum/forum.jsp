<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
 .containerpage{ 
    display: flex; 
    justify-content: center;  
   align-items: center;  
} 
/*多選下拉框樣式（根據自己的樣式調整）*/
.dropdown_item{width: 100%}
.dropdown_item>li:HOVER{background-color: #eee;cursor: pointer;}
.dropdown_item>li {display: block;padding: 3px 10px;clear: both;font-weight: normal;line-height: 1.428571429;color: #333;white-space: nowrap;}
.dropdown_item>li>.check_box{width: 18px;height: 18px;vertical-align: middle;margin: 0px;}
.dropdown_item>li>span{vertical-align: middle;}
.select_multiple .caret{border-top: 4px solid!important;border-bottom: 0;}
.dropdown{width: 20%;background-color: white}
.texaa{display: none;}
/* 控制文章內容顯示字數 */
.box {
width: 620px;
 padding: 10px; 
/* border: #4caf50 2px solid; */
}
.ellipsis {
overflow:hidden;
white-space: nowrap;
text-overflow: ellipsis;
display: -webkit-box;
-webkit-line-clamp: 2; /*行數*/
-webkit-box-orient: vertical;
white-space: normal;
}
.ellipsis3 {
overflow:hidden;
white-space: nowrap;
text-overflow: ellipsis;
display: -webkit-box;
-webkit-line-clamp: 1; /*行數*/
-webkit-box-orient: vertical;
white-space: normal;
}
/* .box2 { */
/* width: 200px; */
/* padding: 10px; */
/* /* border: #4caf50 2px solid; */ 
/* } */
.ellipsis2 {
overflow:hidden;
white-space: nowrap;
text-overflow: ellipsis;
display: -webkit-box;
-webkit-line-clamp: 2; /*行數*/
-webkit-box-orient: vertical;
white-space: normal;
}
.box2 {
  overflow-x : hidden;
  text-overflow : ellipsis;
  white-space : nowrap;
  width : 280px;
}
.box3 {
  overflow-y : auto;
  height: 350px;
  padding-bottom: 0px;	
}
		.drop-shadow {
	    -webkit-filter: drop-shadow(12px 12px 7px rgba(0, 0, 0, 0.7));
	    filter: drop-shadow(12px 12px 7px rgba(0, 0, 0, 0.7))
		}
</style>
<meta charset="UTF-8">
<title>討論板</title>
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

</head>
<body>
<%-- <img src="<c:url value='${member.photosImagePath}' />" alt="User Image"> --%>
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
							<li><a href="<c:url value='/adminindex' />" target="_blank">Admin</a></li>
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
							<h2 class="breadcrumb-title">問題討論</h2>
						</div>

						<div class="col-md-4 col-12">
						<nav class="navbar navbar-expand-sm  navbar-dark">						
						  <form class="form-inline" action="<c:url value='/forum/-1' />">
						    <input name="searchQ" class="form-control mr-sm-2" type="text" placeholder="搜尋" value="${searchQ}">
						    <div class="dropdown">
								<button class="btn btn-default dropdown-toggle form-control select_multiple" style="width: 100%;margin-left: 0px;" type="button" id="dropdownMenu21" data-toggle="dropdown">
							    	<span class="select_text" data-is-select="false">範圍</span>
							    	<span class="caret"></span>
							  	</button>
							  	<ul class="dropdown-menu dropdown_item" style="bottom: auto;">
							  	<c:forEach var="type" items="${types}">
							    	<li><input name="checkType" type="checkbox" class="check_box" value="${type.typePkId}" /> <span>${type.typeName}</span></li>
							  	</c:forEach>
							  	</ul><!-- 為了方便演示，type設定text了，實際中可以設定成hidden -->
<!-- 								<input type="text" name="" class="select_val"/> -->
							</div>
							&nbsp;
						    <button class="btn btn-light" type="submit">搜尋</button>
						  </form>
						</nav>
						</div>
						
						<div class="col-md-4 col-12">
						</div>				
<!-- Notifications -->
				<div class="col-md-1 col-12">
					<li style="list-style-type:none;">
						<a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
							<i class='fas fa-bell' style='font-size:30px;color: white;'><span style='font-size:10px' class="badge badge-success badge-pill">${unreadnum}</span></i> 
						</a>
						<div class="dropdown-menu notifications" style="box-shadow:3px 3px 5px 6px #cccccc;">
							<div class="topnav-dropdown-header" style="margin-left: 20px">
								<span class="notification-title"><b>消息通知</b></span>
							</div>
							<hr>
							<div class="noti-content box3">
								<ul class="notification-list" style="padding: 20px;padding-top: 0px;padding-bottom: 0px">
									<li class="notification-message" style="list-style-type:none;>
										<a href="#">
											<div class="media">
												<div class="media-body">
													<c:forEach var="notification" items="${page2.content}">
													<span style="font-size: 10px"><fmt:formatDate value="${notification.createtime}" type="both"/></span>
														<div class="appointment-list" style="text-align: center;">
															<div class="profile-info-widget" style="font-size: 10px">
																<span class="avatar avatar-sm">
																	<img class="avatar-img rounded-circle" alt="User Image" src="<c:url value='${notification.reply.member.photosImagePath}' />">
																</span>
																<div class="profile-det-info box2">
																	<c:if test="${notification.status==0}"><span class="badge badge-danger">未讀</span></c:if>
																	<br>
																	<span><b>${notification.reply.member.memberName}</b></span>
																	<c:if test="${notification.reply.type==1}">
												                    <span>回覆了你的問題 :【<a href="<c:url value='/question/${notification.question.questionPkId}' />"><b style="color: red">${notification.question.title}</b></a>】</span>
												                    </c:if>
												                    <c:if test="${notification.reply.type==2}">
												                    <span>回覆了你對問題 <a href="<c:url value='/question/${notification.question.questionPkId}' />"><b>${notification.question.title}</b></a> 的評論 : ⌜<a href="<c:url value='/question/${notification.question.questionPkId}' />"><b style="color: red">${notification.selfReplyContent}</b></a>⌟</span>
												                    </c:if>
												                    <br>
												                    <a href="<c:url value="/notification/${notification.notificationPkId}" />">
												                        <span>回覆內容 : ⌜${notification.reply.content}⌟</span>
												                    </a>
																</div>
															</div>
														</div>
														<hr>
													</c:forEach>
												</div>
											</div>
										</a>
									</li>
								</ul>
							</div>
							<div class="topnav-dropdown-footer" style="margin-left: 20px">
								<a href="<c:url value="/personal/information" />"><b>查看所有通知</b></a>
							</div>
						</div>
					</li>
					</div>
						<div class="col-md-1 col-12">
							<a href="<c:url value='/publish' />">
								<span class="glyphicon glyphicon-pencil question-menu" aria-hidden="true"></span>
	               				<i class='far fa-edit' style='font-size:30px;color:white'></i><span style='color:white'>發佈</span>
	               			</a>
	               		</div>
	               		
               			<div class="col-md-1 col-12">
						</div>
						
						<div class="col-md-1 col-12">
						</div>
					<!-- /Notifications -->

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
							<div class="profile-sidebar drop-shadow">
								<div class="widget-profile pro-widget-content">
									<div class="profile-info-widget">
										<a href="<c:url value='/personal/questions' />" class="booking-doc-img">
											<img src="<c:url value='${member.photosImagePath}' />" alt="User Image">
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
													<h3>分類看板</h3>
										</li>
										<c:if test="${typId==-1}">
										<li class="active">
													<a href="<c:url value='/forum/-1' />">
													<i class="fa fa-columns"></i>
													<span>全部</span>
													</a>
											</li>
										</c:if>
										<c:if test="${typId!=-1}">
										<li>
												<a href="<c:url value='/forum/-1' />">
													<i class="fa fa-columns"></i>
													<span>全部</span>
												</a>
											</li>
										</c:if>
										<c:forEach var="type" items="${types}">
										<c:if test="${typId==type.typePkId}">
											<li class="active">
												<a href="<c:url value='/forum/${type.typePkId}' />">
													<i class="fa fa-columns"></i>
													<span>${type.typeName}</span>
												</a>
											</li>
										</c:if>
										<c:if test="${typId!=type.typePkId}">
											<li>
												<a href="<c:url value='/forum/${type.typePkId}' />">
													<i class="fa fa-columns"></i>
													<span>${type.typeName}</span>
												</a>
											</li>
										</c:if>
										</c:forEach>
										
										</ul>
									</nav>
								</div>
							</div>
							<!-- /Profile Sidebar -->
							
						</div>

						<div class="col-md-7 col-lg-8 col-xl-9">
							<div class="appointments">
							<c:if test="${message != null}">
								<div class="alert alert-primary alert-dismissible fade show" role="alert">
									<strong>${message}</strong>
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
							</c:if>
								<!-- Appointment List -->
								<!--分頁展示內容-->
<%-- 								<p>${checkType}</p> --%>
							<h4><c:if test="${searchQ != null}"><i class='fas fa-search' style='font-size:20px'></i><b>搜尋內容 : ${searchQ} ${seleType}</b></c:if></h4>
							<div style="text-align:right;">
								<span class="sortby-fliter">
									<span>排序依</span>
									<select class="select2-container " onchange="self.location.href=options[selectedIndex].value">
									<c:if test="${sort=='createtime'}">
									<option class="sorting" selected
											value="<c:url value='/forum/${typId}?sort=createtime&searchQ=${searchQ}&checkType=${checkType}' />">最新</option>
									</c:if>
									<c:if test="${sort!='createtime'}">
										<option class="sorting" value="<c:url value='/forum/${typId}?sort=createtime&searchQ=${searchQ}&checkType=${checkType}' />">最新</option>
									</c:if>
									<c:if test="${sort=='viewcount'}">
										<option class="sorting" selected
											value=<c:url value='/forum/${typId}?sort=viewcount&searchQ=${searchQ}&checkType=${checkType}' />>熱門</option>
									</c:if>
									<c:if test="${sort!='viewcount'}">
										<option class="sorting" value=<c:url value='/forum/${typId}?sort=viewcount&searchQ=${searchQ}&checkType=${checkType}' />>熱門</option>
									</c:if>
									<c:if test="${sort=='qcommentcount'}">
										<option class="sorting" selected
											value=<c:url value='/forum/${typId}?sort=qcommentcount&searchQ=${searchQ}&checkType=${checkType}' />>評論數</option>
									</c:if>
									<c:if test="${sort!='qcommentcount'}">
										<option class="sorting" value=<c:url value='/forum/${typId}?sort=qcommentcount&searchQ=${searchQ}&checkType=${checkType}' />>評論數</option>
									</c:if>
									<c:if test="${sort=='favoritecount'}">
										<option class="sorting" selected
											value=<c:url value='/forum/${typId}?sort=favoritecount&searchQ=${searchQ}&checkType=${checkType}' />>收藏數</option>
									</c:if>
									<c:if test="${sort!='favoritecount'}">
										<option class="sorting" value=<c:url value='/forum/${typId}?sort=favoritecount&searchQ=${searchQ}&checkType=${checkType}' />>收藏數</option>
									</c:if>
									</select>
								</span>
							<span>${page.number+1} / 共${page.totalPages}頁</span>
							</div>
							<c:forEach var="question" items="${page.content}">
								<div class="appointment-list">
									<div class="profile-info-widget">
										<a href="<c:url value='/question/${question.questionPkId}' />" class="booking-doc-img">
											<img src="<c:url value='${question.member.photosImagePath}' />" alt="User Image">
										</a>
										<div class="profile-det-info">
											<h5 style="color: gray">版塊•${question.type.typeName}</h5>
											<h3 class="box"><a class="ellipsis3" href="<c:url value='/question/${question.questionPkId}' />"><b>${question.title}</b></a></h3>
											<div class="box" style="padding-left: 20px;padding-top: 0px"><span class="ellipsis">${question.description}</span></div>
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
								<!-- /Appointment List -->
								
							</div>
						</div>
					</div>

				</div>

			</div>		
			<!-- /Page Content -->
			
			<!-- 顯示底部的頁碼 -->
			<div class="containerpage">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<%--                 <c:if test="${!page.first}"> --%>
						<li><a class="page-link"
							href="<c:url value='/forum/${typId}?page=0&sort=${sort}&searchQ=${searchQ}&checkType=${checkType}' />"
							aria-label="Previous"> <span aria-hidden="true">&lt;&lt;</span>
						</a></li>
						<%--                  </c:if> --%>
						<c:if test="${!page.first}">
							<li class="disable"><a class="page-link"
								href="<c:url value='/forum/${typId}?page=${page.number-1}&sort=${sort}&searchQ=${searchQ}&checkType=${checkType}' />"
								aria-label="Previous"> <span aria-hidden="true">&lt;</span>
							</a></li>
						</c:if>

						<c:forEach begin="0" end="${page.totalPages-1}" var="i" step="1">
							<c:if test="${i==page.number}">
								<li style="opacity:0.4"><a class="page-link"
									href="<c:url value='/forum/${typId}?page=${i}&sort=${sort}&searchQ=${searchQ}&checkType=${checkType}' />">${i+1}</a>
								</li>
							</c:if>
							<c:if test="${i!=page.number}">
								<li><a class="page-link"
									href="<c:url value='/forum/${typId}?page=${i}&sort=${sort}&searchQ=${searchQ}&checkType=${checkType}' />">${i+1}</a>
								</li>
							</c:if>
						</c:forEach>

						<c:if test="${!page.last}">
							<li><a class="page-link"
								href="<c:url value='/forum/${typId}?page=${page.number+1}&sort=${sort}&searchQ=${searchQ}&checkType=${checkType}' />"
								aria-label="Next"> <span aria-hidden="true">&gt;</span>
							</a></li>
						</c:if>
						<%--                     <c:if test="${!page.last}"> --%>
						<li><a class="page-link"
							href="<c:url value='/forum/${typId}?page=${page.totalPages-1}&sort=${sort}&searchQ=${searchQ}&checkType=${checkType}' />"
							aria-label="Next"> <span aria-hidden="true">&gt;&gt;</span>
						</a></li>
						<%--                     </c:if> --%>
					</ul>
				</nav>
			</div>
			<!-- /顯示底部的頁碼 -->

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
<!-- 	<!-- Select2 JS --> 
		<script src="<c:url value='/assets/plugins/select2/js/select2.min.js' />"></script>
		<!-- Datetimepicker JS -->
		<script src="<c:url value='/assets/js/moment.min.js' />"></script>
		<script src="<c:url value='/assets/js/bootstrap-datetimepicker.min.js' />"></script>
		
		<!-- Fancybox JS -->
		<script src="<c:url value='/assets/plugins/fancybox/jquery.fancybox.min.js' />"></script>
		
		<script type="text/javascript">
		
		//多選下拉框實現
	    $(document).on("click",".check_box",function(event){
			event.stopPropagation();//阻止事件冒泡，防止觸發li的點選事件
			//勾選的項
			var $selectTextDom=$(this).parent().parent("ul").siblings("button").children(".select_text");
			//勾選項的值
			var $selectValDom=$(this).parent().parent("ul").siblings(".select_val");
			//是否有選擇項了
			var isSelected=$selectTextDom[0].getAttribute("data-is-select");
			var selectText="";//文字值，用於顯示
			var selectVal=$selectValDom.val();//實際值，會提交到後臺的
			var selected_text=$(this).siblings("span").text();//當次勾選的文字值
			var selected_val=$(this).val();//當次勾選的實際值
			//判斷是否選擇過
			if(isSelected=="true"){
				selectText=$selectTextDom.text();
			}
			if(selectText!=""){
				if(selectText.indexOf(selected_text)>=0){//判斷是否已經勾選過
					selectText=selectText.replace(selected_text,"").replace(",,",",");//替換掉
					selectVal=selectVal.replace(selected_val,"").replace(",,",",");//替換掉
					//判斷最後一個字元是否是逗號
					if(selectText.charAt(selectText.length - 1)==","){
						//去除末尾逗號
						selectText=selectText.substring(0,selectText.length - 1);
						selectVal=selectVal.substring(0,selectVal.length - 1);
					}
				}else{
					selectText+=","+selected_text;
					selectVal+=","+selected_val;
				}
			}else{
// 				selectText=selected_text;
				selectVal=selected_val;
			}
			$selectTextDom.text(selectText);
			$selectValDom.val(selectVal);
			if(selectText==""){
				$selectTextDom.text("分類");
				$selectTextDom[0].setAttribute("data-is-select","false");
			}else{
				$selectTextDom[0].setAttribute("data-is-select","true");
			}
		})
		
		</script>
</body>
</html>