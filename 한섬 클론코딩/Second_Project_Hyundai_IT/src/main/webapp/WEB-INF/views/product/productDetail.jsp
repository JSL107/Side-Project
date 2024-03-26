<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- 작성자: 김가희 , 김나형 -->

<c:set var="path" value="${pageContext.request.contextPath}" />
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script type="text/javascript">

	// 선택한 상품 컬러에 따라 이미지와 상품번호를 바꿔주는 함수
	function setColor(i) {
		console.log(i);
		console.log(obj[i].ccolorcode);

		let x = document.getElementsByClassName("prodNum")[0];
		x.innerText = obj[i].ccolorcode;

		$("#img3").attr("src", obj[i].cimage3);
		$("#img4").attr("src", obj[i].cimage4);
		$("#img5").attr("src", obj[i].cimage5);
		$("#img6").attr("src", obj[i].cimage6);

		$("#ccolorcode").val(obj[i].ccolorcode);
	}

	//마우스 올렸을 때 색상이름 보여주는 함수
	function setColorName(color) {
		$("#colorNameContent").text(color);
	}

	// 숫자 format
	Number.prototype.format = function(){
		if(this==0) return 0;

	     var reg = /(^[+-]?\d+)(\d{3})/;
	     var n = (this + '');

	     while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');

	     return n;
	};
	// 제품 사이즈 선택
	function change_size(size){
		console.log("사이즈 선택: "+size);
		$("#psize").val(size);
	}

	// 제품 수량 변경
	function change_qty(button){
		 var min_qty = 1;
		 var this_qty = $("#txtqty").val()*1;
		 var this_price = $("#price").val()*1;
		 var max_qty = 5;
		 if(button=='left'){
			 console.log("왼쪽");
			 this_qty -= 1;
			 if(this_qty < min_qty){
				 this_qty = 1;
			 }
			 console.log(this_qty);
		 }
		 else if(button=='right'){
			 console.log("오른쪽");
			 this_qty += 1;
			 if(this_qty > max_qty){
				 alert("재고가 부족합니다.");
				 return;
			 }
			 console.log(this_qty);
		 }
		 var show_total_amount = this_price * this_qty;
		 $("#txtqty").val(this_qty);

		 $("#sumPrice").html('₩ '+show_total_amount.format());

		 $("#pamount").val(this_qty);
	}

	//위시리스트 클릭했을 때 작동하는 함수
	   function addWishListClick()
	   {
	       if(!$('.wishlist1803').hasClass('on')){
	           brazeLogCustomEvent("Wish", "");
	           brazeCustomAttribute("Wish", "add");
	       }else{
	           brazeCustomAttribute("Wish", "remove");
	       }

	       addWishList();

	   }

	$('document').ready(
					function() {
						// 상품 컬러 리스트 가져오는 ajax 호출
						$.ajax({
									url : "/product/productColor?pid="
											+ "${productInfo.pid}",
									type : "GET",
									dataType : "json",
									async : false,
									error : function(request, status, error) {
										console.log("code:" + request.status
												+ "\n" + "message:"
												+ request.responseText + "\n"
												+ "error:" + error);
									},
									success : function(result) {
										var html = "";
										obj = result;
										if (result.length > 0) {
											html += '<ul class="color_chip clearfix">';
											for (var i = 0; i < result.length; i++) {
												console.log(result[i]);
												var img = result[i].ccolorimage;
												html += '<li id="'+result[i].ccolorcode+'">';
												if (i == 0)
													html += '<a href="#;" onclick="setColor('
															+ i
															+ ')" class="beige on" style="background:'
															+ ' url('
															+ result[i].ccolorimage
															+ ')" onmouseover="setColorName(\''
															+ result[i].ccolorname
															+ '\');" onmouseout="setColorName(\''
															+ "" + '\');">'
												else
													html += '<a href="#;" onclick="setColor('
															+ i
															+ ')" class="beige" style="background:'
															+ ' url('
															+ result[i].ccolorimage
															+ ')" onmouseover="setColorName(\''
															+ result[i].ccolorname
															+ '\');" onmouseout="setColorName(\''
															+ ""
															+ '\');"></a></li>';
											}
											html += '</ul>';
										}
										$("#getcolor").html(html);
									}
								});

					});
</script>
</head>
<body>
<input id = "token" type="hidden" name="${_csrf.parameterName}"
	   value="${_csrf.token}" />
	<div id="globalMessages"></div>
	<div id="bodyWrap" class="item_detail">
		<div id="oneEventLayer"></div>
		<div class="adaptive_wrap">
			<div class="clearfix prd_detail1905" id="clearfix">
				<div class="clearfix image_view3">
					<a id="btn_zoom" class="btn_zoom">크게보기</a>
					<div class="image_view1" id="image_view1">
						<div class="item_visual" id="imageDiv" style="margin-top: 20px;">
							<ul>
								<li>
									<img src="${productInfo.cimage3 }" class="respon_image" id="img3" alt="${productInfo.pname }" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg'" />
								</li>
								<li>
									<img src="${productInfo.cimage4 }" class="respon_image" id="img4" alt="${productInfo.pname }" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg'" />
								</li>
								<li>
									<img src="${productInfo.cimage5 }" class="respon_image" id="img5" alt="${productInfo.pname }" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg'" />
								</li>
								<li>
									<img src="${productInfo.cimage6 }" class="respon_image" id="img6" alt="${productInfo.pname }" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg'" />
								</li>
							</ul>
						</div>
					</div>
					<div class="item_visual" id="imageDivW" style="display: none">
						<ul>
							<li>
								<img src="${productInfo.cimage1 }" class="respon_image" alt="${productInfo.pname }" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg'" />
							</li>
							<li>
								<img src="${productInfo.cimage1 }" class="respon_image" alt="${productInfo.pname }" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg'" />
							</li>
							<li>
								<img src="${productInfo.cimage1 }" class="respon_image" alt="${productInfo.pname }" onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg'" />
							</li>
						</ul>
					</div>
				</div>

				<div class="item_detail_info float_right" id="contentDiv" style="margin-top: 20px;">
					<div class="info">
						<div class="info_sect">
							<h4 class="item_name">
								<div class="brand-name">
									<a href="/listBrand?bname=${productInfo.bname}">${productInfo.bname}</a>
								</div>
								<span class="name ko_fir_spel"> ${productInfo.pname }
									<input type="hidden" id="brandName" value="LÄTT" />
									<input type="hidden" id="productName" value="${productInfo.pname }" />
									<input type="hidden" id="productCode" value="${productInfo.pid }" />
								</span>
							</h4>

							<div class="flag"></div>

							<p class="price">
								<span>₩<fmt:formatNumber value="${productInfo.pprice}" type="number" pattern="###,###" /></span>
								<input type="hidden" id="productPrice" value="${productInfo.pprice}" />
							</p>

							<p class="selling_point"></p>

							<div class="prod-detail-con-box">
								<strong class="number-code">상품품번 &#58; <span
									class="prodNum">${productInfo.ccolorcode }</span></strong>
								<div class="round-style">
									<p>${productInfo.pdetail }</p>
								</div>
							</div>
							
						</div>
						
						<div class="info_sect">
							<ul class="point_delivery">
								<li>
									<span class="title">H.Point</span> 
									<span class="txt"><fmt:formatNumber value="${productInfo.pprice * 0.05 }" type="number" pattern="###,###" />&nbsp;P&nbsp;(5%)</span>
									<a id="cardbenef" class="etc_info">카드사 혜택안내</a>
								</li>

								<li>
									<span class="title">배송비</span>
									<span class="txt">30,000원이상 무료배송 (실결제 기준)</span>
									<a class="etc_info">배송안내</a>
								</li>
							</ul>
						</div>

						<div class="info_sect">
							<ul class="color_size_qty">
								<li>
									<span class="title">색상</span>
									<div id="getcolor" class="txt"></div>
									<span class="cl_name" id="colorNameContent"></span>
								</li>
								
								<li>
								<!-- 사이즈 선택 부분 -->
									<span class="title">사이즈</span>
									<span class="txt">
									<ul class="size_chip clearfix sizeChipKo1901">
										<c:forEach var="stock" items="${stock}">
											<c:set var="stock_amount" value="${stock.samount}"/>
											<c:choose>
												<c:when test="${stock_amount eq '0'}">
													<li><a class="not_stock on">${stock.ssize}</a></li>
												</c:when>
												<c:otherwise>
													<li><a href="#;" onclick="change_size('${stock.ssize}');">${stock.ssize}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</ul>
									</span>
								</li>
								
								<!-- 수량 선택 부분 -->
								<li>
									<span class="title">수량</span>
									<span class="txt">
										<span class="qty_sel num">
											<a style="cursor:pointer" onclick="change_qty('left');" class="left"></a>
											<input type="text" id="txtqty" title='수량' value="1" class="mr0" readonly="readonly">
											<a style="cursor:pointer" onclick="change_qty('right');" class="right">다음 버튼</a>
										</span>
									</span>
								</li>
							</ul>
						</div>
						
						<div class="total_price clearfix">
							<input  type="hidden" name="price" id="price" value="${productInfo.pprice}" readonly="readonly">
							<div class="title float_left" style="width: auto;">총 합계</div>
							<div class="pirce float_right">
								<span id="sumPrice">₩
									<fmt:formatNumber value="${productInfo.pprice }" type="number" pattern="###,###" />
								</span>
							</div>
						</div>
						
						<div class="st_receipt_wrap">
							<div class="store_pickup"
								style="padding-bottom: 0; border-bottom: 0">
								<div class="input_wrap">
									<input type="checkbox" id="storePickupCheck" name="storePickupCheck"/>
									<label for="storePickupCheck">매장수령</label>
								</div>
								<img src="http://cdn.thehandsome.com/_ui/desktop/common/images/common/ico_ques2.png" alt="매장수령이란?" class="tlt" />
								<div class="text">
									<p>매장에서 직접 상품 수령을 원하는 경우 체크하세요.</p>
									<p>&#40;여러 개 상품 주문 시, 수령 매장이 동일한 경우 가능&#41;</p>
								</div>
								
								<div class="delch_box" id="store_delbox">
									<span class="arr">위치아이콘</span> <strong>매장 수령 이란? </strong> 매장
									수령을 원하시면 선택하세요.<br /> 여러 개의 상품 주문 시 수령 매장이 동일해야 합니다.
								</div>
							</div>
						</div>

						<div class="btnwrap clearfix"
							style="position: absolute; width: 473px;">
							<input type="button" value="" class="btn wishlist1803 float_left ml0">

							<form id="addToCartForm" name="addToCartForm" action="/shoppingbag" method="post">
								<input type="hidden" name="${_csrf.parameterName}"
									   value="${_csrf.token}" />
								<input type="hidden" id="pid" name="pid" value="${productInfo.pid }" />
								<input type="hidden" id="ccolorcode" name="ccolorcode" value="${productInfo.ccolorcode}" />
								<input type="hidden" id="mid" name="mid" value="${mid}" />
								<input type="hidden" id="psize" name="psize" value="" />
								<input type="hidden" id="pamount" name="pamount" value="1" />
								<input type="button" value='쇼핑백 담기' class="btn cart1803 float_left ml0" id="addToCartButton" onClick="addToCart();" />
								<div>
								</div>
							</form>
							<input type="button" value="바로주문" class="btn order float_right mr0" id="addToCartBuyNowButton" onClick="getProductInfo()">
						</div>

						<dl class="toggle_type1" style="margin-top: 80px;">
							<dt>
								<a href="javascript:void(0);" id="NEW_DETAIL_INFO_EVT">상품상세정보</a>
							</dt>
							<dt>
								<a href="javascript:void(0);" id="DETAIL_INFO_EVT"> 상품정보제공고시</a>
							</dt>
							<dt>
								<a href="javascript:void(0);" id="REAL_SIZE_EVT">실측사이즈</a>
							</dt>
							<dt>
								<a href="javascript:void(0);" id="DELI_RETURN_EVT">배송 및 교환/반품</a>
							</dt>
						</dl>
					</div>

					<div class="clearfix mt30">
						<div class="btnwrap float_left">
							<a href="/qna/qnaMain" class="btn arrow mr0" style="cursor: hand;">Q&amp;A</a>
						</div>
						<div class="float_right">
							<div class="a2a_kit a2a_kit_size_32 a2a_default_style">
								<a class="pinterest"></a>
								<input type="hidden" id="url" value="" />
							</div>
						</div>
					</div>
					<input type="hidden" id="viewExhibitionPageCode" value="" />
					<input type="hidden" id="viewExhibitionPageName" value="" />
				</div>
				<form id="PAY_FORM" method="post" accept-charset="euc-kr"></form>
			</div>
			<div class="product-detail-img"></div>
			<div class="matches_items" id="productDetailEtc"></div>
		</div>
<style>
	#delQnAFile {
		display: inline;
		position: absolute;
		top: 9px;
		right: 115px;
	}
	
	#textQnAFile {
		padding: 0 30px 0 6px;
		width: calc(100% - 24px);
		text-overflow: ellipsis;
	}
</style>
		<script>
			function addToCart()
			{
				$(document).ajaxSend(function(e, xhr, options) {
					xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
				});
				console.log("${member.mid}")
				var qty = $("#txtqty").val();
				var size = $("#psize").val();

				//사이즈 선택 안했을 시 경고창
				if(size == ""){
					alert('사이즈를 선택해 주세요.');
					return;
				}
				// 로그인이 안되어있을 경우 로그인페이지로 이동
                if("${member.mid}" == ""){
                	location.href="/member/login";
	          		return;
	       		}
				if(true){
					addToCartProcess = false;
					var pid = $('form[name=addToCartForm] input[name=pid]').val();
					var psize = $('form[name=addToCartForm] input[name=psize]').val();
					var pamount = $('form[name=addToCartForm] input[name=pamount]').val();
					var pcolor = $("#ccolorcode").val();

					// 장바구니 등록하는 ajax 호출
					$.ajax({
						url: "/cart/add",
						method: "post",
						data : {
							mid : "${member.mid}",
							pid : pid,
							psize : psize,
							pcolor : pcolor,
							pamount : pamount
						},
						success: function (data) {
							alert("완료되었습니다.");
							location.href='/cart/cartList';
						},
						error : function( request, status, error ){
							console.log( "code:" + request.status+"\n" + "message:" + request.responseText+"\n" + "error:" + error );
						}
					});
				}
			}

            function getProductInfo(){
                var mid = "${member.mid}";
                var size = $("#psize").val();
				//사이즈 선택 안했을 시 경고창
				if(size == ""){
					alert('사이즈를 선택해 주세요.');
					return;
				}
				// 로그인이 안되어있을 경우 로그인페이지로 이동
                if(mid == ""){
                	location.href="/member/login";
                	return;
	       		}
                else {
					var qty = $("#txtqty").val();
					var size = $("#psize").val();
					location.href="/order/orderpage?mid=${member.mid}&pid=${productInfo.pid}&ccolorcode=${productInfo.ccolorcode}&amount="+ qty +"&ssize=" + size;
				}
			}
		</script>
</body>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
