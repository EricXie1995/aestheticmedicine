<jsp:useBean id="member" scope="request" class="com.iiiedu.beauty.model.Member"/>
<%--
  Created by IntelliJ IDEA.
  User: student
  Date: 2021/6/19
  Time: 下午 08:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up - iiideuBeauty</title>
    <!-- 引入jquery webjars -->
    <script type="text/javascript" src="<c:url value='/webjars/jquery/3.6.0/jquery.js' />"></script>
    <!-- 引入bootstrap webjars -->
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/4.3.1/css/bootstrap.min.css' />" />
    <script src="<c:url value='/webjars/bootstrap/4.3.1/js/bootstrap.min.js' />"></script>
    <script src="<c:url value='/webjars/popper.js/1.14.3/umd/popper.min.js' />"></script>
</head>
<body>

<script>

</script>
<div class="container text-center" style="margin-top: 50px">
    <div>
        <img class="img-fluid" src="static/assets/img/logo.png">
        <h1>Member Registration - sign Up</h1>
    </div>

    <form action="<c:url value='/process_register'/>" method="post" style="max-width: 600px;margin: 0 auto">
        <div class="m-3">
            <div class="form-group row">
                <label class="col-4 col-form-label">Account : </label>
                <div class="col-8">
                    <input type="email" name="memberAccount"  class="form-control" required />
                </div>
            </div>

            <div class="form-group row">
                <label class="col-4 col-form-label">Password : </label>
                <div class="col-8">
                   <input type="password" name="memberPwd" class="form-control" required minlength="6" maxlength="10"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-4 col-form-label">Name : </label>
                <div class="col-8">
                    <input type="text" name="memberName" class="form-control" required minlength="2" maxlength="20"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-4 col-form-label">IdNumber : </label>
                <div class="col-8">
                    <input type="text" name="memberIdNumber" class="form-control" required minlength="10" maxlength="20"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-4 col-form-label">Address : </label>
                <div class="col-8">
                    <input type="text" name="memberAddress" class="form-control" required minlength="10" maxlength="20"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-4 col-form-label">Phone : </label>
                <div class="col-8">
                    <input type="text" name="memberPhone" class="form-control" required minlength="10" maxlength="20"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-4 col-form-label">LineID : </label>
                <div class="col-8">
                    <input type="text" name="memberLineId" class="form-control" required minlength="10" maxlength="20"/>
                </div>
            </div>

            <div>
                <button type="submit" class="btn btn-primary">Sign Up</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
