<%--
  Created by IntelliJ IDEA.
  User: student
  Date: 2021/6/19
  Time: 下午 07:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome to iiideuBeauty Home</title>
    <!-- 引入jquery webjars -->
    <script type="text/javascript" src="<c:url value='/webjars/jquery/3.6.0/jquery.js' />">></script>
    <!-- 引入bootstrap webjars -->
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/4.3.1/css/bootstrap.min.css' />" />
    <script src="<c:url value='/webjars/bootstrap/4.3.1/js/bootstrap.min.js' />"></script>
    <script src="<c:url value='/webjars/popper.js/1.14.3/umd/popper.min.js' />"></script>
</head>
<body>
<div class="container text-center" style="margin-top: 50px">
    <h1>Welcome to beauty.org</h1>
    <h3><a href="members.jsp">List of Users</a></h3>
    <h3><a href="signup_form.jsp">Register</a></h3>
    <h3><a href="login.jsp">Login</a></h3>
</div>
</body>
</html>
