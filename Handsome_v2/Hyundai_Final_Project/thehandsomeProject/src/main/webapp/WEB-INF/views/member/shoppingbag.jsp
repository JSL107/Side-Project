<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hdsm.domain.MemberSbagDTOForJsp" %>

<%@include file="/WEB-INF/views/common/header.jspf"%>
<!-- bodyWrap -->
<div id="bodyWrap">
	<!--title-->
	<h3 class="cnts_title cnts_tlt1807">
		<span>쇼핑백</span>
	</h3>
	<!--//title-->

	<!-- 장바구니개편 -->
	<span id="shoppingbagCartView"> 
		<div class="sub_container ">
			<!--order wrap-->
			<div class="orderwrap1807">
				<div class="tbl_info_wrap">
					<p class="cart_top_text"></p>

					<div class="fourpm_pd_ck">
						<div class="input_wrap"></div>
					</div>
				</div>
				<!--shoppingback table-->
				<div class="tblwrap">
					<table class="tbl_ltype">
						<caption>쇼핑백</caption>
						<colgroup>
							<col style="width: 10px;" />
							<col />
							<col style="width: 120px" />
							<col style="width: 105px" />
							<col style="width: 140px" />
							<col style="width: 110px" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">
									<!-- 2019.11.07 쇼핑백 진입 시 선택 상품 없도록 수정 --> 
									<input type="checkbox" id="entryCheckAll" value="cartlist">
								</th>
								<th scope="col">상품정보</th>
								<th scope="col">수량</th>
								<th scope="col">판매가</th>
								<th scope="col">적립율</th>
								<th scope="col">선택</th>
							</tr>
						</thead>
						<tbody>
							<script language='javascript' type="text/javascript">
								let pids = [];
								let psizes = [];
								let pcolors = [];
								let pamounts = [];
								let colorinfos = [];
								let colorcodes  = [];
								let _ace_countvar = 0;
							</script>
								
								<% List<MemberSbagDTOForJsp> asd = (List<MemberSbagDTOForJsp>)request.getAttribute("shoppingbagList");
									if(asd.size() == 0 ){ %>
								<tr>
                                    <td colspan="6" class="no_data frt">쇼핑백에 담긴 상품이 없습니다.</td>
                                </tr>
                                <% } %>
							<c:forEach items="${shoppingbagList}" var="shoppingbag" varStatus="status">
							<tr name="entryProductInfo" data-pk="10950401196076"
								data-deliverykind="" data-outofstock="false"
								data-category="ME031">
								<td class="frt">
									<!-- 2019.11.07 쇼핑백 진입 시 선택 상품 없도록 수정 --> <input
									type="checkbox" name="cartlist" data-pk="10950401196076"
									data-division="" data-deliverykind="" value="0">
								</td>
								<td class="pt_list_wrap" itemnum="${status.index}">
									<!-- pt_list_all -->
									<div class="pt_list_all">
										<a itemnum="a${status.index}" href="/product/product_detail?pid=${shoppingbag.pid}&colorcode=${shoppingbag.colorcode}">
											<img src="${shoppingbag.thumbnail}"
											style = "object-fit : cover" alt="" />
										</a>
										<div class="tlt_wrap">
											<a
												href="/product/product_detail?pid=${shoppingbag.pid}&colorcode=${shoppingbag.colorcode}"
												class="basket_tlt"
												itemnum="a${status.index}">
												<span class="tlt">${shoppingbag.bname}</span> <span class="sb_tlt">
													${shoppingbag.pname}</span>
											</a>

											<p class="color_op">

												color : ${shoppingbag.scolor}<span class="and_line">/</span> size :
												${shoppingbag.ssize}
											</p>

											<div class="option_wrap">
												<a href="javascript:void(0);" class="btn_option">옵션변경</a>
											</div>
										</div>
									</div> <!-- //pt_list_all-->
								</td>
								<td class="al_middle">
									<form 
										id="updateCartForm${status.index}"
										data-cart="{&quot;cartCode&quot; : &quot;425633218&quot;,&quot;productPostPrice&quot;:&quot;590000.0&quot;,&quot;productName&quot;:&quot;캐시미어 블렌드 헤링본 재킷&quot;}"
										action="http://www.thehandsome.com/ko/shoppingbag/update" method="post">
										<input type="hidden" name="entryNumber" value="0" /> <input
											type="hidden" name="productCode" value="SH2C9WJC201M_KG_100" />
										<input type="hidden" name="initialQuantity" value="1" /> <input
											type="hidden" name="chgProductCode" value="" /> <input
											type="hidden" name="curSize" value="100" /> <input
											type="hidden" name="storeId" value="" /> <input
											type="hidden" name="storePickupDate" value="" /> <input
											type="hidden" name="deliveryKind" value="" /> <input
											type="hidden" name="cartDivision" value="" />
										<!-- qty_sel -->
										<span class="qty_sel num"> 
										<a href="javascript:void(0);"
											class="left" >이전 버튼</a>
											<input id="quantity0" name="quantity" type="text" class="mr0"
											value="${shoppingbag.amount}" size="1" maxlength="3" style="text-indent: 0;" itemnum="${status.index}"/>
											<a href="javascript:void(0);"
											class="right" >다음 버튼</a>
										</span>
										<!-- //qty_sel -->
										<a href="javascript:void(0);" id="QuantityProduct_0" name="changeBtn"
											class="btn wt_ss qty_w mr0" itemnum="${status.index}">변경</a>
										<div>
											<input type="hidden" name="CSRFToken"
												value="a9703aad-d9dc-4a91-b1a9-28f56c82dc12" />
										</div>
									</form>
								</td>
								<td class="al_middle">
									<!-- Price -->
									<div class="price_wrap">
										<span></span> 
										<input type="hidden" name="checkZeroPrice" value="${shoppingbag.pprice}" />
									</div> 
									<!-- //Price -->
								</td>
								<td class="al_middle"><span class="earn">5% (한섬마일리지)</span>
									<br> <span class="earn">0.1% (H.Point)</span></td>
								<td class="al_middle">
									<!-- Button size -->
									<div class="btn_wrap">
										<a href="javascript:void(0);" id="RemoveProduct_0" class="btn wt_ss" name="deleteOne" itemnum="${status.index}">삭제</a>
									</div> <!-- //Button size -->
								</td>
							</tr>
							<!-- Info wrap -->
							<tr>
                                <td colspan="6" class="basket_wrap">
                                    <!-- Info -->
                                    <div class="basket_info" style="display: none;">
                                        <span class="btn_arr">위치아이콘</span>
                                        <div class="info">
                                            <!-- Products -->
                                            <div class="pt_list" id="pt_list_0"><a href="/product/product_detail?pid=${shoppingbag.pid}&colorcode=${shoppingbag.colorcode}">
												<img src="${shoppingbag.thumbnail}" style = "object-fit : cover" alt=""></a>
													<div class="tlt_wrap">
														<a href="/product/product_detail?pid=${shoppingbag.pid}&colorcode=${shoppingbag.colorcode}" class="basket_tlt">
													        <span class="tlt">${shoppingbag.bname}</span>
													        <span class="sb_tlt">${shoppingbag.pname}</span>
													    </a>
														<!-- color_size -->
														<dl class="cs_wrap" itemnum="${status.index}">
															<dt>COLOR</dt>
																<script>
																	let tempDic${status.index} = {};
																</script>
															<c:forEach items="${shoppingbag.colorlist}" var="coloritem">
															<dd>
																<div class="cl_select">
																<a href="javascript:void(0);" 
																	value = "${coloritem.cname}"
																	class="beige <c:if test="${shoppingbag.scolor eq coloritem.cname}" >on</c:if>"
																	style="background:#F8F8F8 url('${coloritem.ccolorimage}')">BURGUNDY</a>
																	<span class="cs_sel1807">${coloritem.cname}</span>
																</div>
															</dd>
																<script>
																	tempDic${status.index}['${coloritem.cname}'] = ["${coloritem.ccolorcode}","${coloritem.c_thumbnail1}"]
																</script>
															</c:forEach>
															<dt>SIZE</dt>
															<dd style="width: 200px; height: 100%;">
																<div class="sz_select">
																	<c:forEach items="${shoppingbag.sizeList}" var="size">
																		<a href="javascript:void(0);" value="${size}" <c:if test="${size eq shoppingbag.ssize}" >
																			class="on" style="line-height: 15px;"
																		</c:if>> ${size}</a>
																	</c:forEach>
																</div>
															</dd>
															
														</dl>
														<!-- //color_size -->
													</div>
												</div>
                                            <!-- //Products -->
                                            <!-- btns -->
                                            <div class="btns">
                                                <a href="javascript:void(0);" class="btn wt_ss mr0" id="UpdateCart_0" name="changeBtn" itemnum="${status.index}">변경</a>
                                                <a href="javascript:void(0);" class="btn wt_ss mt10 mr0" name="closeclose" id="optCancelLayer_0">취소</a>
                                                <a href="javascript:void(0);" class="btn_close" name="closeclose" id="optCloseLayer_0">닫기</a>
                                            </div>
                                            <!-- //btns -->
                                        </div>
                                    </div> <!-- //Info -->
                                </td>
                            </tr>

							<tr>
								<td colspan="6" class="basket_wrap"></td>
							</tr>
							
							<!-- 변경을 위한 form tag -->
							<!-- Data Allocation (Product_Detail) -->
							<script language='javascript' type="text/javascript">
								pids[_ace_countvar] = "${shoppingbag.pid}";
								psizes[_ace_countvar] = "${shoppingbag.ssize}";
								pcolors[_ace_countvar] = "${shoppingbag.scolor}";
								pamounts[_ace_countvar] = parseInt("${shoppingbag.amount}");
								colorinfos[_ace_countvar] = tempDic${status.index};
								colorcodes[_ace_countvar] = "${shoppingbag.colorcode}";
								_ace_countvar++;
							</script>
							<!-- //Info wrap -->
							</c:forEach>
						</tbody>
						
					</table>
				</div>
				<!--// shoppingback table-->
				<!--Total wrap-->
				<div class="total_wrap">
					<!-- total -->
					<div class="total_price_wrap">
						<dl>
							<dt>상품 합계</dt>
							<dd>
								<span id="cartDataSubtotal"></span>
							</dd>
							<dt class="delch_wrap">
								<p class="tlt_ship">배송비</p>
								<!--delivery charge layer popup-->
								<div class="delch_box" style="display: none;">
									<span class="arr">위치아이콘</span>
									<ul class="bul_sty01_li">
										<li>쿠폰/바우처 할인금액 및 한섬마일리지/H.Point 사용을 제외한 실 결제금액 기준 <strong>3만원
												미만 결제 시 2,500원 배송비가 부과</strong> 됩니다.(3만원 이상 구매 시 무료배송)
										</li>
										<li>도서산간 지역은 배송비가 추가 될 수 있습니다.</li>
										<li>한섬마일리지, H.Point, e-money로 배송비 결제가 불가합니다.</li>
									</ul>
								</div>
								<!--//delivery charge layer popup-->
							</dt>
							<dd>
								<span id="cartDataDeliveryCost">₩ 0</span>
							</dd>
						</dl>
						<dl class="total ">
							<dt>합계</dt>
							<dd>
								<span id="cartDataTotalPrice"></span>
							</dd>
						</dl>
					</div>
					<div class="total_count1807">
						<p>
							총 <span id="selectProductCount">1</span>개 상품
						</p>
					</div>
					<!-- //total -->
				</div>
				<!--//Total wrap-->
				<!--button wrap-->
				<div class="btnwrap order" id="checkout_btn_wrap">
					<a href="javascript:void(0);" ><input id="selectDeleteBtn"value="선택상품삭제"
						class="btn wt" type="button" /></a> <a href="javascript:selectItemOrder();" > 
						<input value="선택상품 주문하기" class="btn gray mr0" type="button" />
					</a>

				</div>
				<!--//button wrap-->
				
			</div>
			<!--//order wrap-->
		</div> <!--//sub_container-->
	</span>
	<!-- // 장바구니개편 -->


	<!--Guide table-->
	<div class="gd_wrap mt60">
		<dl class="shoppingbag_list">
			<dt>쇼핑백 이용안내</dt>
			<dd class="shoppingbag_list_text">
				<ul class="bul_sty01_li">
					<li>쇼핑백에 담긴 상품은 30일 동안 보관됩니다. 30일이 지난 상품 자동 삭제됩니다.<br />더 오래
						보관하고 싶은 상품은 위시리스트에 담아주세요.
					</li>
					<li>쇼핑백에 최대 50개까지 상품 보관이 가능하며, 실제 구매 시에는 가격이나 혜택이 변동될 수 있습니다.</li>

					<li>쇼핑백에 담은 상품이 판매종료가 되었을 경우 자동 삭제 됩니다.</li>
					<li>쿠폰은 배송&결제정보 화면에서 입력 할 수 있습니다.</li>
					<li>상품별 지급율에 따라 한섬마일리지 및 H.POINT가 적립됩니다. 배송완료 10일 이후 적립되며 실
						결제금액기준입니다.</li>
					<li>해외 배송을 원할 경우 더한섬닷컴의 영문 혹은 중문 서비스를 이용해 주시기 바랍니다.</li>
					<li></li>
				</ul>
			</dd>
		</dl>
		<dl class="gd_list">
			<dt>카드행사 혜택</dt>
			<dd>
				<ul class="gd_btn1807">
					<li><a href="#;" rel="benefit_wrap1807">
							<p>무이자 할부</p> <span>자세히 보기 &gt;</span>
					</a></li>
					<li><a href="#;" rel="benefit2_wrap1807">
							<p>청구할인</p> <span>자세히 보기 &gt;</span>
					</a></li>
					<li><a href="#;" rel="benefit3_wrap1807">
							<p>즉시할인</p> <span>자세히 보기 &gt;</span>
					</a></li>
				</ul>
			</dd>
		</dl>
	</div>
	<!--//Guide table-->

	<form id="ordersheetCloneForm" name="orderSheetCloneForm"
		action="http://www.thehandsome.com/ko/shoppingbag/checkout" method="get">
		<input type="hidden" id="ordersheetEntryNumber"
			name="ordersheetEntryNumber" value="" /> <input type="hidden"
			id="ordersheetCartDivision" name="ordersheetCartDivision" value="" />
		<div>
			<input type="hidden" name="CSRFToken"
				value="a9703aad-d9dc-4a91-b1a9-28f56c82dc12" />
		</div>
	</form>
	<!-- layer pop 1 -->
	<div class="popwrap w_type_3" id="storePickupDiv"
		style="display: none;">
		<!--title-->
		<div class="pop_tltwrap">
			<h3>수령 매장 선택</h3>
		</div>
		<!--//title-->
		<!--contents-->
		<div class="pop_cnt zipcode">
			<!-- search -->
			<div class="search">
				<label for="search">지역명 (도로명)</label> <input type="text"
					id="storePickupSearchWord" name="searchWord"
					placeholder="매장명 또는 지역 명을 입력 후 검색해 주세요" style="width: 260px" /> <input
					type="button" value="검색" id="storePickupSearchBtn"
					class="btn wt_s mr0 min_auto" />
			</div>
			<!-- //search -->
			<!--  del_tab_container -->
			<div class="del_tab_container">
				<table class="pop_dtable store">
					<caption>배송지 목록</caption>
					<thead>
						<tr>
							<th scope="col">선택</th>
							<th scope="col">배송지 주소</th>
							<th scope="col">연락처/휴대폰</th>
						</tr>
					</thead>
					<tbody id="popupStorePickupContent">

					</tbody>
				</table>
				<div class="btnwrap">
					<input class="btn wt_s" id="storePickupCloseBtn" value="취소"
						type="button" /> <input class="btn gray_s"
						id="storePickupChoiceBtn" value="확인" type="button" />
				</div>
			</div>
			<!-- //del_tab_container -->
		</div>
		<!--//contents-->
		<a href="#;" class="btn_close" id="storePickupClose"><img
			src="http://cdn.thehandsome.com/_ui/desktop/common/images/popup/ico_close.png"
			alt="닫기" /></a>
	</div>

</div>
<!-- 네이버 애널리틱스 전환페이지 설정 : s -->
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
	var _nasa = {};
	_nasa["cnv"] = wcs.cnv("3", "1"); // 장바구니 전환유형, 전환가치
</script>
<!-- 네이버 애널리틱스 전환페이지 설정 : e -->
<form name="accessiblityForm">
	<input type="hidden" id="accesibility_refreshScreenReaderBufferField"
		name="accesibility_refreshScreenReaderBufferField" value="" />
</form>
<div id="ariaStatusMsg" class="skip" role="status" aria-relevant="text"
	aria-live="polite"></div>

<!--loadingbar-->
<div class="layerBg"></div>
<!--//loadingbar-->

<div id="popwrap_maple_evt2209"
	style="top: 50%; left: 50%; margin: -200px 0 0 -185px; width: 400px; position: fixed; display: block; z-index: 102">
</div>

<div class="layerArea" id="mapleLayer" style="display: none;">
	<div class="layerBg"></div>
</div>

<!-- 1~N개 주문을 위한  form-->
<form commandName="OrderListVO" id="itemsOrderForm" method='post'>

</form>

<script type="text/javascript">
	var virtusizeViewYn = false;

	virtusizeViewYn = true;

	if (virtusizeViewYn) {

	}
</script>
<script>
	function priceComma(price) {
		return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}
	
	function selectItemOrder(){
		let itemindex = 0;
		$('#itemsOrderForm').empty();
		$("tr[name=entryProductInfo]").each(function(index, item){
			if( $(this).find("input[name='cartlist']").is(":checked")){
				$('#itemsOrderForm').append('<input name="orders['+itemindex+'].pid" type="hidden" value="'+pids[index]+'">');
				$('#itemsOrderForm').append('<input name="orders['+itemindex+'].oamount" type="hidden" value="'+parseInt(pamounts[index])+'">');
				$('#itemsOrderForm').append('<input name="orders['+itemindex+'].ccolorcode" type="hidden" value="'+colorcodes[index]+'">');
				$('#itemsOrderForm').append('<input name="orders['+itemindex+'].ssize" type="hidden" value="'+psizes[index]+'">');
				itemindex ++;
			}
		});
		
		$('#itemsOrderForm').append('<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>');
		$('#itemsOrderForm').append('<input type="hidden" name="tocart" value="true" />');
		$("#itemsOrderForm").attr("action","/order/order_page");
		$("#itemsOrderForm").submit();
		
	}
	
	$(document).ready(
		function() {
			//삭제를 위한 ajax
			$.deleteFunction =  function(params){
				let csrfHeaderName ="${_csrf.headerName}";
				let csrfTokenValue="${_csrf.token}";
				
			    //통쉰 하자 ~
			    $.ajax({
			      type: "POST", // HTTP method type(GET, POST) 형식이다.
			      url: "/member/deleteShoppingBag", // 컨트롤러에서 대기중인 URL 주소이다.
			      beforeSend: function(xhr) {
	                    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);},
			      data: params, // Json 형식의 데이터이다.
			      contentType: "application/json; charset=utf-8",
		          //dataType: "json",
			      success: function (data) {
			          //성공하면 그냥 다시 로드해야징
			          location.href = "/member/shoppingbag?mid="+"${member}";
			      },
			      error: function (XMLHttpRequest, textStatus, errorThrown) {
			        // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
					  Swal.fire({
						  icon: 'error',
						  text: '통신실패.',
					  });
			      },
			    });
			}
			
			//선택된 놈들만 지우기
			$.selectRemove = function(){
				const deleteList = [];
				let checkCount = 0;
				$("tr[name=entryProductInfo]").each(function(index, item){
					if( $(this).find("input[name='cartlist']").is(":checked")){
						let itemMap = new Map();
						itemMap.set('mid',"${member}");
						itemMap.set('pid', pids[index]);
						itemMap.set('psize', psizes[index]);
						itemMap.set('pcolor', pcolors[index]);
						itemMap.set('pamount', parseInt(pamounts[index]));
						
						//객체화 시켜서 넣음
						deleteList.push(Object.fromEntries(itemMap));
						checkCount++;
					}
				});
				console.log(deleteList);
				//직렬화 해서 넘겨주자!
				if(checkCount > 0){
					$.deleteFunction(JSON.stringify(deleteList));	
				}
				
			}
			//선택상품삭제 버튼눌렀을때 실행시켜!
			$('#selectDeleteBtn').click(function(){
				$.selectRemove();
			});
			
			
			//전부 체크해버려!
			$("input[name='cartlist']").each(function(index, item){
				$(this).prop("checked", true);
			});
			//기본이 전부 선택이니까 전체 가격이랑 갯수 세기!!
			//시작할때 가격 3자리마다 , 붙이게
			$(".price_wrap").each(function(index, item){
				const price = priceComma($(this).find("input").val());
				$(this).find("span").text('₩'+price);
			});
			//시작할때 합계 구하기
			let total = 0;
			let count = 0;
			$("tr[name='entryProductInfo']").each(function(index, item){
				//수량
				const q = parseInt($(this).find("input[name='quantity']").val());
				//가격
				const p = parseInt($(this).find("input[name='checkZeroPrice']").val());
				//합 더하기
				total += p*q;
				count++;
			});	
			$("#cartDataSubtotal").text('₩'+priceComma(total))
			$("#cartDataTotalPrice").text('₩'+priceComma(total))
			$("#selectProductCount").text(count+'');
			
			//checkbox눌릴때마다 개수랑 합계 구하기
			$("input[name='cartlist']").on("click", function(){
				let checkedcount = 0;
				let checkedsumtotal = 0;
				$("tr[name=entryProductInfo]").each(function(index, item){
					if( $(this).find("input[name='cartlist']").is(":checked")){
						checkedcount++;
						checkedsumtotal += parseInt($(this).find("input[name='checkZeroPrice']").val());
					}
				});
				$("#cartDataSubtotal").text('₩'+priceComma(checkedsumtotal))
				$("#cartDataTotalPrice").text('₩'+priceComma(checkedsumtotal))
				$("#selectProductCount").text(checkedcount+'');
			});
			//checkbox 전부 선택버튼
			$("#entryCheckAll").click(function(){
				let checkedcount = 0;
				let checkedsumtotal = 0;
				if($("#entryCheckAll").is(":checked")){
					$("input[name=cartlist]").prop("checked", true);
					$("tr[name='entryProductInfo']").each(function(index, item){
						const q = parseInt($(this).find("input[name='quantity']").val());
						const p = parseInt($(this).find("input[name='checkZeroPrice']").val());
						checkedsumtotal += p*q;
						checkedcount++;
					});	
				}
				else{
					$("input[name=cartlist]").prop("checked", false);
					checkedcount = 0;
					checkedsumtotal = 0;
				}
				$("#cartDataSubtotal").text('₩'+priceComma(checkedsumtotal))
				$("#cartDataTotalPrice").text('₩'+priceComma(checkedsumtotal))
				$("#selectProductCount").text(checkedcount+'');
			});
			//상품 수량 변경하는거 
			$(".left").on("click", function(){
				let volumn = parseInt($(this).closest("span").find("input[name='quantity']").val());
				if(volumn > 1){
					volumn--;
				}
				$(this).closest("span").find("input[name='quantity']").val(volumn);
			});
			$(".right").on("click", function(){
				let volumn = parseInt($(this).closest("span").find("input[name='quantity']").val());
				if(volumn < 2){
					volumn++;
				}
				$(this).closest("span").find("input[name='quantity']").val(volumn);
			});
			//옵션변경 버튼누를때!
			$(".btn_option").click(function(){
				let checkElement = $(this).closest('tr').next();
				//눌렸으면숨기고 안눌렸으면 block으로 해서 보이게 하기
				if(checkElement.find(".basket_info").css('display') == 'none'){
					checkElement.find(".basket_info").css('display', 'block');
				}else{
					checkElement.find(".basket_info").css('display', 'none');
				}
			});
			//옵션변경창 닫기1,2
			$("a[name=closeclose]").click(function(){
				$(this).closest("tr").find(".basket_info").css('display', 'none');
			});
			//옵션변경의 사이즈버튼 눌릴때 적용되게
			$(".sz_select>a").click(function(){
			  //일단 모든 버튼 on 지우고
			  $(this).closest('div').find('a').removeClass('on');
			  //또한 누르면 그버튼이 계속 눌렸다는걸 표시
			  $(this).addClass('on');
			  //변경
			});
			//옵션변경의 컬러버튼 눌릴때 적용되게
			$(".beige").click(function(){
			  //일단 모든 버튼 on 지우고
			  $(this).closest('dl').find('.beige').removeClass('on');
			  //또한 누르면 그버튼이 계속 눌렸다는걸 표시
			  $(this).addClass('on');
			  //그리고 사진도 바뀌게 해줘야징
			  const itemIndex = parseInt($(this).closest('dl').attr("itemnum"));
			  const colorName = $(this).attr('value');
			  
			  const colorCode = colorinfos[itemIndex][colorName][0];
			 
			  const colorThumbUrl = colorinfos[itemIndex][colorName][1];
			  const productId = pids[itemIndex];
			  //사진과 href 다 바꿔버려 !
			  $(this).closest(".pt_list").find('img').attr('src', colorThumbUrl);
			  $(this).closest(".pt_list").find('.basket_tlt').attr('href', "/product/product_detail?pid="+productId+"&colorcode="+colorCode);
			  $(this).closest(".pt_list").children('a').attr('href', "/product/product_detail?pid="+productId+"&colorcode="+colorCode);
			});
			
			//변경버튼 눌렸을때 처리!	item마다 2개씩 변경 버튼 있는데 전부 name=changeBtn 라는 속성으로 묶어서 처리가능
			//그리고 그안에 itemnum이라는 index 번호로 알맞게 해당 item의 정보를 뺴와서 바꿀 수 있다
			$("a[name=changeBtn]").click(function(){
			  const index = parseInt($(this).attr('itemnum'));
			  const amount = $("input[itemnum="+index+"]").val();
			  const color = $("dl[itemnum="+index+"]").find(".beige.on").attr('value');
			  const size = $("dl[itemnum="+index+"]").find(".sz_select").find(".on").attr('value');

			  //변경눌렀을때 기존거랑 하나라도 다르면 업데이트 시켜!
			  if(color!=pcolors[index] ||
					  size!=psizes[index] ||
					  amount!=pamounts[index]){
				  let csrfHeaderName ="${_csrf.headerName}";
				  let csrfTokenValue="${_csrf.token}";
				  
				  const params = {
						  mid: "${member}",
						  pid: pids[index],
						  psize: size,
						  pcolor: color,
						  pamount: parseInt(amount)
						}
				  //통쉰 하자 ~
				  $.ajax({
					  type: "POST", // HTTP method type(GET, POST) 형식이다.
					  url: "/member/updateShoppingBag", // 컨트롤러에서 대기중인 URL 주소이다.
					  data: params, // Json 형식의 데이터이다.
					  beforeSend: function(xhr) {
		                    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);},
					  success: function (data) {
					    	//성공하면 그 수량대로 전체 합 바꾸고 요소들도 바꿔줘야지!
							let total = 0;
							let count = 0;
							$("tr[name='entryProductInfo']").each(function(index, item){
								if( $(this).find("input[name='cartlist']").is(":checked")){
									//수량
									const q = parseInt($(this).find("input[name='quantity']").val());
									//가격
									const p = parseInt($(this).find("input[name='checkZeroPrice']").val());
									//합 더하기
									total += p*q;
									count++;
								}
							});	
							$("#cartDataSubtotal").text('₩'+priceComma(total))
							$("#cartDataTotalPrice").text('₩'+priceComma(total))
							$("#selectProductCount").text(count+'');
							//컬러가 바뀌면 바뀐 colorcode로 img랑 a의 href 바꿔줘야지
							const cc = colorinfos[index][color][0]
							const thumburl = colorinfos[index][color][1]
							$("a[itemnum=a"+index+"]").find("img").attr("src", thumburl);
							$("a[itemnum=a"+index+"]").attr("href","/product/product_detail?pid="+pids[index]+"&colorcode="+cc);
							
							//요소 바꿔주고
							$("td[itemnum="+index+"]").find(".color_op").html(
									'color : '+ color +'<span class="and_line">/</span> size : '+ size);
							//배열값들도 바꿔줘야지
							pcolors[index]=color;
					  		psizes[index]=size;
					  		pamounts[index]=amount;

						  Swal.fire({
							  icon: 'success',
							  text: '장바구니 옵션이 변경 되었습니다.',
						  }).then(function(){
							  window.location.reload();
						  });

					  },
					  error: function (XMLHttpRequest, textStatus, errorThrown) {
					    // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
						  Swal.fire({
							  icon: 'error',
							  text: '통신실패',
						  });
					  },
					});
			  }
			});
			
			//아이템 삭제 (1개만)
			$("a[name=deleteOne]").click(function(){
			  const itemIndex = parseInt($(this).attr('itemnum'));
			  const deleteList = []
			  let itemMap = new Map();
			  itemMap.set('mid',"${member}");
			  itemMap.set('pid', pids[itemIndex]);
			  itemMap.set('psize', psizes[itemIndex]);
			  itemMap.set('pcolor', pcolors[itemIndex]);
			  itemMap.set('pamount', parseInt(pamounts[itemIndex]));
			  
			  deleteList.push(Object.fromEntries(itemMap));
			  //직렬화 해서 넘겨주자!
			  $.deleteFunction(JSON.stringify(deleteList));
			});
		});
		
</script>
<input type="hidden" id="apiConfmKey"
	value="U01TX0FVVEgyMDE5MDYxNzE2NDczMzEwODgxNTI=" />
<!-- Enliple Tracker End -->
</body>
<%@include file="/WEB-INF/views/common/footer.jspf"%>