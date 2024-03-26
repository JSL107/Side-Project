<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>더한섬닷컴 | THE HANDSOME.COM</title>
<link rel="shortcut icon" href="http://cdn.thehandsome.com/_ui/desktop/common/images/common/thehandsome_ic_16x16.ico">
<link rel="stylesheet" type="text/css" href="/resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="/resources/_ui/desktop/common/css/font_80.css" media="all">
<link rel="stylesheet" type="text/css" href="/resources/css/main_201903.css" media="all">
<link rel="stylesheet" type="text/css" href="/resources/_ui/desktop/common/css/jquery-ui.min.css" media="all">
<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="/resources/css/layout.css">
<link rel="stylesheet" type="text/css" href="/resources/css/product.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/brand.css">
<link rel="stylesheet" type="text/css" href="/resources/css/contents.css">
<link rel="stylesheet" type="text/css" href="/resources/css/popup.css">
<link rel="stylesheet" type="text/css" href="/resources/css/swiper.css">

<!-- 제이쿼리 cdn -->	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/_ui/desktop/common/js/handsome/ui.js?20211105"></script>
</head>
<body oncontextmenu="return false">
	<div id="headerWrap">
		<div class="header header_fixed header_main1903">
		<script>
			$(document).ready(function() {
		    
		    $('.gnb_nav.hscene1906 .cate_m .hscene').mouseover(function(){ // 툴팁
		        $('.gnb_nav.hscene1906 .cate_m li .delch_box').addClass('on');
		    });
		    $('.gnb_nav.hscene1906 .cate_m .hscene').mouseout(function(){
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
						</ul> <!-- clearfix end -->
					</div> <!-- brand_menu end -->
				
					<div class="util_menu" style="display:block;">
						<ul class="clearfix">
							<li><a href="/member/login/">로그인<!-- 로그인 --></a></li>
							<li class="header_dropmemu mypage">
									
								<a href="/member/mypage" class="btn">마이페이지</a>
								<div class="list" style="display: none; height: 164px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">
									<ul>
										<li><!-- 주문조회 -->
											<a href="#">주문조회</a>
										</li>
										<li><!-- 온라인등급 -->
											<a href="#">나의회원등급</a>
										</li>
										<li><!-- 쿠폰조회 -->
											<a href="#">쿠폰조회</a>
										</li>
										<li><!-- 포인트조회 -->
											<a href="#">마일리지조회</a>
										</li>
									    <li><!-- e-Gfit Card -->
									    	<a href="#">e-Gift Card</a>
								    	</li>
									    <li><!-- 회원정보변경 -->
									    	<a href="#">회원정보변경</a>
								    	</li>
										<li><!-- 온라인 상담 -->
											<a href="#">온라인상담</a>
										</li>
									</ul>
								</div>
							</li>
							
							<li>
								<div class="header_dropmemu lang_switch lang_1911">
								    <a href="#" class="btn" onclick="#">LANGUAGE</a>
									<div class="list" style="height: 87px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px; display: none;">
										<ul>
											<li><a href="#">한국어</a></li>
											<li><a href="#">ENGLISH</a></li>
											<li><a href="#">中文</a></li>
										</ul>
									</div>
								</div><!-- header_dropmemu end -->
							</li>
							
						</ul><!-- clearfix end -->
					</div>	<!-- util_menu end -->

				</div> <!-- top_nav_wrap end -->
			</div> <!-- top_nav end -->
			
			<div class="gnbwarp com clearfix">
				<h1 class="logo logo1903">
					<a href="/">thehandsome.com</a>
				</h1>
				<div class="gnb_nav gnb_nav1903 hscene1906 hscene1910">
					<h2 class="invisible">주메뉴</h2>
					<ul class="cate_m cate_banner gnbul1" id="cate_m_main">
						<li></li>
						<!-- 대분류_여성  -->
						<li>
							<a href="/product/list/we/" class="">여성<span class="arr">arrow</span></a>
							<div class="sub_back" style="height: 0px; border-bottom: 0px;">
								<div class="sub_menu clearfix" style="display: none;">
									<ul class="al_frt1 sm_dep1"
										style="margin-left: 165px; margin-bottom: 25px;">
										<li>
											<a href="/product/list/we/">전체보기<!-- 전체보기 --></a>
										</li>
										<li>
											<a href="/product/list/we01/">아우터</a>
											<ul class="clearfix sm_dep2">
												<li>
													<a href="/product/list/we011/">재킷</a>
												</li>
												<li>
													<a href="/product/list/we012/">점퍼</a>
												</li>
												<li>
													<a href="/product/list/we013/">가디건/베스트</a>
												</li>
							                    <li>
							                    	<a href="/product/list/we014/">트렌치 코트</a></li>
												<li>
													<a href="/product/list/we015/">코트</a>
												</li>
												<li>
													<a href="/product/list/we016/">다운/패딩</a>
												</li>
											</ul>
										</li>
										<li>
											<a href="/product/list/we02/">탑</a>
											<ul class="clearfix sm_dep2">
												<li>
													<a href="/product/list/we021/">티셔츠</a>
												</li>
												<li>
													<a href="/product/list/we022/">블라우스</a>
												</li>
												<li>
													<a href="/product/list/we023/">셔츠</a>
												</li>
												<li>
													<a href="/product/list/we024/">니트</a>
												</li>
											</ul>
										</li>
										<li>
											<a href="/product/list/we03/">드레스</a>
											<ul class="clearfix sm_dep2">
												<li>
													<a href="/product/list/we031/">미니 드레스</a>
												</li>
												<li>
													<a href="/product/list/we032/">미디 드레스</a>
												</li>
												<li>
													<a href="/product/list/we033/">롱/맥시 드레스</a>
												</li>
											</ul>
										</li>
										<li>
											<a href="/product/list/we04/">팬츠</a>
											<ul class="clearfix sm_dep2">
												<li>
													<a href="/product/list/we041/">캐주얼</a>
												</li>
												<li>
													<a href="/product/list/we042/">포멀</a>
												</li>
												<li>
													<a href="/product/list/we043/">데님</a>
												</li>
												<li>
													<a href="/product/list/we044/">쇼츠</a>
												</li>
											</ul>
										</li>
										<li style="margin-right: 0px">
											<a href="/product/list/we05/">스커트</a>
											<ul class="clearfix sm_dep2">
												<li>
													<a href="/product/list/we051/">미니 스커트</a>
												</li>
												<li>
													<a href="/product/list/we052/">펜슬 스커트</a>
												</li>
												<li>
													<a href="/product/list/we053/">플레어 스커트</a>
												</li>
												<li>
													<a href="/product/list/we054/">롱/맥시 스커트</a>
												</li>
											</ul>
										</li>
									</ul>
									<div class="gnb_banner float_right"></div>
								</div>
							</div>
						</li><!-- //대분류_여성 -->
						
						<!-- 대분류_남성 -->
						<li>
							<a href="/product/list/me/" class="">남성<span class="arr">arrow</span></a>
							
							<div class="sub_back" style="height: 0px; border-bottom: 0px;">
								<div class="sub_menu clearfix" style="display: none;">
									<ul class="al_frt1 sm_dep1"
										style="margin-left: 165px; margin-bottom: 25px;">
										<li>
											<a href="/product/list/me/">전체보기</a>
										</li>
										
										<li>
											<a href="/product/list/me01/">아우터</a>
											<ul class="clearfix sm_dep2">
												<li>
													<a href="/product/list/me011/">재킷</a>
												</li>
												<li>
													<a href="/product/list/me012/">점퍼</a>
												</li>
												<li>
													<a href="/product/list/me013/">가디건/베스트</a>
												</li>
												<li>
													<a href="/product/list/me014/">트렌치 코트</a>
												</li>
												<li>
													<a href="/product/list/me015/">코트</a>
												</li>
												<li>
													<a href="/product/list/me016/">다운/패딩</a>
												</li>
											</ul>
										</li>
										<li>
											<a href="/product/list/me02/">탑</a>
											<ul class="clearfix sm_dep2">
												<li>
													<a href="/product/list/me021/">티셔츠</a>
												</li>
												<li>
													<a href="/product/list/me022/">셔츠</a>
												</li>
												<li>
													<a href="/product/list/me023/">니트</a>
												</li>
												<li>
													<a href="/product/list/me024/">스웨터</a>
												</li>
											</ul>
										</li>
										<li>
											<a href="/product/list/me03/">팬츠</a>
											<ul class="clearfix sm_dep2">
												<li>
													<a href="/product/list/me031/">루즈/테이퍼드</a>
												</li>
												<li>
													<a href="/product/list/me032/">슬림/스트레이트</a>
												</li>
												<li>
													<a href="/product/list/me033/">조거/트랙</a>
												</li>
												<li>
													<a href="/product/list/me034/">데님</a>
												</li>
												<li>
													<a href="/product/list/me035/">쇼츠</a>
												</li>
											</ul>
										</li>
										<li>
											<a href="/product/list/me04/">수트</a>
											<ul class="clearfix sm_dep2">
												<li>
													<a href="/product/list/me041/">드레스 셔츠</a>
												</li>
												<li>
													<a href="/product/list/me042/">수트 재킷</a>
												</li>
												<li>
													<a href="/product/list/me043/">수트 팬츠</a>
												</li>
											</ul>
										</li>
									</ul>
									<div class="gnb_banner float_right"></div>
								</div>
							</div> 
						</li><!-- //대분류_남성 -->
							
						<!-- 대분류_잡화 -->	
						<li><a href="/product/list/as/" class="">잡화<span class="arr">arrow</span></a>
							<div class="sub_back" style="height: 0px; border-bottom: 0px;">
								<div class="sub_menu clearfix" style="display: none;">
									<ul class="al_frt1 sm_dep1"
										style="margin-left: 165px; float: right; margin-bottom: 25px;">
										<li>
											<a href="/product/list/as/">전체보기</a>
										</li>
										
										<li>
											<a href="/product/list/as01/">여성 슈즈</a>
											<ul class="clearfix sm_dep2">
												<li>
													<a href="/product/list/as011/">부츠</a>
												</li>
												<li>
													<a href="/product/list/as012/">로퍼/블로퍼</a>
												</li>
												<li>
													<a href="/product/list/as013/">스니커즈</a>
												</li>
												<li>
													<a href="/product/list/as014/">플랫</a>
												</li>
												<li>
													<a href="/product/list/as015/">힐/슬링백</a>
												</li>
												<li>
													<a href="/product/list/as016/">샌들/슬라이드</a>
												</li>
												<li>
													<a href="/product/list/as017/">기타 슈즈</a>
												</li>
											</ul>
										</li>
										<li>
											<a href="/product/list/as02/">남성 슈즈</a>
											<ul class="clearfix sm_dep2">
												<li>
													<a href="/product/list/as021/">부츠</a>
												</li>
												<li>
													<a href="/product/list/as022/">포멀 슈즈</a>
												</li>
												<li>
													<a href="/product/list/as023/">스니커즈</a>
												</li>
												<li>
													<a href="/product/list/as024/">샌들/슬라이드</a>
												</li>
												<li>
													<a href="/product/list/as025/">기타 슈즈</a>
												</li>
											</ul>
										</li>
										<li>
											<a href="/product/list/as03/">여성백</a>
											<ul class="clearfix sm_dep2">
												<li>
													<a href="/product/list/as031/">토트백</a>
												</li>
												<li>
													<a href="/product/list/as032/">숄더/크로스바디백</a>
												</li>
												<li>
													<a href="/product/list/as033/">기타 백</a>
												</li>
											</ul>
										</li>
										<li>
											<a href="/product/list/as04/">남성백</a>
											<ul class="clearfix sm_dep2">
												<li>
													<a href="/product/list/as041/">토트백</a>
												</li>
												<li>
													<a href="/product/list/as042/">숄더/크로스바디백</a>
												</li>
												<li>
													<a href="/product/list/as043/">클러치 백</a>
												</li>
												<li>
													<a href="/product/list/as044/">기타 백</a>
												</li>
											</ul>
										</li>
										<li>
											<a href="/product/list/as05/">머플러/스카프</a>
											<ul class="clearfix sm_dep2">
												<li>
													<a href="/product/list/as051/">머플러</a>
												</li>
												<li>
													<a href="/product/list/as052/">스카프</a>
												</li>
											</ul>
										</li>
										<li>
											<a href="/product/list/as06/">주얼리</a>
											<ul class="clearfix sm_dep2">
												<li>
													<a href="/product/list/as061/">이어링/커프</a>
												</li>
												<li>
													<a href="/product/list/as062/">목걸이</a>
												</li>
												<li>
													<a href="/product/list/as063/">팔찌</a>
												</li>
												<li>
													<a href="/product/list/as064/">반지</a>
												</li>
												<li>
													<a href="/product/list/as065/">기타 주얼리</a>
												</li>
											</ul>
										</li>
										<li>
											<a href="/product/list/as07/">기타 ACC</a>
											<ul class="clearfix sm_dep2">
												<li>
													<a href="/product/list/as071/">모자</a>
												</li>
												<li>
													<a href="/product/list/as072/">양말</a>
												</li>
												<li>
													<a href="/product/list/as073/">장갑</a>
												</li>
												<li>
													<a href="/product/list/as074/">벨트</a>
												</li>
												<li>
													<a href="/product/list/as075/">지갑</a>
												</li>
												<li>
													<a href="/product/list/as076/">헤어 ACC</a>
												</li>
												<li>
													<a href="/product/list/as077/">테크 ACC</a>
												</li>
												<li>
													<a href="/product/list/as078/">기타 소품</a>
												</li>
											</ul>
										</li>
									</ul>
									<div class="gnb_banner float_right"></div>
								</div>
							</div>
							</li><!-- //대분류_잡화 -->	
					</ul>
				</div>

				<div id="transparent_mask" style="display: none;"></div>
				<div class="util_menu util_menu1803">
					<ul class="clearfix">
						<li>
							<a href="#"><span class="ico_sh">search</span></a></li>
						<li>
							<a href="#"><span class="ico wishlist">wish list</span> 
								<span class="count">
									(<span id="wishlistCount">0</span>)
								</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="ico cart">장바구니</span> 
								<span class="count">
									(<span id="cartCount">0</span>)
								</span>
							</a>
						</li>
					</ul>
				</div>
			</div>

		</div> <!-- header end -->
	</div> <!-- headerWrap end -->
	
	
