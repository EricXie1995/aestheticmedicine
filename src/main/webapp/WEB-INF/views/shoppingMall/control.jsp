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
      <script src="${cp}/Mall/js/ajaxfileupload.js" type="text/javascript"></script>
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
										<input type='text' class='form-control' name='Name' id='product-name'>
									</div>
									<div class='form-group'>
										<label for='product-price' class='col-form-label'>產品價格:</label>
										<input type='text' class='form-control' name='Price' id='product-price'>
									</div>
									<div class='form-group'>
										<label for='product-counts' class='col-form-label'>產品數量:</label>
										<input type='text' class='form-control' name='counts' id='product-counts'>
									</div>
									<div class='form-group'>
										<label for='product-description' class='col-form-label'>產品描述:</label>
										<input type='text' class='form-control' name='description' id='product-description'>
									</div>
									<div class='form-group'>
										<label for='product-keyword' class='col-form-label'>分類關鍵字:</label>
										<input type='text' class='form-control' name='keyWord' id='product-keyword'>
									</div>
									<div class="form-group">
                                		<label for="product-type" class="col-form-label">商品類別</label>
                                   			<select class="form-control" name="type" id="product-type">
                                       			<option value="1">護目鏡</option>
                                        		<option value="2">防護衣</option>
                                       			<option value="3">抗菌噴霧</option>
                                        		<option value="4">醫用手套</option>
                                       			<option value="5">酒精／優碘棉片</option>
                                    			<option value="6">藥皂／乾洗手(藥用)</option>
                                       			<option value="7">傷口護理用品</option>
                                   			</select>
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
									<a class='updatelink' href="<c:url value='/' />shoppingMall/product/">
								<button id="confirmUpdate" type="button" class="btn btn-primary">儲存變更</button></a>
							</div>
						</div>
					</div>
				</div>

    <!-- 中间内容 -->
    <div class="container-fluid">
        <div class="row">
            <!-- 控制栏 -->
            <div class="col-sm-3 col-md-2 sidebar sidebar-1" style="background-color:#ACD6FF;">
                <ul class="nav nav-sidebar">
                    <li class="list-group-item-diy"><a href="#section1">查看所有會員<span class="sr-only">(current)</span></a></li>
                    <li class="list-group-item-diy"><a href="#section2">查看所有商品</a></li>
                    <li class="list-group-item-diy"><a href="#section3">添加商品</a></li>
                    
                </ul>
            </div>
            <!-- 控制内容 -->
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <div class="col-md-12">
                    <h1><a name="section1">會員資料</a></h1>
                    <hr/>
                    <table class="table table-hover center" id="userTable">
                    </table>
                </div>

                <div class="col-md-12">
                    <hr/>
                    <h1><a name="section2">商品資料</a></h1>
                    <hr/>
                    <div class="col-lg-12 col-md-12 col-sm-12" id="productArea"></div>
                    <br/>
                </div>
				

                <div class="col-md-12">
                    <hr/>
                    <h1><a name="section3">新增商品</a></h1>
                    <hr/>
                    <div class="col-sm-offset-2 col-md-offest-2">
                        <!-- 表单输入 -->
                        <form id="addForm" method="POST"  enctype="multipart/form-data" >
                        <div  class="form-horizontal">
                            <div class="form-group">
                                <label for="productName" class="col-sm-2 col-md-2 control-label">商品名稱</label>
                                <div class="col-sm-6 col-md-6">
                                    <input type="text" class="form-control" name='Name' id="productName"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="productDescribe" class="col-sm-2 col-md-2 control-label">商品描述</label>
                                <div class="col-sm-6 col-md-6">
                                    <input type="text" class="form-control" name='description'  id="productDescribe" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="productkeyWord" class="col-sm-2 col-md-2 control-label">關鍵字</label>
                                <div class="col-sm-6 col-md-6">
                                    <input type='text' class='form-control' name='keyWord' id="productkeyWord" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="productPrice" class="col-sm-2 col-md-2 control-label">商品價格</label>
                                <div class="col-sm-6 col-md-6">
                                    <input type="text" class="form-control" name='Price' id="productPrice" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="productCount" class="col-sm-2 col-md-2 control-label">商品數量</label>
                                <div class="col-sm-6 col-md-6">
                                    <input type="text" class="form-control"  name='counts' id="productCount" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="productType" class="col-sm-2 col-md-2 control-label">商品類別</label>
                                <div class="col-sm-6 col-md-6">
                                    <select class="form-control" name="type" id="productType">
                                        <option value="1">護目鏡</option>
                                        <option value="2">防護衣</option>
                                        <option value="3">抗菌噴霧</option>
                                        <option value="4">醫用手套</option>
                                        <option value="5">酒精／優碘棉片</option>
                                        <option value="6">藥皂／乾洗手(藥用)</option>
                                        <option value="7">傷口護理用品</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="productImgUpload" class="col-sm-2 col-md-2 control-label" >商品圖片</label>
                                <div class="col-sm-6 col-md-6">
                                    <input type="file" name="productImage" id="productImgUpload"/>
                                    <p class="help-block">上傳圖片大小應為280*160大小</p>
                                </div>
                                <%--<button class="btn btn-primary col-sm-2 col-md-2" onclick="fileUpload()">上传图片</button>--%>
                            </div>
<!--                             <div class="form-group"> -->
<!--                                 <div class="col-sm-offset-2 col-sm-6" id="imgPreSee"> -->
<!--                                 </div> -->
<!--                             </div> -->
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-6">
                                    <button class="btn btn-lg btn-primary btn-block" type="submit" onclick="addProduct()">新增商品</button>
                                </div>
                            </div>
                        </div>
                        </form>
                        <br/>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- 尾部 -->
    <jsp:include page="../include/foot.jsp"/>
  <script type="text/javascript">
		function showModal(id) {
// 		        console.log("開啟靜態框");
		        $("#updateModal").on('show.bs.modal', function(event) {
// 					console.log("updateModal");
					var button = $("#updatebtn"+id);
					id = button.data('id');
					var name = button.data('name');
					$(this).find('.modal-body #product-name').val(name)
					var price = button.data('price');
					$(this).find('.modal-body #product-price').val(price)
					var counts = button.data('counts');
					$(this).find('.modal-body #product-counts').val(counts)
					var keyword = button.data('keyword');
// 					console.log("K = "+keyword);
					$(this).find('.modal-body #product-keyword').val(keyword)
					var description = button.data('description');
					$(this).find('.modal-body #product-description').val(description)
					var type = button.data('type');
					$(this).find(".modal-body select").val(type);
				});
			 $("#updateModal").modal("show");
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
//							$('#updateForm').attr('action', href).submit();
						}
						return false;
				});
		}
 
		function updateProduct(href,id) {
			console.log("func.updateProduct.herf = "+href);
			var form = $('#updateForm')[0];
// 			console.log("func.updateProduct.form = ");
// 			console.log(form);
				
			var data = new FormData(form);
			data.append("productPkId",id);
// 			console.log("func.updateProduct.data = "+data);
// 			console.log(data);
			$.ajax({
		        type: "POST",
		        enctype: 'multipart/form-data',
		        url: href,
		        data: data,
		        processData: false, //prevent jQuery from automatically transforming the data into a query string
		        contentType: false,
		        cache: false,
		        success: function (data) {
		            console.log("SUCCESS !! ", data.result);
// 		            window.location = '/beauty/shopping/showAllProducts	';
		        	 listAllProduct();
		        	 window.location = '/beauty/shoppingMall/control';
		        },
		        error: function (e) {
		            console.log("ERROR : ", e);
		        }
	    	});
		}
		
  
      var loading = layer.load(0);
      listAllUser();
      listAllProduct();
      layer.close(loading);
      //列出所有用户
      function listAllUser() {
          var userTable = document.getElementById("userTable");
          var allUser = getAllUsers();
          userTable.innerHTML = '<tr>'+
                                  '<th> 會員ID </th>'+
                                  '<th> 帳號</th>'+
                                  '<th> 暱稱</th>'+
                                  '<th> 信箱</th>'+
                                  '<th> 是否刪除</th>'+
                                '</tr>';
          var html = "";
          for(var i=0;i<allUser.length;i++){
              html += '<tr>'+
                      '<td>'+allUser[i].id+'</td>'+
                      '<td>'+allUser[i].name+'</td>'+
                      '<td>'+allUser[i].nickName+'</td>'+
                      '<td>'+allUser[i].email+'</td>'+
                      '<td>'+
                      '<button class="btn btn-primary btn-sm" type="submit" onclick="deleteUser('+allUser[i].id+')">删除</button>'+
                      '</td>'+
                      '</tr>';
          }
          userTable.innerHTML += html;
      }

      function getAllUsers() {
          var allUsers = "";
          var nothing = {};
          $.ajax({
              async : false, //设置同步
              type : 'POST',
              url : '${cp}/shoppingMall/getAllUser',
              data : nothing,
              dataType : 'json',
              success : function(result) {
                  if (result!=null) {
                      allUsers = result.allUsers;
                  }
                  else{
                      layer.alert('查詢所有會員錯誤');
                  }
              },
              error : function(resoult) {
                  layer.alert('查詢所有會員錯誤');
              }
          });
          allUsers = eval("("+allUsers+")");
          return allUsers;
      }


      function listAllProduct() {
          var productArea = document.getElementById("productArea");
          var allProduct = getAllProducts();
          var html="";
          productArea.innerHTML = '';
          for(var i=0;i<allProduct.length;i++){
              var imgURL = "${cp}/shoppingMall/picture/"+allProduct[i].id;
              html+='<div class="col-sm-4 col-md-4 pd-5">'+
                      '<div class="boxes">'+
                      '<div class="big bigimg">'+
                      '<img onclick="showModal('+allProduct[i].id+')" src="'+imgURL+'">'+
                      '</div>'+
                      '<p class="font-styles center">'+allProduct[i].name+'</p>'+
                      '<p class="pull-right">價格：'+allProduct[i].price+'</p>'+
                      '<p class="pull-left">庫存：'+allProduct[i].counts+'</p>'+
                      '<div class = "row">'+
                      '<button style="display:none" class="btn btn-primary" id="updatebtn'+allProduct[i].id+'"'+
      				  'data-id="'+allProduct[i].id+'" data-name="'+allProduct[i].name+'"'+
      				  'data-price="'+allProduct[i].price+'" data-counts="'+allProduct[i].counts+'"'+
      				  'data-keyword="'+allProduct[i].keyWord+'" data-description="'+allProduct[i].description+'"'+
      				  'data-type="'+allProduct[i].type+'">'+
                      '修改</button>'+
                      '<button class="btn btn-primary delete-button" type="submit" onclick="deleteProduct('+allProduct[i].id+')">删除商品</button>'+
                      '</div>'+
                      '</div>'+
                      '</div>';
          }
          productArea.innerHTML+=html;
      }
      //列出所有商品

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

      function deleteUser(id) {
    	  console.log(id);
          var user = {};
          user.id = id;
          var deleteResult = "";
          $.ajax({
              async : false,
              type : 'POST',
              url : '${cp}/shoppingMall/deleteUser',
              data : user,
              dataType : 'json',
              success : function(result) {
                  deleteResult = result;
              },
              error : function(result) {
                  layer.alert('查詢會員錯誤deleteUser');
              }
          });
//           layer.msg(deleteResult.message);
          listAllUser()
      }

      function deleteProduct(id) {
    	  if (confirm('確定刪除此產品? ')) {
//     	  event.preventDefault();
          var product = {};
          product.id = id;
          var deleteResult = "";
          $.ajax({
              async : false,
              type : 'POST',
              url : '${cp}/shoppingMall/deleteProduct',
              data : product,
              dataType : 'json',
              success : function(result) {
//                   deleteResult = result;
//                   layer.alert('刪除商品成功');
         		 listAllProduct();
              },
              error : function(result) {
                  layer.alert('刪除商品錯誤');
              }
          });
//           layer.msg(deleteResult.message);
			}
			return false;
      }
      
      function addProduct() {
    	  event.preventDefault();
    	  console.log("func.addProduct");
		  var form = $('#addForm')[0];
		  console.log(form);
		  var data = new FormData(form);
//           var loadings = layer.load(0);
//           var product = {};
//           product.name = document.getElementById("productName").value;
//           product.description = document.getElementById("productDescribe").value;
//           product.keyWord = document.getElementById("keyWord").value;
//           product.price = document.getElementById("productPrice").value;
//           product.counts = document.getElementById("productCount").value;
//           product.type = document.getElementById("productType").value;
//           var addResult="";
          $.ajax({
              async : false,
              type : 'POST',
              enctype: 'multipart/form-data',
              url : '${cp}/shoppingMall/addProduct',
              data : data,
              processData: false, //prevent jQuery from automatically transforming the data into a query string
		      contentType: false,
		      cache: false,
              success : function(result) {
//                   addResult = result.result;
//                   layer.alert('新增商品成功');
                  listAllProduct();
// 		          window.location = '/beauty/shoppingMall/control';
              },
//               error : function(result) {
//                   layer.alert('新增商品錯誤');
//               }
          });
//           if(addResult == "success") {
//               fileUpload();
//               layer.msg('新增商品成功', {icon: 1, time: 1000});
//               layer.close(loadings)
//           }
//           listAllProduct();
      }
      
      function fileUpload() {
          var results = "";
          var name = document.getElementById("productName").value;
          $.ajaxFileUpload({
              url:'${cp}/shoppingMall/uploadFile?name='+name,
              secureuri:false ,
              fileElementId:'productImgUpload',
              type:'POST',
              dataType : 'text',
              success: function (result){
                  result = result.replace(/<pre.*?>/g, '');  //ajaxFileUpload会对服务器响应回来的text内容加上<pre style="....">text</pre>前后缀
                  result = result.replace(/<PRE.*?>/g, '');
                  result = result.replace("<PRE>", '');
                  result = result.replace("</PRE>", '');
                  result = result.replace("<pre>", '');
                  result = result.replace("</pre>", '');
                  result = JSON.parse(result);
                  results = result.result;
                  if(results == "success") {
                      layer.msg("圖片上傳成功", {icon: 1});
                      window.location.href = "${cp}/control";
                      //var imgPreSee = document.getElementById("imgPreSee");
                      //var imgSrc = '${cp}/img/'+name+'.jpg';
                      //imgPreSee.innerHTML +='<img src="'+imgSrc+')" class="col-sm-12 col-md-12 col-lg-12"/>';
                  }
                  else {
                      layer.msg("圖片上傳失敗", {icon: 0});
                  }

              },
              error: function ()
              {
                  layer.alert("上傳錯誤");
              }}
          );
      }
  </script>
  </body>
</html>