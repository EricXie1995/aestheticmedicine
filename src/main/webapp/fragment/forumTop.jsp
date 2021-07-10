<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>論壇共同頁首</title>
</head>
<body>
<!--導航欄-->
<div>
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<c:url value='/forum' />" style="margin-left: 170px;">論壇</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="搜尋內容">
                </div>
                <button type="submit" class="btn btn-default">搜尋</button>
            </form>
            <!--根據session中是否存在user判斷顯示的内容-->
            <ul class="nav navbar-nav navbar-right">
            <!-- 這裡要照書偉那邊設定的登錄controller路徑，這邊先暫設/login -->
            <c:if test="${member==null}"><li><a href="<c:url value="/"></c:url>">登錄</a></li></c:if>
            <c:if test="${member!=null}">
                <li>
                	<!-- 私人訊息還沒做 -->
                    <a href="/personal/information">
                        <span class="glyphicon glyphicon glyphicon-envelope" aria-hidden="true"
                              style="padding-top: 2px;"></span>
                        <span style="padding-top: 2px;"></span>
                    </a>
                </li>
             </c:if>
             <c:if test="${member!=null}"><li><a href="<c:url value='/publish' />">發佈</a></li></c:if>
             <c:if test="${member!=null}">
             	<a class="navbar-brand" href="<c:url value="/personal2"></c:url>"> 
    				<img src="<c:url value="/images/testimg.jpg"></c:url>" alt="Logo" style="width:40px;">
  				</a>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false" style="margin-right: 190px;">
<%--                          這邊等到登錄做好要改成${user.memberAccount} --%>
                        <span>${member.memberName}</span>
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" style="margin-right: 190px;">
                    
                        <li><a href="<c:url value='/personal/questions' />">我的提問</a></li>
                        <li><a href="#">個人資料</a></li>
                        <li><a href="/logout">登出</a></li>
                    </ul>
                </li>
              </c:if>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
</div>
</body>
</html>