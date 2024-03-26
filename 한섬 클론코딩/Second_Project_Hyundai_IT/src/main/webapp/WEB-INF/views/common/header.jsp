<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>더한섬닷컴 | THE HANDSOME.COM</title>
<link rel="shortcut icon"
	href="http://cdn.thehandsome.com/_ui/desktop/common/images/common/thehandsome_ic_16x16.ico">
<link rel="stylesheet" type="text/css" href="/resources/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/_ui/desktop/common/css/font_80.css" media="all">
<link rel="stylesheet" type="text/css"
	href="/resources/css/main_201903.css" media="all">
<link rel="stylesheet" type="text/css"
	href="/resources/_ui/desktop/common/css/jquery-ui.min.css" media="all">
<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="/resources/css/layout.css">
<link rel="stylesheet" type="text/css" href="/resources/css/product.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/brand.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/contents.css">
<link rel="stylesheet" type="text/css" href="/resources/css/popup.css">
<link rel="stylesheet" type="text/css" href="/resources/css/swiper.css">

<!-- 제이쿼리 cdn -->
<script type="text/javascript"
	src="../../../resources/_ui/desktop/common/js/handsome/common.js"></script>
<script type="text/javascript"
	src="../../../resources/_ui/desktop/common/js/handsome/html5shiv-printshiv.js"></script>
<script type="text/javascript"
	src="../../../resources/_ui/desktop/common/js/handsome/jquery.bxslider.min.js"></script>
<script type="text/javascript"
	src="../../../resources/_ui/desktop/common/js/handsome/jquery.flexslider.js"></script>
<script type="text/javascript"
	src="../../../resources/_ui/desktop/common/js/handsome/ui.js"></script>

<script type="text/javascript"
	src="../../../resources/_ui/desktop/common/js/common_function.js"></script>
<script type="text/javascript"
	src="../../../resources/_ui/desktop/common/js/instagramAPI.js"></script>
<script type="text/javascript"
	src="../../../resources/_ui/desktop/common/js/jquery.form-3.51.js"></script>
<script type="text/javascript"
	src="../../../resources/_ui/desktop/common/js/jquery.vticker.js"></script>
<script type="text/javascript"
	src="../../../resources/_ui/desktop/common/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript"
	src="../../../resources/_ui/desktop/common/js/jquery-ui-1.11.2.min.js"></script>
<script type="text/javascript"
	src="../../../resources/_ui/desktop/common/js/makePCookie.js"></script>
<script type="text/javascript"
	src="../../../resources/_ui/desktop/common/js/netfunnel.js"></script>
<script type="text/javascript"
	src="../../../resources/_ui/desktop/common/js/netfunnel_skin.js"></script>
<script type="text/javascript"
	src="../../../resources/_ui/desktop/common/js/SsoAjax.js"></script>
<script type="text/javascript"
	src="../../../resources/_ui/desktop/common/js/swiper.min.js"></script>
<script type="text/javascript"
	src="../../../resources/_ui/desktop/common/js/unorm.js"></script>
<script type="text/javascript"
	src="../../../resources/_ui/desktop/common/js/videojs-ie8.min.js"></script>

<script type="text/javascript"
	src="../../../resources/_ui/desktop/common/js/wisenut/ark/js/ark.js"></script>
<script type="text/javascript"
	src="../../../resources/_ui/desktop/common/js/wisenut/ark/js/beta.fix.js"></script>
<script type="text/javascript"
	src="../../../resources/_ui/desktop/common/js/wisenut/js/jquery.min.js"></script>
<script type="text/javascript"
	src="../../../resources/_ui/desktop/common/js/wisenut/js/search.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="/resources/_ui/desktop/common/js/handsome/ui.js?20211105"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body oncontextmenu="return false">
	<div id="headerWrap">
		<div class="header header_fixed header_main1903">
			<script>
            $(document).ready(function () {

                $('.gnb_nav.hscene1906 .cate_m .hscene').mouseover(function () { // 툴팁
                    $('.gnb_nav.hscene1906 .cate_m li .delch_box').addClass('on');
                });
                $('.gnb_nav.hscene1906 .cate_m .hscene').mouseout(function () {
                    $('.gnb_nav.hscene1906 .cate_m li .delch_box').removeClass('on');
                });
        </script>
			<div class="top_nav topnav1903">
				<div class="top_nav_wrap clearfix">
					<!-- before -->
					<div class="brand_menu brandMenu1903">
						<ul class="clearfix">
							<!-- 선호 브랜드 없음 -->
							<li><span class="on"><a href="/">HOME</a></span></li>
						</ul>
						<!-- clearfix end -->
					</div>
					<!-- brand_menu end -->

					<div class="util_menu" style="display: block;">
						<ul class="clearfix">
							<sec:authorize access="isAnonymous()">
								<li><a id="login" href="/member/login/">로그인<!-- 로그인 --></a></li>
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<li><a href="/admin/main">관리자 페이지</a></li>
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
								<li><a href="javascript:logoutAction();">로그아웃</a></li>
								<form id='logoutAction' action="/member/logout" method='post'>
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" id="token" />
								</form>
							</sec:authorize>

							<li class="header_dropmemu mypage"><a href="/member/mypage"
								class="btn">마이페이지</a>
								<div class="list"
									style="display: none; height: 164px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">
									<ul>
										<li>
											<!-- 주문조회 --> <a href="#">주문조회</a>
										</li>
										<li>
											<!-- 온라인등급 --> <a href="#">나의회원등급</a>
										</li>
										<li>
											<!-- 쿠폰조회 --> <a href="#">쿠폰조회</a>
										</li>
										<li>
											<!-- 포인트조회 --> <a href="#">마일리지조회</a>
										</li>
										<li>
											<!-- e-Gfit Card --> <a href="#">e-Gift Card</a>
										</li>
										<li>
											<!-- 회원정보변경 --> <a href="#">회원정보변경</a>
										</li>
										<li>
											<!-- 온라인 상담 --> <a href="#">온라인상담</a>
										</li>
									</ul>
								</div></li>

							<li class="header_dropmemu mypage"><a
								href="/event/eventlist" class="btn">이벤트</a></li>

							<li class="header_dropmemu mypage"><a href="/qna/qnaMain"
								class="btn">고객센터</a></li>

							<li>
								<div class="header_dropmemu lang_switch lang_1911">
									<a href="#" class="btn" onclick="#">LANGUAGE</a>
									<div class="list"
										style="height: 87px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px; display: none;">
										<ul>
											<li><a href="#">한국어</a></li>
											<li><a href="#">ENGLISH</a></li>
											<li><a href="#">中文</a></li>
										</ul>
									</div>
								</div> <!-- header_dropmemu end -->
							</li>

						</ul>
						<!-- clearfix end -->
					</div>
					<!-- util_menu end -->

				</div>
				<!-- top_nav_wrap end -->
			</div>
			<!-- top_nav end -->

			<div class="gnbwarp com clearfix">
				<h1 class="logo logo1903">
					<a href="/">thehandsome.com</a>
				</h1>
				<div class="gnb_nav gnb_nav1903 hscene1906 hscene1910">
					<h2 class="invisible">주메뉴</h2>
					<ul class="cate_m cate_banner gnbul1" id="cate_m_main">
						<li></li>
						<!-- 브랜드 -->
						<li><a href="/list?clarge=여성&cmedium=&csmall=" class="">브랜드<span
								class="arr">arrow</span></a>
							<div class="sub_back" style="height: 0px; border-bottom: 0px;">
								<div class="sub_menu clearfix" style="display: none;">
									<ul class="al_frt1 sm_dep1"
										style="margin-left: 165px; margin-bottom: 25px;">
										<li>
											<!-- <a href="/list?clarge=여성&cmedium=&csmall=">전체보기전체보기</a> -->
										</li>
										<li>
											<!-- <a href="/list?clarge=여성&cmedium=아우터&csmall=">아우터</a> -->
											<ul class="clearfix sm_dep2">
												<li><a href="/listBrand?bname=3.1 Phillip Lim">3.1
														Phillip Lim</a></li>
												<li><a href="/listBrand?bname=BALLY">BALLY</a></li>
												<li><a href="/listBrand?bname=CLUB MONACO">CLUB
														MONACO</a></li>
												<li><a href="/listBrand?bname=FOURM MEN'S LOUNGE">FOURM
														MEN'S LOUNGE</a></li>
												<li><a href="/listBrand?bname=FOURM STUDIO">FOURM
														STUDIO</a></li>
												<li><a href="/listBrand?bname=FOURM THE STORE">FOURM
														THE STORE</a></li>
												<li><a href="/listBrand?bname=ROCHAS">ROCHAS</a></li>
											</ul>
										</li>
										<li>
											<!-- <a href="/list?clarge=여성&cmedium=탑&csmall=">탑</a> -->
											<ul class="clearfix sm_dep2">
												<li><a href="/listBrand?bname=H : SCENE">H : SCENE</a>
												</li>
												<li><a href="/listBrand?bname=LANVIN COLLECTION">LANVIN
														COLLECTION</a></li>
												<li><a href="/listBrand?bname=LANVIN PARIS">LANVIN
														PARIS</a></li>
												<li><a href="/listBrand?bname=MINE">MINE</a></li>
												<li><a href="/listBrand?bname=MUE">MUE</a></li>
												<li><a href="/listBrand?bname=O'2nd">O'2nd</a></li>
												<li><a href="/listBrand?bname=OBZEE">OBZEE</a></li>
											</ul>
										</li>
										<li>
											<!-- <a href="/list?clarge=여성&cmedium=드레스&csmall=">드레스</a> -->
											<ul class="clearfix sm_dep2">
												<li><a href="/listBrand?bname=SJSJ">SJSJ</a></li>
												<li><a href="/listBrand?bname=SYSTEM">SYSTEM</a></li>
												<li><a href="/listBrand?bname=SYSTEM HOMME">SYSTEM
														HOMME</a></li>
												<li><a href="/listBrand?bname=the CASHMERE">the
														CASHMERE</a></li>
												<li><a href="/listBrand?bname=TIME">TIME</a></li>
												<li><a href="/listBrand?bname=TIME HOMME">TIME
														HOMME</a></li>
												<li><a href="/listBrand?bname=TOM GREYHOUND">TOM
														GREYHOUND</a></li>
											</ul>
										</li>
										<!--  <li><a href="/list?clarge=여성&cmedium=팬츠&csmall=">팬츠</a>
                                        <ul class="clearfix sm_dep2">
                                            <li><a href="/list?clarge=여성&cmedium=팬츠&csmall=캐주얼">캐주얼</a>
                                            </li>
                                            <li><a href="/list?clarge=여성&cmedium=팬츠&csmall=포멀">포멀</a>
                                            </li>
                                            <li><a href="/list?clarge=여성&cmedium=팬츠&csmall=데님">데님</a>
                                            </li>
                                            <li><a href="/list?clarge=여성&cmedium=팬츠&csmall=쇼츠">쇼츠</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li style="margin-right: 0px"><a
                                            href="/list?clarge=여성&cmedium=스커트&csmall=">스커트</a>
                                        <ul class="clearfix sm_dep2">
                                            <li><a href="/list?clarge=여성&cmedium=스커트&csmall=미니 스커트">미니
                                                스커트</a></li>
                                            <li><a href="/list?clarge=여성&cmedium=스커트&csmall=펜슬 스커트">펜슬
                                                스커트</a></li>
                                            <li><a
                                                    href="/list?clarge=여성&cmedium=스커트&csmall=플레어 스커트">플레어
                                                스커트</a></li>
                                            <li><a
                                                    href="/list?clarge=여성&cmedium=스커트&csmall=롱/맥시 스커트">롱/맥시
                                                스커트</a></li>
                                        </ul>
                                    </li> -->
									</ul>
									<div class="gnb_banner float_right"></div>
								</div>
							</div></li>
						<!-- //브랜드 -->

						<!-- 대분류_여성  -->
						<li><a href="/list?clarge=여성&cmedium=&csmall=" class="">여성<span
								class="arr">arrow</span></a>
							<div class="sub_back" style="height: 0px; border-bottom: 0px;">
								<div class="sub_menu clearfix" style="display: none;">
									<ul class="al_frt1 sm_dep1"
										style="margin-left: 165px; margin-bottom: 25px;">
										<li><a href="/list?clarge=여성&cmedium=&csmall=">전체보기<!-- 전체보기 --></a>
										</li>
										<li><a href="/list?clarge=여성&cmedium=아우터&csmall=">아우터</a>
											<ul class="clearfix sm_dep2">
												<li><a href="/list?clarge=여성&cmedium=아우터&csmall=재킷">재킷</a>
												</li>
												<li><a href="/list?clarge=여성&cmedium=아우터&csmall=점퍼">점퍼</a>
												</li>
												<li><a
													href="/list?clarge=여성&cmedium=아우터&csmall=가디건/베스트">가디건/베스트</a>
												</li>
												<li><a href="/list?clarge=여성&cmedium=아우터&csmall=트렌치 코트">트렌치
														코트</a></li>
												<li><a href="/list?clarge=여성&cmedium=아우터&csmall=코트">코트</a>
												</li>
												<li><a href="/list?clarge=여성&cmedium=아우터&csmall=다운/패딩">다운/패딩</a>
												</li>
											</ul></li>
										<li><a href="/list?clarge=여성&cmedium=탑&csmall=">탑</a>
											<ul class="clearfix sm_dep2">
												<li><a href="/list?clarge=여성&cmedium=탑&csmall=티셔츠">티셔츠</a>
												</li>
												<li><a href="/list?clarge=여성&cmedium=탑&csmall=블라우스">블라우스</a>
												</li>
												<li><a href="/list?clarge=여성&cmedium=탑&csmall=셔츠">셔츠</a>
												</li>
												<li><a href="/list?clarge=여성&cmedium=탑&csmall=니트">니트</a>
												</li>
											</ul></li>
										<li><a href="/list?clarge=여성&cmedium=드레스&csmall=">드레스</a>
											<ul class="clearfix sm_dep2">
												<li><a href="/list?clarge=여성&cmedium=드레스&csmall=미니 드레스">미니
														드레스</a></li>
												<li><a href="/list?clarge=여성&cmedium=드레스&csmall=미디 드레스">미디
														드레스</a></li>
												<li><a
													href="/list?clarge=여성&cmedium=드레스&csmall=롱/맥시 드레스">롱/맥시
														드레스</a></li>
											</ul></li>
										<li><a href="/list?clarge=여성&cmedium=팬츠&csmall=">팬츠</a>
											<ul class="clearfix sm_dep2">
												<li><a href="/list?clarge=여성&cmedium=팬츠&csmall=캐주얼">캐주얼</a>
												</li>
												<li><a href="/list?clarge=여성&cmedium=팬츠&csmall=포멀">포멀</a>
												</li>
												<li><a href="/list?clarge=여성&cmedium=팬츠&csmall=데님">데님</a>
												</li>
												<li><a href="/list?clarge=여성&cmedium=팬츠&csmall=쇼츠">쇼츠</a>
												</li>
											</ul></li>
										<li style="margin-right: 0px"><a
											href="/list?clarge=여성&cmedium=스커트&csmall=">스커트</a>
											<ul class="clearfix sm_dep2">
												<li><a href="/list?clarge=여성&cmedium=스커트&csmall=미니 스커트">미니
														스커트</a></li>
												<li><a href="/list?clarge=여성&cmedium=스커트&csmall=펜슬 스커트">펜슬
														스커트</a></li>
												<li><a
													href="/list?clarge=여성&cmedium=스커트&csmall=플레어 스커트">플레어
														스커트</a></li>
												<li><a
													href="/list?clarge=여성&cmedium=스커트&csmall=롱/맥시 스커트">롱/맥시
														스커트</a></li>
											</ul></li>
									</ul>
									<div class="gnb_banner float_right"></div>
								</div>
							</div></li>
						<!-- //대분류_여성 -->

						<!-- 대분류_남성 -->
						<li><a href="/list?clarge=남성&cmedium=&csmall=" class="">남성<span
								class="arr">arrow</span></a>

							<div class="sub_back" style="height: 0px; border-bottom: 0px;">
								<div class="sub_menu clearfix" style="display: none;">
									<ul class="al_frt1 sm_dep1"
										style="margin-left: 165px; margin-bottom: 25px;">
										<li><a href="/list?clarge=남성&cmedium=&csmall=">전체보기</a></li>

										<li><a href="/list?clarge=남성&cmedium=아우터&csmall=">아우터</a>
											<ul class="clearfix sm_dep2">
												<li><a href="/list?clarge=남성&cmedium=아우터&csmall=재킷">재킷</a>
												</li>
												<li><a href="/list?clarge=남성&cmedium=아우터&csmall=점퍼">점퍼</a>
												</li>
												<li><a
													href="/list?clarge=남성&cmedium=아우터&csmall=가디건/베스트">가디건/베스트</a>
												</li>
												<li><a href="/list?clarge=남성&cmedium=아우터&csmall=트렌치코트">트렌치코트</a>
												</li>
												<li><a href="/list?clarge=남성&cmedium=아우터&csmall=코트">코트</a>
												</li>
												<li><a href="/list?clarge=남성&cmedium=아우터&csmall=다운/패딩">다운/패딩</a>
												</li>
											</ul></li>
										<li><a href="/list?clarge=남성&cmedium=탑&csmall=">탑</a>
											<ul class="clearfix sm_dep2">
												<li><a href="/list?clarge=남성&cmedium=탑&csmall=티셔츠">티셔츠</a>
												</li>
												<li><a href="/list?clarge=남성&cmedium=탑&csmall=셔츠">셔츠</a>
												</li>
												<li><a href="/list?clarge=남성&cmedium=탑&csmall=니트">니트</a>
												</li>
												<li><a href="/list?clarge=남성&cmedium=탑&csmall=스웨터">스웨터</a>
												</li>
											</ul></li>
										<li><a href="/list?clarge=남성&cmedium=팬츠&csmall=">팬츠</a>
											<ul class="clearfix sm_dep2">
												<li><a href="/list?clarge=남성&cmedium=팬츠&csmall=루즈/테이퍼드">루즈/테이퍼드</a>
												</li>
												<li><a
													href="/list?clarge=남성&cmedium=팬츠&csmall=슬림/스트레이트">슬림/스트레이트</a>
												</li>
												<li><a href="/list?clarge=남성&cmedium=팬츠&csmall=조거/트랙">조거/트랙</a>
												</li>
												<li><a href="/list?clarge=남성&cmedium=팬츠&csmall=데님">데님</a>
												</li>
												<li><a href="/list?clarge=남성&cmedium=팬츠&csmall=쇼츠">쇼츠</a>
												</li>
											</ul></li>
										<li><a href="/list?clarge=남성&cmedium=수트&csmall=">수트</a>
											<ul class="clearfix sm_dep2">
												<li><a href="/list?clarge=남성&cmedium=수트&csmall=드레스셔츠">드레스셔츠</a>
												</li>
												<li><a href="/list?clarge=남성&cmedium=수트&csmall=수트재킷">수트재킷</a>
												</li>
												<li><a href="/list?clarge=남성&cmedium=수트&csmall=수트팬츠">수트팬츠</a>
												</li>
											</ul></li>
									</ul>
									<div class="gnb_banner float_right"></div>
								</div>
							</div></li>
						<!-- //대분류_남성 -->

						<!-- 대분류_잡화 -->
						<li><a href="/list?clarge=잡화&cmedium=&csmall=" class="">잡화<span
								class="arr">arrow</span></a>
							<div class="sub_back" style="height: 0px; border-bottom: 0px;">
								<div class="sub_menu clearfix" style="display: none;">
									<ul class="al_frt1 sm_dep1"
										style="margin-left: 165px; float: right; margin-bottom: 25px;">
										<li><a href="/list?clarge=잡화&cmedium=&csmall=">전체보기</a></li>

										<li><a href="/list?clarge=잡화&cmedium=여성슈즈&csmall=">여성슈즈</a>
											<ul class="clearfix sm_dep2">
												<li><a href="/list?clarge=잡화&cmedium=여성슈즈&csmall=부츠">부츠</a>
												</li>
												<li><a
													href="/list?clarge=잡화&cmedium=여성슈즈&csmall=로퍼/블로퍼">로퍼/블로퍼</a>
												</li>
												<li><a href="/list?clarge=잡화&cmedium=여성슈즈&csmall=스니커즈">스니커즈</a>
												</li>
												<li><a href="/list?clarge=잡화&cmedium=여성슈즈&csmall=플랫">플랫</a>
												</li>
												<li><a href="/list?clarge=잡화&cmedium=여성슈즈&csmall=힐/슬링백">힐/슬링백</a>
												</li>
												<li><a
													href="/list?clarge=잡화&cmedium=여성슈즈&csmall=샌들/슬라이드">샌들/슬라이드</a>
												</li>
												<li><a href="/list?clarge=잡화&cmedium=여성슈즈&csmall=기타 슈즈">기타
														슈즈</a></li>
											</ul></li>
										<li><a href="/list?clarge=잡화&cmedium=남성슈즈&csmall=">남성슈즈</a>
											<ul class="clearfix sm_dep2">
												<li><a href="/list?clarge=잡화&cmedium=남성슈즈&csmall=부츠">부츠</a>
												</li>
												<li><a href="/list?clarge=잡화&cmedium=남성슈즈&csmall=포멀슈즈">포멀슈즈</a>
												</li>
												<li><a href="/list?clarge=잡화&cmedium=남성슈즈&csmall=스니커즈">스니커즈</a>
												</li>
												<li><a
													href="/list?clarge=잡화&cmedium=남성슈즈&csmall=샌들/슬라이드">샌들/슬라이드</a>
												</li>
												<li><a href="/list?clarge=잡화&cmedium=남성슈즈&csmall=기타 슈즈">기타
														슈즈</a></li>
											</ul></li>
										<li><a href="/list?clarge=잡화&cmedium=여성백&csmall=">여성백</a>
											<ul class="clearfix sm_dep2">
												<li><a href="/list?clarge=잡화&cmedium=여성백&csmall=토트백">토트백</a>
												</li>
												<li><a
													href="/list?clarge=잡화&cmedium=여성백&csmall=숄더/크로스바디백">숄더/크로스바디백</a>
												</li>
												<li><a href="/list?clarge=잡화&cmedium=여성백&csmall=기타 백">기타
														백</a></li>
											</ul></li>
										<li><a href="/list?clarge=잡화&cmedium=남성백&csmall=">남성백</a>
											<ul class="clearfix sm_dep2">
												<li><a href="/list?clarge=잡화&cmedium=남성백&csmall=토트백">토트백</a>
												</li>
												<li><a
													href="/list?clarge=잡화&cmedium=남성백&csmall=숄더/크로스바디백">숄더/크로스바디백</a>
												</li>
												<li><a href="/list?clarge=잡화&cmedium=남성백&csmall=클러치 백">클러치
														백</a></li>
												<li><a href="/list?clarge=잡화&cmedium=남성백&csmall=기타 백">기타
														백</a></li>
											</ul></li>
										<li><a href="/list?clarge=잡화&cmedium=머플러/스카프&csmall=">머플러/스카프</a>
											<ul class="clearfix sm_dep2">
												<li><a
													href="/list?clarge=잡화&cmedium=머플러/스카프&csmall=머플러">머플러</a></li>
												<li><a
													href="/list?clarge=잡화&cmedium=머플러/스카프&csmall=스카프">스카프</a></li>
											</ul></li>
										<li><a href="/list?clarge=잡화&cmedium=주얼리&csmall=">주얼리</a>
											<ul class="clearfix sm_dep2">
												<li><a href="/list?clarge=잡화&cmedium=주얼리&csmall=이어링/커프">이어링/커프</a>
												</li>
												<li><a href="/list?clarge=잡화&cmedium=주얼리&csmall=목걸이">목걸이</a>
												</li>
												<li><a href="/list?clarge=잡화&cmedium=주얼리&csmall=팔찌">팔찌</a>
												</li>
												<li><a href="/list?clarge=잡화&cmedium=주얼리&csmall=반지">반지</a>
												</li>
												<li><a href="/list?clarge=잡화&cmedium=주얼리&csmall=기타 주얼리">기타
														주얼리</a></li>
											</ul></li>
										<li><a href="/list?clarge=잡화&cmedium=기타 ACC&csmall=">기타
												ACC</a>
											<ul class="clearfix sm_dep2">
												<li><a href="/list?clarge=잡화&cmedium=기타 ACC&csmall=모자">모자</a>
												</li>
												<li><a href="/list?clarge=잡화&cmedium=기타 ACC&csmall=양말">양말</a>
												</li>
												<li><a href="/list?clarge=잡화&cmedium=기타 ACC&csmall=장갑">장갑</a>
												</li>
												<li><a href="/list?clarge=잡화&cmedium=기타 ACC&csmall=벨트">벨트</a>
												</li>
												<li><a href="/list?clarge=잡화&cmedium=기타 ACC&csmall=지갑">지갑</a>
												</li>
												<li><a
													href="/list?clarge=잡화&cmedium=기타 ACC&csmall=헤어ACC">헤어ACC</a>
												</li>
												<li><a
													href="/list?clarge=잡화&cmedium=기타 ACC&csmall=테크ACC">테크ACC</a>
												</li>
												<li><a
													href="/list?clarge=잡화&cmedium=기타 ACC&csmall=기타소품">기타소품</a>
												</li>
											</ul></li>
									</ul>
									<div class="gnb_banner float_right"></div>
								</div>
							</div></li>
						<!-- //대분류_잡화 -->
					</ul>
				</div>

				<div id="transparent_mask" style="display: none;"></div>
				<div class="util_menu util_menu1803">
					<ul class="clearfix">
						<li><a href="#"><span class="ico_sh">search</span></a></li>
						<li><a href="#"><span class="ico wishlist">wish
									list</span> <span class="count"> (<span id="wishlistCount">0</span>)
							</span> </a></li>
						<li><sec:authorize access="isAnonymous()">
								<a href="/member/login/"> <span class="ico cart">장바구니</span>
									<span class="count"> (<span id="cartCount">0</span>)
								</span>
								</a>
							</sec:authorize> <!-- 세션에 값이 있으면 ~님 환영합니다 출력 하고 로그아웃리으 출력 --> <sec:authorize
								access="isAuthenticated()">
								<a href="/cart/cartList"> <span class="ico cart">장바구니</span>
									<span class="count"> (<span id="cartCount">0</span>)
								</span>
								</a>
							</sec:authorize></li>
					</ul>
				</div>
			</div>

		</div>
		<!-- header end -->
	</div>
	<!-- headerWrap end -->

	<script>

	function logoutAction(){
		$("#logoutAction").submit();
	}
	console.log(document.getByElementId("token").value);
</script>