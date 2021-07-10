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
    <title>MemberDetails</title>
    <!-- 引入jquery webjars -->
    <script type="text/javascript" src="<c:url value='/webjars/jquery/3.6.0/jquery.js' />"></script>
    <!-- 引入bootstrap webjars -->
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/4.3.1/css/bootstrap.min.css' />" />
    <script src="<c:url value='/webjars/bootstrap/4.3.1/js/bootstrap.min.js' />"></script>
    <script src="<c:url value='/webjars/popper.js/1.14.3/umd/popper.min.js' />"></script>
</head>
<body>
    <div class="container text-center" style="margin-top: 50px">
        <h1>Member Details</h1>

        <a href="<c:url value='/memberDetails/new'/>">Create New MemberDetails</a>
        <br/><br/>
        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th> MemberDetailsPkId </th>
                    <th> Photos </th>
                    <th> EmergencyContact </th>
                    <th> EmergencyNumber </th>
                    <th> EmergencyRelationship </th>
                    <th> Smoke </th>
                    <th> BetelNut </th>
                    <th> Diseases </th>
                    <th> Allergy </th>
                    <th> Surgery </th>
                    <th> Actions </th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="memberDetails" items="${listMemberDetails}">
                    <tr>
                        <td>${memberDetails.memberDetailsPkId}</td>
                        <td><img src="<c:url value='${memberDetails.photosImagePath}' /> "></td>
                        <td>${memberDetails.emergencyContact}</td>
                        <td>${memberDetails.emergencyNumber}</td>
                        <td>${memberDetails.emergencyRelationship}</td>
                        <td>${memberDetails.smoke}</td>
                        <td>${memberDetails.betelNut}</td>
                        <td>${memberDetails.diseases}</td>
                        <td>${memberDetails.allergy}</td>
                        <td>${memberDetails.surgery}</td>
                        <td>
                            <a href ="<c:url value='/memberDetails/edit/${memberDetails.memberDetailsPkId}'/>">Edit</a>
                            &nbsp;&nbsp;&nbsp;
                            <a href ="<c:url value='/memberDetails/delete/${memberDetails.memberDetailsPkId}'/>">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
