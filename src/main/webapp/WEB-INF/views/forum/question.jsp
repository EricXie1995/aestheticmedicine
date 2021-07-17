<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--     拿來時間格式化的標籤 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>問題瀏覽</title>
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
<!-- <link rel="stylesheet" -->
<%-- 	href="<c:url value='/assets/css/style.css'></c:url>"> --%>

<!-- Datetimepicker CSS -->
		<link rel="stylesheet" href="<c:url value='/assets/css/bootstrap-datetimepicker.min.css'></c:url>">
<!-- Select2 CSS -->
	<link rel="stylesheet" href="<c:url value='/assets/plugins/select2/css/select2.min.css' />">
<!-- Fancybox CSS -->
	<link rel="stylesheet" href="<c:url value='/assets/plugins/fancybox/jquery.fancybox.min.css' />">
	
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

<link rel="stylesheet"
          href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
<!-- Main CSS -->
<link rel="stylesheet"
	href="<c:url value='/assets/css/style2.css'></c:url>">	
     <style>
        .s {
            filter: grayscale(1);
        }
        .n {
            filter: grayscale(0);
        }
        body {
        	font-size: medium;
        }
		.box {
		width: 200px;
		padding: 10px;
		/* border: #4caf50 2px solid; */
		}
		.ellipsis {
		overflow:hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 4; /*行數*/
		-webkit-box-orient: vertical;
		white-space: normal;
		}
		.ellipsis2 {
		overflow:hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 2; /*行數*/
		-webkit-box-orient: vertical;
		white-space: normal;
		}
		.drop-shadow {
	    -webkit-filter: drop-shadow(12px 12px 7px rgba(0, 0, 0, 0.7));
	    filter: drop-shadow(12px 12px 7px rgba(0, 0, 0, 0.7))
		}
    </style>
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
									<li class="breadcrumb-item active" aria-current="page">討論板</li>
								</ol>
							</nav>
							<h2 class="breadcrumb-title">問題詳情</h2>
						</div>
					</div>
				</div>
			</div>
			<!-- /Breadcrumb -->
			
			<!--問題的詳情和回覆介面-->
<div class="container-fluid main">
    <div class="row">
        <div class="col-lg-9 col-md-12 col-sm-12 col-ss-12">
            <div class="col-lg-12 col-md-12 col-sm-12 col-ss-12">
                <h1><span><b>${question.title}</b></span></h1>
                <!--正文-->
                <span class="common-list">
                	<!-- 用這樣的方式抓到外鍵擁有的屬性 -->
                	<span style="color: gray">${question.type.typeName} • <span style="color: gray"><fmt:formatDate value="${question.createtime}" type="both"/></span></span>                                            
            </span>
                <hr>
                <!--内容-->
                <div class="col-lg-12 col-md-12 col-sm-12 col-ss-12" id="question-view" style="background-color: white;border-radius:10px;width: 1000px;">
                    ${question.description}
                </div>
                <hr class="col-lg-12 col-md-12 col-sm-12 col-ss-12">
                <div class="col-lg-12 col-md-12 col-sm-12 col-ss-12">
                <span>話題標籤</span>&nbsp;
                <c:forEach var="tag" items="${fn:split(question.tag, ',')}">
                    <span class="label label-info" style="margin-right: 10px;">
                        <span class="label label-info">${tag}</span>
                    </span>
                </c:forEach>
                </div>
                 <hr class="col-lg-12 col-md-12 col-sm-12 col-ss-12">
                 <div class="col-lg-12 col-md-12 col-sm-12 col-ss-12">
                 	<span>閱讀數 ${question.viewcount}</span><c:if test="${question.viewcount==null}">0</c:if>&nbsp;&nbsp;
                 	<c:if test="${favo==null}">
                     	<span>收藏</span><img onclick="favpost(this);toastr['success']('成功啦！', '成功')" src="<c:url value='/images/forum/love.jpg' />" class="s" id="loveimg">
                    </c:if>
                    <c:if test="${favo!=null}">
                    	<span>取消</span><img onclick="favpost(this)" src="<c:url value='/images/forum/love.jpg' />" class="n" id="loveimg">
                    </c:if>
                    <c:if test="${question.favoritecount==null}">0</c:if>
                    <c:if test="${question.favoritecount!=null}"><span>${question.favoritecount}</span></c:if>
                 </div>
                 <hr class="col-lg-12 col-md-12 col-sm-12 col-ss-12">
                <!--編輯-->
                <!-- 比對登錄中的user id(透過session抓的，等於發問題的user id，就顯示編輯按鈕)，等書偉session，先暫時用下面代替 -->
				<c:if test="${member!=null && member.memberPkId==question.member.memberPkId}">
				<div class="table-action col-lg-12 col-md-12 col-sm-12 col-ss-12">
					<a href="<c:url value='/publish/${question.questionPkId}' />" class="btn btn-sm bg-success-light">
						<i class="far fa-edit" style="font-size:25px;">編輯</i> 
					</a>
					
					<a class="btn btn-sm bg-danger-light" data-toggle="modal" href="#delete_modal${question.questionPkId}">
						<i class="far fa-trash-alt" style="font-size:25px;">刪除</i> 
					</a>
					<div class="modal fade" id="delete_modal${question.questionPkId}" aria-hidden="true" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document" >
						<div class="modal-content">
						<!--	<div class="modal-header">
								<h5 class="modal-title">Delete</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>-->
							<div class="modal-body" style="text-align: center;">
								<div class="form-content p-2">
									<h2 class="modal-title">刪除</h2>
									<p class="mb-4">確定要刪除嗎?</p>
									<a href="<c:url value='/question/delete/${question.questionPkId}' />"><button type="button" class="btn btn-primary">確定</button></a>
									<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
								</div>
							</div>
						</div>
					</div>
				</div>

<%-- 																			<a href="<c:url value='/question/delete/${question.questionPkId}' />" class="btn btn-sm bg-danger-light"> --%>
<!-- 																				<i class="far fa-trash-alt" style="font-size:25px;">刪除</i>  -->
<!-- 																			</a> -->
				</div>
<%--                 <a href="<c:url value='/publish/${question.questionPkId}' />"> --%>
<!--                 <span class="glyphicon glyphicon-pencil question-menu" aria-hidden="true"> -->
<!--                     編輯 -->
<!--                 </span> -->
<!--                 </a> -->
<%--                 <a href="<c:url value='/question/delete/${question.questionPkId}' />">刪除</a> --%>
<hr class="col-lg-12 col-md-12 col-sm-12 col-ss-12">
                </c:if>
            </div>
            <!--回覆內容-->
<!--             <hr class="col-lg-12 col-md-12 col-sm-12 col-ss-12"> -->
            <h2 style="margin-left: 15px">
            <c:if test="${question.qcommentcount == null}"><span>0個回覆</span></c:if>
            <c:if test="${question.qcommentcount != null}"><span>${question.qcommentcount}個回覆</span></c:if>
                
            </h2>
            <hr class="col-lg-12 col-md-12 col-sm-12 col-ss-12" style="margin-top: 0;">
            <!--一級評論-->
            <c:forEach var="reply" items="${reply}">
            <div class="col-lg-12 col-md-12 col-sm-12 col-ss-12" id="comment_content" style="margin-bottom: 10px">
                <div class="media">
                    <div class="media-left">
                        <img class="avatar-img rounded" style="width: 80px;height: 80px" src="<c:url value='${reply.member.photosImagePath}' />">
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">
<!--                         缺session -->
<%--                             <span>${reply.member.memberName}</span> --%>
							<span style="font-size: 15px">${reply.member.memberName}</span>
							<span></span>
                            <div style="font-size: 15px; margin-top:5px; margin-bottom: 5px">${reply.content}</div>
                            <!-- 點讚(還沒做)、評論、時間 -->
                            <div class="question-menu" style="margin-bottom: 10px">
                                <!-- 回覆按鈕 -->
                                <span class="far fa-comment" aria-hidden="true" style="font-size: 15px"
                                      data-id="${reply.replyPkId}" data-check="1" onclick="secondcomment(this)">${reply.commentcount}</span><c:if test="${reply.commentcount==null}">0</c:if>&nbsp;
                                <span style="color: gray;"><fmt:formatDate value="${reply.createtime}" type="both"/></span>
                            </div>                                
                                <div class="col-lg-12 col-md-12 col-sm-12 col-ss-12 collapse sub-comment"
                                 id="reply-${reply.replyPkId}">
                                 <!-- 二級評論插入到這裡 -->
                                 <!-- 二級評論輸入框 -->
                                <div class="col-lg-12 col-md-12 col-sm-12 col-ss-12" style="margin-top: 10px;">
                                    <input type="text" class="form-control" placeholder="評論一下....." id="input-${reply.replyPkId}">
                                    <button type="button" class="btn btn-success" style="float: right;margin: 10px;"
                                            onclick="replypost(this)" data-id="${reply.replyPkId}">
                                        提交
                                    </button>
                                </div>
                            </div>
                        </h4>
                    </div>
                </div>
            </div>
            </c:forEach>

            <!--回覆框-->
            <div class="col-lg-12 col-md-12 col-sm-12 col-ss-12" id="comment_section">
             <br>
                <div class="media" style="margin-bottom: 20px">
                    <div class="media-left">
                        <img class="avatar-img rounded-circle" style="width: 100px;height: 100px"
                             src="<c:url value='${member.photosImagePath}' />">
                    </div>
                    <div class="media-body" style="padding-top:10px;">
                        <h2 class="media-heading" style="line-height: 60px">
<!--                         這裡預想改成session的user(登錄者)，然後設個id給js抓，傳json給replyController -->
                            ${member.memberName}
                        </h2>
                    </div>
                </div>
                <input type="hidden" id="question_id" value="${question.questionPkId}">
                <textarea class="form-control" rows="6" style="margin-top:10px; margin-bottom: 10px;"
                          id="content"></textarea>
                <button type="button" class="btn btn-success" style="float: right;margin: 10px;"
                        onclick="post()"><b>送出</b>
                </button>
            </div>
        </div>
        <!--右側信息框-->
        <div class="col-lg-3 col-md-12 col-sm-12 col-ss-12">
            <div class="col-lg-12 col-md-12 col-sm-12 col-ss-12">
                <h2><b>問題發起人</b></h2>
                <div class="media">
                    <div class="media-left"> 
                        <img class="avatar-img rounded-circle" style="width: 150px;height: 150px"   
                         src="<c:url value='${question.member.photosImagePath}' />"><!-- 暫時放測試圖片，之後要改成讓使用者上傳 -->
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">
                            <span style="line-height: 130px;font-size: 20px">${question.member.memberName}</span>
                        </h4>
                    </div>
                </div>
            </div>
            <hr class="col-lg-12 col-md-12 col-sm-12 col-ss-12">
<!--             ============================ -->
			<div class="col-lg-12 col-md-12 col-sm-12 col-ss-12"><h1><b>相關問題</b></h1></div>
							<div class="doctor-slider slider col-lg-12 col-md-12 col-sm-12 col-ss-12 drop-shadow">
							
								<!-- Doctor Widget -->
								<c:forEach var="relativequestion" items="${relativequestion}">
								<div class="profile-widget">
<!-- 									<div class="doc-img"> -->
<!-- 										<a href="doctor-profile.html"> -->
<%-- 											<img class="img-fluid" alt="User Image" src="<c:url value='${relativequestion.member.photosImagePath}' />"> --%>
<!-- 										</a> -->
<!-- 										<a href="javascript:void(0)" class="fav-btn"> -->
<!-- 											<i class="far fa-bookmark"></i> -->
<!-- 										</a> -->
<!-- 									</div> -->
									<div class="pro-content">
									<div class="box" style="padding-left: 0px">
										<a class="ellipsis2" href="doctor-profile.html"><b>${relativequestion.title}</b></a> 									
									</div>
										<div class="box" style="padding-left: 20px"><span class="ellipsis">${relativequestion.description}</span></div>
										<ul class="available-info">
											<li>
												<i class="fa fa-user"></i>發問人: ${relativequestion.member.memberName}
											</li>
											<li>
												<i class="far fa-clock"></i> ${relativequestion.createtime}
											</li>
										</ul>
										<div class="row row-sm">
											<div class="col-12">
												<a href="<c:url value='/question/${relativequestion.questionPkId}' />" class="btn view-btn">前往查看</a>
											</div>
										</div>
									</div>
								</div>
								</c:forEach>
								<!-- /Doctor Widget -->
								
							</div>
<!-- =================================================== -->
            <!--相关问题-->
<!--             <div class="col-lg-12 col-md-12 col-sm-12 col-ss-12"> -->
<!--                 <h4>相关问题</h4> -->
<!--                 <ul class="list-group"> -->
<%--                     <li class="list-group-item"  th:each="relative:${relativequestion}"> --%>
<%--                         <a th:href="@{'/question/'+${relative.id}}" th:text="${relative.title}"></a> --%>
<!--                     </li> -->
<!--                 </ul> -->
<!--             </div> -->
<%-- <c:forEach var="relativequestion" items="${relativequestion}">${relativequestion.title}<br></c:forEach> --%>
        </div>
    </div>
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

<script type="text/javascript">

function post() {
    var questionid = $("#question_id").val();
    var content = $("#content").val();
    if (content == '') {
        alert("回覆內容不能為空")
    } else {
        $.ajax({
            type: "POST",
            url: "/beauty/reply",
            contentType: 'application/json',
            data: JSON.stringify({
                "parentid": questionid,
                "type": 1,
                "content": content
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
}


function replypost(e) {
    var commentid = e.getAttribute("data-id");
    var content = $("#input-" + commentid).val();
    if (content == '') {
        alert("回覆內容不能為空")
    } else {
        $.ajax({
            type: "POST",
            url: "/beauty/reply",
            contentType: 'application/json',
            data: JSON.stringify({
                "parentid": commentid,
                "type": 2,
                "content": content
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

        console.log(commentid);
        console.log(content);
    }
}

	
function secondcomment(e) {
	console.log("111111111");
    var id = e.getAttribute("data-id");
    var check = e.getAttribute("data-check");
    var reply = $("#reply-" + id);
    //如果check为1则展开二级评论，否则收缩
    if (check == "1") {
        $.getJSON("/beauty/reply/" + id, function (data) {
            var subCommentContainer = $("#reply-" + id);
            <%--//如果子元素的长度为1，即第一次添加，则调用下面的方法--%>
            if (subCommentContainer.children().length == 1) {
                $.each(data.data.reverse(), function (index, reply) {
                	<%--//对应<span th:text="${comment.user.name}"/>--%>
                    var usernameElement = $("<span/>", {
                    	"style": "font-size: 15px;",
                        html: reply.memberName
                    });
                    <%--//对应<div style="font-size: 15px; margin-top:5px;"--%>
                    <%--//      th:text="${comment.content}">--%>
                    <%--//    </div>--%>
                    var contentElement = $("<div/>", {
                        "style": "font-size: 15px; margin-top:10px;",
                        html: reply.content
                    });

                    var timeElement = $("<span/>", {
                        "style": "float: right",
                        html: moment(reply.createtime).format('YYYY-MM-DD HH:mm')
                    });
                    var questionmenuElement = $("<div/>", {
                        "class": "question-menu"
                    }).append(timeElement);
                    
                    var imgElement = $("<img/>", {
                    	 "class": "media-object img-rounded picset",
                    	 "style": "weight: 70px;height: 70px;margin-bottom: 10px",
                        "src": reply.headpic
                    });

                    var medialeftElement = $("<div/>", {
                        "class": "media-left"
                    }).append(imgElement);
														
                    var mediaheadingElement = $("<h4/>", {
                        "class": "media-heading",
                    }).append(usernameElement)
                        .append(contentElement)
                        .append(questionmenuElement);

                    var mediabodyElement = $("<div/>", {
                        "class": "media-body",
                    }).append(mediaheadingElement);

                    var mediaElement = $("<div/>", {
                        "class": "media"
                    }).append(medialeftElement)
                      .append(mediabodyElement);
                    
                    

                    var commentElement = $("<div/>", {
                        "class": "col-lg-12 col-md-12 col-sm-12 col-ss-12 comments",
                    }).append(mediaElement);
					
                    subCommentContainer.prepend(commentElement);
                })
            }
        });
        reply.addClass("in");
        e.setAttribute("data-check", "0");
        e.classList.add("active");

    } else {
    	reply.removeClass("in");
        e.setAttribute("data-check", "1")
        e.classList.remove("active");
    }
}

function favpost(e) {
    var questionid = $("#question_id").val();
        $.ajax({
            type: "POST",
            url: "/beauty/favorites",
            async:false,
            contentType: 'application/json',
            data: JSON.stringify({
                "questionPkId": questionid,
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

</script>
        
<!-- jQuery -->
	<script src="<c:url value='/assets/js/jquery.min.js' />"></script>
	<!-- Bootstrap Core JS -->
	<script src="<c:url value='/assets/js/popper.min.js' />"></script>
<!-- 	<script src="http://cdn.bootstrapmb.com/bootstrap/4.4.0/js/bootstrap.min.js"></script>  -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
		<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
		
		<!-- Slick JS -->
		<script src="<c:url value='/assets/js/slick.js' />"></script>
		<!-- Custom JS -->
		<script src="<c:url value='/assets/js/script.js' />"></script>
</body>
</html>