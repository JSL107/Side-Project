<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
  <!-- 
  /* 작성자 : 문혁
 * 장바구니 페이지
 */
   -->
<!-- 
추가한 스크립트
 -->
<input id = "token" type="hidden" name="${_csrf.parameterName}"
       value="${_csrf.token}" />
<script type="text/javascript">

//한 상품 삭제 함수
function deleteProduct(cid) {
        var url = "/cart/delete";
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
    });
        if (confirm("해당 상품을 삭제하시겠습니까?") == true) {
        	var checkArr = new Array();
        	checkArr.push(cid);
        	 $.ajax({
         	    url : "/cart/delete",
         	    type : "post",
         	    data : { chbox : checkArr },
         	    success : function(){
         	     location.href = "/cart/cartList";
         	    }
         	   });
        }
    }

//장바구니 수량변경 함수
function change_qty(cartIndex, button){
	console.log("장바구니수량변경함수 들어옴");
	console.log("cartIndex: "+cartIndex);
	console.log("버튼: "+button);
	var this_qty = $("#quantity"+cartIndex).val()*1;
	var min_qty = 1;
	var max_qty = 5;
	console.log("현재수량: "+this_qty);
	if(button=='left'){
		this_qty -= 1;
		if(this_qty<min_qty){
			this_qty = 1;
		}
		console.log(this_qty);
	}else if(button=='right'){
		this_qty += 1;
		console.log('+들어옴'+this_qty);
		/* if(this_qty > max_qty){
			alert("재고가 부족합니다.");
			return;
		} */
	}
	console.log("내값 : "+ this_qty);
	$("#quantity"+cartIndex).val(this_qty);
	console.log("value : " + $("#quantity"+cartIndex).val());
}
	
	$(document).ready(function(){
		// 숫자 format
		Number.prototype.format = function(){
			if(this==0) return 0;

		     var reg = /(^[+-]?\d+)(\d{3})/;
		     var n = (this + '');
		     
		     while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
		     
		     return n;
		};
		
		//김나형 - 옵션변경 닫기,취소버튼 눌렀을때 창닫히기
		/*    $(".btn_close, .btn wt_ss mt10 mr0").on("click", function(){
		       $(".popwrap, .layerArea").hide();
		   }); */
		
		//김나형 - 전체선택 시 체크박스 전체선택됨
		$("#entryCheckAll").click(function(){
			var productcount = 0;
			var sumtotal = 0;
			if($("#entryCheckAll").is(":checked")){
				$("input[name=cartlist]").prop("checked", true);
				$("tr[name='entryProductInfo']").each(function(index, item){
					var price = $(this).find("input[name='checkZeroPrice']").val()*1;
					productcount++;
					sumtotal += price;
				});
			}
			else{
				$("input[name=cartlist]").prop("checked", false);
				productcount = 0;
				sumtotal = 0;
			}
			$("#cartDataSubtotal").html('₩ '+sumtotal.format());
			$("#cartDataTotalPrice").html('₩ '+sumtotal.format());
			$("#selectProductCount").val(productcount);
		});
		
		//김가희 - 체크박스 선택시 수량,총금액 바뀌기
	      $("input[name='cartlist']").on("click", function(){
	         var cnt = 0;
	         var total = 0;
	         $("tr[name=entryProductInfo]").each(function(index, item){
	            if( $(this).find("input[name='cartlist']").is(":checked")){
	               cnt++;
					var price = $(this).find("input[name='checkZeroPrice']").val()*1;
	               total += price;
	            }
	         });
	         console.log("cnt: "+cnt+" total: "+total);
	         $("#cartDataSubtotal").text('₩ '+total.format());
	         $("#cartDataTotalPrice").text('₩ '+total.format());
	         $("#selectProductCount").text(cnt);
	      });
	});

</script>

<script type="text/javascript">
//장바구니 수량 수정버튼 눌렀을 때
function qty(cartIndex, cid){
	var this_qty = $("#quantity"+cartIndex).val()*1;
	console.log("real들어옴: "+cid+" "+this_qty);
	location.href="/cart/updateQty?cid=" +cid+ "&qty=" +this_qty;
}

//김가희 김나형 - 옵션변경 창닫히기
$(document).on("click", '.btn', function(){
    var prodid = $(this).prop('id').split("_");
    
    if(prodid[0] == 'optCancelLayer'){
        $(this).parents('.basket_info').slideUp('fast');
    }
});
</script>


<!--sub_container-->
<c:choose>
	<c:when test="${cartList.size() == 0}">
	            <div class="sub_container ">
                <!--order wrap-->
                <div class="shopping_cart_tab1807 tab_a">
                    <!-- 장바구니개편 -->
                    <ul class="tab3">
                        <li>
                            <a href="#;" name="cartDivision" data-division="" onclick="GA_Event('쇼핑백', '탭', '택배');"
                                class="active"><span class="delt_ico"></span>택배 (0)</a>
                        </li>
                        <li>
                            <a href="#;" name="cartDivision" data-division="store"
                                onclick="GA_Event('쇼핑백', '탭', '매장수령');" class=""><span class="spt_ico"></span>매장수령
                                (0)</a>
                        </li>
                        <li>
                            <a href="#;" name="cartDivision" data-division="quick"
                                onclick="GA_Event('쇼핑백', '탭', '퀵배송                                           ');"
                                class=""><span class="quk_ico"></span>퀵배송 (0)</a>
                        </li>
                    </ul>
                    <!-- //장바구니개편 -->
                </div>

                <div class="orderwrap1807">
                    <div class="tbl_info_wrap">
                        <p class="cart_top_text">
                        </p>

                        <div class="fourpm_pd_ck">
                            <div class="input_wrap">
                            </div>
                        </div>
                    </div>
                    <!--shoppingback table-->
                    <div class="tblwrap">
                        <table class="tbl_ltype">
                            <caption>
                                쇼핑백</caption>
                            <colgroup>
                                <col style="width: 10px;">
                                <col>
                                <col style="width: 120px">
                                <col style="width: 105px">
                                <col style="width: 140px">
                                <col style="width: 110px">
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
                                <tr>
                                    <td colspan="6" class="no_data frt">쇼핑백에 담긴 상품이 없습니다.</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--// shoppingback table-->
                    <!--Total wrap-->
                    <div class="total_wrap">
                        <!-- total -->
                        <div class="total_price_wrap">
                            <dl>
                                <dt>
                                    상품 합계</dt>
                                <dd>
                                    <span id="cartDataSubtotal">₩0</span>
                                </dd>
                                <dt class="delch_wrap">
                                    <p class="tlt_ship">배송비</p>
                                    <!--delivery charge layer popup-->
                                    <div class="delch_box" style="display: none;">
                                        <span class="arr">위치아이콘</span>
                                        <ul class="bul_sty01_li">
                                            <li>쿠폰/바우처 할인금액 및 한섬마일리지/H.Point 사용을 제외한 실 결제금액 기준 <strong>3만원 미만 결제 시
                                                    2,500원 배송비가 부과</strong> 됩니다.(3만원 이상 구매 시 무료배송)</li>
                                            <li>도서산간 지역은 배송비가 추가 될 수 있습니다.</li>
                                            <li>한섬마일리지, H.Point, e-money로 배송비 결제가 불가합니다.</li>
                                        </ul>
                                    </div>
                                    <!--//delivery charge layer popup-->
                                </dt>
                                <dd>
                                    <span id="cartDataDeliveryCost">₩0</span>
                                </dd>
                            </dl>
                            <dl class="total ">
                                <dt>
                                    합계</dt>
                                <dd>
                                    <span id="cartDataTotalPrice">₩0</span>
                                </dd>
                            </dl>
                        </div>
                        <div class="total_count1807">
                            <p>총 <span id="selectProductCount">0</span>개 상품</p>
                        </div>
                        <!-- //total -->
                    </div>
                    <!--//Total wrap-->
                    <!--button wrap-->
                    <div class="btnwrap order" id="checkout_btn_wrap">
                        <a href="#;" onclick="selectRemove();"><input value="선택상품삭제" class="btn wt" type="button"></a>
                        <a href="#;" onclick="checkoutPage();">
                            <input value="선택상품 주문하기" class="btn gray mr0" type="button">
                        </a>

                    </div>
                    <!--//button wrap-->
                </div>
                <!--//order wrap-->
            </div>
	
	</c:when>
	<c:otherwise>
	        <div class="sub_container ">
            <!--order wrap-->
            <div class="shopping_cart_tab1807 tab_a">
                <!-- 장바구니개편 -->
                <ul class="tab3">
                    <li>
                        <a href="#;" name="cartDivision" data-division="" onclick="GA_Event('쇼핑백', '탭', '택배');"><span class="delt_ico"></span>택배 (${total})</a>
                    </li>
                    <li>
                        <a href="#;" name="cartDivision" data-division="store" onclick="GA_Event('쇼핑백', '탭', '매장수령');" ><span class="spt_ico"></span>매장수령 (0)</a>
                    </li>
                    <li>
                        <a href="#;" name="cartDivision" data-division="quick" onclick="GA_Event('쇼핑백', '탭', '퀵배송');" ><span class="quk_ico"></span>퀵배송(0)</a>
                    </li>
                    </ul>
                <!-- //장바구니개편 -->
            </div>
            
            <div class="orderwrap1807">             
                <div class="tbl_info_wrap">
                    <p class="cart_top_text">
                       </p>
                    
                    <div class="fourpm_pd_ck">
                        <div class="input_wrap">
                        </div>
                    </div>
                    </div>
                <!--shoppingback table-->
                <div class="tblwrap">
                    <table class="tbl_ltype">
                        <caption>
                            쇼핑백</caption>
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
<!--                         여기부터 -->

							<!-- c.mid, pid, psize, pcolor, pamount 
							d.bname, pname, pprice, clarge, cmedium, csmall, t01_imageurl  -->
						<c:forEach var="c" items="${cartList}" varStatus="cartIndex">
							<c:set var="d" value="${detailList[cartIndex.index]}"></c:set>
                            <tr name="entryProductInfo" data-pk="10687045664812" data-deliverykind="" data-outofstock="false" data-category="ME011"> 
                       <td class="frt">
                       	   <!-- 2019.11.07 쇼핑백 진입 시 선택 상품 없도록 수정 -->
                           <input type="checkbox" name="cartlist" data-pk="${c.cid}" data-division="" data-deliverykind="" value="9">
                       </td>
                       <td class="pt_list_wrap">
                           <!-- pt_list_all -->
                           <div class="pt_list_all">
                                <a href="/product/productDetail?pid=${c.pid}&ccolorcode=${c.pcolor}" onclick="javascript:setEcommerceData('0', 'Click ADD');GA_Event('쇼핑백','상품','${d.pname}');">
                                <img src="${d.cimage3}" alt="" />
                                </a>
                               <div class="tlt_wrap">
                                   <a href="/product/productDetail?pid=${c.pid}&ccolorcode=${c.pcolor}" class="basket_tlt" onclick="javascript:setEcommerceData('0', 'Click ADD');GA_Event('쇼핑백','상품','${d.pname}');"> 
                                       <span class="tlt">${d.bname}</span> 
                                       <span class="sb_tlt">
                                            ${d.pname}</span>
                                   </a>
    
                                   <p class="color_op">
                                       
                                               color : ${c.pcolor}<span class="and_line">/</span>
                                               
                                                       size : ${c.psize}</p>
                            
                            
                                <div class="option_wrap">
                                <a href="#none" class="btn_option" id="optOpenLayer^9^TH2C3TRN644N_CR" onclick="cartOption('${c.pid}','${c.pcolor}')">옵션변경</a>
                                </div>
                                    
                                </div>
                            </div>
                            <!-- //pt_list_all-->
                            </td>
                            <td class="al_middle">
                                <form id="updateCartForm${cartIndex.index}" data-cart="{&quot;cartCode&quot; : &quot;371497467&quot;,&quot;productPostPrice&quot;:&quot;155000.0&quot;,&quot;productName&quot;:&quot;[온라인 단독] 세미 오버핏 솔리드 티셔츠&quot;}" action="/ko/shoppingbag/update" method="post">
                                	<input type="hidden" name="entryNumber" value="${cartIndex.index}" />
                                    <input type="hidden" name="productCode" value="${c.pid}" />
                                    <input type="hidden" name="initialQuantity" value="${c.pamount}" />
                                    <input type="hidden" name="chgProductCode" value="" />
                                    <input type="hidden" name="curSize" value="1<%-- ${c.psize} --%>" />
                                    <input type="hidden" name="storeId" value="" />
                                    <input type="hidden" name="storePickupDate" value="" />
                                    <input type="hidden" name="deliveryKind" value="" />
                                    <input type="hidden" name="cartDivision" value="" />
                                    <!-- qty_sel -->
                                    <span class="qty_sel num">
                                        <a class="left" onclick="change_qty('${cartIndex.index}', 'left');">이전 버튼</a> 
                                            <input type="text" id="quantity${cartIndex.index}" name="quantity"  class="mr0" value="${c.pamount}" readonly="readonly"/>
                                        <a class="right" onclick="change_qty('${cartIndex.index}', 'right');">다음 버튼</a>
                                        </span>
                                    <!-- //qty_sel -->
                                    <a href="#none" id="QuantityProduct_${cartIndex.index}" class="btn wt_ss qty_w mr0" onclick="qty('${cartIndex.index}','${c.cid}');">변경</a>
                                        <div>
<!-- <input type="hidden" name="CSRFToken" value="2e4f730b-79fa-408e-b072-425a73f94a7c" /> -->
</div></form></td>
                            <td class="al_middle">
                                <!-- Price -->
                                <div class="price_wrap">
                                	<span>₩<fmt:formatNumber value="${d.pprice * c.pamount}" type="number" pattern="###,###" /></span> 
                                	<!-- 김가희 - 체크박스 하나당 가격전송 -->
                                	<input type="hidden" id="b" name="checkZeroPrice" value="${d.pprice * c.pamount}" />
                                </div> <!-- //Price -->
                            </td>
                            <td class="al_middle">       
                                    <span class="earn">5% (H.Point)</span>            
                                </td>
                            <td class="al_middle">
                                <!-- Button size -->
                                <div class="btn_wrap">
                                    <a href="#none" class="btn gray_ss" onclick="callWishListClick('${d.pname}',$(this),'${c.pid }');" data-value="0">위시리스트</a>
                                        <a href="javascript:deleteProduct('${c.cid}');" id="RemoveProduct_${cartIndex.index}" class="btn wt_ss" onclick="GA_Event('쇼핑백','삭제','${d.pname}');">삭제</a>
                                    </div> <!-- //Button size -->
                            </td>
                            </tr>
                            <!-- Info wrap -->
                            <tr>
                                <td colspan="6" class="basket_wrap">
                                    <!-- Info -->
									<!--  옵션변경 버튼 누를 시 나오는 상품 디테일 -->
                                    <div class="basket_info">
                                        <span class="btn_arr">위치아이콘</span>
                                        <div class="info">
                                            <!-- Products -->
                                            <div class="pt_list" id="pt_list_${cartIndex.index}">
											<a href="#">
											<img src="${d.cimage3}" id="pt_list_img_${cartIndex.index}" alt="">
												</a>
											<div class="tlt_wrap">
												<a href="/product/productDetail?pid=${c.pid}&ccolorcode=${c.pcolor}" class="basket_tlt">
											        <span class="tlt">${d.bname}</span>
											        <span class="sb_tlt">${d.pname}</span>
											    </a>
												<!-- color_size -->
												<dl class="cs_wrap">
													<dt>COLOR</dt>
													<dd>
														<div class="cl_select">
														<c:forEach var ="f" items="${colorMap[cartIndex.index]}" varStatus="status">
														<a href="javascript:void(0);" onclick="clickColor('${cartIndex.index}','${f.ccolorcode}','${f.cimage3}');" class="beige" style="background: url('${f.ccolorimage }">${f.ccolorcode}</a>
														</c:forEach>
														<!-- 김가희 김나형 - 옵션변경 창에서 색상을 클릭하면 이미지와 색상코드로 변경해주는 함수 -->
														<script>
															function clickColor(index,colorcode,img){
																console.log("들어옴!"+colorcode);
																console.log("clickColor함수에 index"+index);
																$(".cs_sel1807").html(colorcode);	//선택된 색상 컬러코드 보여주기
																$("#pt_list_img_"+index).attr("src",img);//선택된 색상 이미지 보여주기
															}
														</script>
														
<%-- 																		<a href="javascript:void(0);" onclick="setOptions(this, '0', '${c.pid}', 'style');" class="beige on" style="background:#000000 url('http://newmedia.thehandsome.com/SH/2C/SS/SH2C4TRN654M_BK_C01.jpg/dims/resize/18x18')">BLACK</a> --%>
																		<span class="cs_sel1807">${c.pcolor}</span>
														</div>
													</dd>
													<dt>SIZE</dt>
													<dd style="width: 90%; height: 100%;">
														<div class="sz_select">
														<c:forEach var ="s" items="${sizeMap[cartIndex.index]}" varStatus="status">
															<a href="javascript:void(0);" onclick="setOptions(this, '0', '${c.pid}', 'size');" class="" style="line-height: 15px;">${s.ssize} </a>
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
                                                <a href="#none" class="btn wt_ss mr0" id="UpdateCart_${cartIndex.index}" onclick="clickChange('${c.cid}');">변경</a>
                                                <a href="#none" class="btn wt_ss mt10 mr0" id="optCancelLayer_${cartIndex.index}">취소</a>
                                                <a href="#none" class="btn_close" id="optCloseLayer_${cartIndex.index}">닫기</a>
                                            </div>
                                            <!-- 김가희 김나형 - 옵션변경창에서 변경할 옵션 선택후 변경버튼 눌렀을 때 적용되는 함수 -->
                                            <script>
                                            	function clickChange(cid){
                                            		console.log("카트아이디: "+cid);
                                            		var color = $(".cl_select").find("a.beige.on").text();
                                            		var size = $(".sz_select").find("a.on").text();
                                            		console.log("옵션color"+color);
                                            		console.log("옵션size"+size);
                                            		
                                            		location.href="/cart/updateOption?cid="+cid+"&colorcode="+color+"&size="+size;
                                            	}
                                            </script>
                                            <!-- //btns -->
                                        </div>
                                    </div> <!-- //Info -->
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" class="basket_wrap">
                                    </td>
                            </tr>
                            
                            
                            <!-- AceCounter eCommerce (Product_Detail) v7.5 Start -->
                            <!-- Data Allocation (Product_Detail) -->
                            <script language='javascript' type="text/javascript">
                                _A_amt[_ace_countvar]="${d.pprice}"; 
                                _A_nl[_ace_countvar]="${c.pamount}";   
                                _A_pl[_ace_countvar]="${c.pid}";       
                                _A_pn[_ace_countvar]="${d.pname}"; 
                                _A_ct[_ace_countvar]="${d.bname}";  
                                _ace_countvar++;
                            </script>
                            <!-- AceCounter eCommerce (Cart_InOut) v7.5 End -->
                            <!-- //Info wrap -->
<!--                             여기까지 -->
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
                                <dt>
                                    상품 합계</dt>
                                <dd>
                                <!-- 장바구니 상품 총 금액 -->
                                    <span id="cartDataSubtotal">₩<fmt:formatNumber value="0" type="number" pattern="###,###" /></span>
			</dd>
                                <dt class="delch_wrap">
                                    <p class="tlt_ship">배송비</p>
                                    <!--delivery charge layer popup-->
                                    <div class="delch_box" style="display: none;">
                                        <span class="arr">위치아이콘</span>
                                        <ul class="bul_sty01_li">
                                            <li>쿠폰/바우처 할인금액 및 한섬마일리지/H.Point 사용을 제외한 실 결제금액 기준 <strong>3만원 미만 결제 시 2,500원 배송비가 부과</strong> 됩니다.(3만원 이상 구매 시 무료배송)</li>
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
                            <dt>
                                합계</dt>
                            <dd>
                                <span id="cartDataTotalPrice">₩0</span>
			</dd>
                        </dl>
                    </div>
                    <div class="total_count1807">
                        <p>총 <span id="selectProductCount">${total}</span>개 상품</p>
                        </div>
                    <!-- //total -->
                </div>
                <!--//Total wrap-->
                <!--button wrap-->
                <div class="btnwrap order" id="checkout_btn_wrap">
                    <a href="#;" class="selectDelete_btn" onclick="select('remove');"><input value="선택상품삭제" class="btn wt"type="button" /></a>
                    <a href="#;" onclick="select('order');">
                        <input value="선택상품 주문하기" class="btn gray mr0" type="button" />
                    </a>
                   
                     </div>
                    </div>
                <script>
                //김가희 김나형 - 선택상품 주문,삭제 함수
                function select(msg){
                	 var checkArr = new Array();
                	   
                	   
                	 $("tr[name=entryProductInfo]").each(function(index, item){
                           if( $(this).find("input[name='cartlist']").is(":checked")){
                        	   console.log($(this).find("input[name='cartlist']").attr("data-pk"));
                    		   checkArr.push($(this).find("input[name='cartlist']").attr("data-pk"));
                           }
                     });
                	 //선택상품 주문하기 버튼이었을 때
                	 if(msg=='order'){
           				var confirm_val = confirm("선택한 상품들을 주문하시겠습니까?");
                   	  
                   	  if(confirm_val) {
                          $(document).ajaxSend(function(e, xhr, options) {
                              xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
                          });
                   	  		$.ajax({
                   	    		url : "/order/cartToOrder",
                   	    		type : "post",
                   	    		data : { chbox : checkArr },
                   	    		success : function(){
                   	    			console.log('성공!');
                   	     		   location.href = "/order/orderList";
                   	    		}
                   	   		});
                   	  } 
           			}
                	 
          			if(msg=='remove'){
          				var confirm_val = confirm("선택한 상품들을 삭제하시겠습니까?");
                  	  
                  	  if(confirm_val) {
                          $(document).ajaxSend(function(e, xhr, options) {
                              xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
                          });
                  	  		$.ajax({
                  	    		url : "/cart/delete",
                  	    		type : "post",
                  	    		data : { chbox : checkArr },
                  	    		success : function(){
                  	     		location.href = "/cart/cartList";
                  	    		}
                  	   		});
                  	  } 
          			}
          			
                	
                }
                </script>
            <!--//order wrap-->
        </div>
        <!--//sub_container-->
</span>
        <!-- // 장바구니개편 -->
        
        
        <!--Guide table-->
        <div class="gd_wrap mt60">
            <dl class="shoppingbag_list">
                <dt>
                    쇼핑백 이용안내</dt>
                <dd class="shoppingbag_list_text">
                    <ul class="bul_sty01_li">
                        <li>쇼핑백에 담긴 상품은 30일 동안 보관됩니다. 30일이 지난 상품 자동 삭제됩니다.<br />더 오래 보관하고 싶은 상품은 위시리스트에 담아주세요.</li>
                        <li>쇼핑백에 최대 50개까지 상품 보관이 가능하며, 실제 구매 시에는 가격이나 혜택이 변동될 수 있습니다.</li>
                        
<li>쇼핑백에 담은 상품이 판매종료가 되었을 경우 자동 삭제 됩니다.</li>
						<li>쿠폰은 배송&결제정보 화면에서 입력 할 수 있습니다.</li>
                        <li>상품별 지급율에 따라 한섬마일리지 및 H.POINT가 적립됩니다. 배송완료 10일 이후 적립되며 실 결제금액기준입니다.</li>
                        	<li>해외 배송을 원할 경우 더한섬닷컴의 영문 혹은 중문 서비스를 이용해 주시기 바랍니다.</li>
                            <li>
                            </li>
                        </ul>
                </dd>
            </dl>
            <dl class="gd_list">
				<dt>카드행사 혜택</dt>
				<dd>
					<ul class="gd_btn1807">
						<li>
							<a href="#;" rel="benefit_wrap1807">
								<p>무이자 할부</p>
								<span>자세히 보기 &gt;</span>
							</a>
						</li>
						<li>
							<a href="#;" rel="benefit2_wrap1807">
								<p>청구할인</p>
								<span>자세히 보기 &gt;</span>
							</a>
						</li>
						<li>
							<a href="#;" rel="benefit3_wrap1807">
								<p>즉시할인</p>
								<span>자세히 보기 &gt;</span>
							</a>
						</li>
					</ul>
				</dd>
      		</dl>
      		</div>
        <!--//Guide table-->
        
        <form id="ordersheetCloneForm" name="orderSheetCloneForm" action="/ko/shoppingbag/checkout" method="get"><input type="hidden" id="ordersheetEntryNumber" name="ordersheetEntryNumber" value="" />
			<input type="hidden" id="ordersheetCartDivision" name="ordersheetCartDivision" value="" />
		<div>
<input type="hidden" name="CSRFToken" value="2e4f730b-79fa-408e-b072-425a73f94a7c" />
</div></form><!-- layer pop 1 -->
			<div class="popwrap w_type_3" id="storePickupDiv" style="display:none;">
				<!--title-->
				<div class="pop_tltwrap">
					<h3>수령 매장 선택</h3>
				</div>
				<!--//title-->
				<!--contents-->
				<div class="pop_cnt zipcode">
					<!-- search -->
					<div class="search">
						<label for="search">지역명 (도로명)</label>
						<input type="text" id="storePickupSearchWord" name="searchWord" placeholder="매장명 또는 지역 명을 입력 후 검색해 주세요" style="width:260px" />
						<input type="button" value="검색" id="storePickupSearchBtn" class="btn wt_s mr0 min_auto" />
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
							<input class="btn wt_s" id="storePickupCloseBtn" value="취소" type="button" />
							<input class="btn gray_s" id="storePickupChoiceBtn" value="확인" type="button" />
						</div>
					</div>
					<!-- //del_tab_container -->
				</div>
				<!--//contents-->
				<a href="#;" class="btn_close" id="storePickupClose"><img src="http://cdn.thehandsome.com/_ui/desktop/common/images/popup/ico_close.png" alt="닫기" /></a>
			</div>
			<!-- layer pop 1 -->
<div class="benefit_wrap1807 popwrap" style="top: 1806.2px; position: absolute; left: 201px; z-index: 101; display:none;">
	<div class="pop_tltwrap">
		<h3>무이자 할부</h3>
	</div>
	<!--card event tab-->
	<div class="tab_a m2" id="ce_tab">
		<ul>
			<li><a href="#;" class="active">무이자 할부</a></li>
			<li><a href="#;" class="">부분 무이자 할부</a></li>
		</ul>
	</div>
	<!--//card event tab-->
	<!--card event tab container-->
	<div class="ce_tab_container mt40">
		<!--tab contents 1-->
		<div style="display: block;">
			<!--Table wrap-->
			<table class="cnt_type1">
				<caption>무이자 할부 행사</caption>
				<colgroup>
						<col style="width: 155px">
						<col style="width: 370px">
						<col>
				</colgroup>
				<tbody>
<tr>
						<th scope="row"><span class="card"><img src="/medias/shinhan.jpg?context=bWFzdGVyfHJvb3R8MjY1N3xpbWFnZS9qcGVnfGhkZS9oMmIvODgxNDE4MTUxNTI5NC5qcGd8NTAwMDYxM2ZmZmRlZGFhZDQ0ODNmODJjZTg2OTE3MGI3OWQ2ZmE3YzI0ZjA3MDY3NzIxYWVhNmY3NDQyYWUzMA"   alt="신한카드" /></span></th>
						<td><b>신한카드 5만원이상 결제시 2~7개월 무이자 할부</b><br />
대상: 신한카드 전 회원<br />
(신한BC 제외/ 법인,기프트,체크,선불카드 제외)
</td>
						<td>행사기간 : 2022.05.01 ~ 2022.05.31</td>
					</tr>
		<tr>
						<th scope="row"><span class="card"><img src="/medias/SAMSUNG.jpg?context=bWFzdGVyfHJvb3R8MzIxOXxpbWFnZS9qcGVnfGgzZC9oNGQvODgxNDE4MTYxMzU5OC5qcGd8ZGY1NDJiM2U1YWNmNGE5MTJkOTA0MTAxMDliMDc4ZjRlNTJmZjJlOTkxOTQzZTEwMDcxZWU2NGU2MjJmMWE2Mw"   alt="삼성카드" /></span></th>
						<td><b>삼성카드 5만원이상 결제시 2~6개월 무이자 할부</b><br />
대상: 삼성카드 전 회원<br />
(법인,기프트,체크,선불카드 제외)</td>
						<td>행사기간 : 2022.05.01 ~ 2022.05.31</td>
					</tr>
		<tr>
						<th scope="row"><span class="card"><img src="/medias/BC.jpg?context=bWFzdGVyfHJvb3R8MjQ1OHxpbWFnZS9qcGVnfGhmMi9oMGQvODgxNDE4MTIyMDM4Mi5qcGd8MjZlZGU2ZGQyNDBkYzU5YmY2NWY0MDU3NDc1OTA0YWI5NmM4NDJjMDFiYjBiYjBjY2FhZjhmMzg3ZmE5NGU5Yw"   alt="비씨카드" /></span></th>
						<td><b>비씨카드 5만원이상 결제시 2~7개월 무이자 할부</b><br /> 
대상: 비씨카드 전 회원<br />(법인,기프트,체크,선불카드 제외)</td>
						<td>행사기간 : 2022.05.01 ~ 2022.05.31</td>
					</tr>
		<tr>
						<th scope="row"><span class="card"><img src="/medias/HYUNDAI.jpg?context=bWFzdGVyfHJvb3R8MjYxMHxpbWFnZS9qcGVnfGg1ZC9oN2MvODgxNDE4MTcxMTkwMi5qcGd8YmM5ZWY0ZjlhODlkMzdmMjYyNmY4NjQ4OWU5NWVjOWFlMGY4ODIwYzZlNjA0MjBlNDkwNWI0ZDllYThjMWE5Mw"   alt="현대카드" /></span></th>
						<td><b>현대카드 5만원이상 결제시 2~7개월 무이자 할부</b><br />
대상: 현대카드 전 회원<br />
(법인,기프트,체크,선불카드 제외)</td>
						<td>행사기간 : 2022.05.01 ~ 2022.05.31</td>
					</tr>
		<tr>
						<th scope="row"><span class="card"><img src="/medias/kucmin.jpg?context=bWFzdGVyfHJvb3R8MzMwM3xpbWFnZS9qcGVnfGgyZS9oMzQvODgxNDE4MTAyMzc3NC5qcGd8MjM1YjEyN2I4OTljMGIxYzY3MjhjNDhkZWMyOTE5ODZjYmRiYWExNDdhOWZmNDQ3ZWNhNGIxZjYwYzk2MDA4Zg"   alt="국민카드" /></span></th>
						<td><b>KB국민카드 5만원이상 결제시 2~7개월 무이자 할부</b><br />
대상: KB국민카드 전 회원<br />
(NH농협, 국민BC 제외/ 법인,기프트,체크,선불카드 제외)</td>
						<td>행사기간 : 2022.05.01 ~ 2022.05.31</td>
					</tr>
		<tr>
						<th scope="row"><span class="card"><img src="/medias/hanacard.gif?context=bWFzdGVyfHJvb3R8MTkzNXxpbWFnZS9naWZ8aDYwL2hmYi84ODE0MDU0OTY1Mjc4LmdpZnxhMGM5OWY0MDdhNDhjYzkwOTdiMzhkM2VmMDQ2YTI0NTAyNDBjZTljNTdiYzk4YWRhZmI0NjBhOWRhNzRiMGYw"   alt="하나카드" /></span></th>
						<td><b>하나카드 5만원이상 결제시 2~8개월 무이자 할부</b><br />
대상: 하나카드 전 회원 (구 하나SK, 구 외환)<br />
(하나BC카드 포함/법인,기프트,체크,선불카드 제외)</td>
						<td>행사기간 : 2022.05.01 ~ 2022.05.31</td>
					</tr>
		<tr>
						<th scope="row"><span class="card"><img src="/medias/NH.jpg?context=bWFzdGVyfHJvb3R8Mzk3OXxpbWFnZS9qcGVnfGg4ZS9oMzYvODgxNDE4MTkwODUxMC5qcGd8ZWVlNmY1OWM0NDdmMjg2M2Y4NGZkNDZjYThmOTVkMWNmY2QwYWNkOWI1ODc5YTdiMTc5MjY4MThiZTkzYzNmMw"   alt="NH카드" /></span></th>
						<td><b>NH농협카드 5만원이상 결제시 2~8개월 무이자 할부</b><br />
대상: NH농협카드 전 회원<br />
(NH농협BC카드 포함/ 법인,기프트,체크,선불카드 제외)
</td>
						<td>행사기간 : 2022.05.01 ~ 2022.05.31</td>
					</tr>
		<tr>
						<th scope="row"><span class="card"><img src="/medias/LOTTE.jpg?context=bWFzdGVyfHJvb3R8MzI3MXxpbWFnZS9qcGVnfGhiMy9oNDcvODgxNDE4MTgxMDIwNi5qcGd8MDliOThkNzA1ZDc2ZDE4MzZhYmUzYjI2MDMxZDk0NGU3OTVjYzBhYTA1MmMzMjAyZmE0Y2U4OTZlNTU3NDU2Zg"   alt="롯데카드" /></span></th>
						<td><b>롯데카드 5만원이상 결제시 2~4개월 무이자 할부</b><br />
대상:롯데카드 전 회원<br />
(법인,기프트,체크,선불카드 제외)</td>
						<td>행사기간 : 2022.05.01 ~ 2022.05.31</td>
					</tr>
		</tbody>
			</table>
		</div>
		<!--//tab contents 1-->
		<!--tab contents 2-->
		<div style="display: none;">
			<!--Table wrap-->
			<table class="cnt_type1">
				<caption>부분 무이자 할부 행사</caption>
				<colgroup>
					<col style="width: 155px">
					<col style="width: 370px">
					<col>
				</colgroup>
				<tbody>
<tr>
						<th scope="row"><span class="card"><img src="/medias/shinhan.jpg?context=bWFzdGVyfHJvb3R8MjY1N3xpbWFnZS9qcGVnfGhkZS9oMmIvODgxNDE4MTUxNTI5NC5qcGd8NTAwMDYxM2ZmZmRlZGFhZDQ0ODNmODJjZTg2OTE3MGI3OWQ2ZmE3YzI0ZjA3MDY3NzIxYWVhNmY3NDQyYWUzMA" alt="신한카드" /></span></th>
						<td><b>10개월 부분무이자</b><br />
(5만원이상 결제시/1,2,3,4회차 고객부담, 잔여할부 수수료 면제/법인,체크,기프트카드 제외)</td>
						<td>행사기간 : 2022.05.01 ~ 2022.05.31</td>
					</tr>
		<tr>
						<th scope="row"><span class="card"><img src="/medias/SAMSUNG.jpg?context=bWFzdGVyfHJvb3R8MzIxOXxpbWFnZS9qcGVnfGgzZC9oNGQvODgxNDE4MTYxMzU5OC5qcGd8ZGY1NDJiM2U1YWNmNGE5MTJkOTA0MTAxMDliMDc4ZjRlNTJmZjJlOTkxOTQzZTEwMDcxZWU2NGU2MjJmMWE2Mw" alt="삼성카드" /></span></th>
						<td><b>10개월 부분무이자</b><br />
(5만원이상 결제시/1,2,3,4회차 고객 부담, 잔여할부 수수료 면제/법인,체크,기프트카드 제외)</b></td>
						<td>행사기간 : 2022.05.01 ~ 2022.05.31</td>
					</tr>
		<tr>
						<th scope="row"><span class="card"><img src="/medias/SAMSUNG.jpg?context=bWFzdGVyfHJvb3R8MzIxOXxpbWFnZS9qcGVnfGgzZC9oNGQvODgxNDE4MTYxMzU5OC5qcGd8ZGY1NDJiM2U1YWNmNGE5MTJkOTA0MTAxMDliMDc4ZjRlNTJmZjJlOTkxOTQzZTEwMDcxZWU2NGU2MjJmMWE2Mw" alt="삼성카드" /></span></th>
						<td><b>12개월 부분무이자</b><br />
(5만원이상 결제시/1,2,3,4,5회차 고객 부담, 잔여할부 수수료 면제/법인,체크,기프트카드 제외)</b>
</td>
						<td>행사기간 : 2022.05.01 ~ 2022.05.31</td>
					</tr>
		<tr>
						<th scope="row"><span class="card"><img src="/medias/BC.jpg?context=bWFzdGVyfHJvb3R8MjQ1OHxpbWFnZS9qcGVnfGhmMi9oMGQvODgxNDE4MTIyMDM4Mi5qcGd8MjZlZGU2ZGQyNDBkYzU5YmY2NWY0MDU3NDc1OTA0YWI5NmM4NDJjMDFiYjBiYjBjY2FhZjhmMzg3ZmE5NGU5Yw" alt="비씨카드" /></span></th>
						<td><b> 우리BC 10개월 부분무이자</b><br />
(5만원이상 결제시/1,2,3회차 고객부담, 잔여할부 수수료 면제/법인,체크,기프트카드 제외)
</td>
						<td>행사기간 : 2022.05.01 ~ 2022.05.31</td>
					</tr>
		<tr>
						<th scope="row"><span class="card"><img src="/medias/BC.jpg?context=bWFzdGVyfHJvb3R8MjQ1OHxpbWFnZS9qcGVnfGhmMi9oMGQvODgxNDE4MTIyMDM4Mi5qcGd8MjZlZGU2ZGQyNDBkYzU5YmY2NWY0MDU3NDc1OTA0YWI5NmM4NDJjMDFiYjBiYjBjY2FhZjhmMzg3ZmE5NGU5Yw" alt="비씨카드" /></span></th>
						<td><b>우리BC 12개월 부분무이자</b><br />
(5만원이상 결제시/1,2,3,4회차 고객부담, 잔여할부 수수료 면제/법인,체크,기프트카드 제외)
</td>
						<td>행사기간 : 2022.05.01 ~ 2022.05.31</td>
					</tr>
		<tr>
						<th scope="row"><span class="card"><img src="/medias/kucmin.jpg?context=bWFzdGVyfHJvb3R8MzMwM3xpbWFnZS9qcGVnfGgyZS9oMzQvODgxNDE4MTAyMzc3NC5qcGd8MjM1YjEyN2I4OTljMGIxYzY3MjhjNDhkZWMyOTE5ODZjYmRiYWExNDdhOWZmNDQ3ZWNhNGIxZjYwYzk2MDA4Zg" alt="국민카드" /></span></th>
						<td><b>10개월 부분무이자</b><br />
(5만원이상 결제시/1,2,3회차 고객부담, 잔여할부 수수료 면제/법인,체크,기프트카드 제외)</td>
						<td>행사기간 : 2022.05.01 ~ 2022.05.31</td>
					</tr>
		<tr>
						<th scope="row"><span class="card"><img src="/medias/kucmin.jpg?context=bWFzdGVyfHJvb3R8MzMwM3xpbWFnZS9qcGVnfGgyZS9oMzQvODgxNDE4MTAyMzc3NC5qcGd8MjM1YjEyN2I4OTljMGIxYzY3MjhjNDhkZWMyOTE5ODZjYmRiYWExNDdhOWZmNDQ3ZWNhNGIxZjYwYzk2MDA4Zg" alt="국민카드" /></span></th>
						<td><b>12개월 부분무이자</b><br />
(5만원이상 결제시/1,2,3,4회차 고객부담, 잔여할부 수수료 면제/법인,체크,기프트카드 제외)</td>
						<td>행사기간 : 2022.05.01 ~ 2022.05.31</td>
					</tr>
		<tr>
						<th scope="row"><span class="card"><img src="/medias/hanacard.gif?context=bWFzdGVyfHJvb3R8MTkzNXxpbWFnZS9naWZ8aDYwL2hmYi84ODE0MDU0OTY1Mjc4LmdpZnxhMGM5OWY0MDdhNDhjYzkwOTdiMzhkM2VmMDQ2YTI0NTAyNDBjZTljNTdiYzk4YWRhZmI0NjBhOWRhNzRiMGYw" alt="하나카드" /></span></th>
						<td><b>10개월 부분무이자</b><br />
(5만원이상 결제시/1,2,3회차 고객부담, 잔여할부 수수료 면제/법인,체크,기프트카드 제외)</td>
						<td>행사기간 : 2022.05.01 ~ 2022.05.31</td>
					</tr>
		<tr>
						<th scope="row"><span class="card"><img src="/medias/hanacard.gif?context=bWFzdGVyfHJvb3R8MTkzNXxpbWFnZS9naWZ8aDYwL2hmYi84ODE0MDU0OTY1Mjc4LmdpZnxhMGM5OWY0MDdhNDhjYzkwOTdiMzhkM2VmMDQ2YTI0NTAyNDBjZTljNTdiYzk4YWRhZmI0NjBhOWRhNzRiMGYw" alt="하나카드" /></span></th>
						<td><b>12개월 부분무이자</b><br />
(5만원이상 결제시/1,2,3,4회차 고객부담, 잔여할부 수수료 면제/법인,체크,기프트카드 제외)</td>
						<td>행사기간 : 2022.05.01 ~ 2022.05.31</td>
					</tr>
		<tr>
						<th scope="row"><span class="card"><img src="/medias/shinhan.jpg?context=bWFzdGVyfHJvb3R8MjY1N3xpbWFnZS9qcGVnfGhkZS9oMmIvODgxNDE4MTUxNTI5NC5qcGd8NTAwMDYxM2ZmZmRlZGFhZDQ0ODNmODJjZTg2OTE3MGI3OWQ2ZmE3YzI0ZjA3MDY3NzIxYWVhNmY3NDQyYWUzMA" alt="신한카드" /></span></th>
						<td><b>12개월 부분무이자</b><br />
(5만원이상 결제시/1,2,3,4,5회차 고객부담, 잔여할부 수수료 면제/법인,체크,기프트카드 제외)</td>
						<td>행사기간 : 2022.05.01 ~ 2022.05.31</td>
					</tr>
		</tbody>
				</table>
				<!--//Table wrap-->
			</div>
			<!--//tab contents 2-->
			<!--//Table wrap-->
			<ul class="bul_sty01_li mt40">
				<li>ARS 무이자 할부는 해당 카드사 ARS 번호로 사전 신청을 하신 경우에 한하여 무이자 혜택이적용됩니다.<br>(ARS 부문 무이자 할부 포함)</li>
				<li>상기 부분 무이자 할부는 5만원 이상 결제 시 자동 적용되며, 결제창에는 무이자 표시가 되지 않을 수 있습니다.</li>
				<li>법인 / 체크 / 선불 / 기프트 / 은행 계열 카드는 제외됩니다.</li>
				<li>고객 부담 수수료는 해당 카드사로 문의 바랍니다.</li>
				<li>본 행사는 카드사 사정에 따라 일부 내용이 변경 또는 중단될 수 있습니다.</li>
			</ul>			
			<p class="btnwrap">
				<a href="#;" class="btn gray close_btn">확인</a>
			</p>
			<a href="#;" class="btn_close"><img src="/resources/_ui/desktop/common/images/popup/ico_close.png" alt="닫기"></a>
	</div>
	<!--//card event tab container-->
</div>
<div class="benefit2_wrap1807 popwrap" style="top: 2295.2px; position: absolute; left: 201px; z-index: 101; display: none;">
	<div class="pop_tltwrap">
		<h3>청구할인 행사</h3>
	</div>
	<!--Table wrap-->
	<table class="cnt_type1">
		<caption>청구할인 행사</caption>
		<colgroup>
				<col style="width: 155px">
				<col style="width: 370px">
				<col>
		</colgroup>
		<tbody>
</tbody>
	</table>
	<!--//Table wrap-->
	<ul class="bul_sty01_li mt40">
			<li>법인/선불/기프트/은행 계열 카드는 제외됩니다.</li>
			<!-- ><li>상기 청구할인 행사는 5만원 이상 결제 시 자동 적용되며, 결제창에는 표시가 되지 않을 수 있습니다.</li> -->
			<li>본 행사는 카드사 사정에 따라 일부 내용이 변경 또는 중단될 수 있습니다.</li>
	</ul>
	<p class="btnwrap">
		<a href="#;" class="btn gray close_btn">확인</a>
	</p>
	<a href="#;" class="btn_close"><img src="/resources/_ui/desktop/common/images/popup/ico_close.png" alt="닫기"></a>
</div>
<div class="benefit3_wrap1807 popwrap" style="top: 2336.7px; position: absolute; left: 201px; z-index: 101; display: none;">
	<div class="pop_tltwrap">
		<h3>즉시할인 행사</h3>
	</div>
		<!--Table wrap-->
		<table class="cnt_type1">
				<caption>즉시할인 행사</caption>
				<colgroup>
						<col style="width: 155px">
						<col style="width: 370px">
						<col>
				</colgroup>
				<tbody>
</tbody>
		</table>
		<!--//Table wrap-->
		<div id="nowSale1Img" style="display: none;"><img src="/_ui/desktop/common/images/paynow.jpg" alt="paynow" width="100%"></div>
		<ul class="bul_sty01_li" style="display:none" id="nowSale1">
			<li>선착순 1,000명 대상 행사로, 조기 종료될 수 있습니다.</li>
			<li>전액 취소될 경우에 한하여 할인 혜택이 복원됩니다.</li>
			<li>PAYNOW로 결제하는 경우 무이자 할부는 PAYNOW 정책에 따라 진행됩니다.</li>
			<li>결제문의 : 페이나우 고객센터 (1544-7772)</li>
		</ul>
		<ul class="bul_sty01_li mt40" id="nowSale2" style="display:none;">
			<li>법인/체크/선불/기프트/은행 계열 카드는 제외됩니다.</li>
			<li>상기 청구할인 행사는 5만원 이상 결제 시 자동 적용되며, 결제창에는 표시가 되지 않을 수 있습니다.</li>
			<li>본 행사는 카드사 사정에 따라 일부 내용이 변경 또는 중단될 수 있습니다.</li>
		</ul>
		<p class="btnwrap">
			<a href="#;" class="btn gray close_btn">확인</a>
		</p>
		<a href="#;" class="btn_close"><img src="/resources/_ui/desktop/common/images/popup/ico_close.png" alt="닫기"></a>
</div>
<!-- layer pop 1 -->
            <div class="popwrap w_type_2" id="restockReminder" style="width:450px;display:none;">
                <div class="pop_tltwrap mb20">
                    <h3>재입고 알림 신청</h3>
                </div>
                <div class="pop_cnt pop_con_restock1904">
                    <div class="item_box" id="rewareHousingDiv">
                        <input type="hidden" id="popupHProduct" value="" />
                        <div class="pt_list_all">
                            <img src="/_ui/desktop/common/images/popup/cart_set_img1.jpg" id="popupProductImageS01" alt="" />
                            <div class="tlt_wrap">
                                <div class="basket_tlt">
                                    <span class="tlt" id="popupBrandName"></span>
                                    <span class="sb_tlt" id="popupProductName"></span>
                                </div>
                                <p class="color_op" id="popupProductColor"></p>
                                <input type="hidden" id="popupProductSize" />
                                <p class="mt5" id="popupProductPrice"></p>
                            </div>
                        </div>
                    </div>
                    <div class="input_box1904">
                        <p class="txt1904">재입고 알림을 받으실 이메일 정보를 확인해주세요.</p>
                        <form action="#" method="post">
                            <!-- email -->
                            <input type="text" id="email_address" title="이메일 아이디" class="em_form" style="width:198px;" value="ansgurtk" disabled="disabled" />
                            <span class="andmail">@</span>
                            <input type="text" id="email_domain" title="이메일 도메인" class="em_form" style="width:198px;margin-right:0;" value="naver.com" disabled="disabled" />
                        </form>
                        <ul class="bul_sty01_li mt15">
                            <li>재입고 알림 예정이 있는 상품(컬러/사이즈)에 한해서 재입고 알림 신청이 가능합니다. <br/>(제작상황에 따라 변경될 수 있습니다.)</li>
                            <li>신청 후 30일 내에 상품이 재입고 되면 '1회' 알림이 발송됩니다.</li>
                            <li>소량 입고되거나 동시 구매가 이루어질 경우 등 알림 후에도 품절이 발생할 수 있습니다.</li>
                            <li>회원정보에 등록된 이메일 정보로 안내 드리며, 이메일 정보 수정은<br/>마이페이지 > 개인정보변경 페이지에서 가능합니다.</li>
                            <li>알림 신청 시의 상품 옵션 및 가격 등의 상품정보가 재입고 시 변동될 수 있습니다.</li>
                            <li>아울렛으로 판매 전환 되었을 경우, 알림이 발송되지 않습니다.</li>
                        </ul>
                    </div>
                </div>
                <div class="btnwrap">
                    <input type="button" class="btn wt_s" id="rewareHousingCancel" value="취소">
                    <input type="button" class="btn gray_s mr0" id="rewareHousingApply" value="신청">
                </div>
                <!-- btn_close -->
                <a href="#" class="btn_close"><img src="/resources/_ui/desktop/common/images/popup/ico_close.png" alt="닫기"></a>
                <!-- //btn_close -->
            </div>
            <!-- layer pop 1 -->
</div>
	<div class="layerArea" id="productLayer" style="display: none;">
		<div class="layerBg"></div>
	</div>
    <!-- //bodyWrap -->
<!-- footerWrap -->


<%@include file="/WEB-INF/views/common/footer.jsp" %>

<form id="PAY_FORM" method="post" accept-charset="euc-kr">
</form>
	</c:otherwise>
</c:choose>
