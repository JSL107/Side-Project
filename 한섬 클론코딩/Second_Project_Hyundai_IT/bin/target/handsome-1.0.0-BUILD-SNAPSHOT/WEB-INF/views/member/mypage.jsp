<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>더한섬닷컴</title>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/font_443.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/layout.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/brand.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/contents.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/jquery-ui.min.css">

</head>
<body oncontextmenu="return false" onload=haveData()>

	<div id="headerWrap">
		<div class="header header_fixed header_main1903">
			<div class="top_nav topnav1903">
				<div class="top_nav_wrap clearfix">
					<div class="brand_menu brand_menu1903">
						<ul class="clearfix">
							<!-- 선호 브랜드 없음 -->
							<li><span class="on"><a href="/ko/main"
									onclick="GA_Event('공통','탑_네비게이션','HOME')">HOME</a></span></li>
							<!-- 로그인 상태 -->
							<p class="brand_menu_guide_text">
								아래 '브랜드' 메뉴에서 좋아하는 브랜드를 <span
									style="margin-top: -1px; display: inline-block;">♥</span>해주세요
							</p>
							<!-- 비로그인 상태 -->
						</ul>
					</div>

					<!-- 201705 search_box_wrap -->
					<div class="search_box_wrap sbw1803" id="searchBox">
						<form name="search" id="search" action="/ko/hssearch/searchCount"
							method="post" onsubmit="return false;">
							<input type="hidden" name="CSRFToken"
								value="cf2a1161-b9fe-41fd-9a62-3a45b83b7b2a"> <input
								type="hidden" name="searchwords" value=""> <input
								type="hidden" name="startCount" value=""> <input
								type="hidden" name="mode" value=""> <input type="hidden"
								name="sort" value=""> <input type="hidden"
								name="collection" value=""> <input type="hidden"
								name="range" value=""> <input type="hidden"
								name="startDate" value=""> <input type="hidden"
								name="endDate" value=""> <input type="hidden"
								name="searchField" value=""> <input type="hidden"
								name="reQuery"> <input type="hidden" id="prefixQuery"
								value=""> <input type="hidden" id="identity"
								name="identity" value=""> <input type="hidden"
								id="realQuery" name="realQuery" value=""> <input
								type="hidden" id="loginState" value="loginOn"> <input
								type="hidden" id="athomeInfo" value=""> <input
								type="hidden" id="selectedLang" name="selectedLang"
								value="product_ko"> <input type="hidden" id="lang"
								name="lang" value="ko"> <input type="hidden"
								id="brandPageGubun" name="brandPageGubun" value="off">
							<!-- 브랜드 페이지 여부 -->
							<input type="hidden" id="brand_img" name="brand_img" value="">
							<input type="hidden" id="brand_url" name="brand_url" value="">
							<div class="search_box">
								<label for="query" class="hidden">search</label> <input
									type="search" id="query" name="query" value=""
									onkeypress="javascript:pressCheck((event),this);"
									style="margin-top: 0.2px;" autocomplete="off"> <span
									class="placeholder"></span> <a href="javascript:void(0);"><span
									class="btn_close">닫기</span></a> <a
									href="javascript:GA_search();doSearch();" class="search"><span
									class="ico">검색</span></a>
							</div>
						</form>

						<!--// tab 검색어 입력 전 -->
						<!-- 검색어 입력 후 (검색어 자동완성) -->
						<div class="search_autocomplete">
							<div class="autocomplete_txt">
								<div id="brandView">
									<ul>
									</ul>
								</div>
								<div id="ark" style="height: 170px;">
									<div class="ark_wrap" id="ark_wrap" style="display: none;">
										<ul id="ark_content_list"></ul>
									</div>
								</div>
							</div>
							<div class="autocomplete_right">
								<div class="category_brand">
									<p>카테고리/브랜드</p>
									<div class="brand">
										<p id="autocomplete_brand">브랜드</p>
									</div>
									<div class="category">
										<p id="autocomplete_category">카테고리</p>
									</div>
								</div>
								<div class="autocomplete_img">
									<p>
										<span>"<span id="autocomplete_query">{0}</span>"
										</span>에 대한 주요 검색 결과
									</p>
									<!--                                     <p><span>"<span id="autocomplete_query"></span>&#32;"</span>에 대한 주요 검색 결과</p> -->
									<ul id="auto2">
									</ul>
								</div>
							</div>
						</div>
						<!--// 검색어 입력 후 (검색어 자동완성) -->
					</div>
					<!--//검색박스 활성화 data_react -->
				</div>

			</div>
		</div>

		<div class="gnbwarp new201608 clearfix">
			<h1 class="logo logo1903">
				<a href="/ko/main" onclick="GA_Event('공통', '로고', '상단');">thehandsome.com</a>
			</h1>
			<!-- 첫번째 c:if -->


			<div id="transparent_mask"></div>
			<!-- 201803 util menu -->
			<div class="util_menu util_menu1803">
				<ul class="clearfix">
					<li><a href="javascript:void(0);"><span class="ico_sh">search</span></a></li>
					<li><a href="/ko/mypage/myWish"
						onclick="GA_Event('공통','유틸_메뉴','위시리스트');"><span
							class="ico wishlist">wish list</span> <span class="count">(<span
								id="wishlistCount">0</span>)
						</span></a></li>
					<li><a href="/ko/shoppingbag"
						onclick="GA_Event('공통','유틸_메뉴','쇼핑백');"><span class="ico cart">장바구니</span>
							<span class="count">(<span id="cartCount">0</span>)
						</span></a></li>
				</ul>
			</div>
		</div>
		<!-- //201803 util menu -->
	</div>
	<!-- //headerWrap -->

	<div id="bodyWrap">
		<h3 class="cnts_title">
			<span id="menuTitle">마이페이지</span>
		</h3>
		<div class=""
			style="position: relative; width: 834px; height: 0; display: block; left: 50%; margin-left: -338px;">
			<div class="delch_box tooltip1907" id="store_delbox"
				style="display: none;">
				<span class="arr">위치아이콘</span> 작성 가능한 상품평 확인하시고,<br> 상품평 작성해서
				추가 마일리지 적립하세요.
			</div>
		</div>
		<div class="sub_container">
			<!-- lnb -->
			<div class="lnb_wrap">
				<h4>
					<a href="/member/mypage">마이페이지<!-- 마이페이지 --></a>
				</h4>
				<%--  TODO :: 후에 링크 변경--%>
				<div class="lnb">
					<dl>
						<dt>주문조회</dt>
						<dd>
							<a href="/member/mypage/order/myorders"
								onclick="GA_Event('마이페이지','LNB','주문/배송/반품/취소');">주문/배송/반품/취소</a>
						</dd>
					</dl>
					<dl>

						<dt>혜택관리</dt>
						<dd>
							<a href="/member/mypage/myGradeInfo"
								onclick="GA_Event('마이페이지','LNB','나의 회원 등급');">나의 회원 등급</a>
						</dd>
						<dd>
							<a href="/member/mypage/voucher"
								onclick="GA_Event('마이페이지','LNB','나의 쿠폰');">나의 쿠폰 <!-- 쿠폰함 --></a>
						</dd>
					</dl>
					<dl>
						<dt>나의 상품관리</dt>
						<dd>
							<a href="/member/mypage/myWish"
								onclick="GA_Event('마이페이지','LNB','위시리스트');">위시리스트 <!-- 위시리스트 --></a>
						</dd>
					</dl>
					<dl>
						<dt>나의 정보관리</dt>
						<dd>
							<a href="/member/mypage/personInfomationChangePWCheck"
								onclick="GA_Event('마이페이지','LNB','개인정보 변경/탈퇴');">개인정보 변경/탈퇴</a>
						</dd>
						<dd>
							<a href="/member/mypage/shoppingAddressPWCheck"
								onclick="GA_Event('마이페이지','LNB','배송지 관리');">배송지 관리</a>
						</dd>
					</dl>
				</div>
				<div class="ph_guide">
					<p class="tlt">고객센터 운영 안내</p>
					<p class="phone">
						1800-5700<span style="color: #c69c6d;" class="txt">(유료)</span>
					</p>
					<p class="txt">
						평일(월~금)<br>am 09:00 ~ pm 18:00<span>토/일, 공휴일 휴무</span>
					</p>
					<a href="mailto:shophelp@thehandsome.com">shophelp<br>@thehandsome.com
					</a>
				</div>
			</div>
			<!-- //lnb -->

			<!-- cnts -->
			<div class="sub_cnts">
				<!-- 회원정보 -->
				<div class="profile_info1 clearfix review_betterment1905">
					<div class="name ">
						<span class="ico_grade">${member.mname}&nbsp;<span>님</span></span>
						<span class="grade_txt" id="grade_txt"></span>
					</div>
					<div class="pointbox_cover">
						<div class="point">
							<p class="title">H.POINT</p>
							<a class="count"
								href="https://www.h-point.co.kr/cu/myh/myPnt.shd"
								target="_blank" onclick="GA_Event('마이페이지','회원정보','H.POINT');">${member.mpoint}&nbsp;<span>P</span></a>
						</div>
						<div class="point">
							<p class="title">COUPON</p>
							<%-- <a class="count" href="/member/mypage/voucher">${coupon}&nbsp;<span>장</span></a> --%>
						</div>
						<div class="point review">
							<p class="title">상품평</p>
							<a href="/mypage/myreview" class="count"
								onclick="GA_Event('마이페이지','회원정보','상품평');">0&nbsp;<span>개</span></a>
						</div>
					</div>
				</div>

				<!-- 회원정보 -->
				<!-- 최근주문 -->
				<div class="title_wrap">
					<h4 class="float_left">
						최근주문
						<!-- 최근주문 -->
					</h4>
					<p class="txt_line">
						최근 1개월 내 주문하신 내역입니다.
						<!-- 최근 1개월 내 주문하신 내역 입니다. -->
					</p>
					<div class="btn_wrap">
						<a href="/member/mypage/order/myorders" class="btn add_ss"
							onclick="GA_Event('마이페이지','최근주문','전체보기');">전체보기 <!-- 전체보기 --></a>
					</div>
				</div>
				<!-- table -->
				<div class="tblwrap lncl1812">
					<!-- 클래스추가 181204 -->
					<table class="tbl_ltype review_betterment1905">
						<caption>상품평 리스트</caption>
						<colgroup class="interval1812">
							<!-- 수정 181204 -->
							<col style="width: 120px">
							<col>
							<col style="width: 42px">
							<col style="width: 107px">
							<col style="width: 108px">
							<col style="width: 96px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">주문번호<!-- 주문번호 --></th>
								<th scope="col">상품정보<!-- 상품정보 --></th>
								<th scope="col" style="padding: 15px 0">수량<!-- 수량 --></th>
								<!-- 스타일추가 181204 -->
								<th scope="col">판매가<!-- 판매가 --></th>
								<th scope="col">주문상태<!-- 주문상태 --></th>
								<th scope="col">구분<!-- 구분 --></th>
							</tr>
						</thead>
						<tbody id="listBody">
							<tr>
								<td colspan="6" class="no_data">최근 한 달간 주문내역이 없습니다.<!-- 최근 한 달간 주문내역이 없습니다. --></td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- table -->
				<!-- 위시리스트 -->
				<div class="title_wrap line mt50">
					<h4>
						위시리스트
						<!-- 위시리스트 -->
					</h4>
					<div class="btn_wrap">
						<a href="/ko/mypage/myWish" class="btn add_ss"
							onclick="GA_Event('마이페이지','위시리스트','전체보기');">전체보기 <!-- 전체보기 --></a>
					</div>

					<script type="text/javascript">
                    const data = ${wishList.pid};
                    function haveData(data) {
                        if(data !== null){
                            document.getElementById("have_data").style.visibility = 'visible';
                        } else {
                            document.getElementById("no_data").style.visibility = 'visible';
                        }
                    }

                </script>
					<ul class="wish_wrap">
						<li id="no_data" class="no_data" style="visibility: hidden;">위시리스트에
							저장된 상품이 없습니다.<!-- 위시리스트에 저장된 상품이 없습니다. -->
						</li>

						<!--TODO ::   -->
						<li id="have_data" style="visibility: hidden;"><a
							href="/product/productDetail?pid=${wishList.pid}&ccolorcode=${wishList.ccolorcode}">
								<img src="${wishList.cimage1}" alt="상품 이미지"> <span
								class="brand">${wishList.bname}</span> <span class="tlt">${wishList.pname}</span>
						</a> <span class="price">${wishList.pprice}</span>
                        </li>
					</ul>
				</div>


			</div>
		</div>
	</div>

</body>
</html>
