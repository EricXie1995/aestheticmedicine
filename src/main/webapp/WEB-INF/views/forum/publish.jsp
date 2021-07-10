<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>問題發佈</title>
<link rel="stylesheet"
          href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
</head>
<body>
	<!-- 引入共同的頁首 -->  
<jsp:include page="/fragment/forumTop.jsp" /> 	
<p>${user}</p>
<!--問題發佈頁面-->
<div class="container-fluid main">
    <div class="row">
        <div class="col-lg-9 col-md-12 col-sm-12 col-ss-12">
            <h2><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 發起問題 </h2>
            <hr>
			<form action="<c:url value='/publish?quId=${question.questionPkId}' />" method="post">
<%--             <form action="<c:url value='/publish/${question.questionPkId}' />" method="post"> --%>
                <!--透過隱藏標籤判斷是創建問題還是編輯問題，因為傳回的值若有主鍵就是修改，沒有是新增(對JPA來說)-->
                <input type="hidden" name="questionPkId" value="${question.questionPkId}">
                
          <!-- 分類選擇 -->
                <div class="form-group">
                	<select name="type">
						<!-- 判斷第一次點進來沒有經過驗證 -->
                		<c:if test="${questionDto.type == null}">
                		<!-- 新增的情況所以type沒值，要顯示請選擇分類 -->
                		<c:if test="${question.type==null}">
                			<option value="" selected>請選擇分類</option>
                		</c:if>
                		<!-- 秀出所有分類，判斷若是更新已經有選過的值給selected屬性 -->
                		<c:forEach var="type" items="${types}">
	                		<c:if test="${question.type.typePkId==type.typePkId}">
	                			<option value="${question.type.typePkId}" selected>${question.type.typeName}</option>
	                		</c:if>
					    	<c:if test="${question.type.typePkId!=type.typePkId}">
					    		<option value="${type.typePkId}">${type.typeName}</option>
					    	</c:if>
					    </c:forEach>
					    </c:if>
					    <!-- 若是送出後驗證有問題則在返回頁面，此時questionDto.type有值，繼續顯示選過的選項 -->
					    <c:if test="${questionDto.type != null}">
						    <c:forEach var="type" items="${types}">
						    	<c:if test="${type.typePkId==questionDto.type.typePkId}">
						    	<option value="${questionDto.type.typePkId}" selected>${questionDto.type.typeName}</option>
						    	</c:if>
						    	<c:if test="${type.typePkId!=questionDto.type.typePkId}">
						    	<option value="${type.typePkId}">${type.typeName}</option>
						    	</c:if>
						    </c:forEach>
					    </c:if>
					</select>
					<p class="form-control-static text-danger"><form:errors path="questionDto.type"/></p>
                </div>
          <!-- 分類選擇 -->
                
                <div class="form-group">
                    <label for="title">問題標題</label>
                    <c:if test="${questionDto.title==null}">
                    <input type="text" class="form-control" value="${question.title}" id="title" name="title" autocomplete="on" >
                    </c:if>
                    <c:if test="${questionDto.title!=null}">
                    <input type="text" class="form-control" value="${questionDto.title}" id="title" name="title" autocomplete="on" >
                    </c:if>
                    <p class="form-control-static text-danger"><form:errors path="questionDto.title"/></p>
                </div>
                
                <div class="form-group" id="question-editor">
                    <label for="description">問題內容</label>
                    <c:if test="${questionDto.description==null}">
                    <textarea class="form-control" name="description" id="description" 
                              cols="20" rows="15">${question.description}</textarea>
                    </c:if>
                    <c:if test="${questionDto.description!=null}">
                    <textarea class="form-control" name="description" id="description" 
                              cols="20" rows="15">${questionDto.description}</textarea>
                    </c:if>
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
<%--                     <c:if test="${questionDto.description==null}"> --%>
<!--                     <input type="text" class="form-control" id="tag" autocomplete="on" -->
<%--                            value="${question.tag}" name="tag" onclick="showselecttag()"> --%>
<%--                     </c:if> --%>
<%--                     <c:if test="${questionDto.description!=null}"> --%>
                    <input type="text" class="form-control" id="tag" autocomplete="on"
                           value="${questionDto.tag}" name="tag" onclick="showselecttag()">
<%--                     </c:if> --%>
<%--                      <p class="form-control-static text-danger"><form:errors path="questionDto.tag"/></p> --%>
                </div>
                <!--標籤頁-->
<%--                 <a th:href="@{'#'+${category.categoryname}}" aria-controls="home" --%>
                        
                <div id="select-tags" style="display: none">
                    <ul class="nav nav-tabs" role="tablist">
                    
						<c:forEach var='category' items='${tags}' varStatus="status">
						<c:if test="${status.first}">
                        <li role="presentation" class="active">
                            <a href="<c:url value='/"#"${category.categoryname}' />" aria-controls="home"
                               role="tab" data-toggle="tab">${category.categoryname}
                            </a>
                        </li>
                        </c:if>
                        <c:if test="${!status.first}">
                        <li role="presentation">
                            <a href="<c:url value='/"#"${category.categoryname}' />" aria-controls="home"
                               role="tab" data-toggle="tab">${category.categoryname}
                            </a>
                        </li>
                        </c:if>
						</c:forEach>
						
                    </ul>
                    <div class="tab-content" style="padding-top: 15px;">

                    	<c:forEach var='category' items='${tags}' varStatus="status">
                    	
                    	<c:if test="${status.first}">
                        <div role="tabpanel" 
                             class="active tab-pane" id="${category.categoryname}">
                             <c:forEach var='selecttags' items='${category.tags}'>
                            <span class="label label-info" onclick="selectTag(this)" data-tag="${selecttags}">${selecttags}</span>
                            </c:forEach>
                        </div>
                        </c:if>
                        
                        <c:if test="${!status.first}">
                        	<div role="tab-pane" 
                             class="tab-pane" id="${category.categoryname}">
                             <c:forEach var='selecttags' items='${category.tags}'>
                            <span class="label label-info" onclick="selectTag(this)" data-tag="${selecttags}">${selecttags}</span>
                            </c:forEach>
                        </div>
                        </c:if>
                        
                        </c:forEach>
                        
                    </div>
                </div>

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

<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script> 
<script type="text/javascript" src="<c:url value='/js/community.js' />"></script> 
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
        <script type="text/javascript" src="<c:url value='/js/community.js' />"></script>
</body>
</html>