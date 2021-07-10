<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後臺首頁</title>
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
	name="viewport" />

		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="../static/img/favicon.png">
		
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="http://cdn.bootstrapmb.com/bootstrap/4.3.1/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="../static/css/font-awesome.min.css">
		
		<!-- Feathericon CSS -->
        <link rel="stylesheet" href="../static/css/feathericon.min.css">
		
		<link rel="stylesheet" href="../static/plugins/morris/morris.css">
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="../static/css/style.css">
		
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->

</head>
<body>

	<!-- Main Wrapper -->
        <div class="main-wrapper">
		
			<!-- Header -->
            <div class="header">
			
				<!-- Logo -->
                <div class="header-left">
                    <a href="index.html" class="logo">
						<img src="../static/img/logo.png" alt="Logo">
					</a>
					<a href="index.html" class="logo logo-small">
						<img src="../static/img/logo-small.png" alt="Logo" width="30" height="30">
					</a>
                </div>
				<!-- /Logo -->
				
				<a href="javascript:void(0);" id="toggle_btn">
					<i class="fe fe-text-align-left"></i>
				</a>
				
				<div class="top-nav-search">
					<form>
						<input type="text" class="form-control" placeholder="Search here">
						<button class="btn" type="submit"><i class="fa fa-search"></i></button>
					</form>
				</div>
				
				<!-- Mobile Menu Toggle -->
				<a class="mobile_btn" id="mobile_btn">
					<i class="fa fa-bars"></i>
				</a>
				<!-- /Mobile Menu Toggle -->
				
				<!-- Header Right Menu -->
				<ul class="nav user-menu">

					<!-- Notifications -->
					<li class="nav-item dropdown noti-dropdown">
						<a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
							<i class="fe fe-bell"></i> <span class="badge badge-pill"></span>
						</a>
						<div class="dropdown-menu notifications">
							<div class="topnav-dropdown-header">
								<span class="notification-title">Notifications</span>
								<a href="javascript:void(0)" class="clear-noti"> Clear All </a>
							</div>
							<div class="topnav-dropdown-footer">
								<a href="#">View all Notifications</a>
							</div>
						</div>
					</li>
					<!-- /Notifications -->
					
					<!-- User Menu -->
					<li class="nav-item dropdown has-arrow">
						<a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
							<span class="user-img"><img class="rounded-circle" src="../static/img/profiles/avatar-01.jpg" width="31" alt="Ryan Taylor"></span>
						</a>
						<div class="dropdown-menu">
							<div class="user-header">
								<div class="avatar avatar-sm">
									<img src="../static/img/profiles/avatar-01.jpg" alt="User Image" class="avatar-img rounded-circle">
								</div>
								<div class="user-text">
								
									<h6>Admin</h6>
									<p class="text-muted mb-0">Administrator</p>
									
									
									
								</div>
							</div>
							<a class="dropdown-item" href="javascript:logout();">Logout</a>
						</div>
					</li>
					<!-- /User Menu -->
					
					
					
				</ul>
				<!-- /Header Right Menu -->
				
            </div>
			<!-- /Header -->
			
			<!-- Sidebar -->
            <div class="sidebar" id="sidebar">
                <div class="sidebar-inner slimscroll">
					<div id="sidebar-menu" class="sidebar-menu">
						<ul>
							<li class="menu-title"> 
								<span>Main</span>
							</li>
							<li class="active"> 
								<a href="index.html"><i class="fe fe-home"></i> <span>Dashboard</span></a>
							</li>
							<li> 
								<a href="#"><i class="fe fe-layout"></i> <span>Classification</span><span class="menu-arrow"></span></a>
								<ul style="display: none;">
									<li><a href="javascript:changePage('category');">First</a></li>
									<li><a href="javascript:changePage('categorySec');">Second</a></li>
								</ul>
							</li>
<!-- 							<li>  -->
<!-- 								<a href="specialities.html"><i class="fe fe-users"></i> <span>Specialities</span></a> -->
<!-- 							</li> -->
<!-- 							<li>  -->
<!-- 								<a href="doctor-list.html"><i class="fe fe-user-plus"></i> <span>Doctors</span></a> -->
<!-- 							</li> -->
<!-- 							<li>  -->
<!-- 								<a href="patient-list.html"><i class="fe fe-user"></i> <span>Patients</span></a> -->
<!-- 							</li> -->
<!-- 							<li>  -->
<!-- 								<a href="reviews.html"><i class="fe fe-star-o"></i> <span>Reviews</span></a> -->
<!-- 							</li> -->
<!-- 							<li>  -->
<!-- 								<a href="transactions-list.html"><i class="fe fe-activity"></i> <span>Transactions</span></a> -->
<!-- 							</li> -->
<!-- 							<li>  -->
<!-- 								<a href="settings.html"><i class="fe fe-vector"></i> <span>Settings</span></a> -->
<!-- 							</li> -->
<!-- 							<li class="submenu"> -->
<!-- 								<a href="#"><i class="fe fe-document"></i> <span> Reports</span> <span class="menu-arrow"></span></a> -->
<!-- 								<ul style="display: none;"> -->
<!-- 									<li><a href="invoice-report.html">Invoice Reports</a></li> -->
<!-- 								</ul> -->
<!-- 							</li> -->
<!-- 							<li class="menu-title">  -->
<!-- 								<span>Pages</span> -->
<!-- 							</li> -->
<!-- 							<li>  -->
<!-- 								<a href="profile.html"><i class="fe fe-user-plus"></i> <span>Profile</span></a> -->
<!-- 							</li> -->
<!-- 							<li class="submenu"> -->
<!-- 								<a href="#"><i class="fe fe-document"></i> <span> Authentication </span> <span class="menu-arrow"></span></a> -->
<!-- 								<ul style="display: none;"> -->
<!-- 									<li><a href="login.html"> Login </a></li> -->
<!-- 									<li><a href="register.html"> Register </a></li> -->
<!-- 									<li><a href="forgot-password.html"> Forgot Password </a></li> -->
<!-- 									<li><a href="lock-screen.html"> Lock Screen </a></li> -->
<!-- 								</ul> -->
<!-- 							</li> -->
<!-- 							<li class="submenu"> -->
<!-- 								<a href="#"><i class="fe fe-warning"></i> <span> Error Pages </span> <span class="menu-arrow"></span></a> -->
<!-- 								<ul style="display: none;"> -->
<!-- 									<li><a href="error-404.html">404 Error </a></li> -->
<!-- 									<li><a href="error-500.html">500 Error </a></li> -->
<!-- 								</ul> -->
<!-- 							</li> -->
<!-- 							<li>  -->
<!-- 								<a href="blank-page.html"><i class="fe fe-file"></i> <span>Blank Page</span></a> -->
<!-- 							</li> -->
<!-- 							<li class="menu-title">  -->
<!-- 								<span>UI Interface</span> -->
<!-- 							</li> -->
<!-- 							<li>  -->
<!-- 								<a href="components.html"><i class="fe fe-vector"></i> <span>Components</span></a> -->
<!-- 							</li> -->
<!-- 							<li class="submenu"> -->
<!-- 								<a href="#"><i class="fe fe-layout"></i> <span> Forms </span> <span class="menu-arrow"></span></a> -->
<!-- 								<ul style="display: none;"> -->
<!-- 									<li><a href="form-basic-inputs.html">Basic Inputs </a></li> -->
<!-- 									<li><a href="form-input-groups.html">Input Groups </a></li> -->
<!-- 									<li><a href="form-horizontal.html">Horizontal Form </a></li> -->
<!-- 									<li><a href="form-vertical.html"> Vertical Form </a></li> -->
<!-- 									<li><a href="form-mask.html"> Form Mask </a></li> -->
<!-- 									<li><a href="form-validation.html"> Form Validation </a></li> -->
<!-- 								</ul> -->
<!-- 							</li> -->
<!-- 							<li class="submenu"> -->
<!-- 								<a href="#"><i class="fe fe-table"></i> <span> Tables </span> <span class="menu-arrow"></span></a> -->
<!-- 								<ul style="display: none;"> -->
<!-- 									<li><a href="tables-basic.html">Basic Tables </a></li> -->
<!-- 									<li><a href="data-tables.html">Data Table </a></li> -->
<!-- 								</ul> -->
<!-- 							</li> -->
<!-- 							<li class="submenu"> -->
<!-- 								<a href="javascript:void(0);"><i class="fe fe-code"></i> <span>Multi Level</span> <span class="menu-arrow"></span></a> -->
<!-- 								<ul style="display: none;"> -->
<!-- 									<li class="submenu"> -->
<!-- 										<a href="javascript:void(0);"> <span>Level 1</span> <span class="menu-arrow"></span></a> -->
<!-- 										<ul style="display: none;"> -->
<!-- 											<li><a href="javascript:void(0);"><span>Level 2</span></a></li> -->
<!-- 											<li class="submenu"> -->
<!-- 												<a href="javascript:void(0);"> <span> Level 2</span> <span class="menu-arrow"></span></a> -->
<!-- 												<ul style="display: none;"> -->
<!-- 													<li><a href="javascript:void(0);">Level 3</a></li> -->
<!-- 													<li><a href="javascript:void(0);">Level 3</a></li> -->
<!-- 												</ul> -->
<!-- 											</li> -->
<!-- 											<li><a href="javascript:void(0);"> <span>Level 2</span></a></li> -->
<!-- 										</ul> -->
<!-- 									</li> -->
<!-- 									<li> -->
<!-- 										<a href="javascript:void(0);"> <span>Level 1</span></a> -->
<!-- 									</li> -->
<!-- 								</ul> -->
<!-- 							</li> -->
						</ul>
					</div>
                </div>
            </div>
			<!-- /Sidebar -->
			
			<!-- Page Wrapper -->
            <div class="page-wrapper">
			
                <div class="content container-fluid">
					
					<!-- Page Header -->
					<div class="page-header">
						<div class="row">
							<div class="col-sm-12">
								<h3 class="page-title">Welcome <span text="${session.login_user.username}"></span></h3>
								<span text="${session.login_user.username}"></span>
								<ul class="breadcrumb">
									<li class="breadcrumb-item active">Dashboard</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->

					
				</div>			
			</div>
			<!-- /Page Wrapper -->
		
        </div>
		<!-- /Main Wrapper -->
		
		<!-- jQuery -->
        <script src="../static/js/jquery-3.2.1.min.js"></script>
		
		<!-- Bootstrap Core JS -->
        <script src="../static/js/popper.min.js"></script>
        <script src="http://cdn.bootstrapmb.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		
		<!-- Slimscroll JS -->
        <script src="../static/plugins/slimscroll/jquery.slimscroll.min.js"></script>
		
		<script src="../static/plugins/raphael/raphael.min.js"></script>    
		<script src="../static/plugins/morris/morris.min.js"></script>  
		<script src="../static/js/chart.morris.js"></script>
		
		<!-- Custom JS -->
		<script  src="../static/js/script.js"></script>
		

	<!-- END FOOTER -->

	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->

	<!-- BEGIN CORE PLUGINS -->

	<script src="../ide/js/jquery-1.10.1.min.js" type="text/javascript"></script>

	<script src="../ide/js/jquery-migrate-1.2.1.min.js"
		type="text/javascript"></script>

	<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->

	<script src="../ide/js/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript"></script>

	<script src="../ide/js/bootstrap.min.js}" type="text/javascript"></script>

	<!--[if lt IE 9]>

<script th:src="media/js/excanvas.min.js}"></script>

<script th:src="media/js/respond.min.js}"></script>

<![endif]-->

	<script src="../ide/js/jquery.slimscroll.min.js}"
		type="text/javascript"></script>

	<script src="../ide/js/jquery.blockui.min.js" type="text/javascript"></script>

	<script src="../ide/js/jquery.cookie.min.js" type="text/javascript"></script>

	<script src="../ide/js/jquery.uniform.min.js" type="text/javascript"></script>

	<!-- END CORE PLUGINS -->

	<!-- BEGIN PAGE LEVEL PLUGINS -->

	<!--<script th:src="media/js/jquery.vmap.js" type="text/javascript"></script>

<script th:src="@{/js/jquery.vmap.russia.js" type="text/javascript"></script>

<script th:src="@{/js/jquery.vmap.world.js" type="text/javascript"></script>

<script th:src="@{/js/jquery.vmap.europe.js" type="text/javascript"></script>

<script th:src="@{/js/jquery.vmap.germany.js" type="text/javascript"></script>

<script th:src="@{/js/jquery.vmap.usa.js" type="text/javascript"></script>

<script th:src="@{/js/jquery.vmap.sampledata.js" type="text/javascript"></script>

<script th:src="@{/js/jquery.flot.js" type="text/javascript"></script>

<script th:src="@{/js/jquery.flot.resize.js" type="text/javascript"></script>

<script th:src="@{/js/jquery.pulsate.min.js" type="text/javascript"></script>

<script th:src="@{/js/date.js" type="text/javascript"></script>

<script th:src="@{/js/daterangepicker.js" type="text/javascript"></script>

<script th:src="@{/js/jquery.gritter.js" type="text/javascript"></script>

<script th:src="@{/js/fullcalendar.min.js" type="text/javascript"></script>

<script th:src="@{/js/jquery.easy-pie-chart.js" type="text/javascript"></script>

<script th:src="@{/js/jquery.sparkline.min.js" type="text/javascript"></script>  -->

	<!-- END PAGE LEVEL PLUGINS -->

	<!-- BEGIN PAGE LEVEL SCRIPTS -->

	<script src="../ide/js/app.js" type="text/javascript"></script>

	<script src="../ide/js/index.js" type="text/javascript"></script>

	<!-- END PAGE LEVEL SCRIPTS -->

	<script>
		jQuery(document).ready(function() {

			App.init(); // initlayout and core plugins

			//		   Index.init();
			//
			//		   Index.initJQVMAP(); // init index page's custom scripts
			//
			//		   Index.initCalendar(); // init index page's custom scripts
			//
			//		   Index.initCharts(); // init index page's custom scripts
			//
			//		   Index.initChat();
			//
			//		   Index.initMiniCharts();
			//
			//		   Index.initDashboardDaterange();
			//
			//		   Index.initIntro();
		});

		function changePage(page) {
			$(".page-sidebar-menu li").removeClass("active");
			if ('categorySec' == page) {
				$("#category").addClass("active").find("a").eq(0).append(
						$('<span class="selected"></span>'));
				$("#categorysec").addClass("active");
				$("#mainFrame")
						.attr("src", "classification/toList.html?type=2");
				return;
			} else if ('category' == page) {
				$("#category").addClass("active").find("a").eq(0).append(
						$('<span class="selected"></span>'));
				$("#category_1").addClass("active");
				$("#mainFrame")
						.attr("src", "classification/toList.html?type=1");
				return;
			} else {
				$("#" + page).addClass("active").find("a").eq(0).append(
						$('<span class="selected"></span>'));
			}
			$("#mainFrame").attr("src", page + "/toList.html");
		}

		changePage("user");

		function logout() {
			if (confirm("是否確定要登出")) {
				window.location.href = "logout.do";
			}
		}
	</script>

	<!-- END JAVASCRIPTS -->
</body>

<!-- END BODY -->

</html>