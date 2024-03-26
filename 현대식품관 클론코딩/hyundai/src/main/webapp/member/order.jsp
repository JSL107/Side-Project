<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head   >
    <style class="vjs-styles-defaults">
        .video-js {
            width: 300px;
            height: 150px;
        }

        .vjs-fluid {
            padding-top: 56.25%
        }
    </style>
    <!-- 새벽배송 공통 태그-->
    <meta charset="UTF-8">
    <title>주문하기</title>
    <link rel="shortcut icon" type="image/x-icon" href="../UIUX/images/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../UIUX/css/css-library.min.css?ver=2">
    <link rel="stylesheet" type="text/css" href="../UIUX/css/common.min.css?ver=2">
    <%--data aos css , script 설정--%>
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script>
        AOS.init();
    </script>


</head>
<body data-aos-easing="ease" data-aos-duration="400" data-aos-delay="0">

<link rel="stylesheet" type="text/css" href="../UIUX/css/order.min.css?ver=30">

<div id="wrap" class="order ordersheet">

    <jsp:include page="../Common/Link.jsp"/>

    <!-- H.point pay 전용 CSS ;: 2022-01-05 장영준 -->
    <link rel="stylesheet" type="text/css" href="../UIUX/css/hppay.min.css?ver=1">

    <form id="receoptForm" name="receoptForm" target="_blank" method="post">
        <input type="hidden" name="xxx">
    </form>

    <form id="shippingForm" name="shippingForm" method="post">
        <input type="hidden" name="xxx">
    </form>

    <form id="orderForm" name="orderForm" method="post">
        <input type="hidden" name="slitmData">
        <input type="hidden" name="stlmData">
        <input type="hidden" name="orderData">
        <input type="hidden" name="orderItemData">
        <input type="hidden" name="orderItemPromotionData">
        <input type="hidden" name="orderDlvDcData">
        <input type="hidden" name="changeOrdDlvFormPtcGbcd">
        <input type="hidden" name="giftItemData">
    </form>

    <!-- 상품list -->
    <div id="orderItemDiv"><span id="orderItemDiv_S02011022802"></span></div>

    <!-- 주문 -->
    <div id="orderDataDiv"></div>

    <!-- 상품데이터 -->
    <div id="orderItemShippingDataDiv"><span id="0000000001"></span></div>

    <!-- 배송비 -->
    <div id="dlvDataDiv"></div>

    <!-- 결제정보 -->
    <div id="stlmDataDiv"></div>


    <!-- contents// -->
    <div id="contents">
        <div class="innercon">
            <h2>주문하기</h2>
            <form action="TohomeServlet?command=order_action" method="post">
            	<input type="hidden" name="basketList" value=${basketList}/>				
                <div class="conarea">
                    <section class="leftarea">

                        <!-- 주문 고객 정보// 주문자명 변경기능 원복 (2022.09.05)
						<fieldset class="orderer-field toggle active">
							<legend class="tit toggle-ti">주문 고객 정보</legend>

							<div class="cont" id="memberInfo">
								<label class="form-default horizon form-entry">
									<strong>주문 고객명<span class="need">*<span class="hide">필수</span></span></strong>
									<input type="text" name="custNm" class="big" title="이름 입력" placeholder="이름입력" maxlength="20" value="이준석"><button type="button" class="btn-del" tabindex="-1">삭제</button>
								</label>

							</div>
						</fieldset>-->


                        <div id="orderShippingSlitmDiv">
                            <!-- 주문상품 건수 및 수량 계산 -->
                            <fieldset class="delivery-field toggle active" id="order_dstn_seq_0000000001"
                                      data-dstn_seq="0000000001">

                                <legend class="tit toggle-ti" onClick="changeClass()">배송지 정보</legend>

                                <div class="cont" style="display: block;">
                                
                                    <div class="addrinfo">
                                        <strong>배송지 정보</strong>
                                        <span>
                                            <%--address table에서 값 가져오기--%>
                                            <strong>${addressDTO.user_name}</strong>
                                            ${addressDTO.mobile_num}
                                            </span>
                                        <p class="addr">${addressDTO.main_address}</p>
                                    </div>
                                </div>
                            </fieldset>

                            <%-- 회원 등급, 할인률 출력 부분 --%>
                            <fieldset class="day-field toggle active">
                                <legend class="tit toggle-ti">회원등급과 할인률</legend>
                                <%--회원등급과 할인률 부분 DB에서 가져오기--%>
                                <div class="cont" style="">
                                    <label><span>고객님의 회원 등급은 : ${userGrade} 입니다.</span></label>
                                    <label><span>할인률은 : ${currentUserDTO.sale_rate}% 입니다.</span></label>
                                </div>
                            </fieldset>
                            <!-- 회원 등급, 할인률 출력 부분-->

                            <fieldset class="product-field toggle active">
                                <legend class="tit toggle-ti">주문상품</legend>
                                <div class="cont" style="">
                                    <div>
                                        <strong class="ti">택배배송</strong>
                                        <%--추가구현 부분 : 언제 도착할 것인지--%>
                                        <p class="txt-notice">
                                        </p>

                                        <%--구매하고자 하는 상품 DB에서 가져오기--%>
                                        <ul class="product-list nothumb">
                                        	<c:forEach items="${basketList}"  var="basketDTO">
                                        	<input type="hidden" name="prod_no" value="${basketDTO.prod_no}"/>
                                        	<input type="hidden" name="prod_quantity" value="${basketDTO.prod_quantity}"/>
                                            <li data-ord_prc="${basketDTO.price}" data-ord_dc_prc="${basketDTO.price * (100-currentUserDTO.sale_rate)*0.01}">
                                                <strong class="txt-ti">
                                                    ${basketDTO.prod_name}
                                                </strong>
                                                <span class="txt-num"><strong><em>${basketDTO.prod_quantity}</em>개</strong></span>
                                            </li>
                                            <c:set var= "total_price" value="${total_price + (basketDTO.price * basketDTO.prod_quantity)}"/>
                                            </c:forEach>
                                            <c:forEach items="${basketDetailsNums}"  var="bdns">
                                            	 <input type="hidden" name="basketDetailsNums" value="${bdns}"/>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <!-- //택배배송 -->
                                </div>
                            </fieldset>
                        </div>

                        <!-- 결제수단// -->
							<fieldset class="pay-field">
								<legend class="tit">결제수단</legend>
								<div class="payment other active">
									<ul>
										<li><label><input type="radio"
												name="payWayGbcdGc" value="pay1" data-name="현대백화점카드"
												onclick="fn.addClass('.pay-own-card');fn.removeClass('.pay-card'); fn.removeClass('.pay-kbpay');"><span
												class="card">현대백화점카드</span></label></li>
										<li><label><input type="radio"
												name="payWayGbcdGc" value="pay2" data-name="신용카드"
												onclick="fn.removeClass('.pay-own-card');fn.addClass('.pay-card');fn.removeClass('.pay-kbpay');"><span
												class="card">신용카드</span></label></li>
										<li><label><input type="radio"
												name="payWayGbcdGc" value="pay3" data-name="실시간 계좌이체"
												onclick="fn.removeClass('.pay-own-card');fn.removeClass('.pay-card');fn.removeClass('.pay-kbpay');"><span
												class="bank">실시간 계좌이체</span></label></li>
									</ul>
									<p class="benefit" id="paymentDcInfo" style="display: none;"></p>
									</div>
							</fieldset>
							<!-- //결제수단 -->
                    </section>

                    <section class="rightarea"
                             style="position: static; inset: auto; float: right; margin-bottom: 48px;">

                        <!-- 결제내역// -->
                        <fieldset class="price-field">
                            <legend class="hide">결제내역</legend>
                            <dl class="orderprice">
                                <dt>총 상품금액</dt>
                                <dd><strong><em id="smrySumItemAmt"><fmt:formatNumber type="number" maxFractionDigits="3" value="${total_price}"/></em>원</strong></dd>
                            </dl>
                            <div class="toggle">
                                <dl class="minus toggle-ti">
                                    <dt>총 할인금액</dt>
                                    <fmt:parseNumber var="discount_price" integerOnly= "true" value= "${total_price * (currentUserDTO.sale_rate) * 0.01}"/>
                                    <dd><strong><em id="smrySumDcAmt"><fmt:formatNumber type="number" maxFractionDigits="3" value="${discount_price}"/></em>원</strong></dd>
                                </dl>
                                <div class="cont infotxt">
                                    <ul>
                                        <li>상품할인<span><em id="itemDc">-15,000</em>원</span></li>
                                    </ul>
                                </div>
                            </div>

                            <dl class="total">
                                <dt>총 결제예상금액</dt>
                                <dd><strong><em id="smryExpSumAmt"><fmt:formatNumber type="number" maxFractionDigits="3" value="${total_price - discount_price}"/></em>원</strong></dd>
                            </dl>
                        </fieldset>
                        <!-- //결제내역 -->

                        <button type="submit" class="btn fill big orange btn-order" onclick="settlement();"><span
                                class="txt-price">총 <em id="expSumAmt"><fmt:formatNumber type="number" maxFractionDigits="3" value="${total_price - discount_price}"/></em>원</span><strong>결제하기</strong></button>
                    </section>
                </div>
            </form>
        </div>
    </div>

    <!-- 여러배송지보내기 -->

    <!-- 배송지목록 -->

    <!-- 팝업 : 배송지 선택// -->
    <div id="p_popShippingList" class="popup popshippinglist">
        <div class="inner">
            <button type="button" class="btn-close" onclick="fn.popupCloseId('#p_popShippingList');">닫기</button>

            <header>
                <h2>배송지 목록 <em id="popShippingListCnt"></em></h2>
            </header>
            <div class="contents">
                <div class="scrollbox" id="shippingListDiv">
                </div>
                <div class="btns">
                    <button type="button" class="btn black" id="shippingListAdd1"
                            onclick="fnShippingList('new','subs');">배송지 추가 +
                    </button>


                    <button type="button" id="shippingSelectedBtn" class="btn fill orange"
                            onclick="selectedShippingList(this);">배송지 선택
                    </button>


                </div>
            </div>
        </div>
    </div>
    <!-- //팝업 : 배송지 선택 -->

    <!-- 팝업 : 배송지 추가/수정// -->
    <div id="p_popShippingInput" class="popup popshippinginput">
    </div>
    <!-- //팝업 : 배송지 추가/수정 -->

    <!-- 배송지상세-->

    <!-- 팝업 : 배송요청사항// -->
    <div id="p_popRequest" class="popup poprequest">
        <div class="inner">
            <button type="button" class="btn-close" onclick="fn.popupCloseId('#p_popRequest');">닫기</button>
            <header>
                <h2>배송요청사항</h2>
            </header>
            <div class="contents">
                <div class="request-list">
                    <ul>
                        <li>
                            <strong class="tit">새벽배송</strong>
                            <p class="text" id="shippingDawnReqDlvMsg"></p>
                            <button type="button" class="btn small orange" onclick="openRequestDawnPopup();">수정</button>
                        </li>
                        <li>
                            <strong class="tit">택배배송</strong>
                            <p class="text" id="shippingReqDlvMsg"></p>
                            <button type="button" class="btn small orange" onclick="openRequestParcelPopup();">수정
                            </button>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- //팝업 : 배송요청사항 -->

    <!-- 팝업 : 새벽배송 요청 사항// -->
    <div id="p_popRequestDawn" class="popup poprequest">
        <div class="inner">
            <button type="button" class="btn-close" onclick="fn.popupCloseId('#p_popRequestDawn');">닫기</button>
            <header>
                <h2>새벽배송 요청 사항</h2>
            </header>
            <div class="contents">
                <form id="frmPopRequestDawn">
                    <input type="hidden" name="dstnSeq">
                    <input type="hidden" name="pageFlag">
                    <input type="hidden" name="reqFlag">
                    <fieldset class="form-field">
                        <legend class="tit">출입방법<span class="need">*<span class="hide">필수</span></span></legend>
                        <ul>


                            <li>
                                <label>
                                    <input type="radio" name="cfrtdrEntmthGbcd" value="11" data-txt="공동 현관 비밀번호"
                                           checked="checked">
                                    <span>공동 현관 비밀번호</span>
                                </label>

                                <div style="display: block;">
                                    <label class="form-entry"><input type="text" id="" name="cfrtdrPwd"
                                                                     title="공동 현관 비밀번호" placeholder="예) #1234, 1234#"
                                                                     maxlength="30">
                                        <button type="button" class="btn-del" tabindex="-1">삭제</button>
                                    </label>
                                </div>

                            </li>


                            <li>
                                <label>
                                    <input type="radio" name="cfrtdrEntmthGbcd" value="13" data-txt="자유출입">
                                    <span>자유출입</span>
                                </label>

                            </li>


                            <li>
                                <label>
                                    <input type="radio" name="cfrtdrEntmthGbcd" value="70" data-txt="기타">
                                    <span>기타</span>
                                </label>

                            </li>


                        </ul>
                    </fieldset>
                    <fieldset class="form-field">
                        <legend class="tit">배송시 요청사항<span class="choice">(선택)</span></legend>
                        <div>
                            <textarea title="배송시 요청사항(선택) 입력" name="dawnDlvMsgCntn" placeholder="50자 이내 입력"
                                      maxlength="50"></textarea>
                        </div>
                    </fieldset>
                    <fieldset class="form-field">
                        <legend class="tit">배송완료 알림 시점<span class="need">*<span class="hide">필수</span></span></legend>
                        <div class="radio-list">

                            <label><input type="radio" name="dlvCmptNotfGbcd" value="01"
                                          checked="checked"><span>아침 07시</span></label>

                            <label><input type="radio" name="dlvCmptNotfGbcd" value="02"><span>배송직후</span></label>

                            <label><input type="radio" name="dlvCmptNotfGbcd" value="03"><span>수신거부</span></label>

                        </div>
                        <div class="infotxt">
                            <ul>
                                <li>택배/판매자 배송 상품은 배송 직후 완료 알림 발송되오니, 참고 바랍니다.</li>
                            </ul>
                        </div>
                    </fieldset>
                    <p class="txt">현대식품관 투홈이 문 앞까지 배송 및 반품회수를 하기 위해,<br>공동 현관 비밀번호를 보관할 수 있도록 동의가 필요합니다.</p>
                    <button type="button" class="btn fill orange" onclick="saveDawnRequest();">동의 후 저장</button>
                    <div class="infotxt">
                        <strong>새벽배송 주문 시 문 앞으로 배송됩니다.<br>문 앞 배송 불가 시 1층 공동 현관문 앞으로 배송 될 수 있습니다.</strong>
                        <ul>
                            <li>회사, 학교, 상가 등 새벽 출입이 불가 한 경우</li>
                            <li>출입정보가 정확하지 않은 경우</li>
                            <li>경비실 호출을 시도하였으나, 응답하지 않은 경우</li>
                            <li>세대원 호출을 요청 한 경우(새벽배송은 세대원 호출 불가)</li>
                        </ul>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- //팝업 : 새벽배송 요청 사항 -->

    <!-- 팝업 : 택배배송 요청 사항// -->
    <div id="p_popRequestParcel" class="popup poprequest">
        <div class="inner">
            <button type="button" class="btn-close" onclick="fn.popupCloseId('#p_popRequestParcel');">닫기</button>
            <header>


                <h2>택배배송 요청 사항</h2>


            </header>
            <div class="contents">
                <form id="frmPopRequestParcel">
                    <input type="hidden" name="dstnSeq">
                    <input type="hidden" name="pageFlag">
                    <input type="hidden" name="reqFlag">
                    <fieldset class="form-field">
                        <legend class="hide">배송요청사항 선택</legend>
                        <ul>


                            <li>
                                <label><input type="radio" name="dlvMsgGbcd" value="40" data-txt="문 앞에 놔주세요"><span>문 앞에 놔주세요</span></label>

                            </li>


                            <li>
                                <label><input type="radio" name="dlvMsgGbcd" value="50"
                                              data-txt="부재 시 경비실에 맡겨주세요"><span>부재 시 경비실에 맡겨주세요</span></label>

                            </li>


                            <li>
                                <label><input type="radio" name="dlvMsgGbcd" value="60" data-txt="배송 전 연락주세요"><span>배송 전 연락주세요</span></label>

                            </li>


                            <li>
                                <label><input type="radio" name="dlvMsgGbcd" value="70"
                                              data-txt="기타"><span>기타</span></label>

                                <div>
                                    <textarea title="기타" placeholder="300자 이내 입력" name="dsrvCoMsgCntn"
                                              id="req_dsrvCoMsgCntn"></textarea>
                                </div>

                            </li>


                        </ul>
                    </fieldset>
                    <br>
                    <!-- <p class="txt">현대식품관 투홈이 문 앞까지 배송 및 반품회수를 하기 위해,<br/>공동 현관 비밀번호를 보관할 수 있도록 동의가 필요합니다.</p> -->


                    <button type="button" class="btn fill orange" onclick="saveParcelRequest();">저장</button>


                </form>
            </div>
        </div>
    </div>
    <!-- //팝업 : 택배배송 요청 사항 -->

    <!-- footer// -->
	<jsp:include page="../Common/footer.jsp"/>
    <!-- //footer -->
</div>


</body>
</html>