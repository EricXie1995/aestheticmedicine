<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Shopping</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/css/style2.css' />" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- <style type="text/css"> -->
<%-- <%@include file="css/style2.css"%> --%>
<!-- </style> -->
<title>CH11.Cart-Page</title>
</head>

<body>
	<nav class="navbar navbar-light bg-light ">
		<a href="Index.jsp" class="navbar-brand mb-0 h1" style="font-weight: bold;"><i
			class="fas fa-heart text-info mr-1"></i>整人專家</a>


		<div class="dropdown ml-auto">
			<a href="../cart/showCart" class="btn btn-cart btn-sm" type="button"
				id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">
				<i class="fas fa-shopping-cart text-dark fa-2x"></i> <span
					class="badge badge-pill badge-danger">9</span>
			</a>
			<div class="dropdown-menu dropdown-menu-right"
				style="min-width: 300px" aria-labelledby="dropdownMenuButton">
				<div class="p-3">
					<table class="table table-sm ">
						<h6>已選擇商品</h6>
						<tbody>
							<tr>
								<td class="align-middle text-center"><a href="#removeModal"
									data-price="1999" data-title="不求人" data-toggle="modal"
									data-target="#removeModal"><i class="far fa-trash-alt "></i></a>
								</td>
								<td class="align-middle">不求人</td>
								<td class="align-middle">1件</td>
								<td class="align-middle text-right">$1999</td>
							</tr>
							<tr>
								<td class="align-middle text-center"><a href="#removeModal"
									data-price="999" data-title="一級偽裝帽" data-toggle="modal"
									data-target="#removeModal"><i class="far fa-trash-alt "></i></a>
								</td>
								<td class="align-middle">一級偽裝帽</td>
								<td class="align-middle">1件</td>
								<td class="align-middle text-right">$999</td>
							</tr>
						</tbody>
					</table>
					<a href="#" class="btn btn-block btn-primary btn-sm text-white">確認結帳</a>
				</div>
			</div>
		</div>


	</nav>




	<section>
		<div
			class="jumbotron jumbotron-fluid jumbotron-bg d-flex align-items-end">
			<div class="container jumbotron-text  text-white p-4">
				<h1 class="display-4 " style="font-weight: bold;">買到剁手手！全新上市！</h1>
				<p class="lead">歡慶商城全新開幕，本館商品全面9折起，買越多賺越多，不要再猶豫了，全部給我買起來！！！</p>
			</div>
		</div>
	</section>


	<section class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="list-group sticky-top mt-3">
					<a href="#pane-1"
						class="list-group-item list-group-item-action active "
						data-toggle="list">全部商品</a> <a href="#pane-2"
						class="list-group-item list-group-item-action " data-toggle="list">精品特區</a>
					<a href="#pane-3" class="list-group-item list-group-item-action"
						data-toggle="list">配件優惠</a> <a href="#"
						class="list-group-item list-group-item-action">送禮組合</a> <a
						href="#" class="list-group-item list-group-item-action disabled"
						tabindex="-1" aria-disabled="true">限時下殺</a>
				</div>
			</div>


			<div class="col-md-9">
				<div class="tab-content">
					<div class="tab-pane active" id="pane-1" role="tabpanel">
						<div class="row">



							<c:forEach items="${allProducts}" begin="0"
								end="${allProducts.size()}" var="product">
								<form action="" method="POST">
									<div class="col-md-4 my-3">
										<div class="card text-center h-100 border-0 box-shadow">
											<img src='picture/${product.productPkId}' 
												class="card-img-top" alt="...">
											<div class="card-body">
												<h5 class="card-title " style="font-weight: bold;">${product.productName}</h5>
												<p class="card-text ">${product.productProfile}</p>
											</div>
	
											<div class="h4 ml-auto mb-0 text-danger">
												<small>特價 $NT</small> <strong> ${product.productPrice}</strong>
											</div>
	
											<div class="card-footer border-top-0 bg-white">
												<a onclick="addCart(${product.productPkId}, ${product.productPrice},'${product.productName}')"
													class="btn btn-outline-secondary btn-sm mt-2 d-block"><i
													class="fas fa-shopping-cart mr-1"></i>加入購物車</a>
											</div>
										</div>
									</div>
								</form>
								
								<!--  <td>${productDetail.productID}</td>
								<td>${productDetail.name}</td>
								<td>${productDetail.price}</td>
								<td>${productDetail.amount}</td>
								<td>${productDetail.describe}</td>
								<td><img src="data:image/jpg;base64,${productDetail.image}"></td>
								<td><input class="btn btn-primary" type="button"
									id="update"
									onclick="updateClick(${i},${productDetail.productID},'${productDetail.name}',${productDetail.price},${productDetail.amount},'${productDetail.describe}')"
									value="修改"></td>
								<td><a
									href="DeleteProductServlet?productID=${productDetail.productID}"><input
										class="btn btn-primary" type="button" value="刪除"></a></td>
								</tr>-->

							</c:forEach>


						</div>
					</div>
					<!-- <div class="tab-pane " id="pane-2" role="tabpanel">
              <div class="row">
                <div class="col-md-4">
                  <div class="card text-center h-100 border-0 box-shadow">
                    <img src="http://img10.360buyimg.com/n1/jfs/t13501/112/227513326/105686/aead8ab2/5a0687e5Neda8e7e8.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title " style="font-weight: bold;">不求人</h5>
                      <p class="card-text ">抓背、抓癢、可伸縮：另有隱藏版功能，加購即可升級。</p>
                    </div>
                    <div class="card-footer border-top-0 bg-white">
                      <a href="#" class="btn btn-outline-secondary btn-sm mt-2 d-block"><i class="fas fa-shopping-cart mr-1"></i>加入購物車</a>
                    </div>
  
                  </div>
                </div>
              </div>
            </div> -->
					<!-- <div class="tab-pane " id="pane-3" role="tabpanel">
              <div class="row">
                <div class="col-md-4">
                  <div class="card text-center h-100 border-0 box-shadow">
                    <img src="https://images.unsplash.com/photo-1491336477066-31156b5e4f35?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80" class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title " style="font-weight: bold;">蚵男的手錶</h5>
                      <p class="card-text ">特色：手錶是防水的，還可以照明。主要是射出麻醉針，當然還有時間提示功能。</p>
                    </div>
                    <div class="card-footer border-top-0 bg-white">
                      <div class="btn-group " role="group" aria-label="First group">
                        <button type="button" class="btn btn-outline-secondary btn-sm">紅</button>
                        <button type="button" class="btn btn-outline-secondary btn-sm">黑</button>
                        <button type="button" class="btn btn-outline-secondary btn-sm">褐</button>
  
                      </div>
                      <a href="#" class="btn btn-outline-secondary btn-sm mt-2 d-block"><i class="fas fa-shopping-cart mr-1"></i>加入購物車</a>
                    </div>
  
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="card text-center h-100 border-0 box-shadow">
                    <img src="https://i0.wp.com/flog.cc/mag/wp-content/uploads/2013/12/Taiwan-bluw-and-white-Slipper-1.jpg?resize=660%2C450" class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title " style="font-weight: bold;">+9 戰鬥靴</h5>
                      <p class="card-text ">精品界大師-卡爾拉格斐(Karl Lagerfeld)，最新力作。+9只是最低預估值，數量有限，欲者請速速下單！</p>
                    </div>
                    <div class="card-footer border-top-0 bg-white">
                      <div class="btn-group " role="group" aria-label="First group">
                        <button type="button" class="btn btn-outline-secondary btn-sm">S</button>
                        <button type="button" class="btn btn-outline-secondary btn-sm">M</button>
                        <button type="button" class="btn btn-outline-secondary btn-sm" disabled>L</button>
                        <button type="button" class="btn btn-outline-secondary btn-sm" disabled>XL</button>
                        <button type="button" class="btn btn-outline-secondary btn-sm">XXL</button>
                      </div>
                      <a href="#" class="btn btn-outline-secondary btn-sm mt-2 d-block"><i class="fas fa-shopping-cart mr-1"></i>加入購物車</a>
                    </div>
  
                  </div>
                </div>
              </div>
            </div> -->
				</div>
			</div>
		</div>

	</section>
</body>

<script>
	function addCart(productId,price,name) {
		
		console.log('A');
		 $.ajax({
			    type: "POST",
			    url: "http://localhost:8081/beauty/cart/add",
			    data:{
			    	memberPkId:5,
			    	productPkId:productId,
			    	count:1,
			    	price:price,
			    	productName:name
			    },
			    success: function (response) {
			      alert('加入完成');
			      console.log(response)
					console.log('B');

			    },
			    error: function (thrownError) {
			      console.log(thrownError);
			    }
			  });
			console.log('C');

// 		var cartList = [];
// 		if(localStorage.getItem("cartList")){
// 			cartList = JSON.parse(localStorage.getItem("cartList"));
// 		}
// 		cartList.push(productId);
// 		localStorage.setItem('cartList',JSON.stringify(cartList));

// 		console.log(product);
		
	}
</script>

</html>