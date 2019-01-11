<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="footer" data-animate="fadeInUp">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-sm-6">
				<h4>페이지</h4>

				<ul>
					<li><a href="${pageContext.request.contextPath}/">홈</a></li>
					<li><a href="${pageContext.request.contextPath}/board">게시판</a></li>
					<li><a href="createProduct">상품등록</a></li>
					<li><a href="${pageContext.request.contextPath}/basket">장바구니</a></li>
				</ul>

				<hr>

				<h4>회원 섹션</h4>

				<ul>
					<li><a href="user_register">로그인 및 회원가입</a></li>
				</ul>

				<hr class="hidden-md hidden-lg hidden-sm">

			</div>
			<!-- /.col-md-3 -->

			<div class="col-md-4 col-sm-6">

				<h4>전체 보기</h4>

				<h5>가격대</h5>

				<ul>
					<li><a
						href="${pageContext.request.contextPath}/home?minprice=0&maxprice=100000">10만원	이하</a></li>
					<li><a
						href="${pageContext.request.contextPath}/home?minprice=100000&maxprice=300000">10만원~30만원</a></li>
					<li><a
						href="${pageContext.request.contextPath}/home?minprice=300000&maxprice=1000000">30만원~100만원</a></li>
					<li><a
						href="${pageContext.request.contextPath}/home?minprice=1000000&maxprice=10000000">100만원이상</a></li>
				</ul>

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

				<hr class="hidden-md hidden-lg">

			</div>
			<!-- /.col-md-3 -->

			<div class="col-md-4 col-sm-6">

				<h4>회사 주소</h4>

				<p>
					<strong>(주)내꺼니꺼</strong> <br>전북 전주시 덕진구 기린대로 400-6 <br>캠프PC방 8층 803호 <br> <br>사업자번호 192-168-0-1 <br> <br>대표번호 1577-1577 <br> <br>조장 기성
				</p>


				<hr class="hidden-md hidden-lg">

			</div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->
</div>
<!-- /#footer -->