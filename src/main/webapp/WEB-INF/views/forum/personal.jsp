<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
          href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
</head>
<body>
<!-- 引入共同的頁首 -->  
<jsp:include page="/fragment/forumTop.jsp" />

<!--個人中心的頁面布局-->
<div class="container-fluid main">
    <div class="row">
        <div class="col-lg-9 col-md-12 col-sm-12 col-ss-12">
            <h2><span >${sectionname}</span></h2>
            <hr>
            <!--我的問題-->
            <c:if test="${section == 'questions'}">
            <div class="col-lg-12 col-md-12 col-sm-12 col-ss-12">
            <c:forEach var="question" items="${page.content}">
                <div class="media">
                    <div class="media-left">
                        <a href="#">
                            <img class="media-object img-circle picset"
                                 src="<c:url value='/images/testimg.jpg' />">
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">
                        
                            <a href="<c:url value='/question/${question.questionPkId}' />">${question.title}</a>
                        </h4>
                        <span>
                        <a href="<c:url value='/question/${question.questionPkId}' />">${question.description}</a>
                    </span>
                        <br>
                        <span class="common-list">
                        <span />${question.comment_count} 個評論 • 
                        <span />${question.view_count} 次瀏覽 • 
                        <span />${question.like_count} 個點讚 
                        <span><fmt:formatDate value="${question.createtime}" type="both"/></span>
                        </span>
                    </div>
                </div>
                </c:forEach>
                <!-- 頁碼區塊 -->
                <nav aria-label="Page navigation">
                <ul class="pagination">
<%--                 <c:if test="${!page.first}"> --%>
                    <li>
                        <a href="<c:url value='/personal/${section}?page=0' />" aria-label="Previous">
                            <span aria-hidden="true">&lt;&lt;</span>
                        </a>
                    </li>
<%--                  </c:if> --%>
                 <c:if test="${!page.first}">
                    <li class="disable">
                        <a href="<c:url value='/personal/${section}?page=${page.number-1}' />" aria-label="Previous">
                            <span aria-hidden="true">&lt;</span>
                        </a>
                    </li>
                    </c:if>
                    
                    <c:forEach begin="0" end="${page.totalPages-1}" var="i" step="1">
                    <c:if test="${i==page.number}">
                    	<li class="active">
                        <a href="<c:url value='/personal/${section}?page=${i}' />">${i+1}</a>
                    </li>
                    </c:if>
                    <c:if test="${i!=page.number}">
                    	<li>
                        <a href="<c:url value='/personal/${section}?page=${i}' />">${i+1}</a>
                        </li>
                    </c:if>
                    </c:forEach>
                    
                    <c:if test="${!page.last}">
                    <li>
                        <a href="<c:url value='/personal/${section}?page=${page.number+1}' />" aria-label="Next">
                            <span aria-hidden="true">&gt;</span>
                        </a>
                    </li>
                    </c:if>
<%--                     <c:if test="${!page.last}"> --%>
                    <li>
                        <a href="<c:url value='/personal/${section}?page=${page.totalPages-1}' />" aria-label="Next">
                            <span aria-hidden="true">&gt;&gt;</span>
                        </a>
                    </li>
<%--                     </c:if> --%>
                </ul>
            </nav>
            </div>
            </c:if>
            <!--我的消息-->
<%--             <div class="col-lg-12 col-md-12 col-sm-12 col-ss-12" th:if="${section}=='information'"> --%>
<%--                 <div class="media" th:each="notification:${notifications.data}"> --%>
<%--                     <span th:text="${notification.notifier.name}"></span> --%>
<%--                     <span th:if="${notification.type==1}">回复了你的评论</span> --%>
<%--                     <span th:if="${notification.type==2}">回复了你的问题</span> --%>
<%--                     <a th:href="@{'/notification/'+${notification.id}}"> --%>
<%--                         <span th:text="${notification.outercontent}"></span> --%>
<!--                     </a> -->
<%--                     <span class="label label-danger" th:if="${notification.status==0}">未读</span> --%>
<!--                     <br> -->
<%--                     <span th:text="${#dates.format(notification.createtime,'yyyy-MM-dd')}"></span> --%>
<!--                     <hr> -->
<!--                 </div> -->
<!--                 页码 -->
<!--                 <nav aria-label="Page navigation"> -->
<!--                     <ul class="pagination"> -->
<%--                         <li th:if="${notifications.showfirst}"> --%>
<%--                             <a th:href="@{'/personal/'+${section}(page=${1})}" aria-label="Previous"> --%>
<!--                                 <span aria-hidden="true">&lt;&lt;</span> -->
<!--                             </a> -->
<!--                         </li> -->
<%--                         <li th:if="${notifications.showPre}"> --%>
<%--                             <a th:href="@{'/personal/'+${section}(page=${notifications.page - 1})}" aria-label="Previous"> --%>
<!--                                 <span aria-hidden="true">&lt;</span> -->
<!--                             </a> -->
<!--                         </li> -->
<%--                         <li th:each="page:${notifications.pages}" th:class="${notifications.page==page}? 'active' : ''"> --%>
<%--                             <a th:href="@{'/personal/'+${section}(page=${page})}" th:text="${page}"></a> --%>
<!--                         </li> -->
<%--                         <li th:if="${notifications.shownext}"> --%>
<%--                             <a th:href="@{'/personal/'+${section}(page=${notifications.page + 1})}" aria-label="Next"> --%>
<!--                                 <span aria-hidden="true">&gt;</span> -->
<!--                             </a> -->
<!--                         </li> -->
<%--                         <li th:if="${notifications.showlast}"> --%>
<%--                             <a th:href="@{'/personal/'+${section}(page=${notifications.totalpage})}" aria-label="Next"> --%>
<!--                                 <span aria-hidden="true">&gt;&gt;</span> -->
<!--                             </a> -->
<!--                         </li> -->
<!--                     </ul> -->
<!--                 </nav> -->
<!--             </div> -->

        </div>
        <!--右側的導航欄-->
        <div class="col-lg-3 col-md-12 col-sm-12 col-ss-12">
            <div class="list-group personal">
            <c:if test="${section=='questions'}">
                <a href="<c:url value="/personal/questions" />" class="list-group-item active">
                    我的問題
                </a>
            </c:if>
            <c:if test="${section!='questions'}">
                <a href="<c:url value="/personal/questions" />" class="list-group-item">
                    我的問題
                </a>
            </c:if>
            <c:if test="${section=='information'}">
            
                <a href="<c:url value="/personal/information" />" class="list-group-item active">
                    我的消息
                    <span class="badge">${session.unreadnum}</span>
                </a>
            </c:if>
            <c:if test="${section!='information'}">
                <a href="<c:url value="/personal/information" />" class="list-group-item">
                    我的消息
                    <span class="badge">${session.unreadnum}</span>
                </a>
            </c:if>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script> 
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
</body>
</html>