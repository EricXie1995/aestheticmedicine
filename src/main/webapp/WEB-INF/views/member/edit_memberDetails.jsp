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
        <h1>Edit MemberDetails</h1>
        <br/>

        <form action="<c:url value='/memberDetails/save'/>" method="post" enctype="multipart/form-data"/>
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <td> memberDetailsPkId </td>
                        <td><input type="text" name="memberDetailsPkId" value="${memberDetails.memberDetailsPkId}" readonly="readonly"></td>
                    </tr>
                    <tr>
                        <td> Photos </td>
                        <td><input type="file" name="image" value="" accept="image/png,image/jpeg"><img src="<c:url value='${memberDetails.photosImagePath}' /> "></td>
                    </tr>
                    <tr>
                        <td> EmergencyContact </td>
                        <td><input type="text" name="emergencyContact" value="${memberDetails.emergencyContact}" required></td>
                    </tr>
                    <tr>
                        <td> EmergencyNumber </td>
                        <td><input type="text" name="emergencyNumber" value="${memberDetails.emergencyNumber}" required></td>
                    </tr>
                    <tr>
                        <td> EmergencyRelationship </td>
                        <td><input type="text" name="emergencyRelationship" value="${memberDetails.emergencyRelationship}" required></td>
                    </tr>
                    <tr>
                        <td> Smoke </td>
                        <td><input type="text" name="smoke" value="${memberDetails.smoke}" required></td>
                    </tr>
                    <tr>
                        <td> BetelNut </td>
                        <td><input type="text" name="betelNut" value="${memberDetails.betelNut}" required></td>
                    </tr>
                    <tr>
                        <td> Diseases </td>
                        <td><input type="text" name="diseases" value="${memberDetails.diseases}" required></td>
                    </tr>
                    <tr>
                        <td> Allergy </td>
                        <td><input type="text" name="allergy" value="${memberDetails.allergy}" required></td>
                    </tr>
                    <tr>
                        <td> Surgery </td>
                        <td><input type="text" name="surgery" value="${memberDetails.surgery}" required></td>
                    </tr>
                    <tr>
                        <td style="collapse: 2">
                            <button type="submit" class="btn btn-primary btn-block btn-lg login-btn">Save</button>
                        </td>
                    </tr>
                </thead>
            </table>
        </form>
    </div>
</body>
</html>
