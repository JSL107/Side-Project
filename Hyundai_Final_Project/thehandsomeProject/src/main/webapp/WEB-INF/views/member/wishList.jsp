<%@page import="com.hdsm.domain.MemberWishListDTOforJsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hdsm.domain.MemberWishListDTOforJsp" %>

<%@include file="/WEB-INF/views/common/header.jspf"%>

<div id="bodyWrap">
	<h3 class="cnts_title"><span id="menuTitle">위시리스트</span></h3>
	<div class="sub_container">
		<!-- lnb -->
		<div class="lnb_wrap">
			<h4><a href="/member/mypage">마이페이지<!-- 마이페이지 --></a></h4>
			 <div class="lnb">
				<dl>
					<dt>주문조회</dt>
					<dd>
						<a href="/member/orderlist">주문/배송/반품/취소</a>
						<form id="orderlist" action="/member/orderlist" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
                  </dd>
               </dl>

 				<dl>
                  <dt>나의 상품관리</dt>
                  <dd>
                     <a href="/member/wishList">위시리스트<!-- 위시리스트 --></a>
                  </dd>
               </dl>
               <dl>
                  <dt>나의 정보관리</dt>
                  <dd>
                     <a href="/member/pwcheck">개인정보 변경/탈퇴</a>
                  </dd>
               </dl>
               <dl>
                  <dt>나의 활동관리</dt>
                  <dd>
                     <a href="/member/reviewList">내 상품평</a>
                  </dd>
               </dl>
            </div>
			<!-- ph_guide -->
			<div class="ph_guide">
				<p class="tlt">고객센터 운영 안내</p>
				<p class="phone">1800-5700<span style="color: #c69c6d;" class="txt">(유료)</span></p>
				<p class="txt">평일(월~금)<br>am 09:00 ~ pm 18:00<span>토/일, 공휴일 휴무</span></p>
				<a href="mailto:shophelp@thehandsome.com">shophelp<br>@thehandsome.com</a>
			</div>
			<!-- //ph_guide -->
		</div>
		<!-- //lnb -->
		<!-- cnts -->
		<div class="sub_cnts">
			<input type="hidden" id="isEasyMember" value="false" /> 
			<input type="hidden" id="normalPoint" value="5.0" /> 
			<input type="hidden" id="outletPoint" value="1.0" />
			<div class="title_wrap mt30">
				<h4 class="float_left">위시리스트<!-- 위시리스트 --></h4>
				<p class="txt_line">위시리스트에는 상품이 최대 200개 까지 저장 됩니다.<!-- 위시리스트에는 상품이 최대 200개 까지 저장 됩니다. --></p>
			</div>
			<form id="wishListForm" action="/member/wishList"></form>
			<!-- Table -->
			<div class="tblwrap">
				<table class="tbl_ltype">
					<caption>Backet</caption>
					<colgroup>
						<col style="width: 10px" />
						<col />
						<col style="width: 105px" />
						<col style="width: 120px" />
						<col style="width: 110px" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">
								<input type="checkbox" id="entryCheckAll" title="선택" value="wishlist" name="allcheck" />
							</th>
							<th scope="col">상품정보<!-- 상품정보 --></th>
							<th scope="col">판매가<!-- 판매가 --></th>
							<th scope="col">한섬마일리지<br>적립율</th>
							<th scope="col">선택<!-- 선택 --></th>
						</tr>
					</thead>
					<tbody id="listBody">
						
						<script language='javascript' type="text/javascript">
							let pids = [];
							let psizes = [];
							let pcolors = [];
							let pamounts = [];
							let colorinfos = [];
							let _ace_countvar = 0;
						</script>
						
						<% List<MemberWishListDTOforJsp> asd = (List<MemberWishListDTOforJsp>)request.getAttribute("wishList");
							if(asd.size() == 0 ){ %>
							<tr>
								<td colspan="6" class="no_data frt">위시리스트에 담긴 상품이 없습니다.</td>
							</tr>
						<% } %>
						
						
						<c:forEach items="${wishList}" var="wishitem" varStatus="status">
							<tr name="entryProductInfo">
								<td class="frt">
									<input type="checkbox" name="wishlist" title="선택" value="9611194827454" data-value="SH2C9WJC201M" />
								</td>
								<td class="pt_list_wrap"  itemnum="${status.index}">
									<!-- pt_list_all -->
									<div class="pt_list_all">
										<a itemnum="a${status.index}"  href="/product/product_detail?pid=${wishitem.pvo.pid}&colorcode=${wishitem.colorcode}" >
										<img src="${wishitem.thumbnail}" alt="상품 이미지" style="object-fit : cover"/></a>
										<div class="tlt_wrap">
											<a class="basket_tlt" href="/product/product_detail?pid=${wishitem.pvo.pid}&colorcode=${wishitem.colorcode}" >
												<span class="tlt">${wishitem.pvo.bname}</span> 
												<span class="sb_tlt">${wishitem.pvo.pname}</span>
											</a>
										</div>
										
									</div>
								</td>
								<td class="al_middle">
									<form id="updateWishForm${status.index}" action="/member/wishUpdate" method="post">								
										<%-- <a href="javascript:void(0);" id="QuantityProduct_0" name="changeBtn"
											class="btn wt_ss qty_w mr0" itemnum="${status.index}">변경</a> --%>
									
									</form>
									<div class="price_wrap">
										<span>₩<fmt:formatNumber value="${wishitem.pvo.pprice}" pattern="#,###"></fmt:formatNumber> </span>
									</div>
								</td>
								<td class="al_middle"><span class="earn">5 %</span></td>
								<td class="al_middle">
									<div class="btn_wrap">
										<a href="javascript:void(0)" class="btn wt_ss add_bag parent_add_bag btn_option" product="8864770457601" index="0" productcode="SH2C9WJC201M">쇼핑백담기<!-- 쇼핑백담기 --></a>
										<a href="javascript:void(0)" class="btn wt_ss wishDel" name="deleteOne" itemnum="${status.index}">삭제<!-- 삭제 --></a>
									</div>
								</td>
							</tr>
							<tr class="hid">
								<td colspan="5" class="basket_wrap">
									<div class="basket_info" id="cart0" style="display: none">
										<span class="btn_arr">위치아이콘</span>
										<div class="info">
											<div class="pt_list" id="pt_list_0">
												
													<a itemnum="a${status.index}"  href="/product/product_detail?pid=${wishitem.pid}&colorcode=${wishitem.colorcode}" >
													<img src="${wishitem.thumbnail}" alt="상품 이미지" style="object-fit : cover"/></a>
													<div class="tlt_wrap wish">
														<a class="basket_tlt" href="/product/product_detail?pid=${wishitem.pvo.pid}&colorcode=${wishitem.colorcode}" >
															<input type="hidden" id="promotionProduct0" value="false" /> 
															<span class="tlt">${wishitem.pvo.bname}</span> 
															<span class="sb_tlt" id="productName0">
															<span class="reserveProdNmChild">${wishitem.pvo.pname}</span>
														</a>
													</div>
												
												
												<div class="tlt_wrap wish">
													<!-- color_size -->
													<dl class="cs_wrap" itemnum="${status.index}">
														<!-- color -->
														<dt>COLOR</dt>
															<input type="hidden" name="colorName" id="colorName" value="">
															<script>
																let tempDic${status.index} = {};
															</script>
														<dd>
															<div class="cl_select">
																<c:forEach items="${wishitem.colorList}" var="color">
																	<a href="javascript:void(0)"
																		value = "${color.cname}"
																		class="beige" 
																		style="background: #F8F8F8 url('${color.ccolorimage}');">${color.cname}</a>
																<script>
																	tempDic${status.index}['${color.cname}'] = ["${color.ccolorcode}","${color.c_thumbnail1}"]
																</script>
																</c:forEach>
															</div>
														</dd>
															
														<!-- size -->
														<dt>SIZE</dt>
														<input type="hidden" name="curSelectSize" id="curSelectSize" value="">

														<dd>
															<div class="sz_select">
																
																<c:forEach items="${wishitem.sizeList}" var="size" varStatus="sizeStatus">
																	<a href="javascript:void(0)"
																	value="${size}" sizenum="${sizeStatus.index}"
																	<c:choose>
																		<c:when test="${size eq wishitem.ssize}" >
																			class="sizeBtn on" style="line-height: 15px;"
																		</c:when>
																		<c:otherwise>
																			class="sizeBtn"
																		</c:otherwise>
																	</c:choose> 
																		>${size}
																	</a>
																</c:forEach>
																
															</div>		
														</dd>
														<dt>수량<!-- 수량 --></dt>
														<dd>
															<span class="qty_sel num"> 
																<a href="javascript:void(0)" class="left">이전 버튼</a> 
																<input type="text" name="quantity" title="수량" value="1" id="quantity0" class="mr0" readonly="readonly" />
																<a href="javascript:void(0)" class="right">다음 버튼</a>
															</span>
														</dd>
													</dl>
													<!-- //color_size -->
													<form id="addToCartForm0" name="addToCartForm"
														action="http://www.thehandsome.com/ko/mypage/wishlistaddcart?productCode=SH2C7ASZ074M&amp;index=0" method="post">
														<input type="hidden" maxlength="3" size="1" name="qty" class="qty" /> 
														<input type="hidden" name="productCodePost" value="SH2C7ASZ074M_BK_260" /> 
														<input type="hidden" name="productCodeType" value="ApparelSizeVariantProduct" />
														<input type="hidden" id="stockCnt0" value="16" /> 
														<input type="hidden" name="onlyStorePickup" value="false" />
														<div>
															<input type="hidden" name="CSRFToken" value="6a78cd6f-6ec6-4c63-88fb-3fa2102e55df" />
														</div>
													</form>
												</div>
											</div>
											<div class="btns">
												<a href="javascript:void(0)" class="btn wt_ss bag addToCartButton" name="changeBtn"  itemnum="${status.index}" >쇼핑백담기<!-- 쇼핑백담기 --></a>
												<a href="javascript:void(0)" name="closeclose" class="btn wt_ss mt10 bag" id="cancle_0">취소<!-- 취소 --></a> 
												<a href="javascript:void(0)" name="closeclose" class="btn_close bag" id="close_0">닫기<!-- 닫기 --></a>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="6" class="basket_wrap"></td>
							</tr>
							
							<!-- 변경을 위한 form tag -->
							<!-- Data Allocation (Product_Detail) -->
							<script language='javascript' type="text/javascript">
								pids[_ace_countvar] = "${wishitem.pvo.pid}";
								pcolors[_ace_countvar] = "${wishitem.scolor}";
								colorinfos[_ace_countvar] = tempDic${status.index};
								_ace_countvar++;
							</script>
							<!-- //Info wrap -->
							
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- //Table -->

			<!--  <p class="mt10 ml10">* 세일/가격인하/아울렛 일부 할인 상품은 한섬마일리지 적립이 불가합니다. 정확한 적립율은 쇼핑백과 상품상세페이지에서 확인하세요.</p>-->
			<p class="mt10 ml10">* 정확한 적립율은 상품상세페이지에서 확인하세요.</p>
			<div class="btn_btwrap">
				<a href="javascript:void(0);" class="btn wt_ss selectDel">선택삭제<!-- 선택삭제 --></a>
			</div>
			<!-- paging -->
			<div class="paging"></div>
			<!-- //paging -->

		</div>
		<!-- //cnts -->
	</div>
</div>
<!-- 장바구니 담겼을때 계속 쇼핑할지 말지  -->
<div class="layerArea" id="productLayer" style="display: none;">
	<div class="layerBg"></div>
	<div class="popwrap w_type_1" id="putCart"
		style="z-index: 150; margin-top: 853px; display: none;" tabindex="-1">
		<div class="pop_cnt">
			<h3 class="pop_tlt copy">
				쇼핑백에 담겼습니다.<br>확인하시겠습니까?
			</h3>
			<div class="btnwrap">
				<input type="button" id="cfBtn" class="btn gray_s mr0" value="쇼핑백 바로가기">
			</div>
		</div>
		<a href="javascript:void(0);" class="btn_close" id="clsBtn">
		<img src="/resources/images/ico_close.png" alt="닫기"></a>
	</div>
	<!-- 사이즈 선택 여부 창 -->
	<div class="popwrap w_type_1 " id="Order_confirm" style="z-index: 150; margin-top: 753px; display:none;"
		tabindex="-1">
		<div class="pop_cnt">
			<h3 class="pop_tlt copy">옵션을 선택해 주세요.</h3>
			<div class="btnwrap">
				<input type="button" class="btn gray_s mr0" id="clsBtn2" value="확인">
			</div>
		</div>
	</div>
	<div id="alreadyInsert" class="popwrap w_type_1"
	  style="z-index: 150; margin-top: 1072px; display:none;" tabindex="-1">
		<div class="pop_cnt">
			<h3 class="pop_tlt copy">
				이미 쇼핑백에 담겨있습니다.<br />
				<p style="color: gray; font-size: 14px; margin-top: 8px">
				(동일 상품은 최대 2개까지 구매 가능)
				</p>
			</h3>
			<div class="btnwrap">
				<input type="button" class="btn gray_s mr0" id="clsBtn3" value="확인" />
			</div>
		</div>
	</div>
</div>

<script>
//좋아요 지우는 ajax처리
	function deleteajaxRequest(params){
		//스프링 보안 설정 CSRF 토큰값
		let csrfHeaderName ="${_csrf.headerName}";
		let csrfTokenValue="${_csrf.token}";
		
		$.ajax({
			type : "POST",
			url : "/member/deleteWishList",
			beforeSend: function(xhr) {
		          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);},
			data : params,// json 형태의 데이터
			contentType: "application/json; charset=utf-8",
			success : function(data) {
				console.log(data);
				isWishList=data;
				location.reload(true);
			},
			error : function(jqXHR, textStatus, errorThrown){
	        	console.log(jqXHR);  //응답 메시지
	        	console.log(textStatus); //"error"
	        	console.log(errorThrown);
	        }
		});
	}
	

    function Goorderlist(){
       $("#orderlist").submit();
    }
	
	$(document).ready(
		function() {
			
			// 선택 삭제
			//선택된 놈들만 지우기
			$.selectRemove = function(){
				const deleteList = [];
				let checkCount = 0;
				let itemMap = new Map();
				
				$("tr[name=entryProductInfo]").each(function(index, item){
					if( $(this).find("input[name='wishlist']").is(":checked")){
						
						itemMap.set('member_mid', "${member}");
						itemMap.set('pid', pids[index]);
						
						//직렬화 해서 넘겨주자!
						deleteList.push(Object.fromEntries(itemMap));
						deleteajaxRequest(JSON.stringify(deleteList));
						checkCount++;
					}
				});	
				console.log("checkCount : "+checkCount);
				console.log(deleteList);
				
			}
			$(".selectDel").click(function(){
				$.selectRemove();
			});
				
			
			//삭제
			//장바구니버튼 눌렀을때
			$(".wishDel").on("click", function(e){
				
				const itemIndex = parseInt($(this).attr('itemnum'));
				const productId = pids[itemIndex];

				console.log("itemIndex : " + itemIndex);
				console.log("productId : " + productId);

				const params = {
					mid: "${member}",
					pid: productId,
				}
				
				let isWishList = "${wishList}";
				
				let itemMap = new Map();
				itemMap.set('member_mid',"${member}");
				itemMap.set('pid', productId);
				
				if(isWishList != "0") {
					const deleteList = [];
					deleteList.push(Object.fromEntries(itemMap));
					deleteajaxRequest(JSON.stringify(deleteList));
				}
				//const deleteList = [];
				
				
				/* //ajax 호출!
				$.ajax({
					type : "POST",            // HTTP method type(GET, POST) 형식
					url : "/member/deleteWishList",      // 컨트롤러에서 대기중인 URL 주소
					data : params,            // Json 형식의 데이터
				    beforeSend: function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					success : function(data){ // 비동기통신의 성공일경우 success콜백으로 들어옴 'data'는 응답받은 데이터
						console.log(data);
					},
					error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옴
						alert("삭제 실패.");
					}
				}); */
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
			
			//전부 체크해버려!
			$("input[name='wishlist']").each(function(index, item){
				$(this).prop("checked", false);
			});
			
			//checkbox 전부 선택버튼
			$("#entryCheckAll").click(function(){
				let checkedcount = 0;
				if($("#entryCheckAll").is(":checked")){
					$("input[name=wishlist]").prop("checked", true);
					$("tr[name='entryProductInfo']").each(function(index, item){
						checkedcount++;
					});	
				}
				else{
					$("input[name=wishlist]").prop("checked", false);
					checkedcount = 0;
				}
			});
			
			//옵션변경의 사이즈버튼 눌릴때 적용되게
			$(".sz_select>a").click(function(){
				//일단 모든 버튼 on 지우고
				$(this).closest('div').find('a').removeClass('on');
				//또한 누르면 그버튼이 계속 눌렸다는걸 표시
				$(this).addClass('on');
				//변경
				$("#curSelectSize").val($(this).attr('value'));
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
				// input hidden에 넣어준 값
				$("#colorName").val(colorName);
				console.log($("#colorName").val());
				const colorCode = colorinfos[itemIndex][colorName][0];
				const colorThumbUrl = colorinfos[itemIndex][colorName][1];
				const productId = pids[itemIndex];
				
				
				console.log("colorCode --------------------- "+colorCode);
				//사진과 href 다 바꿔버려 !
				$(this).closest(".pt_list").find('img').attr('src', colorThumbUrl);
				$(this).closest(".pt_list").find('.basket_tlt').attr('href', "/product/product_detail?pid="+productId+"&colorcode="+colorCode);
				$(this).closest(".pt_list").children('a').attr('href', "/product/product_detail?pid="+productId+"&colorcode="+colorCode);
			});
			
			//let selectSize = "88";	
			
			//장바구니버튼 눌렀을때
			$(".addToCartButton").on("click", function(e){
				
				const itemIndex = parseInt($(this).attr('itemnum'));
				const productId = pids[itemIndex];
				const pColor = $("#colorName").val();  
				const selectSize = $("#curSelectSize").val();
				
				console.log("itemIndex : " + itemIndex);
				console.log("productId : " + productId);
				console.log("selectSize : " + selectSize);
				console.log("pColor : " + pColor);
				
				//우선 색상 선택 했는지 물어봐
				if(pColor == "" || selectSize == "") {
					$(".layerArea").show();
					$("#Order_confirm").show();
				}
				else {
					
					$("#Order_confirm").hide();
					
					let csrfHeaderName ="${_csrf.headerName}";
					let csrfTokenValue="${_csrf.token}";

					const params = {
						mid: "${member}",
						pid: productId,
						psize: selectSize,
						pcolor: pColor,
						pamount: $("#quantity0").val()
					}
					console.log(params);
				
					//ajax 호출!
					$.ajax({
						type : "POST",            // HTTP method type(GET, POST) 형식
						url : "/member/insertShoppingbag",      // 컨트롤러에서 대기중인 URL 주소
						data : JSON.stringify(params),            // Json 형식의 데이터
						contentType : 'application/json; charset=utf-8',
					    beforeSend: function(xhr) {
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						},
						success : function(data){ // 비동기통신의 성공일경우 success콜백으로 들어옴 'data'는 응답받은 데이터
						// 응답코드 > 0000
							console.log(data);
							const isfail = data.split(':')[0];
							const count = parseInt(data.split(':')[1]);
							console.log(isfail);
							//만약 세션의 장바구니 갯수와 반환받은 data와 다르면 성공 ! 같으면 안된거니까 실패 !
							if(isfail == "success"){
								console.log("success");
								$(".layerArea").show();
								$("#putCart").show();	
							}else {
								console.log("fail");
								$(".layerArea").show();
								$("#alreadyInsert").show();
							}
						},
						error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옴
							alert("통신 실패.");
						}
					});
				}     
			});
			
			//상품 수량 변경하는거 
			$(".left").on("click", function(){
				let volumn = parseInt($(this).closest("span").find("input[name='quantity']").val());
				if(volumn > 1){
					volumn--;
				}
				$(this).closest("span").find("input[name='quantity']").val(volumn);
				console.log(volumn);
			});
			$(".right").on("click", function(){
				let volumn = parseInt($(this).closest("span").find("input[name='quantity']").val());
				if(volumn < 2){
					volumn++;
				}
				$(this).closest("span").find("input[name='quantity']").val(volumn);
				console.log(volumn);
			});
			
			
			//쇼핑백 담기 - 닫기 버튼
			$("#clsBtn").on("click", function() {
				//밖에 있는 layerArea 태그를 숨긴다.
				$(".layerArea").hide();
				//그중 Cart 모달을 나타내는 태그를 숨긴다
				$("#putCart").hide();
				location.reload(true);
			});
			
			//쇼핑백으로 바로가기
			$("#cfBtn").on("click", function() {
				location.href = "/member/shoppingbag?mid=${member}";
			}); 
			
			//옵션 선택 - 닫기(확인) 버튼
			$("#clsBtn2").on("click", function() {
				//밖에 있는 layerArea 태그를 숨긴다.
				$(".layerArea").hide();
				//그중 Cart 모달을 나타내는 태그를 숨긴다
				$("#putCart").hide();
			});
			
			// 이미 쇼핑백에 담김 - 닫기(확인) 버튼
			$("#clsBtn3").on("click", function() {
				//밖에 있는 layerArea 태그를 숨긴다.
				$(".layerArea").hide();
				//그중 Cart 모달을 나타내는 태그를 숨긴다
				$("#putCart").hide();
				location.reload(true);
			});
			
		}
	);
	</script>
<%@include file="/WEB-INF/views/common/footer.jspf"%>