<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>商品詳情</title>

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
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-1 col-md-1"></div>
            <div class="col-sm-10 col-md-10">
                <h1>${productDetail.name}</h1>
                <hr/>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-1 col-md-1"></div>
            <div class="col-sm-5 col-md-5">
                <img class="detail-img" src="${cp}/shoppingMall/picture/${productDetail.id}">
            </div>
            <div class="col-sm-5 col-md-5 detail-x">
                <table class="table table-striped">
                    <tr>
                        <th>商品名稱</th>
                        <td>${productDetail.name}</td>
                    </tr>
                    <tr>
                        <th>商品價格</th>
                        <td>${productDetail.price}</td>
                    </tr>
                    <tr>
                        <th>商品描述</th>
                        <td>${productDetail.description}</td>
                    </tr>
                    <tr>
                        <th>商品類別</th>
                        <td>${productDetail.type}</td>
                    </tr>
                    <tr>
                        <th>商品庫存</th>
                        <td>${productDetail.counts}</td>
                    </tr>
                    <tr>
                        <th>購買數量</th>
                        <td>
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-default" onclick="subCounts()">-</button>
                                <button id="productCounts" type="button" class="btn btn-default">1</button>
                                <button type="button" class="btn btn-default" onclick="addCounts(1)">+</button>
                            </div>
                        </td>
                    </tr>
                </table>
                <div class="row">
                    <div class="col-sm-1 col-md-1 col-lg-1"></div>
                    <button class="btn btn-danger btn-lg col-sm-4 col-md-4 col-lg-4" onclick="addToShoppingCar(${productDetail.id})">新增至購物車</button>
                    <div class="col-sm-2 col-md-2 col-lg-2"></div>
                    <button  class="btn btn-danger btn-lg col-sm-4 col-md-4 col-lg-4" onclick="buyConfirm(${productDetail.id})">購買</button>

                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-1 col-md-1 col-lg-1"></div>
            <div class="col-sm-10 col-md-10 col-lg-10">
                <hr class="division"/>
                <table class="table evaluationTable" border="0" id="evaluation">
                </table>
                <hr/>
                <div id="inputArea"></div>
            </div>
        </div>
    </div>

    <!-- 尾部 -->
    <jsp:include page="../include/foot.jsp"/>
  <script type="text/javascript">
      listEvaluations();

      function addToShoppingCar(productId) {
          judgeIsLogin();
          var productCounts = document.getElementById("productCounts");
          var counts = parseInt(productCounts.innerHTML);
          var shoppingCar = {};
          shoppingCar.userId = "${currentUser.id}";
          shoppingCar.productId = productId;
          shoppingCar.counts = counts;
          var addResult = "";
          $.ajax({
              async : false,
              type : 'POST',
              url : '${cp}/shoppingMall/addShoppingCar',
              data : shoppingCar,
              dataType : 'json',
              success : function(result) {
                  addResult = result.result;
              },
              error : function(result) {
                  layer.alert('查詢帳號錯誤123');
              }
          });
          if(addResult == "success") {
              layer.confirm('前往購物車？', {icon: 1, title:'新增成功',btn:['前往購物車','繼續瀏覽']},
                      function(){
                          window.location.href = "${cp}/shoppingMall/shopping_car";
                      },
                      function(index){
                        layer.close(index);}
              );
          }
      }

      function judgeIsLogin() {
          if("${currentUser.id}" == null || "${currentUser.id}" === undefined || "${currentUser.id}" ===""){
              window.location.href = "${cp}/shoppingMall/login";
          }
      }

      function subCounts() {
          var productCounts = document.getElementById("productCounts");
          var counts = parseInt(productCounts.innerHTML);
          if(counts>=2)
              counts--;
          productCounts.innerHTML = counts;
      }

      function addCounts() {
          var productCounts = document.getElementById("productCounts");
          var counts = parseInt(productCounts.innerHTML);
          if(counts<${productDetail.counts})
              counts++;
          productCounts.innerHTML = counts;
      }

      function buyConfirm(productId) {
          judgeIsLogin();
          var address = getUserAddress("${currentUser.id}");
          var phoneNumber = getUserPhoneNumber("${currentUser.id}");
          var productCounts = document.getElementById("productCounts");
          var counts = parseInt(productCounts.innerHTML);
          var product = getProductById(productId);
          var html = '<div class="col-sm-1 col-md-1 col-lg-1"></div>'+
                  '<div class="col-sm-10 col-md-10 col-lg-10">'+
                  '<table class="table confirm-margin">'+
                  '<tr>'+
                  '<th>商品名稱：</th>'+
                  '<td>'+product.name+'</td>'+
                  '</tr>'+
                  '<tr>'+
                  '<th>商品單價：</th>'+
                  '<td>'+product.price+'</td>'+
                  '</tr>'+
                  '<tr>'+
                  '<th>購買數量：</th>'+
                  '<td>'+counts+'</td>'+
                  '</tr>'+
                  '<tr>'+
                  '<th>總金額：</th>'+
                  '<td>'+counts*product.price+'</td>'+
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
                  '<button class="btn btn-danger col-sm-4 col-md-4 col-lg-4" onclick="addToShoppingRecords('+productId+')">確認購買</button>'+
                  '</div>'+
                  '</div>';
          layer.open({
              type:1,
              title:'請確認訂單訊息：',
              content:html,
              area:['650px','350px'],
          });
      }

      function getProductById(id) {
          var productResult = "";
          var product = {};
          product.id = id;
          $.ajax({
              async : false, //设置同步
              type : 'POST',
              url : '${cp}/shoppingMall/getProductById',
              data : product,
              dataType : 'json',
              success : function(result) {
                  productResult = result.result;
              },
              error : function(result) {
                  layer.alert('查詢錯誤');
              }
          });
          productResult = JSON.parse(productResult);
          return productResult;
      }

      function getUserAddress(id) {
          var address = "";
          var user = {};
          user.id = id;
          $.ajax({
              async : false, //设置同步
              type : 'POST',
              url : '${cp}/shoppingMall/getUserAddressAndPhoneNumber',
              data : user,
              dataType : 'json',
              success : function(result) {
                  address = result.address;
              },
              error : function(result) {
                  layer.alert('查詢錯誤');
              }
          });
          return address;
      }

      function getUserPhoneNumber(id) {
          var phoneNumber = "";
          var user = {};
          user.id = id;
          $.ajax({
              async : false, //设置同步
              type : 'POST',
              url : '${cp}/shoppingMall/getUserAddressAndPhoneNumber',
              data : user,
              dataType : 'json',
              success : function(result) {
                  phoneNumber = result.phoneNumber;
              },
              error : function(result) {
                  layer.alert('查詢錯誤');
              }
          });
          return phoneNumber;
      }

      function addToShoppingRecords(productId) {
          var productCounts = document.getElementById("productCounts");
          var counts = parseInt(productCounts.innerHTML);
          var shoppingRecord = {};
          shoppingRecord.userId = "${currentUser.id}";
          shoppingRecord.productId = productId;
          shoppingRecord.counts = counts;
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
          if(buyResult === "success") {
              layer.confirm('前往訂單狀態？', {icon: 1, title:'購買成功',btn:['前往訂單','繼續購買']},
                      function(){
                          window.location.href = "${cp}/shoppingMall/shopping_record";
                      },
                      function(index){
                          layer.close(index);}
              );
          }
          else if(buyResult === "unEnough"){
              layer.alert("庫存不足，購買失敗")
          }
      }

      function listEvaluations() {
          var evaluations = getEvaluations();
          var evaluationTable = document.getElementById("evaluation");
          var html = "";
          
          for(var i=0;i<evaluations.length;i++){
        	  
              var user = getUserByEvaId(evaluations[i].evaId);
              html+='<tr>'+
              			'<th> 暱稱 </th>'+
              			'<th> 內容 </th>'+
              		'</tr>'+
              		'<tr>'+
                      '<td>'+user.nickName+'</td>'+
                      '<td>'+evaluations[i].content+'</td>'+
                      '</tr>';
          }
          evaluationTable.innerHTML += html;

          if("${currentUser}"!=="" && getUserProductRecord() === "true"){
              var inputArea = document.getElementById("inputArea");
              html= '<div class="col-sm-12 col-md-12 col-lg-12">'+
                      '<textarea class="form-control" rows="4" id="evaluationText"></textarea>'+
                      '</div>'+
                      '<div class="col-sm-12 col-md-12 col-lg-12">'+
                      '<div class="col-sm-4 col-md-4 col-lg-4"></div>'+
                      '<button class="btn btn-primary btn-lg evaluationButton col-sm-4 col-md-4 col-lg-4" onclick="addToEvaluation()">評價</button>'+
                      '</div>';
              inputArea.innerHTML +=html;
          }

      }

      function getUserProductRecord() {
          var results = "";
          var product = {};
          product.userId = ${currentUser.id};
          product.productId = ${productDetail.id};
          $.ajax({
              async : false, //设置同步
              type : 'POST',
              url : '${cp}/shoppingMall/getUserProductRecord',
              data : product,
              dataType : 'json',
              success : function(result) {
                  results = result.result;
              },
              error : function(result) {
                  layer.alert('查詢錯誤');
              }
          });
          return results;
      }

      function getEvaluations() {
          var evaluations = "";
          var product = {};
          product.productId = "${productDetail.id}";
          $.ajax({
              async : false, //设置同步
              type : 'POST',
              url : '${cp}/shoppingMall/getShoppingEvaluations',
              data : product,
              dataType : 'json',
              success : function(result) {
                  evaluations = result.result;
              },
              error : function(result) {
                  layer.alert('查詢錯誤');
              }
          });
          evaluations = eval("("+evaluations+")");
          return evaluations;
      }

      function getUserById(id) {
          var userResult = "";
          var user = {};
          user.id = id;
          console.log(id);
          $.ajax({
              async : false, //设置同步
              type : 'POST',
              url : '${cp}/shoppingMall/getUserById',
              data : user,
              dataType : 'json',
              success : function(result) {
                  userResult = result.result;
              },
              error : function(result) {
                  layer.alert('查詢錯誤45646');
              }
          });
          userResult = JSON.parse(userResult);
          return userResult;
      }
      
      function getUserByEvaId(id) {
          var userResult = "";
          var user = {};
          user.id = id;
          console.log(id);
          $.ajax({
              async : false, //设置同步
              type : 'POST',
              url : '${cp}/shoppingMall/getUserByEvaId',
              data : user,
              dataType : 'json',
              success : function(result) {
                  userResult = result.result;
              },
              error : function(result) {
                  layer.alert('查詢錯誤789456');
              }
          });
          userResult = JSON.parse(userResult);
          return userResult;
      }

      function addToEvaluation() {
          var inputText = document.getElementById("evaluationText").value;
          var evaluation = {};
          evaluation.userId = "${currentUser.id}";
          evaluation.productId = "${productDetail.id}";
          evaluation.content = inputText;
          var addResult = "";
          $.ajax({
              async : false,
              type : 'POST',
              url : '${cp}/shoppingMall/addShoppingEvaluation',
              data : evaluation,
              dataType : 'json',
              success : function(result) {
                  addResult = result.result;
              },
              error : function(result) {
                  layer.alert('查詢帳號錯誤');
              }
          });
          if(addResult = "success"){
              layer.msg("評價成功",{icon:1});
              window.location.href = "${cp}/shoppingMall/product_detail";
          }
      }

  </script>
  </body>
</html>