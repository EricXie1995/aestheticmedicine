<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>歡迎登入後台系統</title>

<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="../static/img/favicon.png">

		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="http://cdn.bootstrapmb.com/bootstrap/4.3.1/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="../static/css/font-awesome.min.css">
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="../static/css/style.css">
				
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->
		
</head>
<body>

<!-- Main Wrapper -->
        <div class="main-wrapper login-body">
            <div class="login-wrapper">
            	<div class="container">
                	<div class="loginbox">
                    	<div class="login-left">
							<img class="img-fluid" src="../static/img/logo-white.png" alt="Logo">
                        </div>
                        <div class="login-right">
							<div class="login-right-wrap">
								<h1>Login</h1>
								<p class="account-subtitle">Access to our dashboard</p>
								
								<!-- Form -->
								<form action="login.do" method="post">
									<div class="form-group">
										<input class="form-control" type="text" placeholder="Account" name="username">
									</div>
									<div class="form-group">
										<input class="form-control" type="password" placeholder="Password" name="password">
									</div>
									<div class="form-group">
										<button class="btn btn-primary btn-block" type="submit" id='login'>Login</button>
									</div>
								</form>
								<!-- /Form -->
								
								<div class="text-center forgotpass"><a href="forgot-password.html">Forgot Password?</a></div>
								<div class="login-or">
									<span class="or-line"></span>
									<span class="span-or">or</span>
								</div>
								  
								<!-- Social Login -->
								<div class="social-login">
									<span>Login with</span>
									<a href="#" class="facebook"><i class="fa fa-facebook"></i></a><a href="#" class="google"><i class="fa fa-google"></i></a>
								</div>
								<!-- /Social Login -->
								
								<div class="text-center dont-have">Don’t have an account? <a href="register.html">Register</a></div>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		

	<!-- BEGIN COPYRIGHT -->

	<div class="copyright">2021 &copy; Template.</div>

		<!-- jQuery -->
        <script src="../static/js/jquery-3.2.1.min.js"></script>
		
		<!-- Bootstrap Core JS -->
        <script src="../static/js/popper.min.js"></script>
        <script src="http://cdn.bootstrapmb.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		
		<!-- Custom JS -->
		<script src="../static/js/script.js"></script>
		
</body>
</html>