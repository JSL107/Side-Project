<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- 
  /* 작성자 : 김가희, 김나형
 * 상품 리스트 페이지. 
 */
   -->

<body oncontextmenu="return false">
	<!-- bodyWrap -->
	<div id="bodyWrap" class="products">
		<!--title-->
		<!-- 김가희  카테고리 표시 -->
		<h3 class="cnts_title ou1804">
			<!-- 김가희 : 카테고리 : 여성 > 아우터 > 재킷 -->
			<span>
				<!-- 정상 브랜드 카테고리 목록 -->
				<a href="/list?clarge=${category.clarge}&cmedium=&csmall=">
					${category.clarge}
				</a>
				<!-- 김가희 : 중분류값이 비어있지 않으면 ' > 중분류 ' 출력 -->
				<c:if test="${category.cmedium ne ''}">
					<img src="http://cdn.thehandsome.com/_ui/desktop/common/images/products/ou_location_arr.png" alt="location arr">
					<a href="/list?clarge=${category.clarge}&cmedium=${category.cmedium}&csmall=">${category.cmedium}</a>
					<!-- 김가희 : 소분류값이 비어있지 않으면 ' > 소분류 ' 출력 -->
					<c:if test="${category.csmall ne ''}">
						<img src="http://cdn.thehandsome.com/_ui/desktop/common/images/products/ou_location_arr.png" alt="location arr">
						<a href="/list?clarge=${category.clarge}&cmedium=${category.cmedium}&csmall=${category.csmall}">${category.csmall}</a>
					</c:if>
				</c:if>
			</span>
		</h3>
		<!-- 김가희  카테고리 표시 -->
		
		<!--//title-->
		<div class="adaptive_wrap">
			<form id="categoryListForm" action="/ko/c/categoryList">
				<input type="hidden" id="brandCode" name="brandCode" value="">
				<input type="hidden" id="brandName" name="brandName" value="">
				<input type="hidden" id="subBrand" name="subBrand" value="">
				<input type="hidden" name="categoryCode" value="we011">
				<input type="hidden" id="genderCategoryCode" name="genderCategoryCode" value="">
				<input type="hidden" id="mainCateFlag" name="mainCateFlag" value="">
				<input type="hidden" id="repProdColorCode" name="repProdColorCode" value="">
				<input type="hidden" id="repSizeEnumCode" name="repSizeEnumCode" value="">
				<input type="hidden" id="priceOrderCode" name="priceOrderCode" value="">
				<input type="hidden" id="productOrderCode" name="productOrderCode" value="NEW">
				<input type="hidden" id="check4pmCode" name="check4pmCode" value="">
				<input type="hidden" id="checkAtHomeCode" name="checkAtHomeCode" value="">
				<input type="hidden" id="checkSaleCode" name="checkSaleCode" value="">
				<input type="hidden" id="checkQuickCode" name="checkQuickCode" value="">
				<input type="hidden" id="checkDeliveryCode" name="checkDeliveryCode" value="">
				<!-- 뒤로가기 버튼 클릭시 페이징 기억용 -->
				<input type="hidden" id="rememberPage" name="rememberPage" value="">
				<input type="hidden" id="FKD-001_015" value="컬러 더보기">
				<!-- 컬러 더보기 -->

				<!-- sort wrap -->
				<div class="filterWrap hsDelivery1902">
					<ul class="clearfix float_left">
						<!-- 정상용 브랜드 검색 -->
						<li class="brand">
							<a href="javascript:void(0);" class="select">브랜드<span class="ico_arr">arrow</span></a>
							<div class="list" style="display: none;">
								<ul id="category_brand_chip">
									<li><input type="checkbox" id="brand_ck1"><label for="brand_ck1" id="BR01">TIME</label></li>
									<li><input type="checkbox" id="brand_ck2"><label for="brand_ck2" id="BR02">MINE</label></li>
									<li><input type="checkbox" id="brand_ck3"><label for="brand_ck3" id="BR19">LANVIN COLLECTION</label></li>
									<li><input type="checkbox" id="brand_ck4"><label for="brand_ck4" id="BR03">SYSTEM</label></li>
									<li><input type="checkbox" id="brand_ck5"><label for="brand_ck5" id="BR04">SJSJ</label></li>
									<li><input type="checkbox" id="brand_ck6"><label for="brand_ck6" id="BR06">TIME HOMME</label></li>
									<li><input type="checkbox" id="brand_ck7"><label for="brand_ck7" id="BR07">SYSTEM HOMME</label></li>
									<li><input type="checkbox" id="brand_ck8"><label for="brand_ck8" id="BR08">the CASHMERE</label></li>
									<li><input type="checkbox" id="brand_ck9"><label for="brand_ck9" id="BR31">LÄTT</label></li>
									<li><input type="checkbox" id="brand_ck10"><label for="brand_ck10" id="BR43">OBZEE</label></li>
									<li><input type="checkbox" id="brand_ck11"><label for="brand_ck11" id="BR45">O'2nd</label></li>
									<li><input type="checkbox" id="brand_ck12"><label for="brand_ck12" id="BR44">CLUB MONACO</label></li>
									<li><input type="checkbox" id="brand_ck13"><label for="brand_ck13" id="BR61">oera</label></li>
									<li><input type="checkbox" id="brand_ck14"><label for="brand_ck14" id="BR21">BALLY</label></li>
									<li><input type="checkbox" id="brand_ck15"><label for="brand_ck15" id="BR20">LANVIN PARIS</label></li>
									<li><input type="checkbox" id="brand_ck16"><label for="brand_ck16" id="BR41">3.1 Phillip Lim</label></li>
									<li><input type="checkbox" id="brand_ck17"><label for="brand_ck17" id="BR37">ROCHAS</label></li>
									<li><input type="checkbox" id="brand_ck18"><label for="brand_ck18" id="BR15">TOM GREYHOUND</label></li>
									<li><input type="checkbox" id="brand_ck19"><label for="brand_ck19" id="BR35">FOURM THE STORE</label></li>
									<li><input type="checkbox" id="brand_ck20"><label for="brand_ck20" id="BR30">FOURM STUDIO</label></li>
									<li><input type="checkbox" id="brand_ck21"><label for="brand_ck21" id="BR32">FOURM MEN'S LOUNGE</label></li>
									<li><input type="checkbox" id="brand_ck22"><label for="brand_ck22" id="BR16">MUE</label></li>
									<li><input type="checkbox" id="brand_ck23"><label for="brand_ck23" id="BR47">H : SCENE</label></li>
									<li><input type="checkbox" id="brand_ck24"><label for="brand_ck24" id="BR62">Liquides Perfume Bar</label></li>
								</ul>
							</div>
						</li>
						<li class="color"><a href="#" class="select" onclick="GA_Event('카테고리_리스트','정렬','색상');">색상<span
									class="ico_arr">arrow</span></a>
							<div class="list list_item4" style="display: none;">
								<ul class="color_chip clearfix" id="category_color_chip">
									<li><a style="background: #fae7c4;">BEIGE</a></li>
									<li><a style="background: #000000;">BLACK</a></li>
									<li><a style="background: #0f45bc;">BLUE</a></li>
									<li class="mr0"><a style="background: #673915;">BROWN</a></li>
									<li><a style="background: #741313;">BURGUNDY</a></li>
									<li><a style="background: #876c41;">CAMEL</a></li>
									<li><a style="background: #ffc733;">GOLD</a></li>
									<li class="mr0"><a style="background: #0f6f0e;">GREEN</a></li>
									<li><a style="background: #444445;">GREY</a></li>
									<li><a style="background: #fff8d9;">IVORY</a></li>
									<li><a style="background: #465626;">KHAKI</a></li>
									<li class="mr0"><a style="background: #9c81bb;">LAVENDER</a></li>
									<li><a style="background: #9d9fa2;">METAL</a></li>
									<li><a style="background: #95d0ab;">MINT</a></li>
									<li><a style="background: #534741;">MULTI</a></li>
									<li class="mr0"><a style="background: #061836;">NAVY</a></li>
									<li><a style="background: #5d682d;">OLIVE</a></li>
									<li><a style="background: #ee6423;">ORANGE</a></li>
									<li><a style="background: #ea589b;">PINK</a></li>
									<li class="mr0"><a style="background: #833b95;">PURPLE</a></li>
									<li><a style="background: #ec1e24;">RED</a></li>
									<li><a style="background: #c0c0c0;">SILVER</a></li>
									<li><a style="background: #a2d6f3;">SKY</a></li>
									<li class="mr0"><a style="background: #4c2b7b;">VIOLET</a></li>
									<li><a class="wt" style="background: #ffffff;">WHITE</a></li>
									<li><a style="background: #ffea0a;">YELLOW</a></li>
								</ul>
							</div>
						</li>
						<li class="size">
							<a href="#" class="select">사이즈
								<span class="ico_arr">arrow</span>
							</a>
							<div class="list list_item3" style="display: none;">
								<ul class="size_chip clearfix" id="category_size_chip">
									<li><a>XXXS</a></li>
									<li><a>XXS</a></li>
									<li class="mr0"><a>XS</a></li>
									<li><a>S</a></li>
									<li><a>M</a></li>
									<li class="mr0"><a>L</a></li>
									<li><a>XL</a></li>
									<li><a>XXL</a></li>
									<li class="mr0"><a>XXXL</a></li>
									<li><a>XXXXL</a></li>
									<li><a>FREE</a></li>
									<li class="mr0"><a>ETC</a></li>
								</ul>
							</div>
						</li>
						<li class="price">
							<a href="#" class="select">가격
								<span class="ico_arr">arrow</span>
							</a>
							<div class="list" style="display: none;">
								<ul>
									<li>
										<input type="checkbox" id="price_ck1">
										<label for="price_ck1" id="lable_ck1"> ￦100,000 이하</label>
									</li>
									<li>
										<input type="checkbox" id="price_ck2">
										<label for="price_ck2" id="lable_ck2">￦100,000 ~ ￦300,000</label>
									</li>
									<li>
										<input type="checkbox" id="price_ck3">
										<label for="price_ck3" id="lable_ck3">￦300,000 ~ ￦500,000</label>
									</li>
									<li>
										<input type="checkbox" id="price_ck4">
										<label for="price_ck4" id="lable_ck4">￦500,000 ~ ￦1,000,000</label>
									</li>
									<li>
										<input type="checkbox" id="price_ck5">
										<label for="price_ck5" id="lable_ck5">￦1,000,000 이상</label>
									</li>
								</ul>
							</div>
						</li>

						<li class="sortby">
						<a href="#" class="select">정렬순<span class="current">신상품</span><span class="ico_arr">arrow</span></a>
							<div class="list" style="display: none;">
								<ul>
									<li><a>신상품</a></li>
									<li><a>판매순</a></li>
									<li><a>고가순</a></li>
									<li><a>저가순</a></li>
									<li><a>평점순</a></li>
								</ul>
							</div></li>
						<li class="prd_list_filter1810 sale_filter">
							<div class="input_wrap">
								<input type="checkbox" id="checkSale" name="checkSale" style="margin: 3px 10px 0 0;">
									<label for="checkSale" id="checkSale" style="color: #ff0000;">SALE</label>
							</div>
						</li>
						<li class="prd_list_filter1810 delivery" style="display: none">
							<!-- 딜리버리 190219 -->
							<div class="input_wrap">
								<input type="checkbox" id="checkDelivery" name="checkDelivery">
								<label for="checkDelivery" id="hsDelivery">한섬딜리버리</label>
							</div>
							<img src="http://cdn.thehandsome.com/_ui/desktop/common/images/common/ico_quest.png" alt="한섬딜리버리란?" class="tlt" onmouseover="onMouseOverRecommend();" onmouseout="onMouseOutRecommend();">
							<div class="rmd_pb_popup" style="display: none;">
								<p>4PM, 퀵배송이 가능합니다.</p>
								<span class="box_arr"></span>
							</div>
						</li>
						<li class="btn">
							<a>초기화</a><a>적용</a>
						</li>
					</ul>
					<div class="items_count float_right">
						<span class="num">${totalProducts}</span>
						<span>전체</span>
					</div>
				</div>
			</form>
			<!-- sort wrap -->

			<!--  김가희 상품 리스트 및 페이징  -->
			<div class="items_list cate_item4" id="listContent" style="display: block;">
				<ul class="clearfix" id="listBody" style="display: block;">
					<c:forEach items="${list}" var="product" varStatus="status">
						<li>
							<div class="item_box">
								<a href="#" class="item_info1">
									<span class="item_img">
										<input type="hidden" class="idvalue${product.pid}" value="${product.pid}">
										<img src="" id="T01_IMG_0" alt="${product.pname}" targetcode="${product.pid}" class="respon_image" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img3.jpg'">
										<img src="" id="T02_IMG_0" alt="${product.pname}" targetcode="${product.pname}" class="respon_image on" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img3.jpg'" style="opacity: 0;">
										<input type="hidden" id="newImage1_0" value="http://newmedia.thehandsome.com/SY/2C/SS/SY2C4TTO047W_BK_T01.jpg">
										<input type="hidden" id="newImage2_0" value="http://newmedia.thehandsome.com/SY/2C/SS/SY2C4TTO047W_BK_T02.jpg">
									</span>
									<span class="item_size" id="itemsize_0" style="display: none; height: 20px; padding-top: 15px; margin-top: 0px; padding-bottom: 15px; margin-bottom: 0px;">
										<div>
											<c:forEach items="${sizeMap[status.index]}" var="size">
												<span>${size}</span>
											</c:forEach>
										</div>
									</span>
								</a>
								<a href="/ko/p/${product.pid}" class="item_info2"> 
									<span class="brand">${product.bname}</span>
									<span class="title">${product.pname}</span>
									<span class="price">₩
										<fmt:formatNumber value="${product.pprice }" type="number" pattern="###,###" />
									</span>
									<span class="flag">
										<span class="product">NEW</span>
									</span>
								</a>
								<!-- 김가희 상품색상 / 김나형 상품디테일 연결-->
								<div class="color_more_wrap">
									<c:forEach items="${colorMap[status.index] }" var="colorList" varStatus="status2">
										<a href="javascript:void(0)" class="cl wt" style="background: url('${colorList.ccolorimage }');" productid="${product.pid }" ccolorcode="${colorList.ccolorcode }" ; cimage3="${colorList.cimage3}" cimage4="${colorList.cimage4}"></a>
										<input type="hidden" class="colorvalue" value="${colorList.ccolorcode}">
									</c:forEach>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
</body>

<!-- 김나형 페이지 번호 처리  -->
<div class="paging" style="display: block;">
	<input type="hidden" class="clarge" value="${category.clarge}">
	<input type="hidden" class="cmedium" value="${category.cmedium}">
	<input type="hidden" class="csmall" value="${category.csmall}">
	<input type="hidden" class="realEnd" value="${pageMaker.realEnd}">
	<a class="prev2" href="#"></a>
	<c:if test="${pageMaker.prev}">
		<!-- 이전 버튼 -->
		<a class="prev"
			href="/list?clarge=${category.clarge}&cmedium=${category.cmedium}&csmall=${category.csmall}&pageNum=${pageMaker.startPage - 1}">Previous</a>
	</c:if>

	<!-- 1~10 버튼 -->
	<span class="num">
		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			<c:if test="${(pageMaker.startPage+i) <= pageMaker.endPage}">
				<a href="/list?clarge=${category.clarge}&cmedium=${category.cmedium}&csmall=${category.csmall}&pageNum=${num}"
					class="pageBtn">${num}</a>
			</c:if>
		</c:forEach>
	</span>  
	<c:if test="${pageMaker.next}">
		<!-- 다음 버튼 -->
		<a href="/list?clarge=${category.clarge}&cmedium=${category.cmedium}&csmall=${category.csmall}&pageNum=${pageMaker.endPage +1}"
			class="next">Next</a>
	</c:if>
	<a class="next2" href="#"></a>
</div>
<!--  end Pagination -->

<form id='actionForm' action="/list" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
</form>

<!-- //김나형 페이지 번호 처리  -->

<div class="sh_result none" id="searchResult_None" style="display: none;">조건에 맞는 상품 정보가 없습니다.</div>
</div>

<div id="criteoVariable">
	<script type="text/javascript">
		$(document).ready(function () {

			// 김가희 상품이미지
			const products = document.querySelectorAll(".item_box")
			for (i = 0; i < products.length; i++) {
				const img1 = products[i].getElementsByClassName("cl")[0]
					.getAttribute("cimage3");
				const img2 = products[i].getElementsByClassName("cl")[0]
					.getAttribute("cimage4");
				products[i].getElementsByClassName("respon_image")[0].setAttribute(
					"src", img1);
				products[i].getElementsByClassName("respon_image")[1].setAttribute(
					"src", img2);
				// 김나형 상품디테일 href 설정 
				const productid = products[i].getElementsByClassName("cl")[0]
					.getAttribute("productid");
				const ccolorcode = products[i].getElementsByClassName("cl")[0]
					.getAttribute("ccolorcode");
				products[i].getElementsByClassName("item_info1")[0].setAttribute(
					"href", "/product/productDetail?pid=" + productid + "&ccolorcode=" + ccolorcode);
				products[i].getElementsByClassName("item_info2")[0].setAttribute(
					"href", "/product/productDetail?pid=" + productid + "&ccolorcode=" + ccolorcode);
			}

			//김가희 색깔변경
			$(".cl").on("click", function (e) {
				e.preventDefault(); //<a> 작동 중지
				$(this).closest("li").find("img:eq(0)").attr("src", $(this).attr("cimage3"));
				$(this).closest("li").find("img:eq(1)").attr("src", $(this).attr("cimage4"));
				// 김나형 상품디테일 선택한 색으로 변경
				$(this).closest("li").find("a:eq(0)").attr("href", "/product/productDetail?pid=" + $(this)
					.attr("productid") + "&ccolorcode=" + $(this).attr("ccolorcode"));
			});

			// 김가희, 김나형 상품 이미지 hover
			$(".item_info1").hover(function () {
				$(this).find("img:eq(1)").css("visibility", "visible");
				$(this).find("img:eq(1)").css("opacity", 1);
				$(this).find(".item_size").css("display", "block");
			}, function () {
				$(this).find("img:eq(1)").css("opacity", 0);
				$(this).find("img:eq(1)").css("visibility", "hidden");
				$(this).find(".item_size").css("display", "none");
			});

			// 김나형 productDetail 페이지로 이동
			$(".item_img").on("click", function (e) {
				console("페이지 이동");
				location.href = $(this).attr("alt");
			});

			// 김나형 페이징 맨 앞페이지으로 이동
			$(".prev2").on("click", function (e) {
				var clarge = $(".clarge").val();
				var cmedium = $(".cmedium").val();
				var csmall = $(".csmall").val();
				location.href = "/list?clarge=" + clarge + "&cmedium=" + cmedium + "&csmall=" + csmall + "&pageNum=1";
			});

			// 김나형 페이징 맨 끝페이지로 이동
			$(".next2").on("click", function (e) {
				var clarge = $(".clarge").val();
				var cmedium = $(".cmedium").val();
				var csmall = $(".csmall").val();
				var endpage = $(".realEnd").val();
				console.log(endpage);
				location.href = "/list?clarge=" + clarge + "&cmedium=" + cmedium + "&csmall=" + csmall + "&pageNum=" + endpage;
			});

		});

		window.criteo_q = window.criteo_q || [];
		window.criteo_q.push({
			event: "setAccount",
			account: 24596
		}, {
			event: "setSiteType",
			type: "d"
		}, {
			event: "viewList",
			item: ["SY2C4TTO047W", "CM2C4TTO340WP2", "MW2C4TTO509W"]
		});
	</script>
</div>
</div>
<!-- //bodyWrap -->

<iframe height="0" width="0" title="Criteo DIS iframe" style="display: none;"></iframe>
<iframe height="0" width="0" title="Criteo DIS iframe" style="display: none;"></iframe>
</body>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>