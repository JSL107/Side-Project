<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="/WEB-INF/views/common/header.jspf" %>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!DOCTYPE html>
<div id="bodyWrap">
    <script language="javascript"
            src="https://stdpay.inicis.com/stdjs/INIStdPay.js"
            type="text/javascript" charset="UTF-8"></script>
    <h3 class="cnts_title">
        <span>배송&amp;결제정보 입력</span>
    </h3>
    <div class="layerArea" style="z-index: 1110; display: none;" id="layerDiv">
        <div class="layerBg"></div>
        <div class="popwrap w_type_1" id="popup" style="position: fixed; top: 30%; left: 50%; display: none;"
             tabindex="-1">
            <div class="pop_cnt">
                <h3 class="pop_tlt copy" id="alertPopuptxt">결제를 진행 하실 카드를 선택해 주세요.</h3>
                <div class="btnwrap">
                    <input type="button" class="btn gray_s mr0" onclick="AlertClose();" value="확인">
                </div>
            </div>
            <a href="javascript:AlertClose();" class="btn_close">
                <img src="/resources/images/ico_close.png" alt="닫기">
            </a>
        </div>

        <div class="popwrap w_type_2" id="confirmOrder"
             style="position: fixed; top: 30%; left: 50%; display: none;" tabindex="-1">
            <div class="pop_cnt">
                <h3 class="pop_tlt copy">
                    주문이 완료되었습니다.<br>확인하시겠습니까?
                </h3>
                <div class="btnwrap">
                    <input type="button" id="clsBtn" class="btn wt_s mr5" value="마이 페이지로 이동" onclick="location.href='/member/mypage';">
                    <input type="button" id="cfBtn" class="btn gray_s mr0" value="주문결과 바로가기" onclick="clickcfBtn();">
                </div>
            </div>
        </div>

        <!--layer pop-->
        <div class="popwrap w_type_3" id="addresspopup"
             style="top: 659px; position: absolute; z-index: 101; display: none;">
            <!-- Title1 -->
            <div class="pop_tltwrap">
                <h3>배송지관리</h3>
            </div>
            <!-- //Title1 -->
            <div class="pop_cnt">
                <div class="tab_a m2" id="del_tab">
                    <ul>
                        <li><a href="javascript:void(0);" class="active">나의 배송지 목록</a></li>
                    </ul>
                </div>
                <div class="del_tab_container">
                    <!-- tab 1 -->
                    <div>
                        <p class="com_txt mb20 ml10">
                            고객님이 저장하신 배송지 목록입니다.<span class="com_txt_p">(마이페이지에서 등록 및
                     수정 하실 수 있습니다.)</span>
                        </p>
                        <!-- table -->
                        <div>
                            <table class="pop_dtable my">
                                <caption>배송지관리</caption>
                                <thead>
                                <tr>
                                    <th scope="col">선택</th>
                                    <th scope="col">수령인</th>
                                    <th scope="col">배송지 주소</th>
                                    <th scope="col">연락처/휴대폰</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${ addressList}" var="address">
                                    <tr>
                                        <td>
                                            <input name="sel_address" id="sel_address" type="radio"
                                                   value="${address.ano }">
                                            <form id="addressListApply" action="/order/orderpage"
                                                  method="post">
                                                <input type="hidden" name="aname" value="${address.aname }">
                                                <input type="hidden" name="addr1" value="${address.addr1 }">
                                                <input type="hidden" name="addr2" value="${address.addr2 }">
                                                <input type="hidden" name="addr3" value="${address.addr3 }">
                                                <input type="hidden" name="toname" value="${address.toname }">
                                                <input type="hidden" name="tophone" value="${address.tophone }">

                                            </form>
                                        </td>
                                        <td>
                                                ${address.aname }
                                        </td>
                                        <td>
                                            <div>
                                                <span>${address.addr1 }</span>
                                                    <%-- <c:if test="${address.isdefault.equals('1') }">
                                                        <span class="sum_add">기본배송지</span>
                                                    </c:if> --%>
                                                <p>${address.addr2 }&nbsp; ${address.addr3 }</p>
                                            </div>
                                        </td>
                                        <td>
                                                ${address.toname }
                                            <br>
                                                ${address.tophone }
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- //table -->
                        <div class="btnwrap">
                            <input class="btn wt_s" value="취소" type="button"
                                   onclick="javascript:AddressListClose();"> <input
                                class="btn gray_s mr0" value="확인" type="button"
                                onclick="javascript:selectAddress();">
                        </div>
                    </div>
                    <!--// tab 1 -->

                    <!-- tab 2 -->
                    <div style="display: none;">
                        <p class="com_txt mb20 ml10">고객님께서 최근 주문 시 사용하셨던 10개의 배송지 목록
                            입니다.</p>
                        <!-- table -->
                        <table class="pop_dtable lately">
                            <caption>배송지관리</caption>
                            <thead>
                            <tr>
                                <th scope="col">선택</th>
                                <th scope="col">수령인</th>
                                <th scope="col">배송지 주소</th>
                                <th scope="col">연락처/휴대폰</th>
                                <th scope="col">수정/삭제</th>
                            </tr>
                            </thead>
                            <tbody id="shippingDeliveryAddressList">
                            </tbody>
                        </table>
                        <!-- //table -->
                        <div class="btnwrap">
                            <input class="btn wt_s" value="취소" type="button"
                                   onclick="$('.btn_close').click();"> <input
                                class="btn gray_s mr0" value="배송지로 선택" type="button"
                                onclick="javascript:selectDeliveryAddress();">
                        </div>
                    </div>
                    <!--// tab 2 -->

                </div>
            </div>
            <!-- btn_close -->
            <a href="javascript:void(0);" class="btn_close" onclick="AddressListClose();"> <img
                    src="/_ui/desktop/common/images/popup/ico_close.png" alt="닫기">
            </a>
            <!-- //btn_close -->
        </div>
    </div>
    <form id="orderForm" action="/member/orderexec" method="post">
        <input type="hidden" name="mid" value="${member.mid}">
        <input type="hidden" name="ozipcode" value="">
        <input type="hidden" name="oaddress1" value="">
        <input type="hidden" name="oaddress2" value="">
        <input type="hidden" name="oreceiver" value="">
        <input type="hidden" name="otel" value="">
        <input type="hidden" name="ocal" value="">
        <input type="hidden" name="omessage" value="">
        <input type="hidden" name="ousermilege" value="">
        <input type="hidden" name="ousedcoupon" value="">
        <input type="hidden" name="opayment" value="">
        <input type="hidden" name="ostatus" value="">
        <input type="hidden" name="oaccountdeadline" value="">
        <input type="hidden" name="odiscounted" value="">
        <input type="hidden" name="oprice" value="${oprice}">
    </form>
    <!--sub_container-->
    <div class="sub_container">
        <!--orderwrap-->
        <div class="orderwrap del_pay">
            <!--orderwrap left-->
            <div class="float_left">
                <!--table wrap1-->
                <div id="checkoutCartView" class="tblwrap">
                    <table class="tbl_ltype ">

                        <caption>배송&amp;결제정보 입력</caption>
                        <colgroup>
                            <col>
                            <col style="width: 66px">
                            <col style="width: 158px">
                        </colgroup>
                        <script language="javascript" type="text/javascript">
                            let pids = [];
                            let ccolorcodes = [];
                            let ssizes = [];
                            let oamounts = [];
                            let totalprice = [];
                            let oprice = [];
                            let num = 0;
                        </script>
                        <thead>
                        <tr>
                            <th scope="col">상품정보</th>
                            <th scope="col">수량</th>

                            <th scope="col">판매가/쿠폰 적용가</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${orderList }" var="orderitem" varStatus="i">
                            <tr name="entryOrderPageProductInfo" class="al_middle">
                                <td class="frt">
                                    <!-- pt_list_all -->
                                    <div class="pt_list_all">
                                        <a
                                                href="/product/product_detail?pid=${orderitem.pid}&colorcode=${orderitem.ccolorcode}">
                                            <img src="${orderitem.thumbnail.c_thumbnail1 }" style="object-fit : cover"
                                                 alt="">
                                        </a>
                                        <div class="tlt_wrap">
                                            <a
                                                    href="/product/product_detail?pid=${orderitem.pid}&colorcode=${orderitem.ccolorcode}"
                                                    class="basket_tlt"> <span
                                                    class="tlt">${orderitem.productVO.bname}</span>
                                                <span class="sb_tlt">${orderitem.productVO.pname }</span>
                                            </a>
                                            <p class="color_op">

                                                color : ${orderitem.thumbnail.cname }<span class="and_line">/</span>

                                                size :${orderitem.ssize }
                                            </p>
                                        </div>
                                    </div> <!-- //pt_list_all -->
                                </td>
                                <td>${orderitem.oamount }</td>
                                <td>
                                    <input type="hidden" id="oprice" value="${orderitem.oprice}">
                                    <!-- price_wrap -->
                                    <c:choose>
                                        <c:when test="${rafflePrice != null}">
                                            <div class="price_wrap ">
                                                <span class="item_price">${rafflePrice}</span><input
                                                    type="hidden" id="sumprice" value="${rafflePrice}">
                                            </div>
                                            <!-- //price_wrap -->
                                        </c:when>
                                        <c:otherwise>
                                            <div class="price_wrap ">
                                                <span class="item_price">${orderitem.totalprice }</span><input
                                                    type="hidden" id="sumprice" value="${orderitem.totalprice  }">
                                            </div> <!-- //price_wrap -->
                                            <!-- //price_wrap -->
                                        </c:otherwise>
                                    </c:choose>

                                </td>
                            </tr>
                            <script language="javascript" type="text/javascript">
                                pids[num] = "${orderitem.pid}";
                                ccolorcodes[num] = "${orderitem.ccolorcode}";
                                ssizes[num] = "${orderitem.ssize}";
                                oamounts[num] = "${orderitem.oamount}";
                                oprice[num] = "${orderitem.oprice}";
                                totalprice[num] = "${orderitem.totalprice}";
                                if (num == 0) {
                                    var orderName = "${orderitem.productVO.pname}";
                                }
                                num++;
                            </script>
                        </c:forEach>
                        </tbody>
                    </table>
                    <script>
                        var checktHandsomepointUsableAmount = parseInt('450000.0');
                    </script>
                </div>
                <!--//table wrap1-->

                <!--title_wrap & table wrap3-->
                <div class="title_wrap clearfix mt40">
                    <h4 class="float_left">주문자 정보</h4>
                </div>
                <div class="tblwrap">
                    <table class="tbl_wtype1">
                        <caption>주문자 정보</caption>
                        <colgroup>
                            <col style="width: 140px">
                            <col>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row" class="th_space">주문자</th>
                            <td>${member.mname }</td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_space">휴대폰</th>
                            <td>${member.mtel }</td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_space">E-mail</th>
                            <td>${member.memail }</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <!--nonmember-->
                <!--//nonmember-->

                <!--//title_wrap & table wrap3-->
                <!--title_wrap & table wrap4-->
                <div class="title_wrap clearfix mt40" id="deliveryAddressDisplay">
                    <h4 class="float_left">배송지 정보</h4>
                    <p class="reqd_txt none">
                        <strong class="reqd">*</strong> 표시는 필수항목입니다.
                    </p>
                    <div class="btn_wrap">
                        <a href="#;" class="btn wt_ss" onclick="f_customerAddress();">주문 고객과 동일</a>
                        <a href="#;" class="btn wt_ss mr0" onclick="resetAddress();">새로 작성하기</a>
                    </div>
                </div>

                <div class="tblwrap" id="deliveryInfoTitle">
                    <table class="tbl_wtype1">
                        <caption>배송지 정보</caption>
                        <colgroup>
                            <col style="width: 140px">
                            <col>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row" class="tooltip191022"><strong class="reqd">*</strong>
                                <label for="adress">배송지 주소</label> <span class="ico_question">icon</span>
                                <div class="delch_box190816">
                                    <span class="arr">위치아이콘</span>
                                    <ul class="bul_sty01_li">
                                        <li>기본배송지 변경은 <strong>마이페이지&gt; [배송지관리]</strong>에서
                                            가능합니다.
                                        </li>
                                        <li>기본배송지 설정 시 기본배송지가 최우선으로 노출 됩니다.</li>
                                    </ul>
                                </div>
                            </th>
                            <td>
                                <!-- address --> <input value="" title="우편번호" id="zipcode"
                                                        name="postcode" class="post" type="text" readonly="readonly">
                                <input value="우편번호 조회" id="addrSearchBtn" class="btn add_s"
                                       type="button"> <br>
                                <div id="basis_bk_flag">
                                    <input value="" title="주소1" name="address1" id="address1"
                                           class="post_wall top" type="text" readonly="readonly">
                                </div>
                                <input value="" title="주소2" name="address2" id="address2"
                                       class="post_wall" type="text" maxlength="110"
                                       placeholder="나머지 주소를 입력해 주세요."> <!-- //address -->
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><strong class="reqd">*</strong><label
                                    for="rcpt_name">수령인</label></th>
                            <td><input value="" title="수령인" id="receiver"
                                       name="lastName" maxlength="13" type="text"
                                       style="width: 118px;"></td>
                        </tr>
                        <tr>
                            <th scope="row"><strong class="reqd">*</strong><label
                                    for="hp">휴대폰 번호</label></th>
                            <td>
                                <!-- hp --> <select id="hp" name="hp_num1" title="휴대폰 번호 앞자리"
                                                    class="hp_num1">
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                                <option value="018">018</option>
                                <option value="019">019</option>
                            </select>
                                <div class="form_hyphen">-</div>
                                <input title="휴대폰 번호 가운데자리"
                                       name="hp_num2" id="hp_num2" class="hp_num2" type="text"
                                       maxlength="4" numberonly="true">
                                <div class="form_hyphen">-</div>
                                <input title="휴대폰 번호 뒷자리"
                                       name="hp_num3" id="hp_num3" class="hp_num2" type="text"
                                       maxlength="4" numberonly="true"> <!-- //hp -->
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_space"><label for="ph">연락처</label></th>
                            <td>
                                <!-- phone --> <select name="ph_num1" id="ph" title="연락처 앞자리"
                                                       class="hp_num1">
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
                                <input title="연락처 가운데자리"
                                       name="ph_num2" id="ph_num2" class="hp_num2" type="text"
                                       maxlength="4" numberonly="true">
                                <div class="form_hyphen">-</div>
                                <input title="연락처 뒷자리"
                                       name="ph_num3" id="ph_num3" class="hp_num2" type="text"
                                       maxlength="4" numberonly="true"> <!-- //phone -->
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_space"><label for="orderr">배송
                                메세지</label></th>
                            <td>
                                <div class="input_sumtxt">
                                    <div class="input_sumtxt_box">
                                        <!-- input -->
                                        <input onkeyup="chkword('omessage','omessage_text_length',20);"
                                               id="omessage" name="deliveryRequestContents"
                                               type="text" value="" title="배송 메세지"
                                               maxlength="20">
                                        <!-- onclick="documents.getElementByClassName('delivery').focus()" -->
                                        <!-- //input --><!-- autocomplete="off" -->
                                        <div class="delivery_comt" style="display: none;">
                                            <ul>
                                                <li><a href="javascript:void(0);" name="deliveryrequestmessages"
                                                       data-readonly="readonly"
                                                       value="배송 전 연락 바랍니다"> 배송 전 연락 바랍니다</a></li>
                                                <li style="background: rgb(248, 248, 248);"><a
                                                        href="javascript:void(0);" name="deliveryrequestmessages"
                                                        data-readonly="readonly"
                                                        value="부재 시 문 앞에 놓아주세요"> 부재 시 문 앞에
                                                    놓아주세요</a></li>
                                                <li><a href="javascript:void(0);" name="deliveryrequestmessages"
                                                       data-readonly="readonly"
                                                       value="부재 시 경비실에 맡겨주세요"> 부재 시 경비실에
                                                    맡겨주세요</a></li>
                                                <li style="background: rgb(248, 248, 248);"><a
                                                        href="javascript:void(0);" name="deliveryrequestmessages"
                                                        data-readonly="readonly"
                                                        value="빠른 배송 부탁드립니다"> 빠른 배송 부탁드립니다</a></li>
                                                <li><a href="javascript:void(0);" name="deliveryrequestmessages"
                                                       data-readonly="readonly"
                                                       value="부재 시 핸드폰으로 연락바랍니다"> 부재 시
                                                    핸드폰으로 연락바랍니다</a></li>
                                                <li style="background: rgb(248, 248, 248);"><a
                                                        href="javascript:void(0);" name="deliveryrequestmessages"
                                                        data-readonly="write"
                                                        value="직접입력"> 직접입력</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div>
                                        <span id="omessage_text_length">0</span> <span>/20자</span>
                                    </div>
                                </div>
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
                    <h4 class="float_left">쿠폰 및 혜택 적용</h4>
                    <p class="guide_comment">쿠폰을 적용하셔야 할인 혜택이 가능합니다.</p>
                </div>

                <div class="tblwrap">
                    <table class="tbl_wtype1">
                        <colgroup>
                            <col style="width: 140px">
                            <col>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row" class="th_space">쿠폰 및 혜택<br>선택
                            </th>
                            <td>

                                <div class="vvip_td_wrap" id="select_voucher">
                                    <div class="coupon_select_wrap" style="margin-top: 15px">
                                        <input name="voucherCode" id="couponCode" value=""
                                               title="쿠폰코드 직접입력" placeholder="쿠폰코드 직접입력" type="text"
                                               class="input">
                                        <p>또는</p>
                                        <select title="쿠폰을 선택해 주세요." id="selectVoucher"
                                                style="width: 190px;">
                                            <option value="">쿠폰을 선택해 주세요.</option>
                                            <c:forEach items="${couponList}" var="coupon">
                                                <option value="${coupon.ccode}">${coupon.cname}</option>
                                            </c:forEach>
                                        </select>
                                        <div class="btnwrap">
                                            <a href="#;" id="btnApply"
                                               class="btn add_s min_auto" onclick="couponApply();">
                                                적용</a> <a href="#;" style="display: none"
                                                          id="btnCancel" class="btn dis_s min_auto"
                                                          onclick="couponCancel();"> 적용취소</a>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div class="float_right"
                     style="position: absolute; left: 680px; top: 0px;">
                    <!--final payment sum box-->
                    <div class="sum_box">
                        <div>
                            <p class="tlt">최종 결제 금액</p>
                            <hr>
                            <dl class="clearfix">
                                <dt class="sub_total190816">상품 합계</dt>
                                <c:choose>
                                    <c:when test="${rafflePrice != null}">
                                        <dd class="sub_total190816" id="sub_sumprice">
                                            ₩${rafflePrice}
                                            <input type="hidden" id="subsumprice"
                                                   value="${rafflePrice}"/>
                                        </dd>
                                    </c:when>
                                    <c:otherwise>
                                        <dd class="sub_total190816" id="sub_sumprice">
                                            ₩${realTotalPrice}
                                            <input type="hidden" id="subsumprice"
                                                   value="${realTotalPrice}"/>
                                        </dd>
                                    </c:otherwise>
                                </c:choose>

                                <dt id="totalDiscount" style="display:none;">프로모션/쿠폰 할인 금액</dt>
                                <dd id="totalDiscountval" style="display:none;">- ₩</dd>
                                <dt class="delch_wrap190816">
                                    <p class="tlt_ship190816">배송비</p>
                                    <!--delivery charge layer popup-->
                                    <div class="delch_box190816" style="display: none;">
                                        <span class="arr">위치아이콘</span>
                                        <ul class="bul_sty01_li">
                                            <li>쿠폰/바우처 할인금액 및 한섬마일리지/H.Point 사용을 제외한 실 결제금액 기준 <strong>3만원
                                                미만 결제 시 2,500원 배송비가 부과</strong>됩니다. (3만원 이상 구매 시 무료배송)
                                            </li>
                                            <li>도서산간 지역은 배송비가 추가 될 수 있습니다.</li>
                                            <li>한섬마일리지, H.Point, e-money로 배송비 결제가 불가합니다.</li>
                                        </ul>
                                    </div>
                                </dt>
                                <dd id="deliveryCost">₩ 0</dd>
                            </dl>
                        </div>

                        <div class="total">
                            <dl class="clearfix">
                                <dt>합계</dt>
                                <c:choose>
                                    <c:when test="${rafflePrice!=null}">
                                        <dd id="totalPrice">₩${rafflePrice}</dd>
                                        <input type="hidden" value="${rafflePrice}" id ="inputTotalPrice">
                                    </c:when>
                                    <c:otherwise>
                                        <dd id="totalPrice">₩${realTotalPrice}</dd>
                                        <input type="hidden" value="${realTotalPrice}" id ="inputTotalPrice">
                                    </c:otherwise>
                                </c:choose>
                            </dl>
                        </div>
                        <input type="hidden" name="total" id="total" value="450000.0">
                        <input type="hidden" name="cartDeliveryCost" id="cartDeliveryCost"
                               value="0.0"> <input type="hidden" name="voucherRateCheck"
                                                   id="voucherRateCheck" value=""> <input type="hidden"
                                                                                          id="customDueAmount"
                                                                                          value="0.0">
                    </div>
                    <!--//final payment sum box-->
                    <!--point & agreement box-->
                    <div class="p_a_box">
                        <div class="agree">
                            <input type="checkbox" id="agree"><label for="agree"
                                                                     class="tlt">[필수] 구매자 동의 </label>
                            <p class="txt">
                                주문할 상품의 상품명, 가격, 배송정보 등<br> 판매조건을 확인하였으며, 구매진행에 동의합니다.<br>
                                (전자상거래법 제8조 2항)<br>
                                <br> 기존 마이너스 한섬마일리지를 보유하고 있는 고객은 한섬마일리지가 차감되어 적립되는 것에
                                동의합니다. 적립 예정 한섬마일리지가 상이할 수 있습니다.

                            </p>
                        </div>
                        <!-- 20220905 our legacy 개인정보 제3자 제공 추가. -->
                    </div>
                    <!--//point & agreement box-->
                    <span id="doOrderBtn"> <a href="#;" class="btn gray "
                                              onclick="doOrder();"> 결제하기</a>
               </span>
                </div>
                <!--//orderwrap right-->
            </div>
            <!--//orderwrap-->
        </div>
        <!--//sub_container-->

        <div>
            <input type="hidden" name="CSRFToken"
                   value="77b0e71f-1c68-403d-8ba3-1c8b76071cce">
        </div>


        <!--layer pop : password -->
        <div class="popwrap w_type_4" id="popwrap2" style="display: none;">
            <!-- Title1 -->
            <div class="pop_tltwrap2">
                <h3>비밀번호 재확인</h3>
                <p class="txt">
                    고객님의 소중한 한섬마일리지/기프트카드를 보호하기 위하여 비밀번호를 재확인합니다.<br> 로그인 비밀번호를 입력해
                    주시기 바랍니다.
                </p>
            </div>
            <!-- //Title1 -->
            <div class="pop_cnt ">
                <div class="tblwrap">
                    <form id="userInfoForm" action="http://www.thehandsome.com/ko/checkout/ordersheet"
                          method="post">
                        <input id="uid" name="uid" type="hidden" value="gary3545">
                        <input id="gubun" name="gubun" type="hidden" value=""> <input
                            id="pnt" name="pnt" type="hidden" value="">
                        <table class="tbl_wtype1">
                            <caption>제목입력</caption>
                            <colgroup>
                                <col style="width: 100px">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row"><label for="pw">비밀번호</label></th>
                                <!-- <td><input id="pw" name="pw" type="password" value=""
                                    title="비밀번호 입력" style="width: 150px;"
                                    onkeydown="if(event.keyCode==13){this.blur();checkPassword();return false;}">
                                    <span class="guide_comment" id="pwMsg"></span></td> -->
                            </tr>
                            </tbody>
                        </table>
                        <div>
                            <input type="hidden" name="CSRFToken"
                                   value="77b0e71f-1c68-403d-8ba3-1c8b76071cce">
                        </div>
                    </form>
                </div>
                <div class="btnwrap">
                    <input type="button" class="btn wt_s" value="취소"
                           onclick="$('.btn_close').click();"> <input type="button"
                                                                      class="btn gray_s mr0" value="확인"
                                                                      onclick="checkPassword();">
                </div>
            </div>
            <!-- btn_close -->
            <a href="#;" class="btn_close"><img
                    src="/_ui/desktop/common/images/popup/ico_close.png" alt="닫기"></a>
            <!-- //btn_close -->
        </div>
        <!--//layer pop-->


        <!--layer pop : h.point -->
        <div class="popwrap w_type_10" id="popwrap3" style="display: none;">
            <!-- Title1 -->
            <div class="pop_tltwrap2">
                <h3>휴대폰 인증</h3>
            </div>
            <!-- //Title1 -->
            <div class="pop_cnt">
                <form id="hpointForm" action="http://www.thehandsome.com/ko/checkout/ordersheet" method="post">
                    <input id="certNo" name="certNo" type="hidden" value="">
                    <fieldset>
                        <legend>휴대폰인증</legend>
                        <div class="phoneCerti">
                            <p class="txt">
                                H.Point 10만 포인트 이상 사용 시에는 <br> 고객님의 휴대폰으로 인증이 필요합니다.<br>
                                SMS 발송 후 3분 이내 인증번호 6자리를 입력해주시기 바랍니다.
                            </p>
                            <div class="btnArea">
                                <p class="phoneNum">010-2366-5058</p>
                                <input type="button" class="btn add_s" value="인증번호발송"
                                       style="padding: 6px 13px 10px; margin: 0" id="startTimer"
                                       onclick="hpointAuthHandphone();">
                            </div>
                            <div class="inputArea">
                                <label for="codeInput">인증번호</label><input type="text"
                                                                          id="codeInput">
                                <p class="time">
                                    남은시간 <span id="counter">03:00초</span>
                                </p>
                            </div>
                        </div>
                        <!-- <div class="btnwrap">
                            <input type="button" class="btn wt" value="취소"
                                onclick="$('.btn_close').click();" id="stopTimer"> <input
                                type="button" class="btn gray" value="확인" id="stopTimer"
                                onclick="checkHPassword();">
                        </div> -->
                    </fieldset>
                    <div>
                        <input type="hidden" name="CSRFToken"
                               value="77b0e71f-1c68-403d-8ba3-1c8b76071cce">
                    </div>
                </form>
            </div>
            <!-- btn_close -->
            <a href="#" class="btn_close"><img
                    src="/_ui/desktop/common/images/popup/ico_close.png" alt="닫기"></a>
            <!-- //btn_close -->
        </div>

    </div>
    <div id="payinfo">
        <form id="PAY_FORM" method="post"></form>
    </div>
    <form id="orderUserInfo" action="/order/ordersuccess" method="POST">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="hidden" name="oid" value="">
        <input type="hidden" name="rafflePrice" value="${rafflePrice}">
        <input type="hidden" name="ccode" value="">
    </form>

</div>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

    //기존 배송지 정보를 입력한다.
    function f_customerAddress() {
        $("#zipcode").val("${member.mzipcode}");
        $("#address1").val("${member.maddress1}");
        $("#address2").val("${member.maddress2}");
        $("#receiver").val("${member.mname}");
        let arr = new Array();
        arr[0] = "${member.mtel}".substring(0, 3);
        arr[1] = "${member.mtel}".substring(3, 7);
        arr[2] = "${member.mtel}".substring(7, 11);
        console.log(arr[0]);
        $("select[id='hp']").val(arr[0]);
        $("#hp_num2").val(arr[1]);
        $("#hp_num3").val(arr[2]);
        $("select[id='ph']").val("");
        $("#ph_num2").val("");
        $("#ph_num3").val("");
        $("#omessage").val("");
    }

    //배송지 정보를 초기화
    function resetAddress() {
        $("#zipcode").val("");
        $("#address1").val("");
        $("#address2").val("");
        $("#receiver").val("");
        $("select[id='hp']").val("");
        $("#hp_num2").val("");
        $("#hp_num3").val("");
        $("select[id='ph']").val("");
        $("#ph_num2").val("");
        $("#ph_num3").val("");
        $("#omessage").val("");
    }

    function showconfirmOrder(){
        $("#confirmOrder").show();
        $(".layerArea").show();
    }
    function confirmOrderClose(){
        $("#confirmOrder").hide();
        $(".layerArea").hide();
    }
    function clickcfBtn(){
        $("#orderUserInfo").submit();
    }

    //입력한 값들을 전송
    function doOrder() {
        //입력 요소에 대해 값들을 저장한다.
        var date = new Date();
        var year = date.getFullYear().toString();
        var month = date.getMonth() + 1;
        month = month < 10 ? '0' + month.toString() : month.toString();
        var day = date.getDate();
        day = day < 10 ? '0' + day.toString() : day.toString();
        var hour = date.getHours();
        hour = hour < 10 ? '0' + hour.toString() : hour.toString();
        var minites = date.getMinutes();
        minites = minites < 10 ? '0' + minites.toString() : minites.toString();
        var seconds = date.getSeconds();
        seconds = seconds < 10 ? '0' + seconds.toString() : seconds.toString();

        const ccode = $('#couponCode').val();


        let oid = "${member.mid}" + "_" + year + month + day + hour + minites + seconds;
        let ozipcode = parseInt($("#zipcode").val());
        let oaddress1 = $("#address1").val();
        let oaddress2 = $("#address2").val();
        let oreceiver = $("#receiver").val();
        let hp_num1 = $("select[id='hp']").val();
        let hp_num2 = $("#hp_num2").val();
        let hp_num3 = $("#hp_num3").val();
        let ph_num1 = $("select[id='ph']").val();
        let ph_num2 = $("#ph_num2").val();
        let ph_num3 = $("#ph_num3").val();
        let omessage = $("#omessage").val();
        let strpayment = "inicis";
        let omilege = parseInt("${realMilege}");
        let odiscounted = 0;
        let ousedcoupondetail = "";

        let oprice = $("#inputTotalPrice").val();
        console.log("1. ############# oprice" + oprice);

        if (num > 1) {
            orderName = orderName + "외" + (num - 1) + "건";
        }
        console.log(orderName);
        //해당하는 값들에 대한 공백여부를 확인한다.
        if (oaddress1 == "" || oaddress2 == "") {
            console.log("주소");
            $('.layerArea').show();
            $('#popup').show();
            $("#alertPopuptxt").text("주소를 입력해주세요!");
            return;
        } else if (oreceiver == "") {
            $('.layerArea').show();
            $('#popup').show();
            $("#alertPopuptxt").text("수령인을 입력해주세요!");
            return;
        } else if (hp_num2 == "" || hp_num3 == "") {
            $('.layerArea').show();
            $('#popup').show();
            $("#alertPopuptxt").text("휴대폰 번호를 입력해주세요!");
            return;
        } else if (!($('#agree').is(":checked"))) {
            $('.layerArea').show();
            $('#popup').show();
            $('#alertPopuptxt').text("구매자 동의 항목을 체크하여 주세요.");
            return;
        }

        //coupon 값이 빈값이 아니라면 값을 넣는다.
        if ($("#couponCode").val() == "") {
            odiscounted = "";
        } else {
            ousedcoupondetail = $("#couponCode").val();
            let discount = parseInt($("#selectVoucher option:checked").text().substring(1, 3));
            console.log(discount);
            let realTotalPrice = "${realTotalPrice}";
            let parseIntTotalPrice = parseInt(realTotalPrice);
            odiscounted = parseIntTotalPrice * (discount / 100);
        }

        var otel = hp_num1 + "-" + hp_num2 + "-" + hp_num3;
        var ocal = "";

        if (ph_num2 == "" || ph_num3 == "") {
            ocal = ""
        } else {
            ocal = ph_num1 + "-" + ph_num2 + "-" + ph_num3;
        }

        const inputprice = document.getElementById('totalPrice').innerText;
        const lastprice = inputprice.substring(1);
        const number = lastprice.replace(/,/gi, ""); //최종가격
      
      console.log(number);
        
        //결제 코드 받아오기
        var IMP = window.IMP;
        IMP.init("imp07855365");
        //결제 부분 시작
        IMP.request_pay({
            pg: 'html5_inicis',//이니시스 결제 시스템을 하기 위한 부분 고정시켜야합니다
            pay_method: 'card',
            merchant_uid: oid,  //주문 아이템 oid값
            name: orderName, //주문한거 이름
            amount: 100, //최종 가격
            buyer_email: '${member.memail}', //산사람 이메일
            buyer_name: '${member.mname}', //산사람 이름
            buyer_tel: otel,//산사람 번호
            buyer_addr: oaddress1,//산사람 주소
            buyer_postcode: ozipcode //산사람 주소코드

        }, function (rsp) { // callback
            if (rsp.success) {

                //결제 성공에 대한 부분
                console.log(rsp);
                let imp_uid = rsp.imp_uid;
                //map 객체 생성
                let ordermember = new Map();
                ordermember.set('oid', oid);
                ordermember.set('mid', '${member.mid}');
                ordermember.set('ozipcode', ozipcode);
                ordermember.set('oaddress1', oaddress1);
                ordermember.set('oaddress2', oaddress2);
                ordermember.set('otel', otel);
                ordermember.set('ocal', ocal);
                ordermember.set('oreceiver', oreceiver);
                ordermember.set('omessage', omessage);
                ordermember.set('ousermilege', omilege);
                ordermember.set('ousedcoupondetail', ousedcoupondetail);
                ordermember.set('odiscounted', odiscounted);
                ordermember.set('strpayment', strpayment);
                ordermember.set('imp_uid', imp_uid);
                //장바구니 선택으로 인해서 주문이 됬는지 확인
                ordermember.set('tocart', '${tocart}');
                ordermember.set('ccode', ccode);
                ordermember.set('oprice', oprice);

                //주문한 상품들의 리스트를 담을 리스트 객체 생성
                let orderproductlist = [];

                //주문 상품의 상세 정보를 담기 위한 index 값
                let checknum = 0;


                //상품에 대한 정보가 있는 태그를 반복하고 각각 상품에 대한 정보를 map으로 담는다.
                $("tr[name='entryOrderPageProductInfo']").each(function (index, item) {
                    let orderproduct = new Map();
                    orderproduct.set("pid", pids[index]);
                    orderproduct.set("ccolorcode", ccolorcodes[index]);
                    orderproduct.set("ssize", ssizes[index]);
                    orderproduct.set("oamount", oamounts[index]);
                    orderproduct.set("oprice", oprice[index]);
                    orderproduct.set("totalprice", totalprice[index]);

                    //map으로 담은 정보들을 상품들의 리스트에 추가한다.
                    orderproductlist.push(Object.fromEntries(orderproduct));
                    //index 값 증가
                    checknum++;
                });

                //상품 리스트를 객체의 속성 이름과 같은 이름으로 지정하고 저장한다.
                ordermember.set("orders", orderproductlist);

                //map 직렬화
                let serializedMap = JSON.stringify(Object.fromEntries(ordermember));

                //스프링 보안 설정 CSRF 토큰값
                let csrfHeaderName = "${_csrf.headerName}";
                let csrfTokenValue = "${_csrf.token}";


                //주문상품을 등록한다.
                $.ajax({
                    url: '/order/orderexec',
                    type: 'POST',
                    data: serializedMap,
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                    },
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        console.log(data);
                        $("input[name=oid]").val(oid);
                        $("input[name=ccode]").val(ccode);
                        $("input[name=rafflePrice]").val();
                        $("input[id=inputTotalPrice]").val();

                        showconfirmOrder();
                    },
                    error: function (xhr, status, error) {
                        swal.fire({
                            icon:'error',
                            text:'주문 실패 ajax쪽 오류',
                        });
                    }
                });
            } else {
                //결제 실패에 대한 부분
                console.log(rsp);
            }
        });

    }

    //값을 입력하라는 팝업창을 닫는 함수
    function AlertClose() {
        $("#popup").hide();
        $(".layerArea").hide();
    }

    function showaddresslist() {
        $("#addresspopup").show();
        $(".layerArea").show();

    }

    function AddressListClose() {
        $("#addresspopup").hide();
        $('.layerArea').hide();
    }

    function chkword(targetID, lengthID, maxLength) {
        var strValue = $('#' + targetID).val();
        var strLen = strValue.length;
        var maxByte = parseInt(maxLength);
        var str2 = "";

        if (strLen > maxByte) {
            console.log("over");
            $('.layerArea').show();
            $('#alertPopuptxt').text(maxByte + "자를 초과 입력 할 수 없습니다.");
            str2 = strValue.substr(0, maxByte);
            $('#' + targetID).val(str2);
            strLen = str2.length;
        }

        $('#' + lengthID).text(strLen);
    }

    //쿠폰 적용
    function couponApply() { 
        if(${rafflePrice!=null}){
            Swal.fire({
                icon:'warning',
                text:'쿠폰사용이 불가능합니다.',
            });
        } else {
            $("#couponCode").val($("#selectVoucher option:checked").val());
            console.log($('#coupon_index').attr('selected', 'selected'));
            if ($("#couponCode").val() !== "") {
                $("#totalDiscount").show();
                $("#totalDiscountval").show();
                let realTotalPrice = "${realTotalPrice}";
                let parseIntTotalPrice = parseInt(realTotalPrice);
                let salePrice = parseIntTotalPrice * 0.1;
                let StringTotalPrice = (parseIntTotalPrice - salePrice).toString();
                $("#totalDiscountval").text("-₩" + priceComma(salePrice.toString()));
                let StringrealTotalPrice = (StringTotalPrice).toString();
                console.log(StringrealTotalPrice);
                $("#totalPrice").val(parseInt(StringrealTotalPrice));
                $("#totalPrice").text("₩" + priceComma(StringrealTotalPrice));
                $("#btnApply").hide();
                $("#btnApply").attr("class", "btn dis_s min_auto")
                $("#btnCancel").show();
                $("#btnCancel").attr("class", "btn add_s min_auto");
                $("#inputTotalPrice").attr("value", StringrealTotalPrice);
            } else {
                Swal.fire({
                    icon:'warning',
                    text:'쿠폰을 선택해주세요.',
                });
            }
        }

    }

    //쿠폰 적용 취소
    function couponCancel() {
        let realTotalPrice = "${realTotalPrice}";
        let parseIntTotalPrice = parseInt(realTotalPrice);
        let StringTotalPrice = (parseIntTotalPrice).toString();
        $("#totalDiscount").hide();
        $("#totalDiscountval").hide();
        $("#totalPrice").val(parseInt(StringTotalPrice));
        $("#totalPrice").text("₩" + priceComma(StringTotalPrice));
        $("#btnApply").show();
        $("#btnApply").attr("class", "btn add_s min_auto")
        $("#btnCancel").hide();
        $("#btnCancel").attr("class", "btn dis_s min_auto");
        $("#inputTotalPrice").attr("value", ${realTotalPrice});
    }

    //가격에 ,를 적용
    function priceComma(price) {
        return price.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    }

    //배송관리 적용
    function selectAddress() {
        if ($("input:radio[name='sel_address']").is(":checked")) {
            $("#zipcode").val($("input[name='addr1']").val());
            $("#address1").val($("input[name='addr2']").val());
            $("#address2").val($("input[name='addr3']").val());
            $("#receiver").val($("input[name='aname']").val());
            let tel = $("input[name='toname']").val();

            let arr = tel.split("-");
            $('#hp').val(arr[0]);
            $('#hp_num2').val(arr[1]);
            $('#hp_num3').val(arr[2]);

            if ($("input[name='tophone']").val() == "") {
                $("#ph").val("");
                $("#ph_num2").val("");
                $("#ph_num3").val("");
            } else {
                let cal = $("input[name='tophone']").val();
                let arr1 = cal.split("-");
                $("#ph").val(arr1[0]);
                $("#ph_num2").val(arr1[1]);
                $("#ph_num3").val(arr1[2]);
            }
        }
        $("#addresspopup").hide();
        $(".layerArea").hide();
    }


    $(document).ready(
        function () {

            console.log("function");
            //sumprice랑 subprice totalPrice 값을 세자리 수마다 ,를 찍고 출력시킨다.
            const sub_sumprice = priceComma($("#subsumprice").val());

            //콤마찍은 숫자를 가격, 총합계 태그에 뿌림
            $(".item_price").each(function (index, item) {
                let price = '₩' + priceComma($(this).text());
                $(this).text(price)
            });
            $("#sub_sumprice").text("₩" + sub_sumprice);
            $("#totalPrice").text("₩" + sub_sumprice);
            const milege_price = '${realMilege}'.replace(
                /\B(?=(\d{3})+(?!\d))/g, ',');
            const Hpoint_price = '${realTotalPoint}'.replace(
                /\B(?=(\d{3})+(?!\d))/g, ',');

            //마일리지랑  point부분을  ₩ 마일리지 가격이랑  ₩ point 가격으로 바꾼다.
            $("#txtAccumulationPoint").text("한섬마일리지 " + milege_price + " M");
            $("#txtAccumulationHPoint").text("H.Point " + Hpoint_price + "P");

            //배송 메시지를 입력칸을 클릭하게 되면 배송메시지란이 담긴 div 태그를 가져온다.
            $("#omessage").focus(function () {
                console.log("omessage");
                $('.delivery_comt').show();
            });

            //배송 메시지를 중 클릭하게 되면 그 메시지로 바뀌고 직접 입력을 하게 되면 직접 입력이 가능하다.
            $("a[name=deliveryrequestmessages]").click(function () {
                $('#omessage').val($(this).attr('value'));
                $('.delivery_comt').hide();
                if ($(this).attr('value') === '직접입력') {
                    $('#omessage').val("");
                    $("#omessage").focus();
                    $('.delivery_comt').hide();
                }

            });
        });

    // 주소 api
    window.onload = function () {
        document.getElementById("addrSearchBtn").addEventListener("click", function () { //주소입력칸을 클릭하면
            //카카오 지도 발생
            new daum.Postcode({
                oncomplete: function (data) { //선택시 입력값 세팅
                    document.getElementById("zipcode").value = data.zonecode;
                    document.querySelector("input[name='address1']").value = data.address; // 주소 넣기
                    // console.log(document.getElementById("regPostNo").value);
                    document.querySelector("input[name='address2']").focus(); //상세입력 포커싱
                }
            }).open();
        });
    }
</script>
<%@include file="/WEB-INF/views/common/footer.jspf" %>