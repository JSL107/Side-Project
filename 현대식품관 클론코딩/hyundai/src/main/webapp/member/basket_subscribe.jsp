<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <meta charset="UTF-8">
    <title>장바구니</title>
</head>
<body data-aos-easing="ease" data-aos-duration="400" data-aos-delay="0">

<!-- body -->
<!-- 업무 공용 웹자원 -->
<link rel="stylesheet" type="text/css" href="../UIUX/css/order.min.css?ver=28">
<div id="wrap" class="order cart">
    <!-- header// -->
	<jsp:include page="../Common/Link.jsp" />
    <!-- //header -->
    <!-- contents// -->
    <div id="contents">
        <div class="innercon">
            <h2>장바구니</h2>
            <section id="cartlist tab-menu" class="cartlist tab-menu" style="left: auto;">
                <a href="./basket.jsp#cartlist tab-menu" basktgbcd="01">새벽배송</a>&lt;
                <a href="./basket_subscribe.jsp#cartlist tab-menu" class="active" basktgbcd="02">정기배송</a>
            </section>

            <!-- 전체선택// -->
            <section class="cart-select">
                <label><input type="checkbox" checked="checked" name="allItemSelect"><span>전체선택</span></label>
                <ul class="btn-group">
                    <li>
                        <button type="button" onclick="javascript:deleteSelectedBasket();">삭제</button>
                    </li>
                    <li>
                        <button type="button" onclick="javascript:clickAddLikeItem();">좋아요담기</button>
                    </li>
                </ul>
            </section>
            <!-- 전체선택// -->

            <form id="frmBasktInfo">
                <!-- nodata// -->
                <div class="nodata">장바구니에 담긴 상품이 없습니다.</div>
                <!-- //nodata -->

                <div class="rightarea" style="position: absolute; inset: 71px 0px auto auto;">

                    <!-- 결제내역// -->
                    <fieldset class="price-field">
                        <legend class="hide">결제내역</legend>
                        <dl class="orderprice">
                            <dt>총 상품금액</dt>
                            <dd><strong><em id="emPriceFTotNrmlPrice">0</em>원</strong></dd>
                        </dl>
                        <dl>
                            <dt>총 할인금액</dt>
                            <dd><strong><em id="emPriceFTotDcAmt">0</em>원</strong></dd>
                        </dl>

                        <dl class="total">
                            <dt>총 결제예상금액</dt>

                            <dd><strong><em id="emPriceFTotPayAmt">0</em>원</strong></dd>
                        </dl>
                    </fieldset>
                    <!-- 결제내역// -->

                    <%--TODO :: 정기배송 관련한 상품이 없어서 테스트해보지 못했음.--%>
                    <button type="button" class="btn fill bigger orange btn-order"
                            onclick="GA_Event('PC_장바구니', '주문하기', '주문하기'); orderCheck();" disabled="disabled">정기배송 신청
                    </button>
                </div>
            </form>

            <!-- 이용안내// -->
            <section class="cart-info infotxt">
                <strong>이용안내</strong>
                <ul>
                    <li>정기배송설정은 [정기배송 주기 변경]을 선택하여 변경 가능합니다.</li>
                    <li>총 결제예상금액은 현재 가격으로 계산된 금액이며, 최종결제금액은 자동결제 시점의 가격으로 계산됩니다.</li>
                    <li><span>정기배송설정 변경 및 취소는 마이페이지 &gt; 편리한 쇼핑 &gt; 정기배송 관리 메뉴에서 변경 가능합니다.</span></li>
                    <li><span>카드 분실 및 한도초과, 통신 지연 등으로 최초 자동결제(배송일 오전 8시)에 실패된 경우 해당 회차의 상품은 배송되지 않습니다.</span></li>
                </ul>
            </section>
            <!-- 이용안내// -->
        </div>


    </div>
    <!-- //contents -->

    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- 배송지목록 -->

    <!-- footer// -->
	<jsp:include page="../Common/footer.jsp"/>
    <!-- //footer -->


</div>
</body>
</html>