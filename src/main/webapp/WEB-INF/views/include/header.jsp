<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <!--假装我是代码，代码一定要对齐，对齐，对齐！-->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>購物+</title>
    <link href="${cp}/Mall/css/bootstrap.min.css" rel="stylesheet">
    <link href="${cp}/Mall/css/style.css" rel="stylesheet">

    <script src="${cp}/Mall/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${cp}/Mall/js/layer.js" type="text/javascript"></script>
    <!--[if lt IE 9]>
    <script src="${cp}/js/html5shiv.min.js"></script>
    <script src="${cp}/js/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!--导航栏部分-->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid" style="background-color:#ACD6FF;">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${cp}/shoppingMall/main">DOCCURE 購物+</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

            <ul class="nav navbar-nav navbar-right">
                <c:if test="${empty currentUser}">
                    <li><a href="${cp}/shoppingMall/register" methods="post">註冊</a></li>
                    <li><a href="${cp}/shoppingMall/login" methods="post">登入</a></li>
                </c:if>
                <c:if test="${not empty currentUser}">
                    <c:if test="${currentUser.role == 1}">
                        <li><a href="${cp}/shoppingMall/control" methods="post">控制台</a></li>
                    </c:if>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                ${currentUser.nickName}
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="${cp}/shoppingMall/shopping_car">購物車</a></li>
                            <li><a href="${cp}/shoppingMall/shopping_record">訂單狀態</a></li>
                            <c:if test="${currentUser.role == 1}">
                                <li><a href="${cp}/shoppingMall/shopping_handle">處理訂單</a></li>
                            </c:if>
                            <li role="separator" class="divider"></li>
                            <li><a href="${cp}/shoppingMall/amend_info">個人資料修改</a></li>
                            <li><a href="${cp}/shoppingMall/doLogout">登出</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>

            <div class="navbar-form navbar-right">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="關鍵字" id="searchKeyWord"/>
                </div>
                <button class="btn btn-default" onclick="searchProduct();">尋找商品</button>
            </div>
        </div>
    </div>
</nav>
<script type="text/javascript">
    function searchProduct() {
        var search = {};
        search.searchKeyWord = document.getElementById("searchKeyWord").value;
        var searchResult = "";
        $.ajax({
            async : false,
            type : 'POST',
            url : '${cp}/shoppingMall/searchPre',
            data : search,
            dataType : 'json',
            success : function(result) {
                searchResult = result.result;
            },
            error : function(result) {
                layer.alert('查詢錯誤');
            }
        });
        if(searchResult == "success")
            window.location.href = "${cp}/shoppingMall/search";
    }
</script>

</body>
</html>