<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>問題發佈</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0">
<!-- Favicons -->
<link href="<c:url value='/assets/img/favicon.png'></c:url>" rel="icon">
<!-- Bootstrap CSS -->
<!-- <link rel="stylesheet" -->
<!-- 	href="http://cdn.bootstrapmb.com/bootstrap/4.4.0/css/bootstrap.min.css"> -->
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
	
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
	
	
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    
    <!-- Main CSS -->
<link rel="stylesheet"
	href="<c:url value='/assets/css/style2.css'></c:url>">
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
							<h2 class="breadcrumb-title">問題發佈</h2>
						</div>
					</div>
				</div>
			</div>
			<!-- /Breadcrumb -->
			
			<!-- 問題發佈頁面 -->
			<div class="container-fluid main">
    <div class="row">
        <div class="col-lg-9 col-md-12 col-sm-12 col-ss-12">
            <i class='fas fa-pen' style='font-size:36px'></i><h2><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 發起問題 </h2>
            <hr>
<!--             這裡寫判斷兩種路徑是針對修改的情況，若是新增則沒差，都是空的，因為修改第一次點進來的時候是從question.jsp的編輯按鈕經過controller送過來，路徑帶有 -->
<!--             question.questionPkId，抓到id就可以判斷是新增，但如果有欄位格式出錯網頁重跳轉進來id會不見，這樣再送出會變新增，所以從controller那把第一次傳過去的 -->
<!--             id放在modelattribute的quId裡，這樣就算重跳轉也能在抓到id，目前這樣處理，應該還有更好的方法 -->
			<form action="
			<c:if test="${question.questionPkId != null}"><c:url value='/publish?quId=${question.questionPkId}' /></c:if>
			<c:if test="${question.questionPkId == null}"><c:url value='/publish?quId=${quId}' /></c:if>
			" method="post">
			
                
<%--                 <P>que ${question.questionPkId}</P> --%>
<%--                 <P>que2 ${quId}</P> --%>
				<!--透過隱藏標籤判斷是創建問題還是編輯問題，因為傳回的值若有主鍵就是修改，沒有是新增(對JPA來說)-->
<!-- 				這裡做的判斷跟上面form的action一樣 -->
                <c:if test="${question.questionPkId != null}">
                <input type="hidden" name="questionPkId" value="${question.questionPkId}">
                </c:if>
                <input type="hidden" name="questionPkId" value="${quId}">
          <!-- 分類選擇 -->
                <div class="form-group">
                	<select id="sel" name="type">
						<!-- 判斷第一次點進來沒有經過驗證 -->
                		<c:if test="${questionDto.type == null}">
                		<!-- 新增的情況所以type沒值，要顯示請選擇分類 -->
                		<c:if test="${question.type==null}">
                			<option value="" selected>請選擇分類</option>
                		</c:if>
                		<!-- 秀出所有分類，判斷若是更新已經有選過的值給selected屬性 -->
                		<c:forEach var="type" items="${types}">
	                		<c:if test="${question.type.typePkId==type.typePkId}">
	                			<option value="${question.type.typePkId}" selected>${question.type.typeName}</option>
	                		</c:if>
					    	<c:if test="${question.type.typePkId!=type.typePkId}">
					    		<option value="${type.typePkId}">${type.typeName}</option>
					    	</c:if>
					    </c:forEach>
					    </c:if>
					    <!-- 若是送出後驗證有問題則在返回頁面，此時questionDto.type有值，繼續顯示選過的選項 -->
					    <c:if test="${questionDto.type != null}">
						    <c:forEach var="type" items="${types}">
						    	<c:if test="${type.typePkId==questionDto.type.typePkId}">
						    	<option value="${questionDto.type.typePkId}" selected>${questionDto.type.typeName}</option>
						    	</c:if>
						    	<c:if test="${type.typePkId!=questionDto.type.typePkId}">
						    	<option value="${type.typePkId}">${type.typeName}</option>
						    	</c:if>
						    </c:forEach>
					    </c:if>
					</select>
					<p class="form-control-static text-danger"><form:errors path="questionDto.type"/></p>
                </div>
          <!-- 分類選擇 -->
                
                <div class="form-group">
                    <label for="title">問題標題</label>
                    <c:if test="${questionDto.title==null}">
                    <input id="inptitle" type="text" class="form-control" value="${question.title}" id="title" name="title" autocomplete="on" >
                    </c:if>
                    <c:if test="${questionDto.title!=null}">
                    <input id="inptitle" type="text" class="form-control" value="${questionDto.title}" id="title" name="title" autocomplete="on" >
                    </c:if>
                    <p class="form-control-static text-danger"><form:errors path="questionDto.title"/></p>
                </div>
                
                <div class="form-group" id="question-editor">
                    <label for="description">問題內容</label>
                    <c:if test="${questionDto.description==null}">
                    <textarea class="form-control" name="description" id="summernote" 
                              cols="20" rows="15">${question.description}</textarea>
                    </c:if>
                    <c:if test="${questionDto.description!=null}">
                    <textarea class="form-control" name="description" id="summernote" 
                              cols="20" rows="15">${questionDto.description}</textarea>
                    </c:if>
                    <p class="form-control-static text-danger"><form:errors path="questionDto.description"/></p>
                </div>
                
                <!--editor.md相关-->
<!-- <!--                 <script type="text/javascript"> --> 
<!-- //                     $(function() { -->
<!-- //                         var editor = editormd("question-editor", { -->
<!-- //                             width  : "100%", -->
<!-- //                             height : 600, -->
<!-- //                             path   : "/js/lib/", -->
<!-- //                             watch : false -->
<!-- //                         }); -->
<!-- //                     }); -->
<!-- <!--                 </script> --> 

                <div class="form-group" >
                    <label for="tag">添加標籤</label>
<%--                     <c:if test="${questionDto.description==null}"> --%>
<!--                     <input type="text" class="form-control" id="tag" autocomplete="on" -->
<%--                            value="${question.tag}" name="tag" onclick="showselecttag()"> --%>
<%--                     </c:if> --%>
<%--                     <c:if test="${questionDto.description!=null}"> --%>
                    <input type="text" class="form-control" id="tag" autocomplete="on"
                           value="${questionDto.tag}" name="tag" onclick="showselecttag()">
<%--                     </c:if> --%>
<%--                      <p class="form-control-static text-danger"><form:errors path="questionDto.tag"/></p> --%>
                </div>
                <!--標籤頁-->
<%--                 <a th:href="@{'#'+${category.categoryname}}" aria-controls="home" --%>
                        
                <div id="select-tags" style="display: none">
                    <ul class="nav nav-tabs" role="tablist">
                    
						<c:forEach var='category' items='${tags}' varStatus="status">
						<c:if test="${status.first}">
                        <li role="presentation" class="active">
                            <a href="<c:url value='/"#"${category.categoryname}' />" aria-controls="home"
                               role="tab" data-toggle="tab">${category.categoryname}
                            </a>
                        </li>
                        </c:if>
                        <c:if test="${!status.first}">
                        <li role="presentation">
                            <a href="<c:url value='/"#"${category.categoryname}' />" aria-controls="home"
                               role="tab" data-toggle="tab">${category.categoryname}
                            </a>
                        </li>
                        </c:if>
						</c:forEach>
						
                    </ul>
                    <div class="tab-content" style="padding-top: 15px;">

                    	<c:forEach var='category' items='${tags}' varStatus="status">
                    	
                    	<c:if test="${status.first}">
                        <div role="tabpanel" 
                             class="active tab-pane" id="${category.categoryname}">
                             <c:forEach var='selecttags' items='${category.tags}'>
                            <span class="label label-info" onclick="selectTag(this)" data-tag="${selecttags}">${selecttags}</span>
                            </c:forEach>
                        </div>
                        </c:if>
                        
                        <c:if test="${!status.first}">
                        	<div role="tab-pane" 
                             class="tab-pane" id="${category.categoryname}">
                             <c:forEach var='selecttags' items='${category.tags}'>
                            <span class="label label-info" onclick="selectTag(this)" data-tag="${selecttags}">${selecttags}</span>
                            </c:forEach>
                        </div>
                        </c:if>
                        
                        </c:forEach>
                        
                    </div>
                </div>
                <!--標籤頁-->



                <button id="ipsb" type="submit" class="btn btn-primary" style="float: right"><b>送出問題</b></button>
<%--                 <span class="alert alert-danger" role="alert" th:text="${error}" th:if="${error}!= null"></span> --%>
            </form>
        </div>
        <div class="col-lg-3 col-md-12 col-sm-12 col-ss-12">
            <h3>發起問題說明</h3>
            <h4>問題標題：請用簡潔的標題描述發佈問題</h4>
            <h4>問題內容：詳細描述問題的內容</h4>
            <h4>選擇標籤：選擇一個或多個合適的標籤</h4>
        </div>
    </div>
</div>
<br>	
	<!-- /問題發佈頁面 -->		

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
<%-- 	<script src="<c:url value='/assets/js/jquery.min.js' />"></script> --%>
<!-- 	Bootstrap Core JS -->
<%-- 	<script src="<c:url value='/assets/js/popper.min.js' />"></script> --%>
<!-- 	<script -->
<!-- 		src="http://cdn.bootstrapmb.com/bootstrap/4.4.0/js/bootstrap.min.js"></script> -->
<!-- 	Sticky Sidebar JS -->
	<script
		src="<c:url value='/assets/plugins/theia-sticky-sidebar/ResizeSensor.js' />"></script>
	<script
		src="<c:url value='/assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js' />"></script>
	<!-- Custom JS -->
	<script src="<c:url value='/assets/js/script.js' />"></script>
<!-- 	Select2 JS -->
		<script src="<c:url value='/assets/plugins/select2/js/select2.min.js' />"></script>
		<!-- Datetimepicker JS -->
		<script src="<c:url value='/assets/js/moment.min.js' />"></script>
		<script src="<c:url value='/assets/js/bootstrap-datetimepicker.min.js' />"></script>
		
		<!-- Fancybox JS -->
		<script src="<c:url value='/assets/plugins/fancybox/jquery.fancybox.min.js' />"></script>
		
		
		
		<script>	
		
		 $('#summernote').summernote({
		        height: 400, 
		      });
		
		//儲存草稿用，遇到問題還沒做
// 		$(window).bind('beforeunload',function(){
// 			var title = $("#inptitle").val();
// 			var sel = $("#sel").val();
// 			var content = $("#summernote").val();
// 	        $.ajax({
// 	            type: "POST",
// 	            url: "/beauty/testa",
// 	            contentType: 'application/json',
// 	            data: JSON.stringify({
// 	                "title": title,
// 	                "type.typePkId": sel,
// 	                "description": title
// 	            }),
// 	            success: function (data) {
// 	                if (data.code == 200) {
	                	
// 	                } else {
// 	                    alert("出現了錯誤");
// 	                }
// 	            },
// 	            dataType: "json"
// 	        });
// 	        return '提示資訊';
			
// 			}
// 			);

// 		$("#ipsb").click(function () {
// 		    $(window).unbind('beforeunload');
// 		});
  		</script>
</body>
</html>