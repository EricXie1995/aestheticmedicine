<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>

<body>
	<form id="del" method='POST'>
		<input type='hidden' name='_method' value='DELETE'>
	</form>


	<!-- update Modal -->
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">修改產品資訊</h5>
				</div>
				<div class="modal-body">
			<form id="updateForm" method="POST"  enctype="multipart/form-data" >
						<div class='form-group'>
							<label for='product-name' class='col-form-label'>產品名稱:</label>
							<input type='text' class='form-control' name='productName' id='product-name'>
						</div>
						<div class='form-group'>
							<label for='product-price' class='col-form-label'>產品價格:</label>
							<input type='text' class='form-control' name='productPrice' id='product-price'>
						</div>
						<div class='form-group'>
							<label for='product-quantity' class='col-form-label'>產品數量:</label>
							<input type='text' class='form-control' name='productQuantity' id='product-quantity'>
						</div>
						<div class='form-group'>
							<label for='product-profile' class='col-form-label'>產品描述:</label>
							<input type='text' class='form-control' name='productProfile' id='product-profile'>
						</div>
						<div class='form-group'>
							<label for='product-category' class='col-form-label'>分類關鍵字:</label>
							<input type='text' class='form-control' name='productCategory' id='product-category'>
						</div>
						<div class='form-group'>
							<label for='product-image' class='col-form-label'>產品圖片:</label>
							<input type='file' name='productImage' id='product-image'>
						</div>
				</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">取消</button>
						<a class='updatelink' href="<c:url value='/' />shopping/products/">
					<button id="confirmUpdate" type="button" class="btn btn-primary">儲存變更</button></a>
				</div>
			</div>
		</div>
	</div>


	<table border="1">
		<tr>
			<!--<th>產品ID</th>-->
			<th>產品名稱</th>
			<th>產品價格</th>
			<th>產品數量</th>
			<th>產品描述</th>
			<th>分類關鍵字</th>
			<th>產品圖片</th>
			<th>修改</th>
			<th>刪除</th>
		</tr>

		<c:set var="i" value="1" />

		<c:forEach items="${allProducts}" begin="0"
			end="${allProducts.size()}" var="product">

			<tr id="tr${i}">
				<%--  <td>${product.productPkId}</td> --%>
				<td>${product.productName}</td>
				<td>${product.productPrice}</td>
				<td>${product.productQuantity}</td>
				<td>${product.productProfile}</td>
				<td>${product.productCategory}</td>
				<td><img width='320' height='320'
					src='picture/${product.productPkId}' /></td>
				<%-- <td><img src="data:image/jpg;base64,${product.productImage}"></td> --%>
				<td>
<%-- 				<a href='javascript:updateProductForm(${product.productPkId})'> --%>
				<input class="btn btn-primary" type="button" id="updatebtn"
					data-toggle="modal" data-target="#updateModal" data-id="${product.productPkId}" data-name="${product.productName}"
					data-price="${product.productPrice}" data-quantity="${product.productQuantity}" data-profile="${product.productProfile}"
					data-category="${product.productCategory}" value="修改">
					</td>
				<td><a class='deletelink'
					href="<c:url value='/' />shopping/products/${product.productPkId}">
						<input class="btn btn-primary" id="deletebtn" type="button" value="刪除">
				</a></td>
			</tr>
			<c:set var="i" value="${i+1}" />
		</c:forEach>
		<c:remove var="i" />
	</table>
	<!-- 	</form> -->
	<script type="text/javascript">
// 		function updateProductForm(id) {
		
// 			$.ajax({
// 				type : "GET",
// 				url : "<c:url value='/' />shopping/products/"+id,
// 				success : function(data) {
// // 				$(".modal-body").empty();
				
// 				}
// 			});

// 		}
		
		var id = null;
		$(document).ready(function() {
			$(".deletelink").click(function() {
				if (confirm('確定刪除此筆資料? ')) {
					var href = $(this).attr('href');
					$('#del').attr('action', href).submit();
				}
				return false;
			});
			
			$("#updateModal").on('show.bs.modal', function(event) {
				var button = $(event.relatedTarget);
				id = button.data('id');
				var name = button.data('name');
				$(this).find('.modal-body #product-name').val(name)
				var price = button.data('price');
				$(this).find('.modal-body #product-price').val(price)
				var quantity = button.data('quantity');
				$(this).find('.modal-body #product-quantity').val(quantity)
				var profile = button.data('profile');
				$(this).find('.modal-body #product-profile').val(profile)
				var profile = button.data('category');
				$(this).find('.modal-body #product-category').val(profile)
			});
			$(".updatelink").click(function() {
				console.log(id);
					if (confirm('確定變更此筆資料? ')) {
						var href = $(this).attr('href')+id;
						console.log(href);
						event.preventDefault();
						if(id != null){							
						updateProduct(href,id);
						}else{
							alert("id is null");
						}
// 						$('#updateForm').attr('action', href).submit();
					}
					return false;
			});
		})
		
		function updateProduct(href,id) {
			console.log("func.updateProduct.herf = "+href);
			var form = $('#updateForm')[0];
// 			console.log("func.updateProduct.form = ");
// 			console.log(form);
				
			var data = new FormData(form);
// 			console.log("func.updateProduct.data = "+data);
// 			console.log(data);
			data.append("productPkId",id);
			$.ajax({
		        type: "POST",
		        enctype: 'multipart/form-data',
		        url: href,
		        data: data,
		        processData: false, //prevent jQuery from automatically transforming the data into a query string
		        contentType: false,
		        cache: false,
		        success: function (data) {
// 		            console.log("SUCCESS !! ", data);
		            window.location = '/beauty/shopping/showAllProducts	';
		        },
		        error: function (e) {
		            console.log("ERROR : ", e);
		        }
		    });
		}
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