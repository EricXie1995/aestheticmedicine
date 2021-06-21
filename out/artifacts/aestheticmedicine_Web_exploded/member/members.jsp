<%--
  Created by IntelliJ IDEA.
  User: student
  Date: 2021/6/20
  Time: 下午 03:48
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List Members</title>
    <!-- 引入jquery webjars -->
    <script type="text/javascript" src="<c:url value='/webjars/jquery/3.6.0/jquery.js' />">></script>
    <!-- 引入bootstrap webjars -->
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/4.3.1/css/bootstrap.min.css' />" />
    <script src="<c:url value='/webjars/bootstrap/4.3.1/js/bootstrap.min.js' />"></script>
    <script src="<c:url value='/webjars/popper.js/1.14.3/umd/popper.min.js' />"></script>
</head>
<body>
<div class="container text-center" style="margin-top: 50px">
    <div>
        <form action="/logout" method="post">
            <p>
                Welcome <%-- <b>[[${#request.userPrincipal.principal.username}]]</b> --%>
            </p>
            <input type="submit" value="Sign Out"/>
        </form>
    </div>

    <div>
        <h1>List of Users</h1>
    </div>

    <div>
        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
            <tr>
                <th>User ID</th>
                <th>Account</th>
                <th>Name</th>
                <th>Address</th>
                <th>Phone</th>
                <th>LineID</th>
            </tr>
            </thead>
            <tbody>
            <tr th:each="member:${listMembers}">
                <td th:text="${member.memberPkId}">User ID</td>
                <td th:text="${member.memberAccount}">Account</td>
                <td th:text="${member.memberName}">Name</td>
                <td th:text="${member.memberAddress}">Address</td>
                <td th:text="${member.memberPhone}">Phone</td>
                <td th:text="${member.memberLineId}">LineID</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
