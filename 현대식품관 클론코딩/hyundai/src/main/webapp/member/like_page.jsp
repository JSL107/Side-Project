<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>
<style class="vjs-styles-defaults">
.video-js {
	width: 300px;
	height: 150px;
}

.vjs-fluid {
	padding-top: 56.25%
}
</style>
<link rel="shortcut icon" type="image/x-icon"
	href="../UIUX/images/favicon.ico?ver=15">

<link rel="stylesheet" type="text/css"
	href="../UIUX/css/css-library.min.css?ver=15">
<link rel="stylesheet" type="text/css"
	href="../UIUX/css/common.min.css?ver=15">

<link rel="stylesheet" type="text/css" href="../UIUX/css/css-library.min.css?ver=9">
<link rel="stylesheet" type="text/css" href="../UIUX/css/common.min.css?ver=9">

<%--data aos css , script 설정--%>
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- jquery -->
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body data-aos-easing="ease" data-aos-duration="400" data-aos-delay="0">

	<link rel="stylesheet" type="text/css"
		href="../UIUX/css/mypage.min.css?ver=1663418587718">
	<!-- contents// -->

	<div id="wrap" class="mypage change">

		<jsp:include page="../Common/Link.jsp" />
		<!-- header// -->
		<%
		if (session.getAttribute("UserId") == null) {
			String url = "login_form.jsp";
			request.getRequestDispatcher(url).forward(request, response);
		}
		%>
		<!-- header// -->

		<!-- //header -->

		<!-- CDN END// -->
		<!-- //header -->

		<!-- contents// -->
		<div id="contents">
			<div class="innercon">
				<!-- mypage lnb// -->
				<section class="lnbarea">
					<h2>마이페이지</h2>
					<ul>
						<li class="lnb-depth1"><a href="#">주문관리</a>
							<ul class="lnb-depth2">
								<li><a href="#" onclick="fn_GaEvent(this);">주문 내역</a></li>
								<li><a href="#" onclick="fn_GaEvent(this);">주문취소</a></li>
								<li><a href="#" onclick="fn_GaEvent(this);">반품/교환</a></li>
								<li><a href="#" onclick="fn_GaEvent(this);">대량주문 문의</a></li>
								<li><a href="#" onclick="fn_GaEvent(this);">투홈구독</a></li>
								<li><a href="#" onclick="fn_GaEvent(this);">정기배송 설정</a></li>
							</ul></li>

						<li class="lnb-depth1"><a href="#">쇼핑 혜택</a>
							<ul class="lnb-depth2">
								<li><a href="#">쿠폰</a></li>
								<li><a href="#">H.Bonus</a></li>
								<li><a href="#">투홈패스</a></li>
								<li><a href="#">H.Point</a></li>

								<li><a href="#">상품권 전환금</a></li>
							</ul></li>
						<li class="lnb-depth1"><a href="#">나의 활동</a>
							<ul class="lnb-depth2">
								<li><a href="TohomeServlet?command=my_review">리뷰</a></li>
								<li><a href="#">좋아요</a></li>
								<li><a href="#">최근 본 상품</a></li>
								<li><a href="#">매거진 보관함</a></li>
								<li><a href="#">늘 필요한 상품</a></li>

								<li><a href="#">이벤트 참여현황</a></li>
								<li><a href="#">투홈백 관리</a></li>
								<li><a href="#">재입고 알림</a></li>
							</ul></li>
						<li class="lnb-depth1"><a href="#">나의 정보</a>
							<ul class="lnb-depth2">
								<li><a href="./">회원정보 변경</a></li>
								<li><a href="#">배송지 관리</a></li>
								<!-- <li><a href="#">간편계정연결관리</a></li> -->
								<li><a href="#">로그인 기록</a></li>

								<li><a href="#">H.Point Pay</a></li>

								<li><a href="#">Home Pay</a></li>
								<li><a href="#">개인정보 이용현황</a></li>
								<li><a href="#">환불계좌/현금영수증</a></li>
								<li><a href="#">임직원 인증</a></li>
								<li><a href="#">차량 등록</a></li>

							</ul></li>

					</ul>
				</section>
				<!-- //mypage lnb -->

				<!-- 좋아요 -->
				<!-- //mypage lnb -->

				<section class="conarea">
					<h3 class="tit">좋아요</h3>

<!-- 					tabs//
					<div class="tab-menu">
						<a href="/front/mp/mpb/myLike.do?tabIndex=1" id="tabMenu1"
							class="active"><span>새벽투홈<em>2</em></span></a> <a
							href="/front/mp/mpb/myLike.do?tabIndex=3" id="tabMenu3"><span>e슈퍼마켓<em>0</em></span></a>
						<a href="/front/mp/mpb/myLike.do?tabIndex=4" id="tabMenu4"><span>이벤트<em>0</em></span></a>
					</div>
					//tabs -->

					<!-- 새벽배송 Start -->

					<div class="list-filter">
<!-- 						<label><input type="checkbox" id="checkAll"
							onclick="fn_checkboxAll();"><span>전체선택</span></label>
						<button type="button" onclick="fn_deleteCheckList();"
							class="btn small lightgray">선택삭제</button>
						<button type="button" onclick="fn_deleteSoldoutList();"
							class="btn small lightgray">품절삭제</button> -->

<!-- 						<div class="form-filter">
							<div class="select type2">
								<select id="selectBox" title="정렬 조건 선택"
									onchange="fn_myLikeList(1);">
									<option value="1">최신등록순</option>
									<option value="2">혜택순</option>
									<option value="3">상품명</option>
									<option value="4">가격 내림차순</option>
									<option value="5">가격 오름차순</option>
									<option value="6">인기상품</option>
								</select>
							</div>
						</div> -->
					</div>


					<fieldset class="list-field">
						<ul id="contUl" class="product-list vertical">
							<c:forEach items="${likeList}" var="LikeDTO">
                          	<li onclick="javascript:fnMpGaEcommerce(&#039;S02209121900&#039;, &#039;[요떡] 요니네 떡볶이 2종&#039;, &#039;요떡&#039;,
                                        &#039;배송/F＆B/베이커리.디저트/Confectionary_떡&#039;, &#039;1&#039;,&#039;&#039;,&#039;136258_요떡&#039;,&#039;A12600_주식회사 케이컴퍼니 &#039;,
                                        &#039;&#039;,&#039;일반상품&#039;, &#039;190_(주)현대백화점&#039;,&#039;조리식품(1301)&#039;, &#039;1&#039;);">
								
								<label class="thumb"> 
								<!-- <input type="checkbox"
									name="checkboxAll" value="2">  -->
									<span> <img
										src="${LikeDTO.prod_img}"
										alt="${LikeDTO.prod_no}"
										onerror="this.src='/UIUX/w/pjtCom/images/common/noimage_120x144.jpg'" style="height: 50%">
								</span>
							</label>
								<div class="contr">
									<a href="TohomeServlet?command=product_detail&prod_no=${LikeDTO.prod_no}">
										<strong class="txt-ti ellipsis">${LikeDTO.prod_name}</strong>
									</a> <input id="dawnSltdHisNo" name="dawnSltdHisNo" type="hidden"
										value="2" /> <input id="dawnSoldoutYn" name="dawnSoldoutYn"
										type="hidden" value="N" /> <span class="info"> <span
										class="txt-price"> <strong><em>${LikeDTO.price}</em>원</strong> <!-- 정상가가 혜택가보다 큰 경우 -->
									</span>
										<div class="probtn">
											<!-- 정상 -->
<!-- 											<button type="button" class="btn small orange"
												onclick="fnProductBasketAdd('01', 'S02209121900', '', '100411');">장바구니
												담기</button> -->
										</div>
									</span>
								</div>
							</li>

						    </c:forEach>
						</ul>
						<!-- 새벽배송 End -->

						<!-- e슈퍼 Start -->

						<!-- e슈퍼 End -->

						<!-- 이벤트 Start -->

						<!-- 이벤트 End -->
						<!-- pagination -->
						<div class="pagination">
							<a class="prev">이전</a> <span class="num"> <a
								href="javascript:fn_myLikeList(1);" class="active">1</a>
							</span> <a class="next">다음</a>

						</div>
						<!-- pagination -->
					</fieldset>
				</section>
			</div>

		</div>

		<!-- //contents -->

		<!-- footer// -->
		<jsp:include page="../Common/footer.jsp" />
		<!-- //footer -->

	</div>
</body>
</html>