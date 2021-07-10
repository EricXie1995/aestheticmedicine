<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link href="../ide/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="../ide/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
    <link href="../ide/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="../ide/css/style-metro.css" rel="stylesheet" type="text/css"/>
    <link href="../ide/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="../ide/css/style-responsive.css" rel="stylesheet" type="text/css"/>
    <link href="../ide/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>
    <link href="../ide/css/uniform.default.css" rel="stylesheet" type="text/css"/>
    <link rel="shortcut icon" href="../ide/image/favicon.ico"/>
</head>

<body>
<div class="container-fluid">
    <div class="row-fluid">
        <h3 class="page-title"><i class="fa fa-object-group"></i> Classification</h3>
        <ul class="breadcrumb">
            <li>
                <a href="list.html"><i class="fa fa-home"></i>Classification</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a href="#">Add First</a>
            </li>
        </ul>
    </div>
    <div class="row-fluid">
        <div class="portlet box green">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>
                    Add First
                </div>
            </div>
            <div class="portlet-body">
                <form class="form-horizontal" action="#">
                    <div class="control-group">
                        <label class="control-label">First Name：</label>
                        <div class="controls">
                            <input name="cname" type="text" class="m-wrap media"/>
                            <input name="type" type="hidden" value="1"/>
                            <input name="parentId" type="hidden" value="0"/>
                            <span class="help-inline">name</span>
                        </div>
                    </div>

                    <div class="form-actions">
                        <button type="button" onclick="create()" class="btn blue"><i class="fa fa-check"></i>確定</button>&emsp;
                        <button type="button" id="back" class="btn"><i class="fa fa-times"></i>返回</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<script src="../ide/js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script src="../ide/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="../ide/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
<script src="../ide/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../ide/js/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="../ide/js/jquery.blockui.min.js" type="text/javascript"></script>
<script src="../ide/js/jquery.cookie.min.js" type="text/javascript"></script>
<script src="../ide/js/jquery.uniform.min.js" type="text/javascript"></script>
<script src="../ide/js/app.js" type="text/javascript"></script>

<script type="text/javascript">
//    <![CDATA[
    $(function () {
        $("#back").click(function () {
            history.back();
        });
    });

    function create() {
        if (!$("[name='cname']").val()) {
            alert("請輸入分類名稱！");
            return;
        }
        $.ajax({
            cache: true,
            type: "POST",
            url: "add.do",
            data: $('.form-horizontal').serialize(),// 你的formid
            async: false,
            error: function (request) {
                alert("Connection error");
            },
            success: function (result) {
                if (result.state == 0) {
                    alert("創建成功！");
                } else {
                    alert(result.message);
                }
            }
        });
    }
//    ]]>
</script>
</body>
</html>