<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	<img alt="" src="<c:url value="/images/testimg.jpg"></c:url>">
	<form action="/uploadHeadpic" method="post" enctype="multipart/form-data">
		<input type="file" name="headpic">
		<input type="submit">
	</form>
	
</div>

</body>
</html>