<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--     拿來時間格式化的標籤 -->
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
     <style>
        .s {
            filter: grayscale(1);
        }
        .n {
            filter: grayscale(0);
        }
    </style>
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
                	分類： <span>${question.type.typeName}</span>
                    作者： <span>${question.member.memberName}</span> |
                    發布時間： <span><fmt:formatDate value="${question.createtime}" type="both"/></span> |
                    閱讀數： <span>${question.viewcount}</span>|
                    讚數： <span>${question.like_count}</span> | ${favo} ${favo.question.questionPkId}
                    <c:if test="${favo==null}">
                     	<span>收藏</span><img onclick="favpost(this)" src="<c:url value='/images/forum/love.jpg' />" class="s" id="loveimg">
                    </c:if>
                    <c:if test="${favo!=null}">
                    	<span>取消</span><img onclick="favpost(this)" src="<c:url value='/images/forum/love.jpg' />" class="n" id="loveimg">
                    </c:if>
                    <c:if test="${question.favoritecount==null}">0</c:if>
                    <c:if test="${question.favoritecount!=null}"><span>${question.favoritecount}</span></c:if>
                                 
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
				<c:if test="${member!=null && member.memberPkId==question.member.memberPkId}">
                <a href="<c:url value='/publish/${question.questionPkId}' />">
                <span class="glyphicon glyphicon-pencil question-menu" aria-hidden="true">
                    編輯
                </span>
                </a>
                <a href="<c:url value='/question/delete/${question.questionPkId}' />">刪除</a>
                </c:if>
            </div>
            <!--回覆內容-->
            <hr class="col-lg-12 col-md-12 col-sm-12 col-ss-12">
            <h3>
                <span>${question.qcommentcount}</span>個回覆
            </h3>
            <hr class="col-lg-12 col-md-12 col-sm-12 col-ss-12" style="margin-top: 0;">
            <!--一級評論-->
            <c:forEach var="reply" items="${reply}">
            <div class="col-lg-12 col-md-12 col-sm-12 col-ss-12" id="comment_content">
                <div class="media">
                    <div class="media-left">
                        <img class="media-object img-rounded picset"
                             src="<c:url value='/images/testimg.jpg' />">
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">
<!--                         缺session -->
<%--                             <span>${reply.member.memberName}</span> --%>
							<span>${reply.member.memberName}</span>
							<span></span>
                            <div style="font-size: 15px; margin-top:5px;">${reply.content}</div>
                            <!-- 點讚、評論、時間 -->
                            <div class="question-menu">
                                <span class="glyphicon glyphicon-thumbs-up icon" aria-hidden="true"></span>
                                <!-- 回覆按鈕 -->
                                <span class="glyphicon glyphicon-comment icon" aria-hidden="true"
                                      data-id="${reply.replyPkId}" data-check="1" onclick="secondcomment(this)">${reply.commentcount}</span>
                                <span><fmt:formatDate value="${reply.createtime}" type="both"/></span>
                            </div>                                
                                <div class="col-lg-12 col-md-12 col-sm-12 col-ss-12 collapse sub-comment"
                                 id="reply-${reply.replyPkId}">
                                 <!-- 二級評論插入到這裡 -->
                                 <!-- 二級評論輸入框 -->
                                <div class="col-lg-12 col-md-12 col-sm-12 col-ss-12" style="margin-top: 10px;">
                                    <input type="text" class="form-control" placeholder="評論一下....." id="input-${reply.replyPkId}">
                                    <button type="button" class="btn btn-success" style="float: right;margin: 10px;"
                                            onclick="replypost(this)" data-id="${reply.replyPkId}">
                                        提交
                                    </button>
                                </div>
                            </div>
                        </h4>
                    </div>
                </div>
            </div>
            </c:forEach>

            <!--回覆框-->
            <div class="col-lg-12 col-md-12 col-sm-12 col-ss-12" id="comment_section">
                <div class="media" style="margin-bottom: 20px">
                    <div class="media-left">
                        <img class="media-object img-rounded picset"
                             src="<c:url value='/images/testimg.jpg' />">
                    </div>
                    <div class="media-body" style="padding-top:10px;">
                        <h4 class="media-heading">
<!--                         這裡預想改成session的user(登錄者)，然後設個id給js抓，傳json給replyController -->
                            <span />${member.memberName}
                        </h4>
                    </div>
                </div>
                <input type="hidden" id="question_id" value="${question.questionPkId}">
                <textarea class="form-control" rows="6" style="margin-top:10px; margin-bottom: 10px;"
                          id="content"></textarea>
                <button type="button" class="btn btn-success" style="float: right;margin: 10px;"
                        onclick="post()">提交
                </button>
            </div>
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

<script type="text/javascript">

function post() {
    var questionid = $("#question_id").val();
    var content = $("#content").val();
    if (content == '') {
        alert("回覆內容不能為空")
    } else {
        $.ajax({
            type: "POST",
            url: "/beauty/reply",
            contentType: 'application/json',
            data: JSON.stringify({
                "parentid": questionid,
                "type": 1,
                "content": content
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
}


function replypost(e) {
    var commentid = e.getAttribute("data-id");
    var content = $("#input-" + commentid).val();
    if (content == '') {
        alert("回覆內容不能為空")
    } else {
        $.ajax({
            type: "POST",
            url: "/beauty/reply",
            contentType: 'application/json',
            data: JSON.stringify({
                "parentid": commentid,
                "type": 2,
                "content": content
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

        console.log(commentid);
        console.log(content);
    }
}

	
function secondcomment(e) {
    var id = e.getAttribute("data-id");
    var check = e.getAttribute("data-check");
    var reply = $("#reply-" + id);
    //如果check为1则展开二级评论，否则收缩
    if (check == "1") {
        $.getJSON("/beauty/reply/" + id, function (data) {
            var subCommentContainer = $("#reply-" + id);
            <%--//如果子元素的长度为1，即第一次添加，则调用下面的方法--%>
            if (subCommentContainer.children().length == 1) {
                $.each(data.data.reverse(), function (index, reply) {
                	<%--//对应<span th:text="${comment.user.name}"/>--%>
                    var usernameElement = $("<span/>", {
                        html: reply.memberName
                    });
                    <%--//对应<div style="font-size: 15px; margin-top:5px;"--%>
                    <%--//      th:text="${comment.content}">--%>
                    <%--//    </div>--%>
                    var contentElement = $("<div/>", {
                        "style": "font-size: 15px; margin-top:5px;",
                        html: reply.content
                    });

                    var timeElement = $("<span/>", {
                        "style": "float: right",
                        html: moment(reply.createtime).format('YYYY-MM-DD')
                    });
                    var questionmenuElement = $("<div/>", {
                        "class": "question-menu"
                    }).append(timeElement);
                    <%--
                    var imgElement = $("<img/>", {
                        "class": "media-object img-rounded picset",
                        "src": comment.user.headpic
                    });

                    var medialeftElement = $("<div/>", {
                        "class": "media-left"
                    }).append(imgElement);
														--%>
                    var mediaheadingElement = $("<h4/>", {
                        "class": "media-heading",
                    }).append(usernameElement)
                        .append(contentElement)
                        .append(questionmenuElement);

                    var mediabodyElement = $("<div/>", {
                        "class": "media-body",
                    }).append(mediaheadingElement);

                    var mediaElement = $("<div/>", {
                        "class": "media"
                    }).append(mediabodyElement);
                    <%--.append(medialeftElement)--%>

                    var commentElement = $("<div/>", {
                        "class": "col-lg-12 col-md-12 col-sm-12 col-ss-12 comments",
                    }).append(mediaElement);

                    subCommentContainer.prepend(commentElement);
                })
            }
        });
        reply.addClass("in");
        e.setAttribute("data-check", "0");
        e.classList.add("active");

    } else {
    	reply.removeClass("in");
        e.setAttribute("data-check", "1")
        e.classList.remove("active");
    }
}

function favpost(e) {
    var questionid = $("#question_id").val();
        $.ajax({
            type: "POST",
            url: "/beauty/favorites",
            async:false,
            contentType: 'application/json',
            data: JSON.stringify({
                "questionPkId": questionid,
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

</script>

<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script> 
<%-- <script type="text/javascript" src="<c:url value='/js/community.js' />"></script>  --%>
<!-- momemt.js是現成的時間格式化涵式庫，給js、jq使用 -->
<script type="text/javascript" src="<c:url value='/js/moment.js' />"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>

</body>
</html>