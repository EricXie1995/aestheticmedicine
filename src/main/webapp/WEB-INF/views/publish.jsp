<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<!--問題發佈頁面-->
<div class="container-fluid main">
    <div class="row">
        <div class="col-lg-9 col-md-12 col-sm-12 col-ss-12">
            <h2><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 發起問題 </h2>
            <hr>
            <form action="<c:url value='/publish' />" method="post">
                <!--透過隱藏標籤判斷是創建問題還是編輯問題-->
                <input type="hidden" name="id" value="${question.id}">
                <div class="form-group">
                    <label for="title">問題標題</label>
                    <input type="text" class="form-control" value="${questionDto.title}" id="title" name="title" autocomplete="on" >
                    <p class="form-control-static text-danger"><form:errors path="questionDto.title"/></p>
                </div>
                <div class="form-group" id="question-editor">
                    <label for="description">問題內容</label>
                    <textarea class="form-control" name="description" id="description" 
                              cols="20" rows="15">${questionDto.description}</textarea>
                    <p class="form-control-static text-danger"><form:errors path="questionDto.description"/></p>
                </div>
                <!--editor.md相关-->
<!-- <!--                 <script type="text/javascript"> --> 
<!-- //                     $(function() { -->
<!-- //                         var editor = editormd("question-editor", { -->
<!-- //                             width  : "100%", -->
<!-- //                             height : 600, -->
<!-- //                             path   : "/js/lib/", -->
<!-- //                             watch : false -->
<!-- //                         }); -->
<!-- //                     }); -->
<!-- <!--                 </script> --> 

                <div class="form-group" >
                    <label for="tag">添加標籤</label>
                    <input type="text" class="form-control" id="tag" autocomplete="on"
                           value="${questionDto.tag}" name="tag" onclick="showselecttag()">
                     <p class="form-control-static text-danger"><form:errors path="questionDto.tag"/></p>
                </div>
                <!--标签页-->
<!--                 <div id="select-tags" style="display: none"> -->
<!--                     <ul class="nav nav-tabs" role="tablist"> -->

<%--                         <li role="presentation" th:each="category,status:${tags}" th:class="${status.first ? 'active':''}"> --%>
<%--                             <a th:href="@{'#'+${category.categoryname}}" aria-controls="home" --%>
<%--                                role="tab" data-toggle="tab" th:text="${category.categoryname}"> --%>
<!--                             </a> -->
<!--                         </li> -->

<!--                     </ul> -->
<!--                     <div class="tab-content" style="padding-top: 15px;"> -->
<%--                         <div role="tabpanel" th:each="category,status:${tags}" --%>
<%--                              th:class="${status.first ? 'active tab-pane':'tab-pane'}" th:id="${category.categoryname}"> --%>
<!--                             <span class="label label-info" onclick="selectTag(this)" -->
<%--                                   th:each="selecttags:${category.tags}" th:text="${selecttags}" th:data-tag="${selecttags}"></span> --%>
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->

                <button type="submit" class="btn btn-success success" style="float: right">送出</button>
<%--                 <span class="alert alert-danger" role="alert" th:text="${error}" th:if="${error}!= null"></span> --%>
            </form>
        </div>
        <div class="col-lg-3 col-md-12 col-sm-12 col-ss-12">
            <h3>發起問題說明</h3>
            <h4>問題標題：請用簡潔的標題描述發佈問題</h4>
            <h4>問題內容：詳細描述問題的內容</h4>
            <h4>選擇標籤：選擇一個或多個合適的標籤</h4>
        </div>
    </div>
</div>	
	
</body>
</html>