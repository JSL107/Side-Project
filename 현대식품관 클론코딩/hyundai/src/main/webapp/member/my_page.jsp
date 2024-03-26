<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
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
    <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script> <!-- jquery -->
    <meta charset="UTF-8">
    <title>장바구니</title>
</head>
<body data-aos-easing="ease" data-aos-duration="400" data-aos-delay="0">

<link rel="stylesheet" type="text/css" href="../UIUX/css/mypage.min.css?ver=1663418587718">
<!-- contents// -->

<div id="wrap" class="mypage change">

    <jsp:include page="../Common/Link.jsp" />
    <!-- header// -->
    <% if (session.getAttribute("UserId") == null) {
        String url = "login_form.jsp";
        request.getRequestDispatcher(url).forward(request, response);
    } %>
    <!-- header// -->

    <!-- //header -->

    <!-- CDN END// -->
    <!-- //header -->

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
                            <li><a href="#" onclick="fn_GaEvent(this);">주문 내역</a></li>
                            <li><a href="#" onclick="fn_GaEvent(this);">주문취소</a></li>
                            <li><a href="#" onclick="fn_GaEvent(this);">반품/교환</a></li>
                            <li><a href="#" onclick="fn_GaEvent(this);">대량주문 문의</a></li>
                            <li><a href="#" onclick="fn_GaEvent(this);">투홈구독</a></li>
                            <li><a href="#" onclick="fn_GaEvent(this);">정기배송 설정</a></li>
                        </ul>
                    </li>

                    <li class="lnb-depth1">
                        <a href="#">쇼핑 혜택</a>
                        <ul class="lnb-depth2">
                            <li><a href="#">쿠폰</a></li>
                            <li><a href="#">H.Bonus</a></li>
                            <li><a href="#">투홈패스</a></li>
                            <li><a href="#">H.Point</a></li>

                            <li><a href="#">상품권 전환금</a></li>
                        </ul>
                    </li>
                    <li class="lnb-depth1">
                        <a href="#">나의 활동</a>
                        <ul class="lnb-depth2">
                            <li><a href="TohomeServlet?command=my_review">리뷰</a></li>
                            <li><a href="TohomeServlet?command=like_page">좋아요</a></li>
                            <li><a href="#">최근 본 상품</a></li>
                            <li><a href="#">매거진 보관함</a></li>
                            <li><a href="#">늘 필요한 상품</a>
                            </li>

                            <li><a href="#">이벤트 참여현황</a></li>
                            <li><a href="#">투홈백 관리</a></li>
                            <li><a href="#">재입고 알림</a></li>
                        </ul>
                    </li>
                    <li class="lnb-depth1">
                        <a href="#">나의 정보</a>
                        <ul class="lnb-depth2">
                            <li><a href="./">회원정보
                                변경</a></li>
                            <li><a href="#">배송지 관리</a></li>
                            <!-- <li><a href="#">간편계정연결관리</a></li> -->
                            <li><a href="#">로그인 기록</a></li>

                            <li><a href="#">H.Point
                                Pay</a></li>

                            <li><a href="#">Home Pay</a></li>
                            <li><a href="#">개인정보
                                이용현황</a></li>
                            <li><a href="#">환불계좌/현금영수증</a></li>
                            <li><a href="#">임직원 인증</a></li>
                            <li><a href="#">차량 등록</a></li>

                        </ul>
                    </li>

                </ul>
            </section>
            <!-- //mypage lnb -->

            <section class="conarea">
                <h3 class="tit line">마이페이지</h3>

                <form name="mainform" method="post">
                    <fieldset class="form-field">
                        <legend>회원정보</legend>

                        <%--TODO :: MEMBERDTO에서 값 가져오기--%>
                        <dl>
                            <dt>이름<span class="need">*<span class="hide">필수</span></span></dt>
                            <dd>${currentUserDTO.user_name} (이름변경은 고객센터 문의)</dd>
                        </dl>

                        <dl>
                            <dt>아이디<span class="need">*<span class="hide">필수</span></span></dt>
                            <dd>${currentUserDTO.user_id}</dd>
                        </dl>


                        <!-- H.Point 통합회원 비밀번호 변경// -->
                        <dl class="hpointpw">
                            <dt>비밀번호<span class="need">*<span class="hide">필수</span></span></dt>
                            <dd>
                                <button type="button" class="btn small black">
                                    비밀번호 변경
                                </button>
                                <input type="hidden" id="test1" name="OLD_PWD" title="기존 비밀번호 확인 입력"
                                       placeholder="기존 비밀번호">
                                <input type="hidden" id="NEW_PWD" name="NEW_PWD" title="신규 비밀번호 입력"
                                       placeholder="신규 비밀번호" onkeydown="resetPWD();">
                                <input type="hidden" id="NEW_PWD2" name="NEW_PWD2" title="비밀번호 확인 입력"
                                       placeholder="비밀번호 확인" onkeydown="resetPWD();">
                            </dd>
                        </dl>
                        <!-- //H.Point 통합회원 비밀번호 변경 -->

                        <dl>
                            <dt>휴대폰번호<span class="need">*<span class="hide">필수</span></span></dt>
                            <dd>
                                <input type="hidden" id="TELNO" name="TELNO" value="01064700107">
                                <span class="dd-txt" id="TLENO_SPAN">${currentUserDTO.mobile_num}</span>
                                <button type="button" class="btn small black">변경
                                </button>
                            </dd>
                        </dl>

                        <dl class="email-info">
                            <dt>이메일<span class="need">*<span class="hide">필수</span></span></dt>
                            <dd>
                                <label class="form-entry">
                                    <input type="text" name="EMAIL_ADR" id="EMAIL_ADR" title="이메일 입력" placeholder="이메일"
                                           value="juneseok0107@naver.com" oninput="validEmail('EMAIL_ADR');">
                                    <button type="button" class="btn-del" tabindex="-1">삭제</button>
                                </label>
                            </dd>
                        </dl>

                        <input type="hidden" name="POST_NO" value="10037">
                        <input type="hidden" name="BASE_ADR" value="경기도 김포시 대곶면 오니산리 3-3">
                        <input type="hidden" name="PTC_ADR" value="">
                        <input type="hidden" name="ADR_GBCD" value="10">
                        <input type="hidden" name="BASE_YN" value="Y">
                        <dl>

                            <%-- TODO :: ADDRESSDTO에서 값 가져오기 --%>
                            <dt>주소</dt>
                            <dd>
                                <div class="form-addr">
                                    <input type="text" name="RDNM_POST_NO" class="post" title="우편번호" placeholder="우편번호"
                                           readonly="" value="10037">
                                    <!-- <button type="button" class="btn fill gray" onclick="javascript:fn.popupOpen('#popDeliveryAddr');">주소찾기</button> -->
                                    <!-- /UIUX/w/member/join_step2_hpoint.html 영역 참고 : onclick="fn.popupOpen('#p_popDeliveryAddr');" -->
                                    <button type="button" class="btn fill gray">주소찾기
                                    </button>
                                    <input type="text" name="RDNM_BASE_ADR" title="기본주소" placeholder="기본주소" readonly=""
                                           value="경기도 김포시 대곶면 오니산로171번길 125">
                                    <label class="form-entry">
                                        <input type="text" id="RDNM_PTC_ADR" name="RDNM_PTC_ADR" title="상세주소 입력"
                                               placeholder="상세주소 입력" value="">
                                        <button type="button" class="btn-del" tabindex="-1">삭제</button>
                                    </label>
                                    <label id="addAddrListLabel" style="display:none"><input type="checkbox"
                                                                                             name="ADD_DSTN"
                                                                                             id="ADD_DSTN" value="Y"
                                                                                             disabled=""><span>배송지 목록에 추가</span></label>

                                    <div class="delivery-noti">
                                        <div class="infotxt">
                                            <ul>
                                                <li>기본 배송지 설정 및 추가/삭제/변경은 배송지 관리에서 가능합니다.</li>
                                            </ul>
                                        </div>
                                        <a href="./" class="btn-round">배송지 관리</a>
                                    </div>
                                </div>
                            </dd>
                        </dl>
                        <input type="hidden" name="PUSH_RCV_AGR_YN">
                        <input type="hidden" name="SMS_RCV_AGR_YN">
                        <input type="hidden" name="EMAIL_RCV_AGR_YN">

                        <%--TODO :: 비밀번호가 맞지 않는다면 정보변경 버튼 hide--%>
                        <div class="btns">
                            <button type="button" class="btn big lightgray">취소
                            </button>
                            <button type="button" class="btn fill big black">정보변경
                            </button>
                        </div>
                    </fieldset>
                </form>

            </section>
        </div>

    </div>

    <!-- //contents -->

    <!-- footer// -->
	<jsp:include page="../Common/footer.jsp"/>
    <!-- //footer -->

</div>
</body>
</html>