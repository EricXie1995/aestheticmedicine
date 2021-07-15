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
    <div class="container-fluid">
        <h1 class="title center">註冊</h1>
        <br/>
        <div class="col-sm-offset-2 col-md-offest-2">
            <!-- 表单输入 -->
            <div  class="form-horizontal">
                <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 col-md-2 control-label">帳號</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" id="inputUserName" placeholder="请输入数字"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 col-md-2 control-label">信箱</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="email" class="form-control" id="inputEmail" placeholder="请输入正确的邮箱格式"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputNickname" class="col-sm-2 col-md-2 control-label">暱稱</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" id="inputNickname" placeholder="高帅富" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 col-md-2 control-label">密碼</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="password" class="form-control" id="inputPassword" placeholder="禁止输入非法字符" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPhoneNumber" class="col-sm-2 col-md-2 control-label">手機號碼</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" id="inputPhoneNumber" placeholder="请输入手机号" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="man" class="col-sm-2 col-md-2 control-label">性别</label>
                    <div class="col-sm-6 col-md-6">
                        <label class="radio-inline">
                            <input type="radio" id="man" value="option1"> 男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" id="woman" value="option2"> 女
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="birthday" class="col-sm-2 col-md-2 control-label">出生日期</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" id="birthday" placeholder="请输入出生日期" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="postcodes" class="col-sm-2 col-md-2 control-label">編號</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" id="postcodes" placeholder="请输入邮政编码" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="address" class="col-sm-2 col-md-2 control-label">地址</label>
                    <div class="col-sm-6 col-md-6">
                        <input type="text" class="form-control" id="address" placeholder="请输入寄送地址" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-6">
                        <button class="btn btn-lg btn-primary btn-block" type="submit" onclick="startRegister()">註冊</button>
                    </div>
                </div>
            </div>
            <br/>
        </div>
    </div>

    <!--尾部-->
    <jsp:include page="../include/foot.jsp"/>
    <script type="text/javascript">
        function startRegister() {
            var loading = layer.load(0);
            var user = {};
            console.log(user);
            user.userName = document.getElementById("inputUserName").value;
            user.email = document.getElementById("inputEmail").value;
            user.nickName = document.getElementById("inputNickname").value;
            user.password = document.getElementById("inputPassword").value;
            user.phoneNumber = document.getElementById("inputPhoneNumber").value;
            user.birthday = document.getElementById("birthday").value;
            user.postNumber = document.getElementById("postcodes").value;
            user.address = document.getElementById("address").value;
            user.sex = 0;
            
            if(document.getElementById("woman").checked)
                user.sex = 1;
            if(user.userName == ''){
                layer.msg('帳號不能為空',{icon:2});
                return;
            }
            else if(user.userName.length >= 12){
                layer.msg('帳號長度不能超過12個ㄗ字',{icon:2});
                return;
            }
            if(user.nickName == ''){
                layer.msg('暱稱不能為空',{icon:2});
                return;
            }
            else if(user.nickName.length >= 15){
                layer.msg('帳號長度不能超過15個字',{icon:2});
                return;
            }
            else if(user.password == ''){
                layer.msg('密碼不能為空',{icon:2});
                return;
            }
            else if(user.password.length>= 20){
                layer.msg('密碼長度不能超過20個字',{icon:2});
                return;
            }
            var registerResult = null;
            $.ajax({
                async : false, //设置同步
                type : 'POST',
                url : '${cp}/shoppingMall/doRegister',
                data : user,
                dataType : 'json',
                success : function(result) {
                    registerResult = result.result;
                },
                error : function(result) {
                    layer.alert('查詢帳號錯誤');
                }
            });
            if(registerResult == 'success'){
                layer.close(loading);
                layer.msg('註冊成功',{icon:1});
                window.location.href="${cp}/shoppingMall/login";
            }
            else if(registerResult == 'nameExist'){
                layer.close(loading);
                layer.msg('這個帳號已经被使用啦！',{icon:2});
            }
            else if(registerResult == 'emailExist'){
                layer.close(loading);
                layer.msg('這個帳號已經註冊啦！',{icon:2});
            }
            else if(registerResult == 'fail'){
                layer.close(loading);
                layer.msg('伺服器異常',{icon:2});
            }
        }
    </script>
  </body>
</html>