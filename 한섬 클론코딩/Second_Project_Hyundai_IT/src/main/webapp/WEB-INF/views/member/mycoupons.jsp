<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<body oncontextmenu="return false">
<div id="bodyWrap">
    <h3 class="cnts_title">
        <span id="menuTitle">나의 쿠폰</span>
    </h3>
    <div class="sub_container">
        <!-- lnb -->
        <div class="lnb_wrap">
            <h4>
                <a href="/member/mypage">마이페이지<!-- 마이페이지 --></a>
            </h4>
            <%--  TODO :: 후에 링크 변경--%>
            <div class="lnb">
                <dl>
                    <dt>주문조회</dt>
                    <dd>
                        <a href="/member/mypage/order/myorders"
                           onclick="GA_Event('마이페이지','LNB','주문/배송/반품/취소');">주문/배송/반품/취소</a>
                    </dd>
                </dl>
                <dl>

                    <dt>혜택관리</dt>
                    <dd>
                        <a href="/member/mypage/myGradeInfo"
                           onclick="GA_Event('마이페이지','LNB','나의 회원 등급');">나의 회원 등급</a>
                    </dd>
                    <dd>
                        <a href="/member/mypage/voucher"
                           onclick="GA_Event('마이페이지','LNB','나의 쿠폰');">나의 쿠폰 <!-- 쿠폰함 --></a>
                    </dd>
                </dl>
                <dl>
                    <dt>나의 상품관리</dt>
                    <dd>
                        <a href="/member/mypage/myWish"
                           onclick="GA_Event('마이페이지','LNB','위시리스트');">위시리스트 <!-- 위시리스트 --></a>
                    </dd>
                </dl>
                <dl>
                    <dt>나의 정보관리</dt>
                    <dd>
                        <a href="/member/mypage/personInfomationChangePWCheck"
                           onclick="GA_Event('마이페이지','LNB','개인정보 변경/탈퇴');">개인정보 변경/탈퇴</a>
                    </dd>
                    <dd>
                        <a href="/member/mypage/shoppingAddressPWCheck"
                           onclick="GA_Event('마이페이지','LNB','배송지 관리');">배송지 관리</a>
                    </dd>
                </dl>
            </div>
            <div class="ph_guide">
                <p class="tlt">고객센터 운영 안내</p>
                <p class="phone">
                    1800-5700<span style="color: #c69c6d;" class="txt">(유료)</span>
                </p>
                <p class="txt">
                    평일(월~금)<br>am 09:00 ~ pm 18:00<span>토/일, 공휴일 휴무</span>
                </p>
                <a href="mailto:shophelp@thehandsome.com">shophelp<br>@thehandsome.com
                </a>
            </div>
        </div>
        <!-- //lnb -->
        <!-- cnts -->
        <div class="sub_cnts">

            <!-- Table -->
            <div class="tblwrap">
                <table class="tbl_ltype">
                    <caption>온라인 쿠폰 목록<!-- 온라인 쿠폰 목록 --></caption>
                    <colgroup>
                        <col style="width:115px">
                        <col style="width:131px">
                        <col>
                        <col style="width:87px">
                        <col style="width:107px">
                        <col style="width:115px">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col">쿠폰 이름<!-- 이름 --></th>
                        <th scope="col">쿠폰 번호<!-- 쿠폰번호 ccode --></th>
                        <th scope="col">쿠폰 내용<!-- 쿠폰 이름 --></th>
                        <th scope="col">할인<!-- 할인 --></th>
                        <th scope="col">유효 기간<!-- 유효기간 cstartdate ~ cdenddate--></th>
                        <th scope="col">사용 여부<!-- 쿠폰사용일자  cstate --></th>
                    </tr>
                    </thead>
                    <c:forEach items="${coupon}" var="coupon">
                    <tbody id="listBody">
                    <tr class="al_middle">
                        <td class="frt" style="word-break: keep-all;">${coupon.cname}
                            쿠폰
                        </td>
                        <td>${coupon.ccode}</td>
                        <td class="al_left">
                            <ul class="bul_sty01_li">
                                <li>${coupon.ename}이벤트로부터 발급된 쿠폰입니다.</li>
                            </ul>
                        </td>
                        <td>${coupon.eamount}</td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd"
                                            value="${coupon.cstartdate}"/> ~ <br>
                            <fmt:formatDate pattern="yyyy-MM-dd" value="${coupon.cenddate}"/>
                        </td>
                        <td><c:if test="${1 eq coupon.cstate}">
                            사용가능
                        </c:if> <c:if test="${1 ne coupon.cstate}">
                            사용불가
                        </c:if></td>
                    </tr>
                    </c:forEach>
                </table>
            </div>
            <!-- //Table -->

            <!--paging-->
            <div class="paging">
                <a class="prev2" href="javascript:void(0);">처음 페이지로 이동</a>
                <a href="javascript:void(0);" class="prev">이전 페이지로 이동</a>
                <span class="num">
					<a href="javascript:void(0);" class="pageBtn  on  " pagenum="1">1</a>
				</span>
                <a href="javascript:void(0);" class="next">다음 페이지로 이동</a>
                <a href="javascript:void(0);" class="next2">마지막 페이지로 이동</a></div>
            <!--//paging-->


            <!-- Guide Table -->
            <div class="gd_wrap mt50">
                <dl class="gd_list com pl0 svc_gd_list">
                    <dt>쿠폰 안내<!-- 쿠폰 안내 --></dt>
                    <dd>
                        <ul class="bul_sty01_li">
                            <li>온라인쿠폰 : 상품 주문 시 ‘주문&amp;배송정보입력’ 화면에서 쿠폰을 적용하면 할인된 금액으로 상품을 구입하실 수 있습니다.</li>
                            <li>반품쿠폰 : 반품 시 반품 비용 없이 무료로 구입하신 상품을 반품 하실 수 있습니다.</li>
                            <li>일부 상품은 쿠폰할인 적용이 불가능합니다.</li>
                            <li>유효기간이 지난 쿠폰은 자동 소멸 됩니다.</li>
                            <li>주문취소 시 사용한 쿠폰은 유효기간이 만료된 경우 재발급되지 않습니다.</li>
                        </ul>
                    </dd>
                </dl>
            </div>
            <div class="gd_wrap">
                <dl class="gd_list com pl0 svc_gd_list">
                    <dt>회원혜택<!-- 회원 혜택 --></dt>
                    <dd>
                        <ul class="bul_sty01_li">
                            <li>생일축하 한섬마일리지 : 생일을 맞은 회원님께 생일축하 2만 한섬마일리지를 드립니다.(온/오프라인 합하여, 구매이력 있는 고객)</li>
                            <li>신규회원 온라인 할인쿠폰 : 한섬 온라인에 가입한 즉시 발급되며, 1개월 이내 사용 하셔야 합니다.<br>할인 금액의 제한은 없습니다.</li>
                            <li>한섬 우수고객 혜택 (2019년) : 연간 구매금액 1,000만원 이상 회원 대상으로 다음 해 연간 구매 혜택, 서비스, 기프트를 증정합니다.</li>
                            <li>향후 회원 혜택은 사전공지 후 변경될 수 있습니다.</li>
                        </ul>
                    </dd>
                </dl>
            </div>
            <!-- //Guide Table -->

        </div>
        <!-- //cnts -->
    </div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>