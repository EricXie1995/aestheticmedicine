<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>歡迎登入後台系統</title>
<script type="text/javascript" src="<c:url value='/webjars/jquery/3.6.0/jquery.js' />">></script>
</head>
<body>

	<!-- BEGIN LOGIN -->

	<div>

		<!-- BEGIN LOGIN FORM -->

		<form action="login.do" method="post">

			<h3>請登入</h3>
			
			<div>

				<label>帳號</label>

				<div>

					<input type="text" placeholder="帳號" name="username" />

				</div>

			</div>

			<div>

				<label>密碼</label>

				<div>

					<input type="password" placeholder="密碼" name="password" />

				</div>

			</div>

			<div>
			
				<button type="reset" class="btn red ">重置</button>

				<button id='login' type="submit" class="btn green pull-right">登入</button>
				
			</div>
		</form>
		<!-- END LOGIN FORM -->
	</div>

	<!-- END LOGIN -->

	<!-- BEGIN COPYRIGHT -->

	<div class="copyright">2021 &copy; Template.</div>

<!-- 	<!-- END COPYRIGHT --> 

<!-- 	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) --> 

<!-- 	<!-- BEGIN CORE PLUGINS --> 

<!-- 	<script th:src="@{/js/jquery-1.10.1.min.js}" type="text/javascript"></script> -->
<!-- 	<script th:src="@{/js/bootstrap.min.js}" type="text/javascript"></script> -->

<!-- 	<!-- END PAGE LEVEL PLUGINS -->

<!-- 	<!-- BEGIN PAGE LEVEL SCRIPTS --> 

<!-- 	<script th:src="@{/js/app.js}" type="text/javascript"></script> -->

<!-- 	<!-- END PAGE LEVEL SCRIPTS --> 

<!-- 	<script> -->
<!-- //  		jQuery(document).ready(function() {  -->

<!-- //  			App.init();  -->
<!-- //  			//$("#login").click(login); --> -->

<!-- //  		});  -->

<!-- //  		function login() {  -->
<!-- // 			var username = $("[name='username']").val();  -->
<!-- //  			var password = $("[name='password']").val();  -->
<!-- // 			if (!username || !password) {  -->
<!-- //  				alert("帳號密碼不能為空！");  -->
<!-- // 			return;  -->
<!-- // 			}  -->
<!-- //  			$.ajax({  -->
<!-- // 				type : "post",  -->
<!-- // 				url : "login.do",  -->
<!-- // 				data : {  -->
<!-- // 					"username" : username,  -->
<!-- // 					"pwd" : password  -->
<!-- //  				},  -->
<!-- // 				success : function(data) {  -->
<!-- //  					console.log(data); -->
<!-- // 					if (data.state == 0) {  -->
<!-- //  						window.location.href = "index.jsp";  -->
<!-- //  					} else { -->
<!-- // 						alert(data.message);  -->
<!-- // 					}  -->
<!-- //  				}  -->
<!-- //  			});  -->
<!-- //  		}  -->
<!--  	</script>  -->

	<!-- END JAVASCRIPTS -->
	<!-- END BODY -->
</body>
</html>