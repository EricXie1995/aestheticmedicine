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
    <title>Login - iiieduBeauty Admin</title>
    <!-- 引入jquery webjars -->
    <script type="text/javascript" src="<c:url value='/webjars/jquery/3.6.0/jquery.js' />">></script>
    <!-- 引入bootstrap webjars -->
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/4.3.1/css/bootstrap.min.css' />" />
    <script src="<c:url value='/webjars/bootstrap/4.3.1/js/bootstrap.min.js' />"></script>
    <script src="<c:url value='/webjars/popper.js/1.14.3/umd/popper.min.js' />"></script>
</head>
<body>
<div class="container-fluid text-center" style="margin-top: 50px">
    <form action="login.jsp" method="post" style="max-width: 350px; margin: 0 auto;">

        <div th:if="${param.error}">
            <p class="text-danger">${SPRING_SECURITY_LAST_EXCEPTION.message}</p>
        </div>

        <div th:if="${param.logout}">
            <p class="text-warning">You have been logged out.</p>
        </div>

        <div class="border border-secondary p-3 rounded">
            <p>Access to iiieduBeauty Control Panel</p>
            <p>
                <input type="email" name="memberAccount" class="form-control" placeholder="E-mail" required autofocus/>
            </p>
            <p>
                <input type="password" name="memberPwd" class="form-control" placeholder="Password" required />
            </p>
            <p>
                <input type="checkbox" name="remember-me" />&nbsp;Remember Me
            </p>
            <p>
                <input type="submit" value="Login" class="btn btn-primary" />
            </p>
        </div>
    </form>
</div>
</body>
</html>
