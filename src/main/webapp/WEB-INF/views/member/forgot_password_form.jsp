<%--
  Created by IntelliJ IDEA.
  User: student
  Date: 2021/6/22
  Time: 下午 03:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Foegot Password</title>
    <!-- 引入jquery webjars -->
    <script type="text/javascript" src="<c:url value='/webjars/jquery/3.6.0/jquery.js' />">></script>
    <!-- 引入bootstrap webjars -->
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/4.3.1/css/bootstrap.min.css' />" />
    <script src="<c:url value='/webjars/bootstrap/4.3.1/js/bootstrap.min.js' />"></script>
    <script src="<c:url value='/webjars/popper.js/1.14.3/umd/popper.min.js' />"></script>
</head>
<body>
    <div class="text-center" style="margin: 30px auto">
        <h2>Forgot Password</h2>
    </div>

    <c:if test="${error != null}">
        <div class="text-center">
            <p class="text-danger">${error}</p>
         </div>
    </c:if>

    <c:if test="${message != null}">
        <div class="text-center">
            <p class="text-warning">${message}</p>
        </div>
    </c:if>

    <form action="<c:url value="/forgot_password"/>" method="post" style="max-width: 420px;margin: 0 auto">
        <div class="border border-secondary rounded p-3">
            <div>
                <p>We will be sending a reset password link to your email.</p>
            </div>
            <div>
                <P>
                    <input type="email" name="memberAccount" class="form-control" placeholder="Enter your Email" required autofocus/>
                </P>
                <p class="text-center">
                    <input type="submit" value="Send" class="btn btn-primary"/>
                </p>
            </div>
        </div>
    </form>
</body>
</html>
