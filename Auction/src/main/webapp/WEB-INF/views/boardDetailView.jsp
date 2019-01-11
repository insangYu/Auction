<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="robots" content="all,follow">
<meta name="googlebot" content="index,follow,snippet,archive">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Obaju e-commerce template">
<meta name="author" content="Ondrej Svestka | ondrejsvestka.cz">
<meta name="keywords" content="">

<title>내꺼니꺼</title>

<meta name="keywords" content="">

<link href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100' rel='stylesheet' type='text/css'>

<!-- styles -->
<link href="resources/css/font-awesome.css" rel="stylesheet">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/animate.min.css" rel="stylesheet">
<link href="resources/css/owl.carousel.css" rel="stylesheet">
<link href="resources/css/owl.theme.css" rel="stylesheet">

<!-- theme stylesheet -->
<link href="resources/css/style.blue.css" rel="stylesheet" id="theme-stylesheet">

<!-- your stylesheet with modifications -->
<link href="resources/css/custom.css" rel="stylesheet">

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
						<li><a href="board">글 목록 보기</a></li>
					</ul>

					<!-- 					<div class="row" id="error-page"> -->
					<div class="col-md-12">
						<div class="box" style="margin-bottom: 20px">
							<div class="row">
								<div class="col-md-8">
									<h2>${board.title}</h2>
								</div>
								<div class="col-md-4">
									<h5>글쓴이 : ${board.author}</h5>
									<h5>날짜 : ${board.date}</h5>
								</div>
							</div>
							<hr />
							<p>${board.contents}</p>
						</div>

						<div class="box" style="margin-bottom: 20px">
							<div data-animate="fadeInUp">
								<form id="comment-form" method="post">
									<div class="row">
										<div class="col-sm-12">
											<div class="form-group">
												<textarea class="form-control" id="comment" rows="2" placeholder="댓글을 입력해주세요."></textarea>
											</div>
											
										</div>
									</div>

									<div class="row">
										<div class="col-sm-12 text-right">
											<button id="comment-post-button" class="btn btn-primary">
												<i class="fa fa-comment-o"></i> 댓글 남기기
											</button>
										</div>
									</div>
								</form>
							</div>
							<!-- /#comment-form -->

						</div>
						<div class="box">
							<div id="comments" data-animate="fadeInUp">
								<h4>${fn:length(commentList)}개의 댓글이 있습니다.</h4>
								<c:forEach items="${commentList}" var="comment">
									<div class="row comment">
										<div class="col-sm-3 col-md-1 text-center-xs">
											<p>
											</p>
										</div>
										<div class="col-sm-9 col-md-11">
											<h5>${comment.author}</h5>
											<p class="posted">
												<i class="fa fa-clock-o"></i> ${comment.date}
											</p>
											<p>${comment.contents}</p>
										</div>
									</div>
								</c:forEach>
							</div>
							<!-- /#comments -->

						</div>
					</div>
				</div>

				<!-- 				</div> -->
				<!-- /.col-md-9 -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /#content -->
	</div>

	<!-- *** COPYRIGHT ***
 _________________________________________________________ -->
	<div id="copyright">
		<div class="container">
			<div class="col-md-6">
				<p class="pull-left">© 2018 adv_web_programing team2</p>

			</div>
			<div class="col-md-6">
				<p class="pull-right">
					Template by <a href="https://bootstrapious.com/e-commerce-templates">Bootstrapious</a> & <a href="https://fity.cz">Fity</a>
					<!-- Not removing these links is part of the license conditions of the template. Thanks for understanding :) If you want to use the template without the attribution links, you can do so after supporting further themes development at https://bootstrapious.com/donate  -->
				</p>
			</div>
		</div>
	</div>
	<!-- *** COPYRIGHT END *** -->

	<!-- /#all -->


	<!-- *** SCRIPTS TO INCLUDE ***
 _________________________________________________________ -->
	<script src="resources/js/jquery-1.11.0.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.cookie.js"></script>
	<script src="resources/js/waypoints.min.js"></script>
	<script src="resources/js/modernizr.js"></script>
	<script src="resources/js/bootstrap-hover-dropdown.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/front.js"></script>
	<script src="resources/js/respond.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var board_id = '${board.id}';

			$("#comment-form").on('submit', function() {
				var dt = new Date();
				var datetime = dt.getFullYear() + "-" + (dt.getMonth() + 1) + "-" + dt.getDate() + " " + dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();

				$.post('${pageContext.request.contextPath}/create_comment', {
					date : datetime,
					contents : $("#comment").val(),
					board_id : board_id
				}, function(data, status, jqXHR) {
					if (data == "not logged in") {
						alert("로그인 후 댓글 작성이 가능합니다.");
						window.location.replace("${pageContext.request.contextPath}/user_register");
					} else if (data == "logged in") {
						window.location.replace("${pageContext.request.contextPath}/board_detail?board_id=" + board_id);				
				}}).always(function() {
				});
			});
		});
	</script>
	</body>
</html>