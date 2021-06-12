<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>測試頁</title>
<!-- 引入jquery webjars -->
<script type="text/javascript" src="<c:url value='/webjars/jquery/3.6.0/jquery.js' />">></script>
<!-- 引入bootstrap webjars -->
<link rel="stylesheet" href="<c:url value='/webjars/bootstrap/4.3.1/css/bootstrap.min.css' />" />
<script src="<c:url value='/webjars/bootstrap/4.3.1/js/bootstrap.min.js' />"></script>
<script src="<c:url value='/webjars/popper.js/1.14.3/umd/popper.min.js' />"></script>
</head>
<body>

	<h1>Test</h1>
	<button type="button" class="btn btn-primary" id="btn">jq測試</button>
	
	<script type="text/javascript">
	$("#btn").click(function() {
		$("h1").css("background-color", "pink");
	});
	</script>
	
</body>
</html>