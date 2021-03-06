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
                <h1>歡迎來到訂單頁</h1>
                <p>您的購買清單為</p>
            </div>
        </div>
        <div class="col-sm-10  col-md-10 col-sm-offset-1 col-md-offset-1">
            <div class="row">
                <ul class="nav nav-tabs list-group-diy" role="tablist">
                    <li role="presentation" class="active list-group-item-diy"><a href="#unHandle" aria-controls="unHandle" role="tab" data-toggle="tab">待發貨訂單&nbsp;<span class="badge" id="unHandleCount">0</span></a></li>
                    <li role="presentation" class="list-group-item-diy"><a href="#transport" aria-controls="transport" role="tab" data-toggle="tab">配送中訂單&nbsp;<span class="badge" id="transportCount">0</span></a></li>
                    <li role="presentation" class="list-group-item-diy"><a href="#receive" aria-controls="receive" role="tab" data-toggle="tab">已收貨訂單&nbsp;<span class="badge" id="receiveCount">0</span></a></li>
                    <li role="presentation" class="list-group-item-diy"><a href="#all" aria-controls="all" role="tab" data-toggle="tab">全部訂單&nbsp;<span class="badge" id="allCount">0</span></a></li>
                </ul>

                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="unHandle">
                        <table class="table table-hover center" id="unHandleTable">
                        </table>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="transport">
                        <table class="table table-hover center" id="transportTable">
                        </table>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="receive">
                        <table class="table table-hover center" id="receiveTable">
                        </table>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="all">
                        <table class="table table-hover center" id="allTable">
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 尾部 -->
<jsp:include page="../include/foot.jsp"/>

<script type="text/javascript">
    var loading = layer.load(0);
    updateShoppingRecords();

    function updateShoppingRecords() {
        var orderArray = new Array;
        orderArray[0] = "未發貨";
        orderArray[1] = "配送中";
        orderArray[2] = "已收貨";
        var unHandleTable = document.getElementById("unHandleTable");
        var transportTable = document.getElementById("transportTable");
        var receiveTable = document.getElementById("receiveTable");
        var allTable = document.getElementById("allTable");

        var unHandleCount = document.getElementById("unHandleCount");
        var transportCount = document.getElementById("transportCount");
        var receiveCount = document.getElementById("receiveCount");
        var allCount = document.getElementById("allCount");

        var unHandleCounts = parseInt(unHandleCount.innerHTML);
        var transportCounts = parseInt(transportCount.innerHTML);
        var receiveCounts = parseInt(receiveCount.innerHTML);
        var allCounts = parseInt(allCount.innerHTML);

        var allShoppingRecords = getShoppingRecords();
        unHandleTable.innerHTML = "";
        transportTable.innerHTML = "";
        receiveTable.innerHTML = "";
        allTable.innerHTML = "";
        var unHandleHTML = '<tr>'+
                '<th>商品名稱</th>'+
                '<th>購買數量</th>'+
                '<th>付款金額</th>'+
                '<th>訂單狀態</th>'+
                '</tr>';
        var transportHTML = '<tr>'+
                '<th>商品名稱</th>'+
                '<th>購買數量</th>'+
                '<th>付款金額</th>'+
                '<th>送貨地址</th>'+
                '<th>連絡電話</th>'+
                '<th>訂單狀態</th>'+
                '<th>確認收貨</th>'+
                '</tr>';
        var receiveHTML = '<tr>'+
                '<th>商品名稱</th>'+
                '<th>購買數量</th>'+
                '<th>付款金額</th>'+
                '<th>訂單狀態</th>'+
                '<th>評價</th>'+
                '</tr>';
        var allHTML = '<tr>'+
                '<th>商品名稱</th>'+
                '<th>購買數量</th>'+
                '<th>付款金額</th>'+
                '<th>訂單狀態</th>'+
                '</tr>';
        var unHandleHTMLTemp = "";
        var transportHTMLTemp = "";
        var receiveHTMLTemp = "";
        var allHTMLTemp = "";

        for(var i=0;i<allShoppingRecords.length;i++){
        	console.log(allShoppingRecords[i]);
            var product = getProductById(allShoppingRecords[i].recordId);
            console.log(product);
            allHTMLTemp += '<tr>'+
                    '<td>'+product.name+'</td>'+
                    '<td>'+allShoppingRecords[i].counts+'</td>'+
                    '<td>'+allShoppingRecords[i].productPrice+'</td>'+
                    '<td>'+orderArray[allShoppingRecords[i].orderStatus]+'</td>'+
                    '</tr>';
            allCounts++;
            if(allShoppingRecords[i].orderStatus == 0){
                unHandleHTMLTemp+= '<tr>'+
                        '<td>'+product.name+'</td>'+
                        '<td>'+allShoppingRecords[i].counts+'</td>'+
                        '<td>'+allShoppingRecords[i].productPrice+'</td>'+
                        '<td>'+orderArray[allShoppingRecords[i].orderStatus]+'</td>'+
                        '</tr>';
                unHandleCounts++;
            }
            else if(allShoppingRecords[i].orderStatus ==1){
                var address = getUserAddress(allShoppingRecords[i].recordId);
                var phoneNumber = getUserPhoneNumber(allShoppingRecords[i].recordId)
                transportHTMLTemp+= '<tr>'+
                        '<td>'+product.name+'</td>'+
                        '<td>'+allShoppingRecords[i].counts+'</td>'+
                        '<td>'+allShoppingRecords[i].productPrice+'</td>'+
                        '<td>'+address+'</td>'+
                        '<td>'+phoneNumber+'</td>'+
                        '<td>'+orderArray[allShoppingRecords[i].orderStatus]+'</td>'+
                        '<td>'+
//                         '<button class="btn btn-primary btn-sm" onclick="receiveProducts('+allShoppingRecords[i].recordId+','+allShoppingRecords[i].recordId+',\''+allShoppingRecords[i].time+'\')">確認收貨</button>'+
                        '<button class="btn btn-primary btn-sm" onclick="receiveProducts('+allShoppingRecords[i].recordId+')">確認收貨</button>'+
                        '</td>'+
                        '</tr>';
                transportCounts++;
            }
            else if(allShoppingRecords[i].orderStatus ==2){
                receiveHTMLTemp += '<tr>'+
                        '<td>'+product.name+'</td>'+
                        '<td>'+allShoppingRecords[i].counts+'</td>'+
                        '<td>'+allShoppingRecords[i].productPrice+'</td>'+
                        '<td>'+orderArray[allShoppingRecords[i].orderStatus]+'</td>'+
                        '<td>'+
                        '<button class="btn btn-primary btn-sm" onclick="productDetail('+allShoppingRecords[i].recordId+')">評價</button>'+
                        '</td>'+
                        '</tr>';
                receiveCounts++;
            }
        }
        if(unHandleHTMLTemp == ""){
            unHandleHTML='<div class="row">'+
                            '<div class="col-sm-3 col-md-3 col-lg-3"></div> '+
                            '<div class="col-sm-6 col-md-6 col-lg-6">'+
                                '<h2>沒有相關訂單</h2>'+
                            '</div>'+
                        '</div>';
        }
        else
            unHandleHTML+=unHandleHTMLTemp;
        if(transportHTMLTemp == ""){
            transportHTML = '<div class="row">'+
                    '<div class="col-sm-3 col-md-3 col-lg-3"></div> '+
                    '<div class="col-sm-6 col-md-6 col-lg-6">'+
                    '<h2>沒有相關訂單</h2>'+
                    '</div>'+
                    '</div>';
        }
        else
            transportHTML+=transportHTMLTemp;
        if(receiveHTMLTemp == ""){
            receiveHTML = '<div class="row">'+
                    '<div class="col-sm-3 col-md-3 col-lg-3"></div> '+
                    '<div class="col-sm-6 col-md-6 col-lg-6">'+
                    '<h2>沒有相關訂單</h2>'+
                    '</div>'+
                    '</div>';
        }
        else
            receiveHTML+=receiveHTMLTemp;
        if(allHTMLTemp == ""){
            allHTML = '<div class="row">'+
                    '<div class="col-sm-3 col-md-3 col-lg-3"></div> '+
                    '<div class="col-sm-6 col-md-6 col-lg-6">'+
                    '<h2>沒有相關訂單</h2>'+
                    '</div>'+
                    '</div>';
        }
        else
            allHTML+=allHTMLTemp;

        unHandleCount.innerHTML = unHandleCounts;
        transportCount.innerHTML = transportCounts;
        receiveCount.innerHTML = receiveCounts;
        allCount.innerHTML = allCounts;

        unHandleTable.innerHTML += unHandleHTML;
        transportTable.innerHTML += transportHTML;
        receiveTable.innerHTML += receiveHTML;
        allTable.innerHTML += allHTML;
        layer.close(loading);
    }

    function getShoppingRecords() {
        judgeIsLogin();
        var shoppingRecordProducts = "";
        var user = {};
        user.userId = ${currentUser.id};
        $.ajax({
            async : false, //设置同步
            type : 'POST',
            url : '${cp}/shoppingMall/getShoppingRecords',
            data : user,
            dataType : 'json',
            success : function(result) {
                shoppingRecordProducts = result.result;
            },
            error : function(result) {
                layer.alert('查詢錯誤');
            }
        });
        shoppingRecordProducts = eval("("+shoppingRecordProducts+")");
        return shoppingRecordProducts;
    }

    function getProductById(id) {
        var productResult = "";
        var product = {};
        product.recordId = id;
        $.ajax({
            async : false, //设置同步
            type : 'POST',
            url : '${cp}/shoppingMall/getProductByRecordId',
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
        user.recordId = id;
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
                layer.alert('查詢錯誤+Address');
            }
        });
        return address;
    }

    function getUserPhoneNumber(id) {
        var phoneNumber = "";
        var user = {};
        user.recordId = id;
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
                layer.alert('查詢錯誤+PhoneNumber');
            }
        });
        return phoneNumber;
    }

    function judgeIsLogin() {
        if("${currentUser.id}" == null || "${currentUser.id}" == undefined || "${currentUser.id}" ==""){
            window.location.href = "${cp}/login";
        }
    }
    function receiveProducts(recordId) {
        var receiveResult = "";
        var shoppingRecord = {};
//         shoppingRecord.recordId = userId;
//         shoppingRecord.recordId = productId;
//         shoppingRecord.time = time;
        shoppingRecord.recordId = recordId;
        shoppingRecord.orderStatus = 2;
        $.ajax({
            async : false, //设置同步
            type : 'POST',
            url : '${cp}/shoppingMall/changeShoppingRecord',
            data : shoppingRecord,
            dataType : 'json',
            success : function(result) {
                receiveResult = result.result;
            },
            error : function(result) {
                layer.alert('查詢錯誤+receiveProducts');
            }
        });
        if(receiveResult = "success")
            window.location.href = "${cp}/shoppingMall/shopping_record";
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