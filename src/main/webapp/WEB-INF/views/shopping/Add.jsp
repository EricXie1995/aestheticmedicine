<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AddProduct</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

</head>
<body>
<h1>${productDetail.name}</h1>
<h1>${productDetail.price}</h1>
<h1>${productDetail.description}</h1>
<h1>${productDetail.type}</h1>
<h1>${productDetail.id}</h1>
<h1>${productDetail.counts}</h1>
<button onclick="judgeIsLogin()" >userid</button>
<script type="text/javascript">
function findid(){
// 	var id = ${currentUser}
	console.log(${currentUser[id]});
}
function judgeIsLogin() {
    if("${currentUser.id}" == null || "${currentUser.id}" === undefined || "${currentUser.id}" ===""){
    	console.log("aaa");
    }
}
</script>

<img src="<c:url value='/'/>shoppingMall/picture/${productDetail.id}">
	<!-- 要加 method="post" enctype="multipart/form-data" 才能用Part取得上傳的圖片-->
<!-- 	<div> -->
<%-- 		<form:form method="POST" modelAttribute="products" enctype='multipart/form-data'> --%>
<%-- 			產品名稱：<form:input path="productName"/> 產品價格：<form:input path="productPrice"/><br> 產品數量：<form:input path="productQuantity"/> --%>
<%-- 			產品描述：<form:input path="productProfile"/> 分類關鍵字：<form:input path="productCategory"/> --%>
<%-- 			<br> 產品圖片：<form:input path="productImage" type='file'/><input type="submit"> --%>
<%-- 		</form:form> --%>
<!-- 	</div> -->
	<div>
		<a href="<c:url value='/shopping/showAllProducts'/>"><input type="button"
			value="查詢"></a>
	</div>
	<div>
		<a href="<c:url value='/shopping/shopping'/>"><input type="button" value="返回首頁"></a>
	</div>
</body>
</html>