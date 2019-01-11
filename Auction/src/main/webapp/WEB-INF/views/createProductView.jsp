<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
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
						<li>상품 등록</li>
					</ul>
				</div>
				<div class="col-md-6">
					<div class="box">
						<h1>상품 등록</h1>
						<p class="lead">상품을 경매에 등록해 보세요!</p>

						<hr>

						<form action="createProduct" enctype="multipart/form-data"
							method="post" accept-charset="UTF-8">
							<div class="form-group">
								<label for="name">상품명</label> <input type="text" name="name"
									class="form-control" id="name">
							</div>
							<div class="form-group">
								<label for="price">즉시 구매가</label> <input type="text" name="price"
									class="form-control" id="price">
							</div>
							<div class="form-group">
								<label for="bid_price">경매 시작가</label> <input type="text" name="bid_price"
									class="form-control" id="bid_price">
							</div>
							<div class="form-group">
								<label for="category">카테고리</label><br> <select name="category"
									style="height: 30px; width: 200px" class="form-group"
									id="category">
									<option value="electronics">전자제품</option>
									<option value="fashion">패션</option>
									<option value='health'>헬스</option>
									<option value='beauty'>뷰티</option>
									<option value='motors'>모터</option>
									<option value='collections'>콜렉션</option>
									<option value='sports'>스포츠</option>
									<option value='interior'>인테리어</option>
								</select>
							</div>
							<div class="form-group">
								<label for="description">상세 설명</label> <input type="text"
									name="description" class="form-control" id="description">
							</div>
							<div class="form-group">
								<label for="image">이미지</label> <input type="file" name="file"
									id="imgInp"> <img id="blah" src="#" alt="미리보기"
									style="width: 500px; height: 300px" />
							</div>

							<div class="text-center">
								<input type="submit" class="btn btn-primary" value="상품등록">
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
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.cookie.js"></script>
	<script src="resources/js/waypoints.min.js"></script>
	<script src="resources/js/modernizr.js"></script>
	<script src="resources/js/bootstrap-hover-dropdown.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/front.js"></script>
	<script src="resources/js/respond.min.js"></script>
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			function readURL(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$('#blah').attr('src', e.target.result);
					}
					reader.readAsDataURL(input.files[0]);
				}
			}
			$("#imgInp").change(function() {
				readURL(this);
			});
		});
	</script>
</body>
</html>