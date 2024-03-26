<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 작성자: 이준석 -->
<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
    .title_font {
        font-size: 16px;
        height: 30px;
        font-weight: bolder;
        margin: 40px 0px 15px 0px;
    }

    .table_head {
        background-color: #f5f5f5;
        padding: 7px 0px 7px 20px;
        width: 140px;
        height: 45px;
        border-bottom: 1px solid rgba(0, 0, 0, 0.1);
    }

    .table_body {
        border-top: 1px solid #666;
    }

    .table_detail {
        width: 525px;
        border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        padding: 7px 10px;
    }

    .mandatory_sign {
        color: #c69c6c;
        font-weight: bolder;
    }

    .no_mandatory_sign {
        color: #f5f5f5;
        font-weight: bolder;
    }

    .form_hyphen {
        padding-right: 5px;
        height: 32px;
        line-height: 32px;
        display: inline-block;
        text-align: center;
        color: #b0b0b0;
    }

    select {
        margin: 0px 5px 0 0;
        height: 30px;
        border: 1px solid #ccc;
        padding: 3px 8px 6px 8px;
        vertical-align: top;
    }

    input[type="text"], input[type="password"], input[type="email"] {
        margin-right: 5px;
        height: 30px;
        line-height: 30px;
        text-indent: 10px;
        border: 1px solid #ccc;
    }

    .btn_normal {
        margin-left: 5px;
        display: inline-block;
        color: #363636;
        font-size: 12px;
        font-weight: bold;
        text-align: center;
        vertical-align: middle;
        cursor: pointer;
    }

    .btn_theme_white {
        padding: 6px 10px 7px;
        min-width: 50px;
        border: 1px solid #ccc;
        background: #fff;
        font-size: 11px;
        line-height: 11px;
    }

    .btn_theme_gray {
        padding: 7px 15px 9px;
        min-width: 90px;
        border: 1px solid #ccc;
        background: #f5f5f5;
        line-height: 12px;
    }
</style>
<div id="bodyWrap">
    <h3 class="cnts_title">
        <span>배송&amp;결제정보 입력</span>
    </h3>

    <input type="hidden" id="chk_giftAmount" value="">
    <input type="hidden" id="chk_pointAmount" value="">

    <form id="orderForm" action="/order/ordering" method="post">
        <input id = "token" type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
        <script language="javascript" src="https://stdpay.inicis.com/stdjs/INIStdPay.js" type="text/javascript"
                charset="UTF-8"></script>
        <input type="hidden" id="ccolorcode" name="ccolorcode" value="${ccolorcode}">
        <input type="hidden" id="ssize" name="ssize" value="${ssize}">
        <input type="hidden" id="pid" name="pid" value="${pid}">
        <input type="hidden" id="mid" name="mid" value="${mid}">
        <input type="hidden" id="oamount" name="oamount" value="${oamount}">
        <input id="mode" name ="opayment" type="hidden" value="0">
        <input id = "opt" type="hidden" name = "ousedcoupon" value="">

        <!--sub_container-->
        <div class="sub_container">
            <!--orderwrap-->
            <div class="orderwrap del_pay">
                <!--orderwrap left-->
                <div class="float_left">
                    <!--table wrap1-->
                    <div id="checkoutCartView" class="tblwrap">
                        <table class="tbl_ltype ">

                            <caption>
                                배송&amp;결제정보 입력
                            </caption>
                            <colgroup>
                                <col>
                                <col style="width: 66px">
                                <col style="width: 158px">
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col">상품정보</th>
                                <th scope="col">수량</th>
                                <th scope="col">판매가/쿠폰 적용가</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="al_middle">
                                <td class="frt">
                                    <!-- pt_list_all -->
                                    <div class="pt_list_all">
                                        <a href="/ko/HANDSOME/WOMEN/PANTS/DENIM/%5BSignature-Jeans%5D-%EC%9B%8C%EC%8B%B1-%EB%8D%B0%EB%8B%98-%ED%81%AC%EB%A1%AD-%ED%8C%AC%EC%B8%A0/p/SJ2C9NPC991N_KG_61">
                                            <img src="${orderinfo.cimage3}"
                                                 alt="">
                                        </a>
                                        <div class="tlt_wrap">
                                            <a href="/ko/HANDSOME/WOMEN/PANTS/DENIM/%5BSignature-Jeans%5D-%EC%9B%8C%EC%8B%B1-%EB%8D%B0%EB%8B%98-%ED%81%AC%EB%A1%AD-%ED%8C%AC%EC%B8%A0/p/SJ2C9NPC991N_KG_61"
                                               class="basket_tlt">
                                                <span class="tlt">${orderinfo.bname}</span>
                                                <span class="sb_tlt">${orderinfo.pname}</span>
                                            </a>
                                            <p class="color_op">
                                                color : ${orderinfo.ccolorname}<span class="and_line">/</span>
                                                size : ${orderinfo.ssize}</p>
                                        </div>
                                    </div> <!-- //pt_list_all -->
                                </td>
                                <!-- 수량  -->
                                <td>${amount}</td>
                                <td>
                                    <!-- price_wrap -->
                                    <div id="price_wrap" class="price_wrap ">
                                        <span id="price" style="display: block" >
                                            <fmt:formatNumber value="${totalPrice}" pattern="\###,###,###,###"/></span>
                                        <del id="price_sale" style="display: none"><fmt:formatNumber
                                                value="${totalPrice}" pattern="\###,###,###,###"/></del>
                                    </div> <!-- //price_wrap -->
                                    <div id="price_wrap coupon" class="price_wrap coupon" style=" display : none">
                                        <span id="saleprice">
                                            <input id="minusPrice"
                                                   value=${totalPrice} readonly
                                                   style="border:none; background:none; color: #c69c6c; font-size: 16px; text-align: center"></span>
                                    </div> <!-- //price_wrap -->
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--//table wrap1-->

                    <!--title_wrap & table wrap3-->
                    <div class="title_wrap clearfix mt40">
                        <h4 class="float_left">
                            주문자 정보</h4>
                    </div>
                    <div class="tblwrap">
                        <table class="tbl_wtype1">
                            <caption>
                                주문자 정보
                            </caption>
                            <colgroup>
                                <col style="width: 140px">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row" class="th_space">주문자</th>
                                <td>${orderinfo.mname}</td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_space">휴대폰</th>
                                <td>
                                    ${orderinfo.mtel}</td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_space">E-mail</th>
                                <td>${orderinfo.memail}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--nonmember-->
                    <!--//nonmember-->

                    <!--//title_wrap & table wrap3-->
                    <!--title_wrap & table wrap4-->
                    <div class="title_wrap clearfix mt40" id="deliveryAddressDisplay">
                        <h4 class="float_left">
                            배송지 정보</h4>
                        <p class="reqd_txt none">
                            <strong class="reqd">*</strong>
                            표시는 필수항목입니다.</p>
                        <div class="btn_wrap">
                            <a href="#;" class="btn wt_ss" id="btn_wt_ss" onclick="onToChangeMemberAddress()">주문고객과
                                동일</a>
                            <a href="#;" class="btn wt_ss mr0" onclick="onToClear();">새로작성하기</a>
                        </div>
                    </div>

                    <div class="tblwrap" id="deliveryInfoTitle">
                        <table class="tbl_wtype1">
                            <caption>
                                배송지 정보
                            </caption>
                            <colgroup>
                                <col style="width: 140px">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row" class="tooltip191022">
                                    <strong class="reqd">*</strong>
                                    <label for="adress">배송지 주소</label>
                                    <span class="ico_question">icon</span>
                                    <div class="delch_box190816">
                                        <span class="arr">위치아이콘</span>
                                        <ul class="bul_sty01_li">
                                            <li>기본배송지 변경은 <strong>마이페이지&gt; [배송지관리]</strong>에서 가능합니다.</li>
                                            <li>기본배송지 설정 시 기본배송지가 최우선으로 노출 됩니다.</li>
                                        </ul>
                                    </div>
                                </th>
                                <td><!-- address -->
                                    <input value="" title="우편번호" id="address" class="post" type="text"
                                           name ="ozipcode" readonly="">
                                   <input value="우편번호 조회" id="addrSearchBtn" class="btn add_s" type="button" onclick="execution_daum_address()">
                                    <br>
                                    <div id="basis_bk_flag">
                                        <input value="" title="주소1" name="oaddress1" id="line1" class="post_wall top"
                                               type="text" readonly="">
                                    </div>
                                    <input value="" title="주소2" name="oaddress2" id="line2" class="post_wall" type="text"
                                           maxlength="110" placeholder="나머지 주소를 입력해 주세요."> <!-- //address -->
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><strong class="reqd">*</strong>
                                    <label for="rcpt_name">수령인</label></th>
                                <td>
                                    <input title="수령인" id="rcpt_name" name="oreceiver" maxlength="13"
                                           type="text" style="width: 118px;">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><strong class="reqd">*</strong><label for="hp">휴대폰 번호</label></th>
                                <td>
                                    <!-- hp --> <select id="hp" name="phNum1" title="휴대폰 번호 앞자리" class="hp_num1">
                                    <option value="010">010</option>
                                    <option value="011">011</option>
                                    <option value="016">016</option>
                                    <option value="017">017</option>
                                    <option value="018">018</option>
                                    <option value="019">019</option>
                                </select>
                                    <div class="form_hyphen">-</div>
                                    <input title="휴대폰 번호 가운데자리" name="phNum2" id="hp_num2" class="hp_num2" type="text"
                                           maxlength="4" numberonly="true">
                                    <div class="form_hyphen">-</div>
                                    <input title="휴대폰 번호 뒷자리" name="phNum3" id="hp_num3" class="hp_num2" type="text"
                                           maxlength="4" numberonly="true"> <!-- //hp -->
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_space">
                                    <label for="ph">연락처</label></th>
                                <td>
                                    <!-- phone -->
                                    <select name="ph_num1" id="ph" title="연락처 앞자리" class="hp_num1">
                                    <option value="">선택</option>
                                    <option value="02">02</option>
                                    <option value="031">031</option>
                                    <option value="032">032</option>
                                    <option value="033">033</option>
                                    <option value="041">041</option>
                                    <option value="042">042</option>
                                    <option value="043">043</option>
                                    <option value="044">044</option>
                                    <option value="051">051</option>
                                    <option value="052">052</option>
                                    <option value="053">053</option>
                                    <option value="054">054</option>
                                    <option value="055">055</option>
                                    <option value="061">061</option>
                                    <option value="062">062</option>
                                    <option value="063">063</option>
                                    <option value="064">064</option>
                                </select>
                                    <div class="form_hyphen">-</div>
                                    <input title="연락처 가운데자리" name="ph_num2" id="ph_num2" class="hp_num2" type="text"
                                           maxlength="4" numberonly="true">
                                    <div class="form_hyphen">-</div>
                                    <input title="연락처 뒷자리" name="ph_num3" id="ph_num3" class="hp_num2" type="text"
                                           maxlength="4" numberonly="true"> <!-- //phone -->
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_space"><label for="orderr">배송 메세지</label></th>
                                <td>
                                    <div class="input_sumtxt">
                                        <div class="input_sumtxt_box">
                                            <!-- input -->
                                            <input onkeyup="chkword('orderr','orderr_text_length',20);" id="orderr"
                                                   name="deliveryRequestContents" autocomplete="off" type="text"
                                                   value="" title="배송 메세지" maxlength="20">
                                            <!-- //input -->
                                            <div class="delivery_comt" style="display: none;">
                                                <ul>
                                                    <li>
                                                        <a href="#;" data-readonly="readonly"
                                                           deliveryrequestmessage="배송 전 연락 바랍니다">
                                                            배송 전 연락 바랍니다</a>
                                                    </li>
                                                    <li style="background: rgb(248, 248, 248);">
                                                        <a href="#;" data-readonly="readonly"
                                                           deliveryrequestmessage="부재 시 문 앞에 놓아주세요">
                                                            부재 시 문 앞에 놓아주세요</a>
                                                    </li>
                                                    <li>
                                                        <a href="#;" data-readonly="readonly"
                                                           deliveryrequestmessage="부재 시 경비실에 맡겨주세요">
                                                            부재 시 경비실에 맡겨주세요</a>
                                                    </li>
                                                    <li style="background: rgb(248, 248, 248);">
                                                        <a href="#;" data-readonly="readonly"
                                                           deliveryrequestmessage="빠른 배송 부탁드립니다">
                                                            빠른 배송 부탁드립니다</a>
                                                    </li>
                                                    <li>
                                                        <a href="#;" data-readonly="readonly"
                                                           deliveryrequestmessage="부재 시 핸드폰으로 연락바랍니다">
                                                            부재 시 핸드폰으로 연락바랍니다</a>
                                                    </li>
                                                    <li style="background: rgb(248, 248, 248);">
                                                        <a href="#;" data-readonly="write"
                                                           deliveryrequestmessage="직접입력">
                                                            직접입력</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div>
                                            <span id="orderr_text_length">0</span> <span>/20자</span>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- 211028 공동현관 출입방법 S -->
                            <tr class="enter-door211026">

                                <th scope="row" class="tooltip191022 th_space tooltip211026-">
                                    <label for="enter_door" class="">공동현관<br>출입방법</label><span
                                        class="ico_question">icon</span>
                                    <div class="delch_box190816 ">
                                        <span class="arr">위치아이콘</span>
                                        <ul class="bul_sty01_li">
                                            <li>공동현관 출입번호가 정확하지 않을 경우, 배송 기사의 판단에 따라 1층 공동현관 앞 또는 경비실에 배송될 수 있습니다.</li>
                                            <li>새벽배송 시 배송 전 연락을 드리지 않습니다.</li>
                                        </ul>
                                    </div>
                                </th>
                                <td>
                                    <div class="input_sumtxt">
                                        <div class="input_sumtxt_box input_sumtxt_box2">
                                            <!-- 211028 공동현관 출입방법 S -->
                                            <input name="frontDoorSelectMessage" id="enter_door" type="text"
                                                   autocomplete="off" value="공동현관 출입방법을 선택해주세요" title="공동현관 출입방법"
                                                   readonly="">
                                            <!-- 211028 공동현관 출입방법 E -->
                                            <div class="delivery_comt delivery_comt2" style="display: none;">
                                                <ul>
                                                    <li>
                                                    </li>
                                                    <li style="background: rgb(248, 248, 248);"><a href="#;"
                                                                                                   data-default="공동현관 출입번호"
                                                                                                   data-input-display="block">공동현관
                                                        출입번호</a></li>
                                                    <li><a href="#;" data-default="자유 출입 가능" data-input-display="none">자유
                                                        출입 가능</a></li>
                                                    <li style="background: rgb(248, 248, 248);"><a href="#;"
                                                                                                   data-default="기타"
                                                                                                   data-input-display="block">기타</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="input_sumtxt enter_front">
                                        <input onkeyup="chkword('frontDoorMessage','front_door_text_length',15);"
                                               id="frontDoorMessage" name="frontDoorMessage" type="text"
                                               placeholder="15자 이내로 입력하세요" title="출입방법 예시" maxlength="15">
                                        <div>
                                            <span id="front_door_text_length">0</span>
                                            <span>/15자</span>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- 211028 공동현관 출입방법 E -->
                            <tr>
                                <th scope="row" class="th_space"><label for="mail">수령인 E-mail</label></th>
                                <td>
                                    <!-- email -->
                                    <input type="text" id="mail" name="mail" title="이메일 아이디"
                                           class="em_form">
                                    <span class="andmail">@</span>
                                    <input type="text" value="" name="emailDely" id="emailDely" title="직접입력"
                                           class="em_form">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <ul class="bul_sty01_li">
                            <li>선택사항을 미입력하더라도 불이익은 발생하지 않습니다.</li>
                        </ul>
                    </div>
                    <!--//title_wrap & table wrap4-->
                    <!--title_wrap & table wrap2-->
                    <div class="title_wrap  mt40">
                        <h4 class="float_left">
                            쿠폰 및 혜택 적용</h4>
                        <p class="guide_comment">
                            쿠폰을 적용하셔야 할인 혜택이 가능합니다.</p>
                    </div>

                    <div class="tblwrap">
                        <table class="tbl_wtype1">
                            <colgroup>
                                <col style="width:140px">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row" class="th_space">쿠폰 및 혜택<br>선택</th>
                                <td>
                                    <div class="vvip_td_wrap" id="select_voucher">
                                        <div class="coupon_select_wrap" style="margin-top:15px">

                                            <input name="voucherCode" id="voucherCode" value="" title="쿠폰코드 직접입력"
                                                   placeholder="쿠폰코드 직접입력" type="text" class="input">
                                            <p>또는</p>
                                            <select title="쿠폰을 선택해 주세요." id="selectVoucher" style="width: 190px;">
                                                    <option value="">쿠폰을 선택해 주세요.</option>
                                                <c:forEach items="${couponList}" var="coupon">
                                                    <option onclick="selectCoupon()" id="couponcode" value="<c:out value="${coupon.ccode}"></c:out>"><c:out value="${coupon.cname}"></c:out></option>
                                                </c:forEach>
                                            </select>


                                            <div class="btnwrap">
                                                <a href="#;" id="btnRedeemVoucher" class="btn add_s min_auto"
                                                   onclick="salePrice()" style="display:block;">
                                                    적용</a>
                                                <a href="#;" style="display:none" id="btnReleaseVoucher"
                                                   class="btn add_s min_auto" onclick="cancelSalePrice();">
                                                    적용취소</a>
                                            </div>


                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- H.Point START ------------------------------------------------>
                    <!-- H.Point END -------------------------------------------->

                    <!--//title_wrap & table wrap2-->
                    <!--title_wrap & table wrap5-->
                    <div class="title_wrap clearfix mt40">
                        <h4 class="float_left">결제 수단 선택</h4>
                    </div>
                    <div class="tblwrap">
                        <table class="tbl_wtype1">
                            <caption>결제 수단 선택</caption>
                            <colgroup>
                                <col style="width: 140px">
                                <col>
                            </colgroup>
                            <tbody>
                            <!-- H.Point Start NOT ANY **********************************-->
                            <tr>
                                <th scope="row" class="th_space"><label for="hpointpay">H.Point 결제</label></th>
                                <td>
                                    <!-- point wrap -->
                                    <div class="point_wrap">
                                        <input title="H.Point 결제" class="inpput" id="hpointpay"
                                               name="ousedpoint" numberonly="true" onchange="printPoint()">

                                        <p class="p_txt">
                                            P 사용 (잔액 : <span>${orderinfo.mpoint}P</span>)
                                        </p>
                                        <!-- apply -->
                                        <div class="point_apply">
                                            <div class="all">
                                                <input title="선택" value="" type="checkbox" id="hpoint_useall"
                                                       onclick=" selectClick()">
                                                <span><label for="hpoint_useall">모두사용</label></span>
                                            </div>
                                            <input id="btnUseHPoint" class="btn add_s min_auto" type="button"
                                                   onclick="doUseHPoint();" value="적용">
                                            <input id="btnCancelUseHPoint" class="btn dis_s min_auto" type="button"
                                                   onclick="cancelUseHPoint();" value="적용취소">
                                        </div>
                                        <!-- //apply -->
                                    </div> <!-- point wrap -->
                                </td>
                            </tr>
                            <!-- H.Point End ********************************************-->
                            <%-- INFO :: 결제 수단 정리--%>
                            <tr>
                                <th scope="row" class="th_space">결제수단 선택</th>
                                <td>
                                    <div class="rd_wrap payment_way1907">
                                        <ul>
                                            <li>
                                                <input type="radio" name="mode" id="sel_rd0" checked="checked"
                                                       value="0" onChange="changeRadioButton()" >
                                                <label for="sel_rd0" class="mr20 one_click_pay">원클릭결제</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="mode" id="sel_rd1" value="1" onChange="changeRadioButton()">
                                                <label for="sel_rd1" class="mr20">신용카드</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="mode" id="sel_rd2" value="2"
                                                       onChange="changeRadioButton()">
                                                <label for="sel_rd2" class="mr20">실시간 계좌이체</label>
                                            </li>
                                            <%-- INFO :: 카카오 페이 추가하기--%>
                                            <li>
                                                <input type="radio" name="mode" id="sel_rd3" value=3
                                                       onChange="changeRadioButton()">
                                                <label for="sel_rd2" class="mr20">카카오페이</label>
                                            </li>
                                        </ul>
                                    </div> <!-- ckout_wrap -->
                                    <div class="ckout_wrap" id="ckout_wrap0" style="">
                                        <div class="oclk_card_list_wrap" id="oclk_card_list_wrap">
                                            <div class="card_easy_pay_wrap swiper-container swiper_card_easy_pay swiper-container-horizontal swiper-container-wp8-horizontal"
                                                 id="card_easy_pay">
                                                <ul class="swiper-wrapper"
                                                    style="transition-duration: 0ms; transform: translate3d(0px, 0px, 0px);">
                                                    <li class="swiper-slide swiper-slide-active"
                                                        style="margin-right: 25px;">
                                                        <div class="card_item cd_kind_add"><a href="#none"
                                                                                              class="card_add_btn"
                                                                                              id="btnCardRegist">카드등록</a>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <a href="#;"
                                               class="prev_oclk_slide_btn oclks_btn1905 swiper-button-disabled"
                                               style="display: none;">이전</a>
                                            <a href="#;"
                                               class="next_oclk_slide_btn oclks_btn1905 swiper-button-disabled"
                                               style="display: none;">다음</a>
                                        </div>

                                    </div>

                                    <div class="ckout_wrap" id="ckout_wrap" style="display: none;">
                                        <p>※ 한섬마일리지/기프트카드와 가상계좌 함께 사용 시, 입금시점에 한섬마일리지/기프트카드의 결제 잔액이
                                            있어야 주문이 완료됩니다.</p>
                                        <p id="virtualText" style="display: none;">※ <font color="red">4시간 이내 입금</font>
                                            하셔야 주문이 완료 됩니다.</p>
                                        <div class="escrow_wrap">
                                            <p class="escrowservice">
                                                <strong>에스크로 서비스</strong>
                                            </p>
                                            <input type="radio" name="escrowYn" id="ipt_escrow_01" value="N" checked="">
                                            <label for="ipt_escrow_01" class="mr20">아니요</label>
                                            <input type="radio" name="escrowYn" id="ipt_escrow_02" value="Y">
                                            <label for="ipt_escrow_02">예</label>
                                            <p class="escrowservice_txt">정부방침에 따라 실시간계좌이체 및 무통장입금, 가상계좌로 주문하시는 경우 에스크로
                                                서비스 이용여부를 선택할 수 있습니다.</p>
                                        </div>
                                        <a href="#;" onclick="escrowPopup();" class="btn add_s">매매보호서비스 가입사실확인</a>
                                    </div> <!-- //ckout_wrap -->
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--//title_wrap & table wrap5-->

                    <!--card event tab-->
                    <div class="tab_a m3 mt40" id="ce_tab">
                        <ul>
                            <li><a href="#;" class="active">무이자 할부</a></li>
                            <li><a href="#;"><!-- <strong style="color:#c69c6c">NEW</strong>  -->청구할인</a></li>
                            <li><a href="#;">즉시할인</a></li>
                        </ul>
                    </div>
                    <!--//card event tab-->
                    <!--card event tab container-->
                    <div class="ce_tab_container mt40">
                        <!--tab contents 1-->
                        <div style="display: block;">
                            <div class="title_wrap">
                                <h5>무이자 할부 행사</h5>
                            </div>
                            <!--Table wrap-->
                            <table class="cnt_type1">
                                <caption>무이자 할부 행사</caption>
                                <colgroup>
                                    <col style="width: 155px">
                                    <col style="width: 270px">
                                    <col>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row"><span class="card"><img
                                            src="../../../resources/medias/shinhan.jpg?context=bWFzdGVyfHJvb3R8MjY1N3xpbWFnZS9qcGVnfGhkZS9oMmIvODgxNDE4MTUxNTI5NC5qcGd8NTAwMDYxM2ZmZmRlZGFhZDQ0ODNmODJjZTg2OTE3MGI3OWQ2ZmE3YzI0ZjA3MDY3NzIxYWVhNmY3NDQyYWUzMA"
                                            alt="신한카드"></span></th>
                                    <td><b>신한카드 5만원이상 결제시 2~6개월 무이자 할부</b><br>
                                        대상: 신한카드 전 회원<br>
                                        (신한BC 제외/ 법인,기프트,체크,선불카드 제외)
                                    </td>
                                    <td>행사기간 : 2022.10.01
                                        ~ 2022.10.31
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="card"><img
                                            src="../../../resources/medias/SAMSUNG.jpg?context=bWFzdGVyfHJvb3R8MzIxOXxpbWFnZS9qcGVnfGgzZC9oNGQvODgxNDE4MTYxMzU5OC5qcGd8ZGY1NDJiM2U1YWNmNGE5MTJkOTA0MTAxMDliMDc4ZjRlNTJmZjJlOTkxOTQzZTEwMDcxZWU2NGU2MjJmMWE2Mw"
                                            alt="삼성카드"></span></th>
                                    <td><b>삼성카드 5만원이상 결제시 2~6개월 무이자 할부</b><br>
                                        대상: 삼성카드 전 회원<br>
                                        (법인,기프트,체크,선불카드 제외)
                                    </td>
                                    <td>행사기간 : 2022.10.01
                                        ~ 2022.10.31
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="card"><img
                                            src="../../../resources/medias/BC.jpg?context=bWFzdGVyfHJvb3R8MjQ1OHxpbWFnZS9qcGVnfGhmMi9oMGQvODgxNDE4MTIyMDM4Mi5qcGd8MjZlZGU2ZGQyNDBkYzU5YmY2NWY0MDU3NDc1OTA0YWI5NmM4NDJjMDFiYjBiYjBjY2FhZjhmMzg3ZmE5NGU5Yw"
                                            alt="비씨카드"></span></th>
                                    <td><b>비씨카드 5만원이상 결제시 2~7개월 무이자 할부</b><br>
                                        대상: 비씨카드 전 회원<br>(법인,기프트,체크,선불카드 제외)
                                    </td>
                                    <td>행사기간 : 2022.10.01
                                        ~ 2022.10.31
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="card"><img
                                            src="../../../resources/medias/HYUNDAI.jpg?context=bWFzdGVyfHJvb3R8MjYxMHxpbWFnZS9qcGVnfGg1ZC9oN2MvODgxNDE4MTcxMTkwMi5qcGd8YmM5ZWY0ZjlhODlkMzdmMjYyNmY4NjQ4OWU5NWVjOWFlMGY4ODIwYzZlNjA0MjBlNDkwNWI0ZDllYThjMWE5Mw"
                                            alt="현대카드"></span></th>
                                    <td><b>현대카드 5만원이상 결제시 2~7개월 무이자 할부</b><br>
                                        대상: 현대카드 전 회원<br>
                                        (법인,기프트,체크,선불카드 제외)
                                    </td>
                                    <td>행사기간 : 2022.10.01
                                        ~ 2022.10.31
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="card"><img
                                            src="../../../resources/medias/kucmin.jpg?context=bWFzdGVyfHJvb3R8MzMwM3xpbWFnZS9qcGVnfGgyZS9oMzQvODgxNDE4MTAyMzc3NC5qcGd8MjM1YjEyN2I4OTljMGIxYzY3MjhjNDhkZWMyOTE5ODZjYmRiYWExNDdhOWZmNDQ3ZWNhNGIxZjYwYzk2MDA4Zg"
                                            alt="국민카드"></span></th>
                                    <td><b>KB국민카드 5만원이상 결제시 2~7개월 무이자 할부</b><br>
                                        대상: KB국민카드 전 회원<br>
                                        (NH농협, 국민BC 제외/ 법인,기프트,체크,선불카드 제외)
                                    </td>
                                    <td>행사기간 : 2022.10.01
                                        ~ 2022.10.31
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="card"><img
                                            src="../../../resources/medias/hanacard.gif?context=bWFzdGVyfHJvb3R8MTkzNXxpbWFnZS9naWZ8aDYwL2hmYi84ODE0MDU0OTY1Mjc4LmdpZnxhMGM5OWY0MDdhNDhjYzkwOTdiMzhkM2VmMDQ2YTI0NTAyNDBjZTljNTdiYzk4YWRhZmI0NjBhOWRhNzRiMGYw"
                                            alt="하나카드"></span></th>
                                    <td><b>하나카드 5만원이상 결제시 2~8개월 무이자 할부</b><br>
                                        대상: 하나카드 전 회원 (구 하나SK, 구 외환)<br>
                                        (하나BC카드 포함/법인,기프트,체크,선불카드 제외)
                                    </td>
                                    <td>행사기간 : 2022.10.01
                                        ~ 2022.10.31
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="card"><img
                                            src="../../../resources/medias/NH.jpg?context=bWFzdGVyfHJvb3R8Mzk3OXxpbWFnZS9qcGVnfGg4ZS9oMzYvODgxNDE4MTkwODUxMC5qcGd8ZWVlNmY1OWM0NDdmMjg2M2Y4NGZkNDZjYThmOTVkMWNmY2QwYWNkOWI1ODc5YTdiMTc5MjY4MThiZTkzYzNmMw"
                                            alt="NH카드"></span></th>
                                    <td><b>NH농협카드 5만원이상 결제시 2~8개월 무이자 할부</b><br>
                                        대상: NH농협카드 전 회원<br>
                                        (NH농협BC카드 포함/ 법인,기프트,체크,선불카드 제외)
                                    </td>
                                    <td>행사기간 : 2022.10.01
                                        ~ 2022.10.31
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="card"><img
                                            src="../../../resources/medias/LOTTE.jpg?context=bWFzdGVyfHJvb3R8MzI3MXxpbWFnZS9qcGVnfGhiMy9oNDcvODgxNDE4MTgxMDIwNi5qcGd8MDliOThkNzA1ZDc2ZDE4MzZhYmUzYjI2MDMxZDk0NGU3OTVjYzBhYTA1MmMzMjAyZmE0Y2U4OTZlNTU3NDU2Zg"
                                            alt="롯데카드"></span></th>
                                    <td><b>롯데카드 5만원이상 결제시 2~4개월 무이자 할부</b><br>
                                        대상:롯데카드 전 회원<br>
                                        (법인,기프트,체크,선불카드 제외)
                                    </td>
                                    <td>행사기간 : 2022.10.01
                                        ~ 2022.10.31
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <!--//Table wrap-->
                        </div>
                        <!--//tab contents 1-->
                    </div>
                    <!--//card event tab container-->
                </div>
                <!--//orderwrap left-->
                <!--orderwrap right-->
                <div class="float_right" style="position: absolute; left: 680px; top: 0px;">
                    <!--final payment sum box-->
                    <div class="sum_box">
                        <div>
                            <p class="tlt">최종 결제 금액</p>
                            <hr>
                            <dl class="clearfix">
                                <dt class="sub_total190816">상품 합계</dt>
                                <dd class="sub_total190816" id="subTotal">
                                    <fmt:formatNumber value="${totalPrice}" pattern="\###,###,###,###"/></dd>
                                <dt>프로모션/쿠폰 할인 금액</dt>
                                <dd id="couponDiscounts" style="display: none"></dd>
                                <dt>H.Point 결제</dt>
                                <dd id="hpointDiscount" style="display:none;"></dd>
                                <dt class="delch_wrap190816">
                                    <!--delivery charge layer popup-->
                                    <div class="delch_box190816" style="display: none;">
                                        <span class="arr">위치아이콘</span>
                                        <ul class="bul_sty01_li">
                                            <li>쿠폰/바우처 할인금액 및 한섬마일리지/H.Point 사용을 제외한 실 결제금액 기준 <strong>3만원 미만 결제 시
                                                2,500원 배송비가 부과</strong>됩니다. (3만원 이상 구매 시 무료배송)
                                            </li>
                                            <li>도서산간 지역은 배송비가 추가 될 수 있습니다.</li>
                                            <li>한섬마일리지, H.Point, e-money로 배송비 결제가 불가합니다.</li>
                                        </ul>
                                    </div>
                                </dt>
                            </dl>
                        </div>
                        <div class="total">
                            <dl class="clearfix">
                                <dt>
                                    합계
                                </dt>
                                <dd>
                                    <input name = "odiscounted" id="sumPrice" value="${totalPrice}" readonly size=10
                                           style="border:none; background:none; color: #c69c6c; font-size: 16px;  font-weight: bold; text-align: right"/>
                                </dd>
                            </dl>
                        </div>
                    </div>
                    <!--//final payment sum box-->
                    <!--point & agreement box-->
                    <div class="p_a_box">
                        <div class="point">
                            <!-- 간편회원이 아닐 때 s -->
                            <p class="tlt">구매 시 지급 예정 포인트</p>
                            <p class="txt" id="txtAccumulationHPoint">H.Point
                                <input id="txtAccumulationHPointInput" value="" size=5 readonly
                                       style="border:none; background:none; color: #c69c6c; font-size: 16px;  font-weight: bold; text-align: left; padding-bottom: 6px;">P
                            </p>
                        </div>


                        <div class="agree">
                            <input type="checkbox" id="agree">
                            <label for="agree" class="tlt">[필수] 구매자 동의 </label>
                            <p class="txt">
                                주문할 상품의 상품명, 가격, 배송정보 등<br>
                                판매조건을 확인하였으며, 구매진행에 동의합니다.<br>
                                (전자상거래법 제8조 2항)<br><br>
                                기존 마이너스 한섬마일리지를 보유하고 있는 고객은
                                한섬마일리지가 차감되어 적립되는 것에 동의합니다.
                                적립 예정 한섬마일리지가 상이할 수 있습니다.

                            </p>
                        </div>
                        <!-- 20220905 our legacy 개인정보 제3자 제공 추가. -->
                    </div>
                    <!--//point & agreement box-->
                    <span id="doOrderBtn">
<%--							<a href="#;" class="btn gray " onclick=location.href="/order/ordercomplete?mid=${mid}&ozipcode=?&oaddress1=?&oaddress2=?&oreceiver=?&otel=?&ousedpoint=?&opayment=?&ostatus=?&odiscounted=?&pid=?&ccolorcode=?&ssize=?&oamount=?">결제하기</a>--%>
                    							<a href="#;" type="submit" class="btn gray" onclick="chk_form()">결제하기</a>

                    </span>
                </div>
                <!--//orderwrap right-->
            </div>
            <!--//orderwrap-->
        </div>
        <!--//sub_container-->
    </form>

</div>
<script>
    function chk_form() {
    	console.log('들어옴');
    	alert('주문이 완료되었습니다.');
        document.getElementById('orderForm').submit();
    }
</script>
<script type="text/javascript">
    var hpoint = $('#hpointpay').val();
    var couponCalculatePrice = ${totalPrice}-(${totalPrice} *
    ${orderinfo.saleprice})
    ;
    var calculatePrice =
    ${totalPrice} *
    ${orderinfo.saleprice};


    function onToChangeMemberAddress() {
        $('#address').attr("value", "${member.maddress1}");
        $('#line1').attr("value", "${member.maddress2}");
        $('#line2').attr("value", "${member.maddress3}");
        $('#rcpt_name').attr("value", "${member.mname}");
        $('#hp_num2').attr("value", "${middlePhoneNum}");
        $('#hp_num3').attr("value", "${endPhoneNum}");
        $('#mail').attr("value", "${parsingemail1}");
        $('#emailDely').attr("value", "${parsingemail2}");
    }

    function onToClear() {
        $('#address').attr("value", "");
        $('#line1').attr("value", "");
        $('#line2').attr("value", "");
        $('#rcpt_name').attr("value", "");
        $('#hp_num2').attr("value", "");
        $('#hp_num3').attr("value", "");
        ``
        $('#mail').attr("value", "");
        $('#emailDely').attr("value", "");
    }

    function salePrice() {
        var ccname = $("#selectVoucher").val();
        var pprice = ${orderinfo.pprice};
        var elimit = ${orderinfo.elimit};

        if (pprice < elimit) {
            alert("쿠폰 할인가가 상품가를 넘을 수는 없습니다.");
        } else {
            if (ccname === "") {
                alert("쿠폰번호를 입력해주세요");
            } else {
                document.getElementById("price").style.display = "none";
                document.getElementById("price_wrap coupon").style.display = "block";
                document.getElementById("price_sale").style.display = "block";
                document.getElementById("btnReleaseVoucher").style.display = "block";
                document.getElementById("btnRedeemVoucher").style.display = "none";
                document.getElementById("couponDiscounts").style.display = "block";
                document.getElementById("couponDiscounts").innerText = "-\\" + parseInt(calculatePrice);
                $('#minusPrice').val(couponCalculatePrice);
                $('#sumPrice').val(parseInt(document.getElementById("sumPrice").value)-parseInt(calculatePrice));
                console.log("쿠폰 적용 후 : " + document.getElementById("sumPrice").value);
            }
        }
    }

    function cancelSalePrice() {
        document.getElementById("price").style.display = "block";
        document.getElementById("price_wrap coupon").style.display = "none";
        document.getElementById("price_sale").style.display = "none";
        document.getElementById("btnReleaseVoucher").style.display = "none";
        document.getElementById("btnRedeemVoucher").style.display = "block";
        document.getElementById("couponDiscounts").style.display = "none";
        document.getElementById("couponDiscounts").innerText = "";
        $('#minusPrice').val("");
        $('#sumPrice').val(parseInt(parseInt(document.getElementById("sumPrice").value)+parseInt(calculatePrice)));
        console.log("쿠폰 적용 취소 : " + document.getElementById("sumPrice").value);

    }

    function printPoint() {
        hpoint = parseInt($('#hpointpay').val());
    }

    function doUseHPoint() {
        if (hpoint === "" || hpoint >${orderinfo.mpoint}) {
            alert("포인트 사용을 확인해주세요.");
        } else {
            document.getElementById("btnUseHPoint").className = "btn dis_s min_auto";
            document.getElementById("btnCancelUseHPoint").className = "btn add_s min_auto";
            document.getElementById("hpointDiscount").style.display = "block";
            $('#hpointpay').attr('readonly', true);
            $('#hpoint_useall').attr('disabled', true);
            $('#sumPrice').val(parseInt(document.getElementById("sumPrice").value) - parseInt(hpoint));
            document.getElementById("hpointDiscount").innerText = "-\\" + hpoint;
            console.log("포인트 적용 취소 : " + (document.getElementById("sumPrice").value - hpoint));
        }
    }

    function cancelUseHPoint() {
        document.getElementById("btnUseHPoint").className = "btn add_s min_auto";
        document.getElementById("btnCancelUseHPoint").className = "btn dis_s min_auto";
        document.getElementById("hpointDiscount").style.display = "none";
        $('#hpointpay').attr('readonly', false);
        $('#hpoint_useall').attr('disabled', false);
        document.getElementById("hpointDiscount").innerText = "";
        $('#sumPrice').val(parseInt(document.getElementById("sumPrice").value) + parseInt(hpoint));
    }

    function selectClick() {
        console.log($("#hpoint_useall").prop("checked"))
        if ($("#hpoint_useall").prop("checked") === true) {
            hpoint = ${orderinfo.mpoint};
            $('#hpointpay').val(hpoint)
        } else {
            hpoint = "";
            $('#hpointpay').val("");
        }
    }

    function changeRadioButton() {
        $('#mode').val($('input[name="mode"]:checked').val());
        console.log($('#mode').val());
    }

    /* 다음 주소 연동 */
	function execution_daum_address() {

		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName
										: data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 주소변수 문자열과 참고항목 문자열 합치기
							addr += extraAddr;

						} else {
							addr += ' ';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						$("#address").val(data.zonecode);
						$("#line1").val(addr);
						// 커서를 상세주소 필드로 이동한다.
						$("#line2").focus();
					}
				}).open();

	}

    function selectCoupon (){
        $('#opt').val($('#couponcode').val());
    }
</script>
<script>
    var calculatePoint =
    ${totalPrice} *
    0.05;
    $('#txtAccumulationHPointInput').val(calculatePoint);
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>