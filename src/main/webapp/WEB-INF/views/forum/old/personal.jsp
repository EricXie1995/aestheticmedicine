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
                        <span />${question.qcommentcount} 個評論 • 
                        <span />${question.viewcount} 次瀏覽 • 
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
            
            <c:if test="${section == 'information'}">
            <button onclick="clearAllStatus()">清除所有未讀</button><button onclick="DelAllNot()">刪除所有通知</button>
<%--            <c:if test="${page != null}"> --%>
				<div class="col-lg-12 col-md-12 col-sm-12 col-ss-12">
            	<c:forEach var="notification" items="${page.content}">
                <div class="media">
					<!-- 回覆的人 -->
					<p>${notification.notificationPkId}</p>
                    <span>${notification.reply.member.memberName}</span>
                    <c:if test="${notification.reply.type==1}">
                    <span>回覆了你的問題:${notification.question.title}</span>
                    </c:if>
                    <c:if test="${notification.reply.type==2}">
                    <span>回覆了你對問題${notification.question.title}的評論${notification.selfReplyContent}</span>
                    </c:if>
                    <br>
                    <a href="<c:url value="/notification/${notification.notificationPkId}" />">
                        <span>回覆內容:${notification.reply.content}</span>
                    </a>
                    <c:if test="${notification.status==0}"><span class="label label-danger">未讀</span></c:if>
                    <br>
                    <span><fmt:formatDate value="${notification.createtime}" type="both"/></span>
                    <c:if test="${notification.status==0}">
                    <button type="button" onclick="clearNotIdStatus(this)" data-id="${notification.notificationPkId}">標示為已讀</button>
                    </c:if>
                    <button type="button" onclick="delNotByNotid(this)" data-id="${notification.notificationPkId}">刪除</button>
                    <hr>
                </div>
                </c:forEach>
            
<!--                 頁碼區塊 -->
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
<%--         </c:if> --%>
        </c:if>
        
        <!--我的收藏-->
            <c:if test="${section == 'favorites'}">
            <div class="col-lg-12 col-md-12 col-sm-12 col-ss-12">
            <c:forEach var="favorites" items="${page.content}">
                <div class="media">
                    <div class="media-left">
                        <a href="#">
                            <img class="media-object img-circle picset"
                                 src="<c:url value='/images/testimg.jpg' />">
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">
                        
                            <a href="<c:url value='/question/${favorites.question.questionPkId}' />">${favorites.question.title}</a>
                        </h4>
                        <span>
                        <a href="<c:url value='/question/${favorites.question.questionPkId}' />">${favorites.question.description}</a>
                    </span>
                        <br>
                        <span class="common-list">
                        <span />${favorites.question.qcommentcount} 個評論 • 
                        <span />${favorites.question.viewcount} 次瀏覽 • 
                        <span />${favorites.question.like_count} 個點讚 
                        <span><fmt:formatDate value="${favorites.question.createtime}" type="both"/></span>
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
                    <span class="badge">${unreadnum}</span>
                </a>
            </c:if>
            <c:if test="${section!='information'}">
                <a href="<c:url value="/personal/information" />" class="list-group-item">
                    我的消息
                    <span class="badge">${unreadnum}</span>
                </a>
            </c:if>
            <c:if test="${section=='favorites'}">
            
                <a href="<c:url value="/personal/favorites" />" class="list-group-item active">
                    我的收藏
                </a>
            </c:if>
            <c:if test="${section!='favorites'}">
                <a href="<c:url value="/personal/favorites" />" class="list-group-item">
                    我的收藏
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
<script type="text/javascript">
function clearAllStatus() {
        $.ajax({
            type: "POST",
            url: "/beauty/notification/clearunread",
            contentType: 'application/json',
            success: function (data) {
                if (data.code == 200) {
                    window.location.reload();
                } else {
                    alert("出現了錯誤");
                }
            },
            dataType: "json"
        });
}

function clearNotIdStatus(e) {
	var notificationid = e.getAttribute("data-id");
    $.ajax({
        type: "POST",
        url: "/beauty/notification/clearunread",
        contentType: 'application/json',
        data: JSON.stringify({
            "notificationPkId": notificationid,
        }),
        success: function (data) {
            if (data.code == 200) {
                window.location.reload();
            } else {
                alert("出現了錯誤");
            }
        },
        dataType: "json"
    });
}

function delNotByNotid(e) {
	var notificationid = e.getAttribute("data-id");
    $.ajax({
        type: "POST",
        url: "/beauty/notification/delete",
        contentType: 'application/json',
        data: JSON.stringify({
            "notificationPkId": notificationid,
        }),
        success: function (data) {
            if (data.code == 200) {
                window.location.reload();
            } else {
                alert("出現了錯誤");
            }
        },
        dataType: "json"
    });
}

function DelAllNot() {
    $.ajax({
        type: "POST",
        url: "/beauty/notification/delete",
        contentType: 'application/json',
        success: function (data) {
            if (data.code == 200) {
                window.location.reload();
            } else {
                alert("出現了錯誤");
            }
        },
        dataType: "json"
    });
}
</script>
</body>
</html>