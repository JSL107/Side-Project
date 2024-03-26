<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.tohome.dto.BasketDTO"%>
<% 
   int login_yn = 0;
   int sale_rate = 0;
   if (session.getAttribute("UserId") != null) { 
      login_yn = 1;
   }
   if (request.getAttribute("saleRate")!=null){
	   sale_rate = (int)request.getAttribute("saleRate");
   }
   %>
<!DOCTYPE html>
<html>
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
    <link rel="shortcut icon" type="image/x-icon" href="../UIUX/images/favicon.ico?ver=15">

    <link rel="stylesheet" type="text/css" href="../UIUX/css/css-library.min.css?ver=15">
    <link rel="stylesheet" type="text/css" href="../UIUX/css/common.min.css?ver=15">
    <%--data aos css , script 설정--%>
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<!--     <script>
        AOS.init();
    </script> -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script> <!-- jquery -->
    <meta charset="UTF-8">
    <title>장바구니</title>
</head>
<body data-aos-easing="ease" data-aos-duration="400" data-aos-delay="0">
<jsp:include page="../Common/Link.jsp" />
<!-- body -->
<!-- 업무 공용 웹자원 -->
<link rel="stylesheet" type="text/css" href="../UIUX/css/order.min.css?ver=12">


<% if (session.getAttribute("UserId") == null) { 
	String url = "login_form.jsp";
    request.getRequestDispatcher(url).forward(request, response);
} %>
<div id="wrap" class="order cart">


    <!-- contents// -->
    <div id="contents">
        <div class="innercon">
            <h2>장바구니</h2>
            <section id="cartlist tab-menu" class="cartlist tab-menu" style="left: auto;">
                <a class="active" basktgbcd="01">새벽배송</a>&lt;
                
                </a>
            </section>

            <!-- 전체선택// -->
            <section class="cart-select">
                <label><input type="checkbox" checked="checked" name="allItemSelect" class="allItemSelect"><span>전체선택</span></label>
                <ul class="btn-group">
                    <li>
                        <button type="button" id="delBtn">삭제</button>
                    </li>
                    <li>
                        <button type="button" onclick="javascript:clickAddLikeItem();">좋아요담기</button>
                    </li>
                </ul>
            </section>
            <!-- 전체선택// -->

            <form id="frmBasktInfo" name="my_form">

                <!-- 새벽 배송// -->
                <fieldset class="list-field toggle active">
                    <legend class="tit toggle-ti">새벽배송</legend>
                    <div class="cont" style="">
                        <ul class="product-list vertical">
							<c:forEach items="${basketList}" var="basketDTO">
								<%-- <c:set var="bakset_details_no" value="${basketDTO.basket_detail_no}"/> --%>
			                    <li dlvdivision="1_DAWN" data-dlvc_pay_gbcd="10" class="cart_info_li">
                                <!-- <button type="button" class="btn-del" onclick="javascript:deleteBasketItem(this);">삭제
                                </button> -->
                                <!-- <input type="checkbox" name="itemSelect" checked="checked"> -->
                                <label class="thumb">
                                
                                    <input type="checkbox" name="itemSelect" checked="checked" class="itemcheckbox">
                                    <span>
                                        <img
                                                src="${basketDTO.prod_img}"
                                                alt="${basketDTO.prod_no}"
                                                onerror="this.src='/UIUX/w/pjtCom/images/common/noimage_120x144.jpg'">
                                    </span>
                                </label>
                                <div class="contr">
                                    <a href="TohomeServlet?command=product_detail&prod_no=${basketDTO.prod_no}"
                                       onclick="GA_odCartClickEcomm(this);">
                                        <strong class="txt-ti ellipsis">${basketDTO.prod_name}</strong>
                                    </a>

                                    <span class="info">
                                                        <div class="ea-area">
                                                        	<span class="txt-price">
                                                        		<em>수량 : </em>
                                                        		<em class="itemquantity">${basketDTO.prod_quantity}</em>
                                                        	</span>
                                                        </div>
                                                        <span class="txt-price">
                                                            <strong><em class="itemprice">${basketDTO.price}</em>원</strong>
                                                        </span>
                                                        <span class="txt-price" style="margin-left:50px;">
                                                        	 장바구니 번호 :
                                                        	<span class="basketDetailNo"> ${basketDTO.basket_detail_no}</span>
                                                        </span>
                                                    </span>
                                </div>
                            </li>
                            
						    </c:forEach>
                        </ul>
                    </div>
                </fieldset>
                <!-- //새벽배송 -->


                <div class="rightarea" style="position: absolute; inset: 71px 0px auto auto;">
                    <!-- 결제내역// -->
                    <fieldset class="price-field">
                        <legend class="hide">결제내역</legend>
                        <dl class="orderprice">
                            <dt>총 상품금액</dt>
                            <dd><strong><em id="emPriceFTotNrmlPrice">29,500</em>원</strong></dd>
                        </dl>
                        <dl>
                            <dt>총 할인금액</dt>
                            <dd><strong><em id="emPriceFTotDcAmt">0</em>원</strong></dd>
                        </dl>

                        <p class="txt">주문 결제 시 배송지에 따라 배송비가 상이할 수 있습니다.</p>

                        <dl class="total">
                            <dt>총 결제예상금액</dt>

                            <%--계산식(총 상품 금액 - 총 할인금액)에 따른 값 변화 필요--%>
                            <dd><strong><em id="emPriceFTotPayAmt">33,000</em>원</strong></dd>
                        </dl>
                    </fieldset>
                    <!-- 결제내역// -->
                    <button type="button" class="btn fill bigger orange btn-order"
                            onclick="is_login_buy()">주문하기
                    </button>
                </div>
            </form>

            <!-- 주문 안내// -->
            <section class="cart-info infotxt">
                <strong>주문 안내</strong>
                <ul>
                    <li>장바구니에 담긴 상품은 최대 60일간 보관됩니다.(로그인 기준)</li>
                    <li>패키지/딜 종료 시 해당 상품은 자동 삭제됩니다.</li>
                    <li>상품을 장기간 보관하시려면 "좋아요"를 눌러주십시오.</li>
                    <li>장바구니에 최대 100개 상품을 담을 수 있습니다.</li>
                </ul>
            </section>
            <!-- 주문 안내// -->
        </div>


    </div>
    <!-- //contents -->
	<!-- footer// -->
	<jsp:include page="../Common/footer.jsp"/>
    <!-- //footer -->
	

</div>

<script>
	let sale_rate = parseInt(<%=request.getAttribute("saleRate")%>);
	
	//let list = ${basketList};
	//Writen by 여명 
	function is_login_buy() {
	    if (<%=login_yn%> == 1)
	    {
	    	const nums = getCheckedProdNo($(".cart_info_li"));
	        location.href = "TohomeServlet?command=order_page&details_nos="+nums;
	    }
	else
	    {
	        location.href = "TohomeServlet?command=login_form";
	    }
	}
	
	$(document).ready(function(){
		setTotalInfo();
	});
	
	$(".itemcheckbox").on("change", function(){
		setTotalInfo($(".cart_info_li"));
		
	});
	
	/* 체크박스 전체 선택 */
	$(".allItemSelect").on("click", function(){
		/* 체크박스 체크/해제 */
		if($(".allItemSelect").prop("checked")){
			$(".itemcheckbox").prop("checked", true);
		} else{
			$(".itemcheckbox").prop("checked", false);
		}
		// 상품 전체 금액 업뎃
		setTotalInfo($(".cart_info_li"));
	});
	
	$("#delBtn").on("click", function(){
		const pNums = getdeleteProdNo($(".cart_info_li"))
		location = "TohomeServlet?command=basket_delete&pNums="+pNums;
	});
	
	function setTotalInfo(){
		let totalPrice = 0;				// 총 금액
		let totalCount = 0;				// 총 갯수
		let totalSalePrice = 0;			// 총 할인 금액
		let totalPayment = 0;			// 총 결제 금액
		
		//체크박스들이 바뀔때마다 어떤게 체크된지 담기위해 담을 변수를 초기화 시켜줌
		detailNums="";

		$(".cart_info_li").each(function(index, element){
			
			if($(element).find(".itemcheckbox").is(":checked") === true){
				// 총 가격
				totalPrice += parseInt($(element).find("em.itemprice").text()) * parseInt($(element).find("em.itemquantity").text());
				// 총 갯수
				totalCount += parseInt($(element).find("em.itemquantity").text());			
			}
		});
		
		if (sale_rate != 0){
			totalSalePrice = totalPrice*(sale_rate/100);
		}
		totalPayment = totalPrice - totalSalePrice;
		$("#emPriceFTotNrmlPrice").text(totalPrice.toLocaleString());
		$("#emPriceFTotDcAmt").text(totalSalePrice.toLocaleString());
		$("#emPriceFTotPayAmt").text(totalPayment.toLocaleString());
		}
	//원래 이것도 bakset_details_no로 지우게 해야하는데 일단 시작 이걸로해서 어쩔수 없이 그대로 쓰자
	function getdeleteProdNo(){
		let pNums = "";
		
		$(".cart_info_li").each(function(index, element){
					
			if($(element).find(".itemcheckbox").is(":checked") === true){
				// 체크 눌린 item의 img alt 값(prod_no으로 지정해놓은거) 을 가져와서 하나의 스트링으로 가져오기
				pNums += $(element).find("img").attr('alt')+",";
			}
					
		});
		pNums = pNums.replace(/,$/, '');
		return pNums;
	}
	
	// 구매하기 버튼 눌렀을때 체크된 basket_details_no를 requset에 담아서 구매하기 띄우는action에서 해당 번호들 DTO만 뿌려지게 하기 위함
	function getCheckedProdNo(){
		let detailNums = "";
		
		$(".cart_info_li").each(function(index, element){
					
			if($(element).find(".itemcheckbox").is(":checked") === true){
				// 체크 눌린 item의 details_no를 가져와서 하나의 스트링으로 가져오기
				
				detailNums += $(element).find(".basketDetailNo").text().trim()+",";
			}
					
		});
		detailNums = detailNums.replace(/,$/, '');
		return detailNums;
	}
</script>
</body>
</html>