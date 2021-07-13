<%--
  Created by IntelliJ IDEA.
  User: student
  Date: 2021/6/25
  Time: 下午 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create New MemberDetails</title>
    <!-- 引入jquery webjars -->
    <script type="text/javascript" src="<c:url value='/webjars/jquery/3.6.0/jquery.js' />"></script>
    <!-- 引入bootstrap webjars -->
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/4.3.1/css/bootstrap.min.css' />" />
    <script src="<c:url value='/webjars/bootstrap/4.3.1/js/bootstrap.min.js' />"></script>
    <script src="<c:url value='/webjars/popper.js/1.14.3/umd/popper.min.js' />"></script>
</head>
<body>
    <div class="container text-center" style="margin-top: 50px">
        <h1>Create New MemberDetails</h1>
        <br/>
        <form action="<c:url value='/memberDetails/save'/>" method="post" enctype="multipart/form-data" >
            <table class="text-center">
                <thead class="thead-dark">
                    <tr>
                        <td> Photos: </td>
                        <td><input type="file" name="image" accept="image/png,image/jpeg"></td>
                    </tr>
                    <tr>
                        <td> EmergencyContact </td>
                        <td><input type="text" name="emergencyContact" required></td>
                    </tr>
                    <tr>
                        <td> EmergencyNumber </td>
                        <td><input type="text" name="emergencyNumber" required></td>
                    </tr>
                    <tr>
                        <td> EmergencyRelationship </td>
                        <td><select class="form-control" name="emergencyRelationship" >
                            <option>${memberDetails.emergencyRelationship}</option>
                            <option>Father</option>
                            <option>Mother</option>
                            <option>Husband</option>
                            <option>Wife</option>
                            <option>Son</option>
                            <option>Daughter</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td> Smoke </td>
                        <td><input type="text" name="smoke" required></td>
                    </tr>
                    <tr>
                        <td> BetelNut </td>
                        <td><input type="text" name="betelNut" required></td>
                    </tr>
                    <tr>
                        <td> Diseases </td>
                        <td><input type="text" name="diseases" required></td>
                    </tr>
                    <tr>
                        <td> Allergy </td>
                        <td><input type="text" name="allergy" required></td>
                    </tr>
                    <tr>
                        <td> Surgery </td>
                        <td><input type="text" name="surgery" required></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="submit" class="btn btn-primary btn-block btn-lg login-btn">Save</button>
                        </td>
                    </tr>
                </thead>
            </table>
        </form>
    </div>
</body>
</html>
