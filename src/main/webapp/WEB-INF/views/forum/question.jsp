<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

<!--問題的詳情和回覆介面-->
<div class="container-fluid main">
    <div class="row">
        <div class="col-lg-9 col-md-12 col-sm-12 col-ss-12">
            <div class="col-lg-12 col-md-12 col-sm-12 col-ss-12">
                <h2><span>${question.title}</span></h2>
                <!--正文-->
                <span class="common-list">
                	<!-- 用這樣的方式抓到外鍵擁有的屬性 -->
                    作者： <span>${question.member.memberName}</span> |
                    發布時間： <span><fmt:formatDate value="${question.createtime}" type="both"/></span> |
                    閱讀數： <span>${question.view_count}</span>
            </span>
                <hr>
                <!--内容-->
                <div class="col-lg-12 col-md-12 col-sm-12 col-ss-12" id="question-view">
                    <textarea readonly="readonly">${question.description}</textarea>
                </div>
<!--                 <script type="text/javascript"> -->
<!--                      $(function() { -->
<!--                          editormd.markdownToHTML("question-view", { -->
<!--                          }); -->
<!--                      }); -->
<!--                 </script> -->

                <hr class="col-lg-12 col-md-12 col-sm-12 col-ss-12">
                <!--標籤-->
                <div class="col-lg-12 col-md-12 col-sm-12 col-ss-12">
                <c:forEach var="tag" items="${fn:split(question.tag, ',')}">
                    <span class="label label-info" style="margin-right: 10px;">
                        <span class="label label-info">${tag}</span>
                    </span>
                </c:forEach>

                </div>
                <hr class="col-lg-12 col-md-12 col-sm-12 col-ss-12">
                <!--編輯-->
                <!-- 比對登錄中的user id(透過session抓的，等於發問題的user id，就顯示編輯按鈕)，等書偉session，先暫時用下面代替 -->
<%--                 <c:if test="${user!=null && user.memberPkId==question.member.memberPkId}"> --%>
				<c:if test="${user!=null}">
                <a href="<c:url value='/publish/${question.questionPkId}' />">
                <span class="glyphicon glyphicon-pencil question-menu" aria-hidden="true">
                    編輯
                </span>
                </a>
                </c:if>
            </div>
            <!--回覆內容-->
<!--             <hr class="col-lg-12 col-md-12 col-sm-12 col-ss-12"> -->
<!--             <h3> -->
<%--                 <span th:text="${questionDto.comment_count}"></span>个回复 --%>
<!--             </h3> -->
<!--             <hr class="col-lg-12 col-md-12 col-sm-12 col-ss-12" style="margin-top: 0;"> -->
            <!--一級評論-->
<%--             <div class="col-lg-12 col-md-12 col-sm-12 col-ss-12" th:each="comment:${comments}" id="comment_content"> --%>
<!--                 <div class="media"> -->
<!--                     <div class="media-left"> -->
<!--                         <img class="media-object img-rounded picset" -->
<%--                              th:src="${comment.user.headpic}"> --%>
<!--                     </div> -->
<!--                     <div class="media-body"> -->
<!--                         <h4 class="media-heading"> -->
<%--                             <span th:text="${comment.user.name}"/> --%>
<%--                             <div style="font-size: 15px; margin-top:5px;" th:text="${comment.content}"> --%>
<!--                             </div> -->
<!--                             点赞评论时间 -->
<!--                             <div class="question-menu"> -->
<!--                                 <span class="glyphicon glyphicon-thumbs-up icon" aria-hidden="true"></span> -->
<!--                                 回复按钮 -->
<!--                                 <span class="glyphicon glyphicon-comment icon" aria-hidden="true" -->
<%--                                       th:data-id="${comment.id}" th:data-check="1" onclick="secondcomment(this)" th:text="${comment.commentcount}"></span> --%>
<%--                                 <span th:text="${#dates.format(comment.createtime,'yyyy-MM-dd')}"></span> --%>
<!--                             </div> -->
<!--                             <div class="col-lg-12 col-md-12 col-sm-12 col-ss-12 collapse sub-comment" -->
<%--                                  th:id="${'comment-'+comment.id}"> --%>
<!--                                 二級評論插入到這裡 -->
<!--                                 二級評論輸入框 -->
<!--                                 <div class="col-lg-12 col-md-12 col-sm-12 col-ss-12" style="margin-top: 10px;"> -->
<%--                                     <input type="text" class="form-control" placeholder="評論一下....." th:id="${'input-'+comment.id}"> --%>
<!--                                     <button type="button" class="btn btn-success" style="float: right;margin: 10px;" -->
<%--                                             onclick="replypost(this)" th:data-id="${comment.id}"> --%>
<!--                                         提交 -->
<!--                                     </button> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </h4> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->

            <!--回复框-->
<!--             <div class="col-lg-12 col-md-12 col-sm-12 col-ss-12" id="comment_section"> -->
<!--                 <div class="media" style="margin-bottom: 20px"> -->
<!--                     <div class="media-left"> -->
<!--                         <img class="media-object img-rounded picset" -->
<%--                              th:src="${session.user.headpic}"> --%>
<!--                     </div> -->
<!--                     <div class="media-body" style="padding-top:10px;"> -->
<!--                         <h4 class="media-heading"> -->
<%--                             <span th:text="${questionDto.user.name}"/> --%>
<!--                         </h4> -->
<!--                     </div> -->
<!--                 </div> -->
<%--                 <input type="hidden" id="question_id" th:value="${questionDto.id}"> --%>
<!--                 <textarea class="form-control" rows="6" style="margin-top:10px; margin-bottom: 10px;" -->
<!--                           id="content"></textarea> -->
<!--                 <button type="button" class="btn btn-success" style="float: right;margin: 10px;" -->
<!--                         onclick="post()">提交 -->
<!--                 </button> -->
<!--             </div> -->
        </div>
        <!--右側信息框-->
        <div class="col-lg-3 col-md-12 col-sm-12 col-ss-12">
            <div class="col-lg-12 col-md-12 col-sm-12 col-ss-12">
                <h4>問題發起人</h4>
                <div class="media">
                    <div class="media-left">
                        <img class="media-object img-circle picset"
                         src="<c:url value='/images/testimg.jpg' />"><!-- 暫時放測試圖片，之後要改成讓使用者上傳 -->
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">
                            <span />${question.member.memberName}
                        </h4>
                    </div>
                </div>
            </div>
            <hr class="col-lg-12 col-md-12 col-sm-12 col-ss-12">
            <!--相关问题-->
<!--             <div class="col-lg-12 col-md-12 col-sm-12 col-ss-12"> -->
<!--                 <h4>相关问题</h4> -->
<!--                 <ul class="list-group"> -->
<%--                     <li class="list-group-item"  th:each="relative:${relativequestion}"> --%>
<%--                         <a th:href="@{'/question/'+${relative.id}}" th:text="${relative.title}"></a> --%>
<!--                     </li> -->
<!--                 </ul> -->
<!--             </div> -->
        </div>
    </div>
</div>




<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script> 
<script type="text/javascript" src="<c:url value='/js/community.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/moment.js.js' />"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
</body>
</html>