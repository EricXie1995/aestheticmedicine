<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
<title>貼文管理</title>	
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="<c:url value='/adminassets/img/favicon.png' />">
		
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="http://cdn.bootstrapmb.com/bootstrap/4.3.1/css/bootstrap.min.css">
		
<!-- Fontawesome CSS -->
<link rel="stylesheet" href="<c:url value='/adminassets/css/font-awesome.min.css' />">

<!-- Datatables CSS -->
<link rel="stylesheet" href="<c:url value='/adminassets/plugins/datatables/datatables.min.css' />">
		
<!-- Feathericon CSS -->
<link rel="stylesheet" href="<c:url value='/adminassets/css/feathericon.min.css' />">
<link rel="stylesheet" href="<c:url value='/adminassets/plugins/morris/morris.css' />">	
	
<!-- Main CSS -->
<link rel="stylesheet" href="<c:url value='/adminassets/css/style.css' />">


<link rel="stylesheet" href="<c:url value='/js/forum/custom/custom.css' />">
<!-- modal -->
<script src="<c:url value='/js/forum/custom/dashboard-modal.js' />"></script> 
<!-- bootstrap-select -->
<link rel="stylesheet" href="<c:url value='/js/forum/bootstrap-select/css/bootstrap-select.min.css' />">
<script src="<c:url value='/js/forum/bootstrap-select/js/bootstrap-select.min.js' />"></script>
<script src="<c:url value='/js/forum/bootstrap-select/js/i18n/defaults-zh_CN.min.js' />"></script>
<!-- date range picker -->
<script src="<c:url value='/js/forum/daterangepicker/moment.min.js' />"></script>
<link rel="stylesheet" href="<c:url value='/js/forum/daterangepicker/daterangepicker.css' />">
<script src="<c:url value='/js/forum/daterangepicker/daterangepicker.js' />"></script>
<script src="<c:url value='/js/forum/custom/daterangepicker.js' />"></script>
<!-- chart js -->
<script src="<c:url value='/js/forum/chartjs/Chart.min.js' />"></script>

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
width: 100px;
/* padding: 10px; */
/* border: #4caf50 2px solid; */
}
.ellipsis {
overflow:hidden;
white-space: nowrap;
text-overflow: ellipsis;
display: -webkit-box;
-webkit-line-clamp: 1; /*行數*/
-webkit-box-orient: vertical;
white-space: normal;
}
</style>
</head>
<body>
<!-- Main Wrapper -->
        <div class="main-wrapper">
		
			<!-- Header -->
            <div class="header">
			
				<!-- Logo -->
                <div class="header-left">
                    <a href="index.html" class="logo">
						<img src="assets/img/logo.png" alt="Logo">
					</a>
					<a href="index.html" class="logo logo-small">
						<img src="assets/img/logo-small.png" alt="Logo" width="30" height="30">
					</a>
                </div>
				<!-- /Logo -->
				
				<a href="javascript:void(0);" id="toggle_btn">
					<i class="fe fe-text-align-left"></i>
				</a>
				
<!-- 				<div class="top-nav-search"> -->
<%-- 					<form action="<c:url value="/adminQuestion" />"> --%>
<!-- 						<input type="text" name="likeString" class="form-control" placeholder="搜尋"> -->
<!-- 						<button class="btn" type="submit"><i class="fa fa-search"></i></button> -->
<!-- 					</form> -->
<!-- 				</div> -->
				
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
							<i class="fe fe-bell"></i> <span class="badge badge-pill">3</span>
						</a>
						<div class="dropdown-menu notifications">
							<div class="topnav-dropdown-header">
								<span class="notification-title">Notifications</span>
								<a href="javascript:void(0)" class="clear-noti"> Clear All </a>
							</div>
							<div class="noti-content">
								<ul class="notification-list">
									<li class="notification-message">
										<a href="#">
											<div class="media">
												<span class="avatar avatar-sm">
													<img class="avatar-img rounded-circle" alt="User Image" src="assets/img/doctors/doctor-thumb-01.jpg">
												</span>
												<div class="media-body">
													<p class="noti-details"><span class="noti-title">Dr. Ruby Perrin</span> Schedule <span class="noti-title">her appointment</span></p>
													<p class="noti-time"><span class="notification-time">4 mins ago</span></p>
												</div>
											</div>
										</a>
									</li>
									<li class="notification-message">
										<a href="#">
											<div class="media">
												<span class="avatar avatar-sm">
													<img class="avatar-img rounded-circle" alt="User Image" src="assets/img/patients/patient1.jpg">
												</span>
												<div class="media-body">
													<p class="noti-details"><span class="noti-title">Charlene Reed</span> has booked her appointment to <span class="noti-title">Dr. Ruby Perrin</span></p>
													<p class="noti-time"><span class="notification-time">6 mins ago</span></p>
												</div>
											</div>
										</a>
									</li>
									<li class="notification-message">
										<a href="#">
											<div class="media">
												<span class="avatar avatar-sm">
													<img class="avatar-img rounded-circle" alt="User Image" src="assets/img/patients/patient2.jpg">
												</span>
												<div class="media-body">
												<p class="noti-details"><span class="noti-title">Travis Trimble</span> sent a amount of $210 for his <span class="noti-title">appointment</span></p>
												<p class="noti-time"><span class="notification-time">8 mins ago</span></p>
												</div>
											</div>
										</a>
									</li>
									<li class="notification-message">
										<a href="#">
											<div class="media">
												<span class="avatar avatar-sm">
													<img class="avatar-img rounded-circle" alt="User Image" src="assets/img/patients/patient3.jpg">
												</span>
												<div class="media-body">
													<p class="noti-details"><span class="noti-title">Carl Kelly</span> send a message <span class="noti-title"> to his doctor</span></p>
													<p class="noti-time"><span class="notification-time">12 mins ago</span></p>
												</div>
											</div>
										</a>
									</li>
								</ul>
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
							<span class="user-img"><img class="rounded-circle" src="<c:url value='/adminassets/img/profiles/avatar-01.jpg' />" width="31" alt="Ryan Taylor"></span>
						</a>
						<div class="dropdown-menu">
							<div class="user-header">
								<div class="avatar avatar-sm">
									<img src="assets/img/profiles/avatar-01.jpg" alt="User Image" class="avatar-img rounded-circle">
								</div>
								<div class="user-text">
									<h6>Ryan Taylor</h6>
									<p class="text-muted mb-0">Administrator</p>
								</div>
							</div>
							<a class="dropdown-item" href="profile.html">My Profile</a>
							<a class="dropdown-item" href="settings.html">Settings</a>
							<a class="dropdown-item" href="login.html">Logout</a>
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
							<li> 
								<a href="index.html"><i class="fe fe-home"></i> <span>Dashboard</span></a>
							</li>
							<li> 
								<a href="appointment-list.html"><i class="fe fe-layout"></i> <span>Appointments</span></a>
							</li>
							<li> 
								<a href="specialities.html"><i class="fe fe-users"></i> <span>Specialities</span></a>
							</li>
							<li> 
								<a href="doctor-list.html"><i class="fe fe-user-plus"></i> <span>Doctors</span></a>
							</li>
							<li> 
								<a href="patient-list.html"><i class="fe fe-user"></i> <span>Patients</span></a>
							</li>
							<li> 
								<a href="reviews.html"><i class="fe fe-star-o"></i> <span>Reviews</span></a>
							</li>
							<li> 
								<a href="transactions-list.html"><i class="fe fe-activity"></i> <span>Transactions</span></a>
							</li>
							<li> 
								<a href="settings.html"><i class="fe fe-vector"></i> <span>Settings</span></a>
							</li>
							<li class="submenu">
								<a href="#"><i class="fe fe-document"></i> <span> Reports</span> <span class="menu-arrow"></span></a>
								<ul style="display: none;">
									<li><a href="invoice-report.html">Invoice Reports</a></li>
								</ul>
							</li>
							<li class="submenu">
								<a class="active" href="#"><i class="fe fe-document"></i> <span> 論壇管理</span> <span class="menu-arrow"></span></a>
								<ul style="display: none;">
									<li><a href="<c:url value='/adminForumChart' />">貼文分析</a></li>
									<li class="active"><a href="<c:url value='/adminQuestion' />">貼文管理</a></li>
									<li><a href="<c:url value='/adminType' />">分類管理</a></li>
								</ul>
							</li>
							<li class="menu-title"> 
								<span>Pages</span>
							</li>
							<li> 
								<a href="profile.html"><i class="fe fe-user-plus"></i> <span>Profile</span></a>
							</li>
							<li class="submenu">
								<a href="#"><i class="fe fe-document"></i> <span> Authentication </span> <span class="menu-arrow"></span></a>
								<ul style="display: none;">
									<li><a href="login.html"> Login </a></li>
									<li><a href="register.html"> Register </a></li>
									<li><a href="forgot-password.html"> Forgot Password </a></li>
									<li><a href="lock-screen.html"> Lock Screen </a></li>
								</ul>
							</li>
							<li class="submenu">
								<a href="#"><i class="fe fe-warning"></i> <span> Error Pages </span> <span class="menu-arrow"></span></a>
								<ul style="display: none;">
									<li><a href="error-404.html">404 Error </a></li>
									<li><a href="error-500.html">500 Error </a></li>
								</ul>
							</li>
							<li> 
								<a href="blank-page.html"><i class="fe fe-file"></i> <span>Blank Page</span></a>
							</li>
							<li class="menu-title"> 
								<span>UI Interface</span>
							</li>
							<li> 
								<a href="components.html"><i class="fe fe-vector"></i> <span>Components</span></a>
							</li>
							<li class="submenu">
								<a href="#"><i class="fe fe-layout"></i> <span> Forms </span> <span class="menu-arrow"></span></a>
								<ul style="display: none;">
									<li><a href="form-basic-inputs.html">Basic Inputs </a></li>
									<li><a href="form-input-groups.html">Input Groups </a></li>
									<li><a href="form-horizontal.html">Horizontal Form </a></li>
									<li><a href="form-vertical.html"> Vertical Form </a></li>
									<li><a href="form-mask.html"> Form Mask </a></li>
									<li><a href="form-validation.html"> Form Validation </a></li>
								</ul>
							</li>
							<li class="submenu">
								<a href="#"><i class="fe fe-table"></i> <span> Tables </span> <span class="menu-arrow"></span></a>
								<ul style="display: none;">
									<li><a href="tables-basic.html">Basic Tables </a></li>
									<li><a href="data-tables.html">Data Table </a></li>
								</ul>
							</li>
							<li class="submenu">
								<a href="javascript:void(0);"><i class="fe fe-code"></i> <span>Multi Level</span> <span class="menu-arrow"></span></a>
								<ul style="display: none;">
									<li class="submenu">
										<a href="javascript:void(0);"> <span>Level 1</span> <span class="menu-arrow"></span></a>
										<ul style="display: none;">
											<li><a href="javascript:void(0);"><span>Level 2</span></a></li>
											<li class="submenu">
												<a href="javascript:void(0);"> <span> Level 2</span> <span class="menu-arrow"></span></a>
												<ul style="display: none;">
													<li><a href="javascript:void(0);">Level 3</a></li>
													<li><a href="javascript:void(0);">Level 3</a></li>
												</ul>
											</li>
											<li><a href="javascript:void(0);"> <span>Level 2</span></a></li>
										</ul>
									</li>
									<li>
										<a href="javascript:void(0);"> <span>Level 1</span></a>
									</li>
								</ul>
							</li>
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
								<h3 class="page-title">貼文列表</h3>
<!-- 								<ul class="breadcrumb"> -->
<!-- 									<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
<!-- 									<li class="breadcrumb-item active">Invoice Report</li> -->
<!-- 								</ul> -->
							</div>	
						</div>
					</div>
					<!-- /Page Header -->
					
					<div class="row">
					<form style="display: flex;" action="<c:url value="/adminQuestion" />">
						&nbsp&nbsp&nbsp&nbsp&nbsp
						<c:if test="${selDate1 ==null || selDate1 == ''}">
						<label style="line-height: 40px">開始日期: </label><input name="date1" type="date" class="form-control" style="width: 200px">
						</c:if>
						<c:if test="${selDate1 != null && selDate1 != ''}">
						<label style="line-height: 40px">開始日期: </label><input name="date1" type="date" value="${selDate1}" class="form-control" style="width: 200px">
						</c:if>
						&nbsp&nbsp&nbsp&nbsp&nbsp
						<c:if test="${selDate2 ==null || selDate2 == ''}">
						<label style="line-height: 40px">結束日期: </label><input name="date2" type="date" class="form-control" style="width: 200px">
						</c:if>
						<c:if test="${selDate2 != null && selDate2 != ''}">
						<label style="line-height: 40px">結束日期: </label><input name="date2" type="date" value="${selDate2}" class="form-control" style="width: 200px">
						</c:if>
						&nbsp&nbsp&nbsp&nbsp&nbsp
						
						<select name="typId" class="form-control" style="width: 200px">
						    <option value="">文章分類</option>
						    <c:if test="${selType == null}">
							    <c:forEach var="type" items="${types}">
							    <option value="${type.typePkId}">${type.typeName}</option>
							    </c:forEach>
						    </c:if>
						    <c:if test="${selType != null}">
							    <c:forEach var="type" items="${types}">
							    <c:if test="${selType == type.typePkId}">
							    	<option value="${type.typePkId}" selected>${type.typeName}</option>
							    </c:if>
							    <c:if test="${selType != type.typePkId}">
							    	<option value="${type.typePkId}">${type.typeName}</option>
							    </c:if>
							    </c:forEach>
						    </c:if>
						</select>
						
						<div class="top-nav-search">
						<c:if test="${selLikeString == null || selLikeString == ''}">
						<input type="text" name="likeString" class="form-control" placeholder="搜尋">
						</c:if>
						<c:if test="${selLikeString != null && selLikeString != ''}">
						<input type="text" name="likeString" value="${selLikeString}" class="form-control" placeholder="搜尋">
						</c:if>
						</div>
						<button class="btn" type="submit"><i class="fa fa-search"></i></button>
						
					</form>
					
					
						<div class="col-sm-12">	
						
							<div class="card">
							
								<div class="card-body">
								
									<div class="table-responsive">
										<table class="datatable table table-hover table-center mb-0">
											<thead>
												<tr>
													<th>ID</th>
													<th>分類</th>
													<th>作者</th>
													<th>標題</th>
													<th>內容</th>
													<th>話題標籤</th>
													<th>閱讀數</th>
													<th>評論數</th>
													<th>收藏數</th>
													<th>發文時間</th>													
													<th></th>
												</tr>
											</thead>
											<tbody>
											<c:forEach var="question" items="${page}">
												<tr>
													<td>${question.questionPkId}</td>
													<td>${question.type.typeName}</td>
													<td>
														<h2 class="table-avatar">
															<a href="profile.html" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="<c:url value='${question.member.photosImagePath}' />" alt="User Image"></a>
															<a href="profile.html">${question.member.memberName}</a>
														</h2>
													</td>
													<td><div class="box"><span class="ellipsis">${question.title}</span></div></td>
													<td><div class="box"><span class="ellipsis">${question.description}</span></div></td>
													<td><div class="box"><span class="ellipsis">${question.tag}</span></div></td>
													<td>${question.viewcount}<c:if test="${question.viewcount==null}">0</c:if></td>
													<td>${question.qcommentcount}<c:if test="${question.qcommentcount==null}">0</c:if></td>
													<td>${question.favoritecount}<c:if test="${question.favoritecount==null}">0</c:if></td>
													<td><fmt:formatDate value="${question.createtime}" pattern="yyyy-MM-dd HH:mm:ss" type="date" dateStyle="long" /></td>
													<td class="text-right">
														<div class="actions">
<!-- 															<a data-toggle="modal" href="#edit_invoice_report" class="btn btn-sm bg-success-light mr-2"> -->
<!-- 																<i class="fe fe-pencil"></i> Edit -->
<!-- 															</a> -->
															<a href="<c:url value='/publish/${question.questionPkId}' />" class="btn btn-sm bg-success-light mr-2"> 
																<i class="fe fe-pencil"></i> 編輯 
															</a> 
															<a class="btn btn-sm bg-danger-light" data-toggle="modal" href="#delete_modal${question.questionPkId}">
																<i class="fe fe-trash"></i> 刪除
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
																			<h4 class="modal-title">刪除</h4>
																			<p class="mb-4">確定要刪除嗎?</p>
																			<a href="<c:url value='admin/question/delete/${question.questionPkId}' />"><button type="button" class="btn btn-primary">確定</button></a>
																			<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														</div>
													</td>
												</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>			
					</div>
					
				</div>			
			</div>
			<!-- /Page Wrapper -->
			
		<!-- Edit Details Modal -->
			<div class="modal fade" id="edit_invoice_report" aria-hidden="true" role="dialog">
				<div class="modal-dialog modal-dialog-centered" role="document" >
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Edit Invoice Report</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form>
								<div class="row form-row">
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Invoice Number</label>
											<input type="text" class="form-control" value="#INV-0001">
										</div>
									</div>
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Patient ID</label>
											<input type="text" class="form-control" value="	#PT002">
										</div>
									</div>
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Patient Name</label>
											<input type="text" class="form-control" value="R Amer">
										</div>
									</div>
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Patient Image</label>
											<input type="file"  class="form-control">
										</div>
									</div>
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Total Amount</label>
											<input type="text"  class="form-control" value="$200.00">
										</div>
									</div>
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Created Date</label>
											<input type="text"  class="form-control" value="29th Oct 2019">
										</div>
									</div>
									
								</div>
								<button type="submit" class="btn btn-primary btn-block">Save Changes</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- /Edit Details Modal -->
			
			<!-- Delete Modal -->
<!-- 			<div class="modal fade" id="delete_modal" aria-hidden="true" role="dialog"> -->
<!-- 				<div class="modal-dialog modal-dialog-centered" role="document" > -->
<!-- 					<div class="modal-content"> -->
<!-- 						<div class="modal-header">
							<h5 class="modal-title">Delete</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>-->
<!-- 						<div class="modal-body"> -->
<!-- 							<div class="form-content p-2"> -->
<!-- 								<h4 class="modal-title">Delete</h4> -->
<!-- 								<p class="mb-4">Are you sure want to delete?</p> -->
<%-- 								<a href="<c:url value='/question/delete/${question.questionPkId}' />"><button type="button" class="btn btn-primary">Save</button></a> --%>
<!-- 								<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<!-- /Delete Modal -->
		
        </div>
		<!-- /Main Wrapper -->
		
		<!-- jQuery -->
        <script src="<c:url value='/adminassets/js/jquery-3.2.1.min.js' />"></script>
		
		<!-- Bootstrap Core JS -->
        <script src="<c:url value='/adminassets/js/popper.min.js' />"></script>
        <script src="http://cdn.bootstrapmb.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		
		<!-- Slimscroll JS -->
        <script src="<c:url value='/adminassets/plugins/slimscroll/jquery.slimscroll.min.js' />"></script>
		
		<script src="<c:url value='/adminassets/plugins/raphael/raphael.min.js' />"></script>    
		<script src="<c:url value='/adminassets/plugins/morris/morris.min.js' />"></script>  
		<script src="<c:url value='/adminassets/js/chart.morris.js' />"></script>
		
		<!-- Datatables JS -->
		<script src="<c:url value='/adminassets/plugins/datatables/jquery.dataTables.min.js' />"></script>
		<script src="<c:url value='/adminassets/plugins/datatables/datatables.min.js' />"></script>
		
		<!-- Custom JS -->
		<script  src="<c:url value='/adminassets/js/script.js' />"></script>
		
		<script src="<c:url value='/js/forum/custom/dashboard-charts.js' />"></script>
		<script src="<c:url value='/js/forum/custom/randomColor.min.js' />"></script>
		
</body>
</html>