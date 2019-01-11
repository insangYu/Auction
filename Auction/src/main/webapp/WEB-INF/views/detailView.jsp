<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>

<html>
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
	<jsp:include page="recentProduct.jsp"></jsp:include>


	<div id="all">

		<div id="content">
			<div class="container">

				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="#">홈</a></li>
						<li><a href="#">제품</a></li>
						<li>${product.name}</li>
					</ul>

				</div>

				<div class="col-md-3">
					<!-- *** MENUS AND FILTERS ***
 _________________________________________________________ -->
					<div class="panel panel-default sidebar-menu">

						<div class="panel-heading">
							<h3 class="panel-title">카테고리</h3>
						</div>

						<div class="panel-body">
							<ul class="nav nav-pills nav-stacked category-menu">
								<li><a href="">가격대별</a>
									<ul>
										<li><a
											href="${pageContext.request.contextPath}/home?minprice=0&maxprice=200000">20만원 이하</a></li>
										<li><a
											href="${pageContext.request.contextPath}/home?minprice=200000&maxprice=400000">20만원~40만원</a></li>
										<li><a
											href="${pageContext.request.contextPath}/home?minprice=400000&maxprice=600000">40만원~60만원</a></li>
										<li><a
											href="${pageContext.request.contextPath}/home?minprice=600000&maxprice=100000000">60만원 이상</a></li>
									</ul></li>
								<li><a href="">카테고리</a>
									<ul>
										<li><a href="${pageContext.request.contextPath}/home?category=electronics">전자제품</a></li>
										<li><a href="${pageContext.request.contextPath}/home?category=fashion">패션</a></li>
										<li><a href="${pageContext.request.contextPath}/home?category=health">헬스</a></li>
										<li><a href="${pageContext.request.contextPath}/home?category=beauty">뷰티</a></li>
										<li><a href="${pageContext.request.contextPath}/home?category=motors">모터</a></li>
										<li><a href="${pageContext.request.contextPath}/home?category=collections">콜렉션</a></li>
										<li><a href="${pageContext.request.contextPath}/home?category=sports">스포츠</a></li>
										<li><a href="${pageContext.request.contextPath}/home?category=interior">인테리어</a></li>
										<li><a href="${pageContext.request.contextPath}/home?category=others">기타</a></li>
									</ul></li>								
						</div>
					</div>



					<!-- *** MENUS AND FILTERS END *** -->


				</div>

				<div class="col-md-9">

					<div class="row" id="productMain">
						<div class="col-sm-6">
							<div id="mainImage">
								<img src="${product.image}" alt="" class="img-responsive">
							</div>

							<div class="ribbon sale">
								<div class="theribbon">SALE</div>
								<div class="ribbon-background"></div>
							</div>
							<!-- /.ribbon -->

							<div class="ribbon new">
								<div class="theribbon">NEW</div>
								<div class="ribbon-background"></div>
							</div>
							<!-- /.ribbon -->

						</div>
						<div class="col-sm-6">
							<div class="box">
								<h1 class="text-center">${product.name}</h1>
									<p class="text-center">즉시구매가 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;경매시작가</p>
								<p class="price">&#8361; ${product.price} &nbsp; &#8361;${product.bid_price}</p>


								<p class="text-center buttons">
									<button id="cart_btn_id" data-toggle="modal"
										data-target="#cart-modal" class="btn btn-primary">
										<i class="fa fa-shopping-cart"></i>장바구니
									</button>
									<button id="pay_btn_id" data-toggle="modal"
										data-target="#pay-button" class="btn btn-primary">
										<i class="fa fa-shopping-cart"></i>즉시 구매
									</button>
								</p>
							</div>


						</div>

					</div>

					<div class="modal fade" id="cart-modal" tabindex="-1" role="dialog"
						aria-labelledby="Login" aria-hidden="true">
						<div class="modal-dialog modal-sm">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title">Add To Cart</h4>
								</div>
								<div class="modal-body">
									<p class="text-center text-muted">상품이 장바구니에 담겼습니다.</p>
									<p class="text-center text-muted">장바구니로 가시겠습니까?</p>
									<p class="text-center">
										<button
											onclick="location.href='${pageContext.request.contextPath}/basket'"
											class="btn btn-primary">예</button>
										<button data-dismiss="modal" aria-hidden="true"
											class="btn btn-primary">아니요</button>
									</p>

								</div>
							</div>
						</div>
					</div>


					<div class="box" id="details">
						<p>
						<h4>상세 설명</h4>
						<p>${product.description}</p>
						<hr>
					</div>
					<div class="box" id="fist_bidder">
						<p>
						<h4>최상위 입찰자</h4>
						<p>${product.bidder}</p>
						<hr>
					</div>
					<div class="box" style="margin-bottom: 20px">
						<div data-animate="fadeInUp">
							<form class="form-inline" id="bid-form" method="post">
								<div class="col-sm-5">
									<div class="form-group">
										<textarea class="form-control" id="bid" rows="1"
											placeholder="입찰가"></textarea>
										<button id="bid-button" class="btn btn-primary">
										<i class="fa fa-comment-o"></i>입찰하기
										</button>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12 text-right"></div>
								</div>
							</form>
						</div>
					</div>
						<!-- /#입찰 폼-->
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
	<script src="resources/js/jquery.session.js"></script>
	<script src="resources/js/respond.min.js"></script>
	<script>
      $(document).ready(function() {
         var sessionflag = "${sessionflag}";
         if (sessionflag == "true") {
            $("#pay_btn_id").click(function() {
               
               $.ajax({
                  url : "http://localhost:8080/jbnu/getReadyPage",
                  method : "POST",
                  data : {product : "${product.code}"},
                  success : function(data) {
                     window.location.href = data.next_redirect_pc_url;
                  }
               });
            });
         } else {
         }
      });
	</script>	
 	
	<!--  입찰 부분-->
	<script type="text/javascript">
	 	
	$(document).ready(function() {
			var product = '${product.code}';

			$("#bid-form").on('submit', function() {
				
				$.post('${pageContext.request.contextPath}/insertBid', {
					contents : $("#bid").val(),
					product : product,
					success : function() {
	                     alert("입찰에 성공하였습니다");
	                     window.location.href = '${pageContext.request.contextPath}/finishBid';
	                  }})})});
	</script>	
	

	<script>
	
		$(document)
				.ready(
						function() {
							var sessionflag = "${sessionflag}";
							if (sessionflag == "true") {
								$("#cart_btn_id")
										.click(
												function() {
													$
															.ajax({
																url : "${pageContext.request.contextPath}/insertCartProduct",
																type : "post",
																data : {
																	product : "${product.code}"
																}
															});
												});
							} else {
								$("#cart_btn_id").removeAttr("data-toggle");
								$("#cart_btn_id").removeAttr("data-target");
								$("#cart_btn_id")
										.attr("onclick",
												"location.href='${pageContext.request.contextPath}/user_register'");
							}
						});
	</script>
	<script>
		$(document).ready(function() {
			if (!!$.cookie("recentProduct")) {
				var products = $.parseJSON($.cookie("recentProduct"));
				if (products.length >= 3) {
					products.sort().reverse();
					products.pop();
					products.sort().reverse();
				}
				products.push({
					"name" : "${product.name}",
					"image" : "${product.image}",
					"code" : "${product.code}"
				});
				$.cookie("recentProduct", JSON.stringify(products));
			} else {
				var products = [ {
					"name" : "${product.name}",
					"image" : "${product.image}",
					"code" : "${product.code}"
				} ];
				$.cookie("recentProduct", JSON.stringify(products));
			}
		});
	</script>
	
</body>

</html>