<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>論壇首頁</title>
<link rel="stylesheet"
          href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
</head>
<body>
<!-- 引入共同的頁首 -->  
<jsp:include page="/fragment/forumTop.jsp" /> 
<!--首頁展示的發現部分-->
<div class="container-fluid main">
    <div class="row">
        <div class="col-lg-9 col-md-12 col-sm-12 col-ss-12">
            <h2><span class="glyphicon glyphicon-list" aria-hidden="true"></span> 問答區 </h2>
            <a href="<c:url value='/forum/-1' />">全部</a>
            <c:forEach var="type" items="${types}">
            <a href="<c:url value='/forum/${type.typePkId}' />">${type.typeName}</a>
            </c:forEach>
            
            <span>文章排序依</span>
            <select onchange="self.location.href=options[selectedIndex].value">
            <c:if test="${sort=='createtime'}">
            <option selected value="<c:url value='/forum/${typId}?sort=createtime' />">最新</option>
            </c:if>
            <c:if test="${sort!='createtime'}">
            <option value="<c:url value='/forum/${typId}?sort=createtime' />">最新</option>
            </c:if>
            <c:if test="${sort=='viewcount'}">
            <option selected value=<c:url value='/forum/${typId}?sort=viewcount' />>熱門</option>
            </c:if>
            <c:if test="${sort!='viewcount'}">
            <option value=<c:url value='/forum/${typId}?sort=viewcount' />>熱門</option>
            </c:if>
            <c:if test="${sort=='qcommentcount'}">
            <option selected value=<c:url value='/forum/${typId}?sort=qcommentcount' />>評論數</option>
            </c:if>
            <c:if test="${sort!='qcommentcount'}">
            <option value=<c:url value='/forum/${typId}?sort=qcommentcount' />>評論數</option>
            </c:if>
            <c:if test="${sort=='favoritecount'}">
            <option selected value=<c:url value='/forum/${typId}?sort=favoritecount' />>收藏數</option>
            </c:if>
            <c:if test="${sort!='favoritecount'}">
            <option value=<c:url value='/forum/${typId}?sort=favoritecount' />>收藏數</option>
            </c:if>					    
			</select>
			
            <hr>
            <!--分頁展示內容-->
            <c:forEach var="question" items="${page.content}">
            <div class="media" style="margin-top: 22px">
                <div class="media-left">
<!--                 controller還沒寫 -->
                    <a href="<c:url value='/question/${question.questionPkId}' />">
                   <!-- 暫時放測試圖片，之後要改成讓使用者上傳 -->
                        <img class="media-object img-circle picset"                         
                             src="<c:url value='/images/testimg.jpg' />">
                    </a>
                </div>
                <div class="media-body">
                    <span style="margin-top: 10px;">
                    	<h5>${question.type.typeName}</h5>
                        <h4 class="media-heading" style="font-size: 17px;">
                        <!--                 controller還沒寫 -->
                        <a href="<c:url value='/question/${question.questionPkId}' />">${question.title}</a>
                        </h4>
                    </span>
                    <span class="common-list">
                    <span>${question.qcommentcount} <c:if test="${question.qcommentcount==null}">0</c:if>個評論 •<span/> 
                    <span>${question.viewcount} 次瀏覽 •<span/> 
                    <span>${question.like_count} 個點讚<span />
<%--                     ${#dates.format(question.createtime,'yyyy-MM-dd')} --%>
<%--                     <span style="float: right;">${question.createtime}</span> --%>
					<span>作者:${question.member.memberName}<span />
					<span><img src="<c:url value='/images/forum/love.jpg' />"></span>
					<c:if test="${question.favoritecount==null}">0</c:if>
                    <c:if test="${question.favoritecount!=null}"><span>${question.favoritecount}</span></c:if>
                    <span style="float: right;"><fmt:formatDate value="${question.createtime}" type="both"/></span>
                    
                    </span>
                </div>
            </div>
            </c:forEach>
            <!--顯示底部的頁碼-->
            <nav aria-label="Page navigation">
                <ul class="pagination">
<%--                 <c:if test="${!page.first}"> --%>
                    <li>
                        <a href="<c:url value='/forum/${typId}?page=0&sort=${sort}' />" aria-label="Previous">
                            <span aria-hidden="true">&lt;&lt;</span>
                        </a>
                    </li>
<%--                  </c:if> --%>
                 <c:if test="${!page.first}">
                    <li class="disable">
                        <a href="<c:url value='/forum/${typId}?page=${page.number-1}&sort=${sort}' />" aria-label="Previous">
                            <span aria-hidden="true">&lt;</span>
                        </a>
                    </li>
                    </c:if>
                    
                    <c:forEach begin="0" end="${page.totalPages-1}" var="i" step="1">
                    <c:if test="${i==page.number}">
                    	<li class="active">
                        <a href="<c:url value='/forum/${typId}?page=${i}&sort=${sort}' />">${i+1}</a>
                    </li>
                    </c:if>
                    <c:if test="${i!=page.number}">
                    	<li>
                        <a href="<c:url value='/forum/${typId}?page=${i}&sort=${sort}' />">${i+1}</a>
                        </li>
                    </c:if>
                    </c:forEach>
                    
                    <c:if test="${!page.last}">
                    <li>
                        <a href="<c:url value='/forum/${typId}?page=${page.number+1}&sort=${sort}' />" aria-label="Next">
                            <span aria-hidden="true">&gt;</span>
                        </a>
                    </li>
                    </c:if>
<%--                     <c:if test="${!page.last}"> --%>
                    <li>
                        <a href="<c:url value='/forum/${typId}?page=${page.totalPages-1}&sort=${sort}' />" aria-label="Next">
                            <span aria-hidden="true">&gt;&gt;</span>
                        </a>
                    </li>
<%--                     </c:if> --%>
                </ul>
            </nav>
        </div>
        <p>${page.number}</p>
        <!--热门话题部分-->
<!--         <div class="col-lg-3 col-md-12 col-sm-12 col-ss-12"> -->
<!--             <h3>站长</h3> -->
<!--             <a href="https://github.com/OliverLiy"> -->
<!--                 <img class="adminicon" src="../img/GitHub.png"> -->
<!--             </a> -->
<!--             <a href="https://im.qq.com/"> -->
<!--                 <img class="adminicon" src="../img/qq.jpg"/> -->
<!--             </a> -->
<!--             <a href="https://blog.csdn.net/qq_41973594"> -->
<!--                 <img class="adminicon" src="../img/csdn.jpg"/> -->
<!--             </a> -->
<!--             <hr> -->
<!--             <h3>热门话题</h3> -->
<!--             <ul class="list-group"> -->
<%--                 <li class="list-group-item"  th:each="question:${topquestion}"> --%>
<%--                     <a th:href="@{'/question/'+${question.id}}" th:text="${question.title}"></a> --%>
<!--                 </li> -->
<!--             </ul> -->

<!--         </div> -->
    </div>
</div>


<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script> 
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
</body>
</html>