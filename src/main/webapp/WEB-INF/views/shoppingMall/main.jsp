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
      <script src="${cp}/js/js/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <!--导航栏部分-->
	<jsp:include page="../include/header.jsp"/>
	<!-- 中间内容 -->
	<div class="container-fluid">
		<div class="row">
			<!-- 控制栏 -->
			<div class="col-sm-3 col-md-2 sidebar sidebar-1" style="background-color:#ACD6FF;">
				<ul class="nav nav-sidebar">
					<li class="list-group-item-diy"><a href="#productArea1">護目鏡 <span class="sr-only">(current)</span></a></li>
					<li class="list-group-item-diy"><a href="#productArea2">防護衣</a></li>
					<li class="list-group-item-diy"><a href="#productArea3">抗菌噴霧</a></li>
					<li class="list-group-item-diy"><a href="#productArea4">醫用手套</a></li>
					<li class="list-group-item-diy"><a href="#productArea5">酒精／優碘棉片</a></li>
					<li class="list-group-item-diy"><a href="#productArea6">藥皂／乾洗手(藥用)</a></li>
					<li class="list-group-item-diy"><a href="#productArea7">傷口護理用品</a></li>
				</ul>
			</div>
			<!-- 控制内容 -->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" >
				<div class="jumbotron" style="background-image: url('${cp}/Mall/img/Banners.jpg');">
					<h1>歡迎來到 DOCCURE購物+</h1>
					<p>知識就是力量，洗手就是榜樣！讓我們一起為台灣加油</p>
				</div>

				<div name="productArea1" class="row pd-10" id="productArea1">
				</div>

				<div name="productArea2" class="row" id="productArea2">
				</div>

				<div name="productArea3" class="row" id="productArea3">
				</div>

                <div name="productArea4" class="row" id="productArea4">
				</div>

				<div name="productArea5" class="row" id="productArea5">
				</div>

				<div name="productArea6" class="row" id="productArea6">
				</div>

				<div name="productArea7" class="row" id="productArea7">
				</div>


			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
				<jsp:include page="../include/foot.jsp"/>
			</div>
		</div>
	</div>

  <script type="text/javascript">

	  var loading = layer.load(0);

      var productType = new Array;
      productType[1] = "護目鏡";
      productType[2] = "防護衣";
      productType[3] = "抗菌噴霧";
      productType[4] = "醫用手套";
      productType[5] = "酒精／優碘棉片";
      productType[6] = "藥皂／乾洗手(藥用)";
      productType[7] = "傷口護理用品";


	  listProducts();

	  function listProducts() {
		  var allProduct = getAllProducts();
          var mark = new Array;
          mark[1] = 0;
          mark[2] = 0;
          mark[3] = 0;
          mark[4] = 0;
          mark[5] = 0;
          mark[6] = 0;
          mark[7] = 0;
          console.log(allProduct);
          for(var i=0;i<allProduct.length;i++){
              var html = "";
			  var imgURL = "${cp}/shoppingMall/picture/"+allProduct[i].id;
			  html += '<div class="col-sm-4 col-md-4" >'+
					  '<div class="boxes pointer" onclick="productDetail('+allProduct[i].id+')">'+
					  '<div class="big bigimg">'+
					  '<img src="'+imgURL+'">'+
					  '</div>'+
					  '<p class="product-name">'+allProduct[i].name+'</p>'+
					  '<p class="product-price">'+allProduct[i].price+'</p>'+
					  '</div>'+
					  '</div>';
              var id = "productArea"+allProduct[i].type;
              console.log("productArea = "+id);
              console.log("html = "+html);
              var productArea = document.getElementById(id);
              if(mark[allProduct[i].type] == 0){
                  html ='<hr/><h1>'+productType[allProduct[i].type]+'</h1><hr/>'+html;
                  mark[allProduct[i].type] = 1;
              }
              console.log("productArea = "+productArea);
              productArea.innerHTML += html;
		  }
		  layer.close(loading);
	  }
	  function getAllProducts() {
          var allProducts = null;
          var nothing = {};
          $.ajax({
              async : false, //设置同步
              type : 'POST',
              url : '${cp}/shoppingMall/getAllProducts',
              data : nothing,
              dataType : 'json',
              success : function(result) {
                  if (result!=null) {
                      allProducts = result.allProducts;
                  }
                  else{
                      layer.alert('查詢所以商品錯誤');
                  }
              },
              error : function(resoult) {
                  layer.alert('查詢所以商品錯誤');
              }
          });
        //這裡的eval方法不同於prase方法，外面加括號
          allProducts = eval("("+allProducts+")");
          return allProducts;
      }

	  function productDetail(id) {
		  var product = {};
		  var jumpResult = '';
		  product.id = id;
		  $.ajax({
			  async : false, //设置同步
			  type : 'POST',
			  url : '${cp}/shoppingMall/productDetail',
			  data : product,
			  dataType : 'json',
			  success : function(result) {
				  jumpResult = result.result;
			  },
			  error : function(resoult) {
				  layer.alert('查詢錯誤');
			  }
		  });

		  if(jumpResult == "success"){
			  window.location.href = "${cp}/shoppingMall/product_detail";
		  }
	  }

  </script>


  </body>
</html>