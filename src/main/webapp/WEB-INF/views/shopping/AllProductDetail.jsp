<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>AllProductDetail</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<body>
	<form method='POST'>
		<input type='hidden' name='_method' value='DELETE'>
	</form>
<!-- 	<form action='' class="update" method='post' enctype='multipart/form-data'> -->
		<table border="1">
			<tr>
				<!--<th>產品ID</th>-->
				<th>產品名稱</th>
				<th>產品價格</th>
				<th>產品數量</th>
				<th>產品描述</th>
				<th>產品圖片</th>
				<th>修改</th>
				<th>刪除</th>
			</tr>

			<c:set var="i" value="1" />

			<c:forEach items="${allProducts}" begin="0"
				end="${allProducts.size()}" var="product">

				<tr id="tr${i}">
					<%-- 							 <td>${product.productPkId}</td> --%>
					<td>${product.productName}</td>
					<td>${product.productPrice}</td>
					<td>${product.productQuantity}</td>
					<td>${product.productProfile}</td>
					<td><img width='320' height='320' src='picture/${product.productPkId}' /></td>
					<%-- 							<td><img src="data:image/jpg;base64,${product.productImage}"></td> --%>
					<td><input class="btn btn-primary" type="button" id="update"
						onclick="updateClick(${i},${product.productPkId},'${product.productName}',${product.productPrice},${product.productQuantity},'${product.productProfile}')"
						value="修改"></td>
					<td><a class='deletelink'
						href="<c:url value='/' />shopping/products/${product.productPkId}">
						<input class="btn btn-primary" type="button" value="刪除"></a></td>
				</tr>
				<c:set var="i" value="${i+1}" />
			</c:forEach>
			<c:remove var="i" />
		</table>
<!-- 	</form> -->
	<script type="text/javascript">
				function updateClick(tr, id, name, price, amount, describe) {
					console.log(1);
					$("tr input").attr("disabled",true);
					$(".update").attr("action", "UpdateProductServlet?productID=" + id);
					$("#tr" + tr).prepend("<td><input type='text' value='" + name + "' name='name'></td><td><input type='text' value='" + price + "' name='price'></td><td><input type='text' value='" + amount + "' name='amount'></td><td><input type='text' value='" + describe + "' name='describe'></td><td><input type='file' name='image'></td><td><input class='btn btn-primary' type='submit' value='更新'><a href='<c:url value='/shopping/showAllProducts'/>'><input class='btn btn-primary' type='button' value='取消'></a></td>");
					$("#tr" + tr).children("td").slice(6, 12).remove();
				};
				$(document).ready(function() {
			        $('.deletelink').click(function() {
			        	if (confirm('確定刪除此筆紀錄? ')) {
			        		var href = $(this).attr('href');
			        		$('form').attr('action', href).submit();
			        	} 
			        	return false;
			        });
			    })
			</script>
	<div>
		<a href="<c:url value='/shopping/add' />"><input type="button"
			value="新增產品"></a>
	</div>
	<div>
		<a href="<c:url value='/shopping/shopping' />"><input
			type="button" value="返回首頁"></a>
	</div>
</body>

</html>