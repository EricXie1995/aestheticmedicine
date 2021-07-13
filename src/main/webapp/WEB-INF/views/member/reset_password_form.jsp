<%--
  Created by IntelliJ IDEA.
  User: student
  Date: 2021/6/22
  Time: 下午 05:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reset Password</title>
    <!-- 引入jquery webjars -->
    <script type="text/javascript" src="<c:url value='/webjars/jquery/3.6.0/jquery.js' />">></script>
    <!-- 引入bootstrap webjars -->
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/4.3.1/css/bootstrap.min.css' />"/>
    <script src="<c:url value='/webjars/bootstrap/4.3.1/js/bootstrap.min.js' />"></script>
    <script src="<c:url value='/webjars/popper.js/1.14.3/umd/popper.min.js' />"></script>
</head>
<body>
<div class="text-center" style="margin: 30px auto">
    <h2>Reset Your Password</h2>
</div>
<form action="<c:url value="/reset_password"/>" method="post" style="max-width: 350px ; margin: 0 auto;">
    <input type="hidden" name="token" value="${token}"/>
    <div>
        <p>
            <input type="password" name="memberPwd" id="password"
                   class="form-control" placeholder="Enter your new password" required autofocus>
        </p>
        <p>
            <input type="password" class="form-control" placeholder="Confirm your new password"
                   required oninput="checkPasswordMath(this);"/>
            <script>
                function checkPasswordMath(fieldConfirmPassword){
                    if(fieldConfirmPassword.value !== $("#password").val()){
                        fieldConfirmPassword.setCustomValidity("Passwords do not match")
                    }else {
                        fieldConfirmPassword.setCustomValidity("");
                    }
                }
            </script>
        </p>
        <p class="text-center">
            <input type="submit" value="Change Password" class="btn btn-primary"/>
        </p>
    </div>
</form>
</body>
</html>
