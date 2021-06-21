<%--
  Created by IntelliJ IDEA.
  User: student
  Date: 2021/6/19
  Time: 下午 08:05
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Verify Fail</title>
    <!-- 引入jquery webjars -->
    <script type="text/javascript" src="<c:url value='/webjars/jquery/3.6.0/jquery.js' />">></script>
    <!-- 引入bootstrap webjars -->
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/4.3.1/css/bootstrap.min.css' />" />
    <script src="<c:url value='/webjars/bootstrap/4.3.1/js/bootstrap.min.js' />"></script>
    <script src="<c:url value='/webjars/popper.js/1.14.3/umd/popper.min.js' />"></script>
</head>
<body>
<div class="container text-center" style="margin-top: 50px">
    <h3>Sorry, we could not verify account. It maybe already verified,
        or verification code is incorrect.</h3>
</div>
</body>
</html>
