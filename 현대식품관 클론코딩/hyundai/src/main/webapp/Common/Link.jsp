<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- jquery -->

<!-- header// -->
<link rel="stylesheet" type="text/css"
	href="./UIUX/css/common.min.css?ver=15">
<header id="header">
	<!-- topbanner : 메인에서만 노출// -->
	<div id="topBanner"></div>
	<!-- topbanner// -->

	<div class="inner">
		<!-- toparea// -->
		<div class="toparea">
			<h1>
				<a href="TohomeServlet?command=main"
					onclick="location.href='TohomeServlet?command=main'"><img
					src="./UIUX/images/header_logo_freex34.png" alt="현대식품관"></a>
			</h1>

			<!-- 로그인 여부에 따른 메뉴 변화 -->
			<%
			if (session.getAttribute("UserId") == null) {
			%>
			<!-- util : 로그인 전// -->
			<div class="util" id="dawnLoginN" style="display: hidden">
				<a href="TohomeServlet?command=login_form"
					onclick="GA_Event('PC_공통', '헤더', '로그인'); javascript:loginPopup('');return false;">로그인</a>
				<a href="TohomeServlet?command=join_form"
					onclick="GA_Event('PC_공통', '헤더', '회원가입');">회원가입</a>
				<!-- <a href="" onclick="GA_Event('PC_공통', '헤더', '마이페이지');">마이페이지</a> -->
				<!-- <a href="" onclick="GA_Event('PC_공통', '헤더', '고객센터');">고객센터</a> -->
			</div>
			<!-- //util : 로그인 전 -->
			<%
			} else {
			%>
			<!-- util : 로그인 후// -->
			<div class="util" id="dawnLoginY" style="display: hidden">
				<button type="button" class="btn-linedown btn-personal"
					id="memNmText">
					<%=session.getAttribute("UserName")%>
					님! 반갑습니다.
				</button>
				<a href="TohomeServlet?command=logout" class="active">로그아웃</a>
				<!-- 활성화 class="active" 추가 -->
				<!-- <a href="">회원정보변경</a> -->
				<a href="TohomeServlet?command=my_page"
					onclick="GA_Event('PC_공통', '헤더', '마이페이지');">마이페이지</a>
				<!-- <a href="TohomeServlet?command=qna_center" onclick="GA_Event('PC_공통', '헤더', '고객센터');">고객센터</a> -->
			</div>

			<!-- //util : 로그인 후 -->
			<%
			}
			%>

		</div>
		<!-- //toparea -->

		<!-- gnbarea// -->
		<nav class="gnbarea">

			<!-- 팝업 : category// -->
			<div id="popCategory">
				<script type="text/javascript">
					$(document).ready(
							function() {

								// 퍼블 정상 동작을 위해 $(document).ready에 추가
								$(".depth1.brand-wrap .depth2 button, .depth3")
										.hover(
												function() {
													$(this).parents("ul.lnb")
															.addClass("on");
												},
												function() {
													$(this).parents("ul.lnb")
															.removeClass("on");
												});

								$(".exhibition-wrap, .brand-ct").hover(
										function() {
											$(this).parents("ul.lnb").addClass(
													"on2");
										},
										function() {
											$(this).parents("ul.lnb")
													.removeClass("on2");
										});
							});

					function category_onclick() {
						const c = document.querySelector("#p_popCategory")
						c.classList.toggle("active");
					}
				</script>
				<!-- category// -->
				<button type="button" class="btn-category"
					onclick="category_onclick()">카테고리리 전체보기</button>
				<div id="p_popCategory" class="popcategory">
					<nav class="lnb-list">
						<ul class="lnb">
							<li class="depth1">
								<button type="button"
									onclick="location='TohomeServlet?command=fruits_vegetables_list&category_name=과일과 채소&category_id=100571&top_num=0&filter=0'">
									과일과 채소</button>
							</li>
							<li class="depth1">
								<button type="button"
									onclick="location='TohomeServlet?command=grain_nuts_list&category_name=곡물과 견과&category_id=100610&top_num=0&filter=0'">
									곡물과 견과</button>
							</li>
							<li class="depth1">
								<button type="button"
									onclick="location='TohomeServlet?command=fish_driedfish_list&category_name=생선과 해산물, 건어물&category_id=100615&top_num=0&filter=0'">
									생선과 해산물, 건어물</button>
							</li>
						</ul>
					</nav>
				</div>
				<!-- //category -->
			</div>
			<!-- //팝업 : category -->

			<!-- gnb// -->
			<ul class="gnb-list" id="homeGnbList">
				<li><a
					href="TohomeServlet?command=latest_productList&top_num=0&filter=0"
					style="color: #ff6913">신상품</a></li>
				<li><a
					href="TohomeServlet?command=all_productList&top_num=0&filter=0">전체상품</a>
				</li>
			</ul>
			<!-- //gnb -->


			<button type="button" class="btn-cart"
				onclick="location='TohomeServlet?command=basket'">
				장바구니
				<%--TODO :: DB에서 user_no별 basket의 행의 갯수 가져오기--%>
				<span id="basketCnt">
					<%
					int count = 0;
					if (session.getAttribute("basketCount") != null) {
						count = (int) session.getAttribute("basketCount");
					}
					out.print(count);
					%>
				</span>
			</button>
		</nav>
		<!-- //gnbarea -->
	</div>
</header>
<!-- //header -->