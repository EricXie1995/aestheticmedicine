<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>購物+</title>
	  <link href="${cp}/Mall/css/bootstrap.min.css" rel="stylesheet">
	  <link href="${cp}/Mall/css/style.css" rel="stylesheet">

	  <script src="${cp}/Mall/js/jquery.min.js" type="text/javascript"></script>
	  <script src="${cp}/Mall/js/bootstrap.min.js" type="text/javascript"></script>
	  <script src="${cp}/Mall/js/layer.js" type="text/javascript"></script>
    <!--[if lt IE 9]>
      <script src="${cp}/js/html5shiv.min.js"></script>
      <script src="${cp}/js/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <!--导航栏部分-->
	<jsp:include page="../include/header.jsp"/>

	<!-- 中间内容 -->
	<div class="container-fluid bigHead">
		<div class="row">
			<div class="col-sm-10  col-md-10 col-sm-offset-1 col-md-offset-1">
				<div class="jumbotron">
					<h1>歡迎來到購物車</h1>
					<p>您的購物車清單為</p>
				</div>
			</div>
			<div class="col-sm-10  col-md-10 col-sm-offset-1 col-md-offset-1">
				<table class="table table-hover center" id="shoppingCarTable">
				</table>

				<hr/>
				<div class="row">
					<div class="col-lg-4 col-md-4 col-sm-4"></div>
					<button type="button" class="btn btn-danger btn-lg col-lg-4 col-md-4 col-sm-4" onclick="confirmPre()">確認購買</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 尾部 -->
	<jsp:include page="../include/foot.jsp"/>
	
	<script type="text/javascript">
		updateShoppingCars();

		function updateShoppingCars() {
			var shoppingCarTable = document.getElementById("shoppingCarTable");
			var allShoppingCars = getShoppingCars();
// 			console.log(allShoppingCars)
			shoppingCarTable.innerHTML = "";
			var html = '<tr>'+
							'<th>是否購買</th>'+
							'<th>商品名稱</th>'+
							'<th>商品單價</th>'+
							'<th>商品數量</th>'+
						'</tr>';
			for(var i=0;i<allShoppingCars.length;i++){
// 				console.log(allShoppingCars[i]+"updateShoppingCars");
				var product = getProductById(allShoppingCars[i].carId);
				html  += '<tr>'+
						'<td>'+
						'<div class="checkbox">'+
						'<label>'+
						'<input type="checkbox" id="checkbox'+allShoppingCars[i].carId+'" value="option1">'+
						'</label>'+
						'</div>'+
						'</td>'+
						'<td>'+product.name+'</td>'+
						'<td>'+product.price+'</td>'+
						'<td>'+allShoppingCars[i].counts+'</td>'+
						'</tr>';
			}
			shoppingCarTable.innerHTML += html;

		}

		function getShoppingCars() {
			judgeIsLogin();
			var shoppingCarProducts = "";
			var user = {};
			user.userId = ${currentUser.id};
			$.ajax({
				async : false, //设置同步
				type : 'POST',
				url : '${cp}/shoppingMall/getShoppingCars',
				data : user,
				dataType : 'json',
				success : function(result) {
					shoppingCarProducts = result.result;
				},
				error : function(result) {
					layer.alert('查詢錯誤123');
				}
			});
			shoppingCarProducts = eval("("+shoppingCarProducts+")");
			return shoppingCarProducts;
		}

		function confirmPre() {
			var allShoppingCars = getShoppingCars();
			var buyProducts = new Array;
			var buyProductsCounts = new Array;
			var buyCounts = 0;
			for(var i=0;i<allShoppingCars.length;i++){
// 				console.log(allShoppingCars[i]+"confirmPre");
				var checkBox = document.getElementById("checkbox"+allShoppingCars[i].carId);
				if(checkBox.checked){
					buyProducts[buyCounts] = allShoppingCars[i].carId;
					buyProductsCounts[buyCounts] = allShoppingCars[i].counts;
					buyCounts++;
				}
			}
			if(buyCounts == 0){
				layer.msg("未選中商品",{icon:2});
			}
			else{
				buyConfirm(buyProducts,buyProductsCounts);
			}
		}

		function getProductById(id) {
			var productResult = "";
			var product = {};
			product.carId = id;
// 			console.log(product);
			$.ajax({
				async : false, //设置同步
				type : 'POST',
				url : '${cp}/shoppingMall/getProductByCarId',
				data : product,
				dataType : 'json',
				success : function(result) {
					productResult = result.result;
				},
				error : function(result) {
					layer.alert('查詢錯誤77777');
				}
			});
			productResult = JSON.parse(productResult);
			return productResult;
		}

        function judgeIsLogin() {
            if("${currentUser.id}" == null || "${currentUser.id}" == undefined || "${currentUser.id}" ==""){
                window.location.href = "${cp}/shoppingMall/login";
            }
        }
		
        
		function buyConfirm(carId,productsCounts) {
// 			var address = getUserAddress(${currentUser.id},carId);
			console.log("buyConfirm.carId = "+carId);
			var address = getUserAddress(carId);
			var phoneNumber = getUserPhoneNumber(carId);
			var totalPrice = 0;
			
			var html = 
				
				'<div class="col-sm-1 col-md-1 col-lg-1"></div>'+
					'<div class="col-sm-10 col-md-10 col-lg-10">'+
					'<table class="table confirm-margin">';
			for(var i=0;i<carId.length;i++){
				var product = getProductById(carId[i]);
				
				html +=	'<tr>'+
					'<th>商品'+(i+1)+'名稱：</th>'+
					'<td>'+product.name+'</td>'+
					'</tr>'+
					'<tr>'+
					'<th>商品單價：</th>'+
					'<td>'+product.price+'</td>'+
					'</tr>'+
					'<tr>'+
					'<th>購買數量：</th>'+
					'<td>'+productsCounts[i]+'</td>'+
					'</tr>'+
					'<tr>';
				totalPrice+=product.price*productsCounts[i];
			}
			html +='<th>總金額：</th>'+
					'<td>'+totalPrice+'</td>'+
					'</tr>'+
					'<tr>'+
					'<th>收貨地址：</th>'+
					'<td>'+address+'</td>'+
					'</tr>'+
					'<tr>'+
					'<th>連絡電話：</th>'+
					'<td>'+phoneNumber+'</td>'+
					'</tr>'+
					'</table>'+
					
					'<div class="row">'+
					'<div class="col-sm-4 col-md-4 col-lg-4"></div>'+
					'<form method="post" action="${payPalConfig.posturl}">'+
						
					      <!--  PayPal Setting -->
						  '<input type="hidden" name="upload" value="1" />'+
						  '<input type="hidden" name="return" value="${payPalConfig.returnurl }" />'+
						  '<input type="hidden" name="cmd" value="_cart" />'+
						  '<input type="hidden" name="business" value="${payPalConfig.business }" />';
						  
						  <!--  Products List -->
						  for(var i=0;i<carId.length;i++){
							  var product = getProductById(carId[i]);
							  console.log(product);
							  html +=
							  '<input type="hidden" name="item_name_'+(i+1)+'" value="'+product.name+'" >'+
						  	  '<input type="hidden" name="amount_'+(i+1)+'" value="'+product.price+'" >'+
						  	  '<input type="hidden" name="quantity_'+(i+1)+'" value="'+productsCounts[i]+'" >';
							  
						  }
						  
					html +=
					'<button class="btn btn-danger col-sm-4 col-md-4 col-lg-4" onclick="addToShoppingRecordsPre(['+carId+'],['+productsCounts+'])">確認購買</button>'+
					'</form>'+
					'</div>'+
					'</div>';
					
			layer.open({
				type:1,
				title:'請確認訂單訊息：',
				content:html,
				area:['650px','350px'],
			});
		}


		function getUserAddress(carId) {
			var address = "";
			var car = {};
			car.id = carId[0];
			console.log("getUserAddress.user = ");
			console.log(carId[0]);
			
			$.ajax({
				async : false, //设置同步
				type : 'POST',
				url : '${cp}/shoppingMall/getUserAddress',
				data : car,
				dataType : 'json',
				success : function(result) {
					address = result.address;
// 					layer.alert('查詢成功'+address);
				},
				error : function(result) {
					layer.alert('查詢錯誤');
				}
			});
			return address;
		}


		function getUserPhoneNumber(carId) {
			var phoneNumber = "";
			var car = {};
			car.id = carId[0];
			console.log("getUserPhoneNumber.user = ");
			console.log(car.id);
			$.ajax({
				async : false, //设置同步
				type : 'POST',
				url : '${cp}/shoppingMall/getUserPhoneNumber',
				data : car,
				dataType : 'json',
				success : function(result) {
					phoneNumber = result.phoneNumber;
// 					layer.alert('查詢成功'+phoneNumber);
				},
				error : function(result) {
					layer.alert('查詢錯誤');
				}
			});
			return phoneNumber;
		}

		function addToShoppingRecordsPre(carId,productsCounts) {
			for(var i=0;i<carId.length;i++){
				addToShoppingRecords(carId[i],productsCounts[i]);
			}
			layer.confirm('前往訂單狀態？', {icon: 1, title:'購買成功',btn:['前往訂單','繼續購買']},
					function(){
						window.location.href = "${cp}/shoppingMall/shopping_record";
					},
					function(index){
                        window.location.href = "${cp}/shoppingMall/shopping_car";
					}
			);
		}

		function addToShoppingRecords(carId,productCounts) {
			judgeIsLogin();
			var shoppingRecord = {};
			shoppingRecord.userId = ${currentUser.id};
			shoppingRecord.carId = carId;
			shoppingRecord.counts = productCounts;
			var buyResult = "";
			$.ajax({
				async : false,
				type : 'POST',
				url : '${cp}/shoppingMall/addShoppingRecord',
				data : shoppingRecord,
				dataType : 'json',
				success : function(result) {
					buyResult = result.result;
				},
				error : function(result) {
					layer.alert('購買錯誤');
				}
			});
			var product = getProductById(carId);
			if(buyResult == "success") {
                deleteShoppingCar(carId);
				layer.msg("商品 "+product.name+" 購買成功",{icon:1});
			}
			else if(buyResult == "unEnough"){
				layer.alert("商品 "+product.name+" 庫存不足，購買失敗")
			}
		}

		function deleteShoppingCar(carId) {
            var shoppingCar = {};
            shoppingCar.userId = ${currentUser.id};
            shoppingCar.carId = carId;
            var deleteResult = "";
            $.ajax({
                async : false,
                type : 'POST',
                url : '${cp}/shoppingMall/deleteShoppingCar',
                data : shoppingCar,
                dataType : 'json',
                success : function(result) {
                    deleteResult = result.result;
                },
                error : function(result) {
                    layer.alert('查詢帳號錯誤');
                }
            });
        }
	</script>
  </body>
</html>