<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="robots" content="all,follow">
<meta name="googlebot" content="index,follow,snippet,archive">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Obaju e-commerce template">
<meta name="author" content="Ondrej Svestka | ondrejsvestka.cz">
<meta name="keywords" content="">

<title>내꺼니꺼</title>

<meta name="keywords" content="">

<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100'
	rel='stylesheet' type='text/css'>

<!-- styles -->
<link href="resources/css/font-awesome.css" rel="stylesheet">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/animate.min.css" rel="stylesheet">
<link href="resources/css/owl.carousel.css" rel="stylesheet">
<link href="resources/css/owl.theme.css" rel="stylesheet">

<!-- theme stylesheet -->
<link href="resources/css/style.blue.css" rel="stylesheet"
	id="theme-stylesheet">

<!-- your stylesheet with modifications -->
<link href="resources/css/custom.css" rel="stylesheet">


<script src="resources/js/respond.min.js"></script>

<link rel="shortcut icon" href="favicon.png">

</head>

<body>

	<jsp:include page="_top.jsp"></jsp:include>
	<jsp:include page="_navbar.jsp"></jsp:include>

	<div id="all">

		<div id="content">
			<div class="container">

				<div class="col-md-12">

					<ul class="breadcrumb">
						<li><a href="home">홈</a></li>
						<li>회원정보수정</li>
					</ul>

				</div>

				<div class="col-md-6">
					<div class="box">
						<h1>회원정보변경</h1>

						<hr>

						<form id="form_user_edit" action="" method="post">
							<div class="form-group">
								<label for="name">이름</label> <input type="text"
									class="form-control" id="name" name="name">
							</div>
							<div class="form-group">
								<label for="password">비밀번호</label> <input type="password"
									class="form-control" id="password" name="password">
							</div>
							<div class="form-group">
								<label for="phone">핸드폰</label> <input type="text"
									class="form-control" id="phone" name="phone">
							</div>
							<div class="text-center">
								<button id="edit-button" class="btn btn-primary">
									<i class="fa fa-user-md"></i> 수정
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- /.container -->
		</div>
		<!-- /#content -->


		<jsp:include page="_footer.jsp"></jsp:include>
		<jsp:include page="_copyright.jsp"></jsp:include>

	</div>
	<!-- /#all -->




	<!-- *** SCRIPTS TO INCLUDE ***
 _________________________________________________________ -->
	<script src="resources/js/jquery-1.11.0.min.js"></script>
	<script src="resources/js/jquery.validate.min.js"></script>
	<script src="resources/js/additional-methods.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.cookie.js"></script>
	<script src="resources/js/waypoints.min.js"></script>
	<script src="resources/js/modernizr.js"></script>
	<script src="resources/js/bootstrap-hover-dropdown.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/front.js"></script>
	<script type="text/javascript">
		$(document).ready(
				function() {

					$.validator.addMethod("kor",
							function(value, element) {
								return this.optional(element)
										|| /^[가-힣]+$/.test(value);
							});

					$.validator.addMethod("password", function(value, element) {
						return this.optional(element)
								|| /^.*(?=^.{6,15}$)(?=.*\d)(?=.*[a-zA-Z]).*$/
										.test(value);
					});

					$("#form_user_edit").validate({
						debug : true,
						errorClass : "error",
						highlight : function(element, errorClass) {
							$(element).fadeOut(function() {
								$(element).fadeIn();
							});
						},
						rules : {
							name : {
								required : true,
								maxlength : 4,
								kor : true
							},
							password : {
								required : true,
								password : true
							},
							phone : {
								required : true,
								number : true,
								rangelength : [ 10, 11 ]
							}
						},
						messages : {
							name : {
								required : "필수 입력사항입니다.",
								maxlength : "최대 {0}글자이하여야 합니다.",
								kor : "자/모음만 있거나 영어가 있으면 안댐"
							},
							password : {
								required : "필수 입력사항입니다.",
								password : "영/숫자 포함 6자 이상이어야 함"
							},
							phone : {
								required : "필수 입력사항입니다.",
								number : "숫자만 가능합니다",
								rangelength : "핸드폰 번호는 10~11자리 숫자만 입력해야합니다"
							}
						},
						errorClass : "validation-error"

					});

					$("#edit-button").on('click', function() {
						if ($("#form_user_edit").valid()) {
							document.getElementById("form_user_edit").submit();
						}
					});

				});
	</script>


</body>

</html>
