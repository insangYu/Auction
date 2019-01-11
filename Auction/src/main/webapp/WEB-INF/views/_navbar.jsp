<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- *** NAVBAR ***
_________________________________________________________ -->

<div class="navbar navbar-default yamm" role="navigation" id="navbar">
    <div class="container">
        <div class="navbar-header">

            <a class="navbar-brand home" href="home" data-animate-hover="bounce">
                <img src="resources/img/logo.JPG" alt="YoursMine" class="hidden-xs">
                <img src="resources/img/logo-small.jpg" alt="YoursMine" class="visible-xs"><span class="sr-only">Obaju - go to homepage</span>
            </a>
            <div class="navbar-buttons">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation">
                    <span class="sr-only">Toggle navigation</span>
                    <i class="fa fa-align-justify"></i>
                </button>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#search">
                    <span class="sr-only">Toggle search</span>
                    <i class="fa fa-search"></i>
                </button>
                <a class="btn btn-default navbar-toggle" href="${pageContext.request.contextPath}/basket">
                    <i class="fa fa-shopping-cart"></i>  <span class="hidden-xs">장바구니</span>
                </a>
            </div>
        </div>
        <!--/.navbar-header -->

        <div class="navbar-collapse collapse" id="navigation">

            <ul class="nav navbar-nav navbar-left">
                <li class="active"><a href="${pageContext.request.contextPath}/">홈</a>
                </li>
                <li class="dropdown yamm-fw">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" 	data-hover="dropdown" data-delay="200">카테고리 <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li>
							<div class="yamm-content">
								<div class="row">
									<div class="col-sm-3">
										<h5>가격대</h5>
										<ul>
											<li><a href="${pageContext.request.contextPath}/home?minprice=0&maxprice=100000">10만원 이하</a></li>
											<li><a href="${pageContext.request.contextPath}/home?minprice=100000&maxprice=300000">10만원~30만원</a></li>
											<li><a href="${pageContext.request.contextPath}/home?minprice=300000&maxprice=1000000">30만원~100만원</a></li>
											<li><a href="${pageContext.request.contextPath}/home?minprice=1000000&maxprice=100000000">100만원 이상</a></li>
										</ul>
									</div>
									<div class="col-sm-3">
										<h5>카테고리</h5>
										<ul>
											<li><a
												href="${pageContext.request.contextPath}/home?category=electronics">전자제품</a></li>
											<li><a
												href="${pageContext.request.contextPath}/home?category=fashion">패션</a></li>
											<li><a
												href="${pageContext.request.contextPath}/home?category=health">헬스</a></li>
											<li><a
												href="${pageContext.request.contextPath}/home?category=beauty">뷰티</a></li>
											<li><a
												href="${pageContext.request.contextPath}/home?category=motors">모터</a></li>
											<li><a
												href="${pageContext.request.contextPath}/home?category=collections">콜렉션</a></li>
											<li><a
												href="${pageContext.request.contextPath}/home?category=sports">스포츠</a></li>
											<li><a
												href="${pageContext.request.contextPath}/home?category=interior">인테리어</a></li>
											<li><a
												href="${pageContext.request.contextPath}/home?category=others">기타</a></li>
										</ul>
									</div>
								</div>
                            </div>
                            <!-- /.yamm-content -->
                        </li>
                    </ul>
                </li>
    	        <li><a href="${pageContext.request.contextPath}/board">게시판</a></li>
	            
            </ul>

        </div>
        <!--/.nav-collapse -->

        <div class="navbar-buttons">

            <div class="navbar-collapse collapse right" id="basket-overview">
                <a href="${pageContext.request.contextPath}/basket" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span class="hidden-sm">장바구니</span></a>
            </div>
            <!--/.nav-collapse -->

            <div class="navbar-collapse collapse right" id="search-not-mobile">
                <button type="button" class="btn navbar-btn btn-primary" data-toggle="collapse" data-target="#search">
                    <span class="sr-only">Toggle search</span>
                    <i class="fa fa-search"></i>
                </button>
            </div>

        </div>

        <div class="collapse clearfix" id="search">

			<div class="col-md-6 offer"></div>
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search" id="search_input_id">
                    <span class="input-group-btn">
						<button id="search_btn_id" onclick="" class="btn btn-primary"><i class="fa fa-search"></i></button>
	    			</span>
                </div>
        </div>
        <!--/.nav-collapse -->

    </div>
    <!-- /.container -->
</div>
<!-- /#navbar -->

<!-- *** NAVBAR END *** -->
<script src="resources/js/jquery-1.11.0.min.js"></script>
<script>
$(document).ready(function() {
	$("#search_btn_id").click(function() {
		window.location.replace("${pageContext.request.contextPath}/home?keyword=" + $("#search_input_id").val());
	});
});
</script>