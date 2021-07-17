<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <c:url value='/js/forum/js/bootstrap.min.js' /> --%>
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="http://cdn.bootstrapmb.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <!-- jQuery -->
	<script src="<c:url value='/assets/js/jquery.min.js' />"></script>
	<!-- Bootstrap Core JS -->
	<script src="<c:url value='/assets/js/popper.min.js' />"></script>
	<script
		src="http://cdn.bootstrapmb.com/bootstrap/4.4.0/js/bootstrap.min.js"></script>
<!-- bootstrap -->
<%-- 	<link rel="stylesheet" href="<c:url value='/js/forum/css/bootstrap.min.css' />"> --%>
    <link rel="stylesheet" href="<c:url value='/js/forum/custom/custom.css' />">
<%-- 	<script src="<c:url value='/js/forum/js/jquery-3.2.1.min.js' />"></script> --%>
<%-- 	<script src="<c:url value='/js/forum/js/bootstrap.min.js' />"></script> --%>

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



</head>
<body>
	
 			<div class="row form-group">
                <div id="reportrange" class="pull-right selectbox" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc;">
				    <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>&nbsp;
				    <span></span> <b class="caret"></b>
				</div>
            </div>

	<div id="canvas-holder" style="width: 100%">
		<div class="centered">
			<h3>分類問題比例/數量</h3>
		</div>
		<canvas id="pieChart"></canvas>
		<div class="centered">
			<h3>過去十二個月的問題數量</h3>
		</div>
		<canvas id="barChart"></canvas>
	</div>
	<script src="<c:url value='/js/forum/custom/dashboard-charts.js' />"></script>
	<script src="<c:url value='/js/forum/custom/randomColor.min.js' />"></script>
</body>
</html>