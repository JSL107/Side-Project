<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="/WEB-INF/views/common/header.jspf" %>
<body>
<!-- bodyWrap -->
<div id="bodyWrap">
    <h3 class="cnts_title">
        <span id="menuTitle">회원 탈퇴</span>
    </h3>
    <div class="sub_container">
        <!-- lnb -->
        <div class="lnb_wrap">
            <h4>
                <a href="/member/mypage">마이페이지<!-- 마이페이지 --></a>
            </h4>
            <div class="lnb">
                <dl>
                    <dt>주문조회</dt>
                    <dd>
                        <a href="/member/orderlist">주문/배송/반품/취소</a>
                        <form id="orderlist" action="/member/orderlist" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                    </dd>
                </dl>
                <dl>
                    <dt>혜택 관리</dt>
                    <dd>
                        <a href="/member/myGradeInfo">나의 회원 등급<!-- 나의 회원 등급 --></a>
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
                        <a href="/kakao/pwcheck">개인정보 탈퇴</a>
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
                <p class="phone">
                    1800-5700 <span style="color: #c69c6d;" class="txt">(유료)</span>
                </p>
                <p class="txt">
                    평일(월~금)<br>am 09:00 ~ pm 18:00<span>토/일, 공휴일 휴무</span>
                </p>
                <a href="mailto:shophelp@thehandsome.com">shophelp<br>@thehandsome.com
                </a>
            </div>
            <!-- //ph_guide -->
        </div>

        <!-- //lnb -->
        <!-- cnts -->
        <div class="sub_cnts">


            <script type="text/javascript" src="/_ui/desktop/common/js/jquery-1.11.2.min.js"></script>


            <form id="personInfomationChangePage" name="manToManInquiryForm"
                  action="http://www.thehandsome.com/ko/mypage/personInfomationChangePWCheck" method="post"><input type="hidden" name="directInto"
                                                                                         value="NO">
                <div>
                    <input type="hidden" name="CSRFToken" value="2081f55e-60bf-4593-b34e-ade5383b2b89">
                </div>
            </form>
            <div class="title_wrap mt30">
                <h4 class="float_left">회원탈퇴 재확인</h4>
                <p class="txt_line">탈퇴를 진행하시면 이후에 혜택을 받으실수 없습니다.</p>
            </div>

            <!-- pw reaffirm -->
            <div class="pw_reaffirm">
                <form id="pwcheckform">
                    <fieldset>
                        <legend>입력항목</legend>
                        <div class="login_section" style="height: 50px;">
                            <div>
                                <div>
                                    <img src="../../../resources/images/alert.png"
                                         style="width:50px; height:50px; vertical-align:middle;">
                                    <span style="vertical-align: middle;font-size:18px;">정말로 탈퇴하시겠습니까?</span>
                                </div>
                            </div>
                            <p class="guide_comment ml50">
                                <!-- 입력하신 아이디 혹은 비밀번호가 일치하지 않습니다. --></p>
                        </div>
                    </fieldset>
                </form>
            </div>
            <!-- //pw reaffirm -->

            <!-- btn_btwrap -->
            <div class="btnwrap mypage2">
                <a href="/kakao/mypage" class="btn wt" id="cancle_btn">취소</a>
                <form id ="ok">
                    <a href="javascript:void(0);" class="btn gray" id="login_btn">확인</a>
                </form>
            </div>
        </div>
        <!-- //cnts -->


    </div>
</div>
<script>
    $("#login_btn").click(function () {
        $("#ok").attr("action", "/kakao/deleteuserpo");
        $("#ok").submit();
    });
    $("#cancle_btn").click(function () {
        window.history.go(-1);
    });


</script>

</body>
<%@include file="/WEB-INF/views/common/footer.jspf" %>