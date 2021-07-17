<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
      integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
      crossorigin="anonymous"
    />
    <style>
      .product {
        border: 1px solid #d1d1d1;
      }
      .title {
        color: rgb(51, 168, 246);
        font-size: 20px;
      }
      .info {
        display: flex;
      }
      .price {
        color: coral;
      }
      .card-block {
        background-color: #fff;
        box-shadow: 0 2px 20px 0 #cbcbcb80;
        width: 80%;
        padding: 50px;
        margin: 0 auto;
      }
      .box {
        height: 80%;
        overflow-y: auto;
      }
      .bottom-info {
        text-align: right;
      }
      .totla-info {
        margin: 20px 0;
      }
      .orange {
        background-color: #fd7e14;
        color: #fff;
        border: 5px solid #000;
        border-width: 0 4px 5px 0;
        border-radius: 5px;
        border-color: transparent #e4c4aa #c56b1f transparent;
      }
      .green {
        background-color: #8bbc3f;
        color: #fff;
        border: 5px solid #000;
        border-width: 0 4px 5px 0;
        border-radius: 5px;
        border-color: transparent #cde1af #7d9f4a transparent;
      }
      .btn {
        border-radius: 3px;
        font-size: 15px;
        width: 80%;
        border: 0;
        padding: 12px 20px;
        margin: 10px auto auto;
        display: block;
        background-clip: padding-box;
      }
    </style>
  </head>
  <body>
    <div class="card-block mt-5">
      <h5>購物車列表</h5>
      <div class="container">

      	<c:forEach items="${showCartModel}" begin="0"
				end="${showCartModel.size()}" var="model">
      	
      	<div class="row mt-3 product">
          <div class="col-2 p-3">
            <img class="img-fluid" src="https://zhenghui.idv.tw/assets/img/demo.png" />
          </div>
          <div class="col-10 p-3">
            <div class="title">${model.productName}</div>
            <div class="desc">
              ${model.productSpec}
            </div>
            <div class="info mt-5">
              <div class="price mr-3">100</div>
              <div class="count">數量：${model.count}</div>
            </div>
          </div>
      	      </div>
      	
      	</c:forEach>
      	
      
      
      
      <div class="bottom-info">
        <div class="row totla-info">
          <div class="col-8 col-lg-9 col-xl-9" style="font-size: 20px; color: #282828; line-height: 46px">總計</div>
          <div class="col-4 col-lg-3 col-xl-3" style="font-size: 31px; font-weight: bold">$2,700</div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <button class="orange btn" type="button" tabindex="0">繼續購物</button>
          </div>
          <div class="col-md-6">
            <button class="green btn" type="button">前往結帳</button>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
