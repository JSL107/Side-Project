<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" type="image/x-icon" href="../UIUX/images/favicon.ico?ver=17">
    <link rel="stylesheet" type="text/css" href="../UIUX/css/css-library.min.css?ver=17">
    <link rel="stylesheet" type="text/css" href="../UIUX/css/common.min.css?ver=17">
    <title>마이페이지>배송지관리</title>
</head>
<body class="shipping" data-aos-easing="ease" data-aos-duration="400" data-aos-delay="0">
<link rel="stylesheet" type="text/css" href="../UIUX/css/mypage.min.css?ver=17">

<div id="wrap" class="mypage shippinglist">

    <!-- header// -->
 	<jsp:include page="../Common/Link.jsp"/>
    <!-- //header -->
    
    <% if (session.getAttribute("UserId") == null) {
        String url = "login_form.jsp";
        request.getRequestDispatcher(url).forward(request, response);
    } %>

    <!-- contents// -->
    <div id="contents">
        <div class="innercon">
            <!-- mypage lnb// -->

            <section class="lnbarea">
                <h2>마이페이지</h2>
                <ul>
                    <li class="lnb-depth1">
                        <a href="#">주문관리</a>
                        <ul class="lnb-depth2">
                            <li><a href="./">주문 내역</a></li>
                            <li id="esuperlist"><a href="./">주문 내역(e슈퍼마켓)</a></li>
                            <!-- 20220412 김민서 [e슈퍼이관] e슈퍼 링크 추가 -->
                            <li><a href="./">주문취소</a></li>
                            <li><a href="./">반품/교환</a></li>
                            <li><a href="./">대량주문 문의</a></li>
                            <li><a href="./">투홈구독</a></li>
                            <li><a href="./">정기배송 설정</a></li>
                        </ul>
                    </li>

                    <li class="lnb-depth1">
                        <a href="#">쇼핑 혜택</a>
                        <ul class="lnb-depth2">
                            <li><a href="./">쿠폰</a></li>
                            <li><a href="/">H.Bonus</a></li>
                            <li><a href="./">투홈패스</a></li>
                            <li><a href="./">H.Point</a></li>

                            <li><a href="./">상품권 전환금</a></li>
                        </ul>
                    </li>
                    <li class="lnb-depth1">
                        <a href="#">나의 활동</a>
                        <ul class="lnb-depth2">
                            <li><a href="./">리뷰</a></li>
                            <li><a href="./">좋아요</a></li>
                            <li><a href="./">최근 본 상품</a></li>

                            <li><a href="./">매거진 보관함</a></li>
                            <li><a href="./">늘 필요한 상품</a></li>

                            <li><a href="./">이벤트 참여현황</a></li>
                            <li><a href="./">투홈백 관리</a></li>
                            <li><a href="./">재입고 알림</a></li>
                        </ul>
                    </li>
                    <li class="lnb-depth1">
                        <a href="#">나의 정보</a>
                        <ul class="lnb-depth2">
                            <li><a href="./">회원정보 변경</a></li>
                            <li class="active"><a href="./" ">배송지 관리</a></li>
                            <!-- <li><a href="#">간편계정연결관리</a></li> -->
                            <li><a href="./">로그인 기록</a></li>

                            <li><a href="./">H.Point Pay</a></li>

                            <li><a href="./">Home Pay</a></li>
                            <li><a href="./">개인정보 이용현황</a></li>
                            <li><a href="./">환불계좌/현금영수증</a></li>
                            <li><a href="./">임직원 인증</a></li>
                            <li><a href="./" onclick="fn_GaEvent(this);">차량 등록</a></li>
                        </ul>
                    </li>
                </ul>
            </section>

            <!-- //mypage lnb -->

            <section class="conarea">
                <h3 class="tit line">배송지 관리</h3>

                <div class="filter-area">
                    <div class="list-filter">
                        <label><input type="radio" name="sort" value="0" class="sort" checked=""><span>전체</span></label>
                        <label><input type="radio" name="sort" value="1" class="sort"><span>새벽배송</span></label>
                        <label><input type="radio" name="sort" value="2" class="sort"><span>택배배송</span></label>
                    </div>
                    <p class="txt">배송지에 따라 배송 가능 지역이 달라집니다.</p>
                </div>

                <ul class="shipping-list">

                    <li class="contarea" data-dawn_dlv_yn="N" data-dsrv_dlv_yn="Y">

                        <label class="tit"><input type="radio" name="radio" data-dstn_seq="0000000001" data-base_yn="Y"
                                                  checked=""><span><span>[기본배송지]</span></span></label>
                        <div class="cont">
                            <div class="addrinfo">
                                <span>
                                    <strong class="name">이준석</strong>
                                    <div class="tel">010-6470-0107</div>
                                </span>
                                <div>
                                    <p class="addr">경기도 김포시 대곶면 오니산로171번길 125 </p>
                                    <span class="category">택배배송</span>
                                </div>
                            </div>
                        </div>
                        <div class="btns">
                            <%--TODO :: 수정 팝업 띄우기--%>
                            <button type="button" class="btn small lightgray"
                                    onclick="ptcPop('0000000001','202208042099');">수정
                            </button>
                            <%--TODO :: 삭제도 할건강...?--%>
                            <button type="button" class="btn small lightgray"
                                    onclick="del('0000000001','202208042099');">삭제
                            </button>
                        </div>
                    </li>
                </ul>
            </section>
        </div>
    </div>
    <!-- //contents -->

    <%--TODO :: 수정 버튼시 팝업 띄울 부분--%>
    <%--    // start--%>
    <%--    finish//--%>

    <!-- footer// -->
	<jsp:include page="../Common/footer.jsp"/>
    <!-- //footer -->

</div>
</body>
</html>