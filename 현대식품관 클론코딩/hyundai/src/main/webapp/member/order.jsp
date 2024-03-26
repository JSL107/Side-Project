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
    <!-- ������� ���� �±�-->
    <meta charset="UTF-8">
    <title>�ֹ��ϱ�</title>
    <link rel="shortcut icon" type="image/x-icon" href="../UIUX/images/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../UIUX/css/css-library.min.css?ver=2">
    <link rel="stylesheet" type="text/css" href="../UIUX/css/common.min.css?ver=2">
    <%--data aos css , script ����--%>
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

    <!-- H.point pay ���� CSS ;: 2022-01-05 �念�� -->
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

    <!-- ��ǰlist -->
    <div id="orderItemDiv"><span id="orderItemDiv_S02011022802"></span></div>

    <!-- �ֹ� -->
    <div id="orderDataDiv"></div>

    <!-- ��ǰ������ -->
    <div id="orderItemShippingDataDiv"><span id="0000000001"></span></div>

    <!-- ��ۺ� -->
    <div id="dlvDataDiv"></div>

    <!-- �������� -->
    <div id="stlmDataDiv"></div>


    <!-- contents// -->
    <div id="contents">
        <div class="innercon">
            <h2>�ֹ��ϱ�</h2>
            <form action="TohomeServlet?command=order_action" method="post">
            	<input type="hidden" name="basketList" value=${basketList}/>				
                <div class="conarea">
                    <section class="leftarea">

                        <!-- �ֹ� �� ����// �ֹ��ڸ� ������ ���� (2022.09.05)
						<fieldset class="orderer-field toggle active">
							<legend class="tit toggle-ti">�ֹ� �� ����</legend>

							<div class="cont" id="memberInfo">
								<label class="form-default horizon form-entry">
									<strong>�ֹ� ����<span class="need">*<span class="hide">�ʼ�</span></span></strong>
									<input type="text" name="custNm" class="big" title="�̸� �Է�" placeholder="�̸��Է�" maxlength="20" value="���ؼ�"><button type="button" class="btn-del" tabindex="-1">����</button>
								</label>

							</div>
						</fieldset>-->


                        <div id="orderShippingSlitmDiv">
                            <!-- �ֹ���ǰ �Ǽ� �� ���� ��� -->
                            <fieldset class="delivery-field toggle active" id="order_dstn_seq_0000000001"
                                      data-dstn_seq="0000000001">

                                <legend class="tit toggle-ti" onClick="changeClass()">����� ����</legend>

                                <div class="cont" style="display: block;">
                                
                                    <div class="addrinfo">
                                        <strong>����� ����</strong>
                                        <span>
                                            <%--address table���� �� ��������--%>
                                            <strong>${addressDTO.user_name}</strong>
                                            ${addressDTO.mobile_num}
                                            </span>
                                        <p class="addr">${addressDTO.main_address}</p>
                                    </div>
                                </div>
                            </fieldset>

                            <%-- ȸ�� ���, ���η� ��� �κ� --%>
                            <fieldset class="day-field toggle active">
                                <legend class="tit toggle-ti">ȸ����ް� ���η�</legend>
                                <%--ȸ����ް� ���η� �κ� DB���� ��������--%>
                                <div class="cont" style="">
                                    <label><span>������ ȸ�� ����� : ${userGrade} �Դϴ�.</span></label>
                                    <label><span>���η��� : ${currentUserDTO.sale_rate}% �Դϴ�.</span></label>
                                </div>
                            </fieldset>
                            <!-- ȸ�� ���, ���η� ��� �κ�-->

                            <fieldset class="product-field toggle active">
                                <legend class="tit toggle-ti">�ֹ���ǰ</legend>
                                <div class="cont" style="">
                                    <div>
                                        <strong class="ti">�ù���</strong>
                                        <%--�߰����� �κ� : ���� ������ ������--%>
                                        <p class="txt-notice">
                                        </p>

                                        <%--�����ϰ��� �ϴ� ��ǰ DB���� ��������--%>
                                        <ul class="product-list nothumb">
                                        	<c:forEach items="${basketList}"  var="basketDTO">
                                        	<input type="hidden" name="prod_no" value="${basketDTO.prod_no}"/>
                                        	<input type="hidden" name="prod_quantity" value="${basketDTO.prod_quantity}"/>
                                            <li data-ord_prc="${basketDTO.price}" data-ord_dc_prc="${basketDTO.price * (100-currentUserDTO.sale_rate)*0.01}">
                                                <strong class="txt-ti">
                                                    ${basketDTO.prod_name}
                                                </strong>
                                                <span class="txt-num"><strong><em>${basketDTO.prod_quantity}</em>��</strong></span>
                                            </li>
                                            <c:set var= "total_price" value="${total_price + (basketDTO.price * basketDTO.prod_quantity)}"/>
                                            </c:forEach>
                                            <c:forEach items="${basketDetailsNums}"  var="bdns">
                                            	 <input type="hidden" name="basketDetailsNums" value="${bdns}"/>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <!-- //�ù��� -->
                                </div>
                            </fieldset>
                        </div>

                        <!-- ��������// -->
							<fieldset class="pay-field">
								<legend class="tit">��������</legend>
								<div class="payment other active">
									<ul>
										<li><label><input type="radio"
												name="payWayGbcdGc" value="pay1" data-name="�����ȭ��ī��"
												onclick="fn.addClass('.pay-own-card');fn.removeClass('.pay-card'); fn.removeClass('.pay-kbpay');"><span
												class="card">�����ȭ��ī��</span></label></li>
										<li><label><input type="radio"
												name="payWayGbcdGc" value="pay2" data-name="�ſ�ī��"
												onclick="fn.removeClass('.pay-own-card');fn.addClass('.pay-card');fn.removeClass('.pay-kbpay');"><span
												class="card">�ſ�ī��</span></label></li>
										<li><label><input type="radio"
												name="payWayGbcdGc" value="pay3" data-name="�ǽð� ������ü"
												onclick="fn.removeClass('.pay-own-card');fn.removeClass('.pay-card');fn.removeClass('.pay-kbpay');"><span
												class="bank">�ǽð� ������ü</span></label></li>
									</ul>
									<p class="benefit" id="paymentDcInfo" style="display: none;"></p>
									</div>
							</fieldset>
							<!-- //�������� -->
                    </section>

                    <section class="rightarea"
                             style="position: static; inset: auto; float: right; margin-bottom: 48px;">

                        <!-- ��������// -->
                        <fieldset class="price-field">
                            <legend class="hide">��������</legend>
                            <dl class="orderprice">
                                <dt>�� ��ǰ�ݾ�</dt>
                                <dd><strong><em id="smrySumItemAmt"><fmt:formatNumber type="number" maxFractionDigits="3" value="${total_price}"/></em>��</strong></dd>
                            </dl>
                            <div class="toggle">
                                <dl class="minus toggle-ti">
                                    <dt>�� ���αݾ�</dt>
                                    <fmt:parseNumber var="discount_price" integerOnly= "true" value= "${total_price * (currentUserDTO.sale_rate) * 0.01}"/>
                                    <dd><strong><em id="smrySumDcAmt"><fmt:formatNumber type="number" maxFractionDigits="3" value="${discount_price}"/></em>��</strong></dd>
                                </dl>
                                <div class="cont infotxt">
                                    <ul>
                                        <li>��ǰ����<span><em id="itemDc">-15,000</em>��</span></li>
                                    </ul>
                                </div>
                            </div>

                            <dl class="total">
                                <dt>�� ��������ݾ�</dt>
                                <dd><strong><em id="smryExpSumAmt"><fmt:formatNumber type="number" maxFractionDigits="3" value="${total_price - discount_price}"/></em>��</strong></dd>
                            </dl>
                        </fieldset>
                        <!-- //�������� -->

                        <button type="submit" class="btn fill big orange btn-order" onclick="settlement();"><span
                                class="txt-price">�� <em id="expSumAmt"><fmt:formatNumber type="number" maxFractionDigits="3" value="${total_price - discount_price}"/></em>��</span><strong>�����ϱ�</strong></button>
                    </section>
                </div>
            </form>
        </div>
    </div>

    <!-- ��������������� -->

    <!-- �������� -->

    <!-- �˾� : ����� ����// -->
    <div id="p_popShippingList" class="popup popshippinglist">
        <div class="inner">
            <button type="button" class="btn-close" onclick="fn.popupCloseId('#p_popShippingList');">�ݱ�</button>

            <header>
                <h2>����� ��� <em id="popShippingListCnt"></em></h2>
            </header>
            <div class="contents">
                <div class="scrollbox" id="shippingListDiv">
                </div>
                <div class="btns">
                    <button type="button" class="btn black" id="shippingListAdd1"
                            onclick="fnShippingList('new','subs');">����� �߰� +
                    </button>


                    <button type="button" id="shippingSelectedBtn" class="btn fill orange"
                            onclick="selectedShippingList(this);">����� ����
                    </button>


                </div>
            </div>
        </div>
    </div>
    <!-- //�˾� : ����� ���� -->

    <!-- �˾� : ����� �߰�/����// -->
    <div id="p_popShippingInput" class="popup popshippinginput">
    </div>
    <!-- //�˾� : ����� �߰�/���� -->

    <!-- �������-->

    <!-- �˾� : ��ۿ�û����// -->
    <div id="p_popRequest" class="popup poprequest">
        <div class="inner">
            <button type="button" class="btn-close" onclick="fn.popupCloseId('#p_popRequest');">�ݱ�</button>
            <header>
                <h2>��ۿ�û����</h2>
            </header>
            <div class="contents">
                <div class="request-list">
                    <ul>
                        <li>
                            <strong class="tit">�������</strong>
                            <p class="text" id="shippingDawnReqDlvMsg"></p>
                            <button type="button" class="btn small orange" onclick="openRequestDawnPopup();">����</button>
                        </li>
                        <li>
                            <strong class="tit">�ù���</strong>
                            <p class="text" id="shippingReqDlvMsg"></p>
                            <button type="button" class="btn small orange" onclick="openRequestParcelPopup();">����
                            </button>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- //�˾� : ��ۿ�û���� -->

    <!-- �˾� : ������� ��û ����// -->
    <div id="p_popRequestDawn" class="popup poprequest">
        <div class="inner">
            <button type="button" class="btn-close" onclick="fn.popupCloseId('#p_popRequestDawn');">�ݱ�</button>
            <header>
                <h2>������� ��û ����</h2>
            </header>
            <div class="contents">
                <form id="frmPopRequestDawn">
                    <input type="hidden" name="dstnSeq">
                    <input type="hidden" name="pageFlag">
                    <input type="hidden" name="reqFlag">
                    <fieldset class="form-field">
                        <legend class="tit">���Թ��<span class="need">*<span class="hide">�ʼ�</span></span></legend>
                        <ul>


                            <li>
                                <label>
                                    <input type="radio" name="cfrtdrEntmthGbcd" value="11" data-txt="���� ���� ��й�ȣ"
                                           checked="checked">
                                    <span>���� ���� ��й�ȣ</span>
                                </label>

                                <div style="display: block;">
                                    <label class="form-entry"><input type="text" id="" name="cfrtdrPwd"
                                                                     title="���� ���� ��й�ȣ" placeholder="��) #1234, 1234#"
                                                                     maxlength="30">
                                        <button type="button" class="btn-del" tabindex="-1">����</button>
                                    </label>
                                </div>

                            </li>


                            <li>
                                <label>
                                    <input type="radio" name="cfrtdrEntmthGbcd" value="13" data-txt="��������">
                                    <span>��������</span>
                                </label>

                            </li>


                            <li>
                                <label>
                                    <input type="radio" name="cfrtdrEntmthGbcd" value="70" data-txt="��Ÿ">
                                    <span>��Ÿ</span>
                                </label>

                            </li>


                        </ul>
                    </fieldset>
                    <fieldset class="form-field">
                        <legend class="tit">��۽� ��û����<span class="choice">(����)</span></legend>
                        <div>
                            <textarea title="��۽� ��û����(����) �Է�" name="dawnDlvMsgCntn" placeholder="50�� �̳� �Է�"
                                      maxlength="50"></textarea>
                        </div>
                    </fieldset>
                    <fieldset class="form-field">
                        <legend class="tit">��ۿϷ� �˸� ����<span class="need">*<span class="hide">�ʼ�</span></span></legend>
                        <div class="radio-list">

                            <label><input type="radio" name="dlvCmptNotfGbcd" value="01"
                                          checked="checked"><span>��ħ 07��</span></label>

                            <label><input type="radio" name="dlvCmptNotfGbcd" value="02"><span>�������</span></label>

                            <label><input type="radio" name="dlvCmptNotfGbcd" value="03"><span>���Űź�</span></label>

                        </div>
                        <div class="infotxt">
                            <ul>
                                <li>�ù�/�Ǹ��� ��� ��ǰ�� ��� ���� �Ϸ� �˸� �߼۵ǿ���, ���� �ٶ��ϴ�.</li>
                            </ul>
                        </div>
                    </fieldset>
                    <p class="txt">�����ǰ�� ��Ȩ�� �� �ձ��� ��� �� ��ǰȸ���� �ϱ� ����,<br>���� ���� ��й�ȣ�� ������ �� �ֵ��� ���ǰ� �ʿ��մϴ�.</p>
                    <button type="button" class="btn fill orange" onclick="saveDawnRequest();">���� �� ����</button>
                    <div class="infotxt">
                        <strong>������� �ֹ� �� �� ������ ��۵˴ϴ�.<br>�� �� ��� �Ұ� �� 1�� ���� ������ ������ ��� �� �� �ֽ��ϴ�.</strong>
                        <ul>
                            <li>ȸ��, �б�, �� �� ���� ������ �Ұ� �� ���</li>
                            <li>���������� ��Ȯ���� ���� ���</li>
                            <li>���� ȣ���� �õ��Ͽ�����, �������� ���� ���</li>
                            <li>����� ȣ���� ��û �� ���(��������� ����� ȣ�� �Ұ�)</li>
                        </ul>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- //�˾� : ������� ��û ���� -->

    <!-- �˾� : �ù��� ��û ����// -->
    <div id="p_popRequestParcel" class="popup poprequest">
        <div class="inner">
            <button type="button" class="btn-close" onclick="fn.popupCloseId('#p_popRequestParcel');">�ݱ�</button>
            <header>


                <h2>�ù��� ��û ����</h2>


            </header>
            <div class="contents">
                <form id="frmPopRequestParcel">
                    <input type="hidden" name="dstnSeq">
                    <input type="hidden" name="pageFlag">
                    <input type="hidden" name="reqFlag">
                    <fieldset class="form-field">
                        <legend class="hide">��ۿ�û���� ����</legend>
                        <ul>


                            <li>
                                <label><input type="radio" name="dlvMsgGbcd" value="40" data-txt="�� �տ� ���ּ���"><span>�� �տ� ���ּ���</span></label>

                            </li>


                            <li>
                                <label><input type="radio" name="dlvMsgGbcd" value="50"
                                              data-txt="���� �� ���ǿ� �ð��ּ���"><span>���� �� ���ǿ� �ð��ּ���</span></label>

                            </li>


                            <li>
                                <label><input type="radio" name="dlvMsgGbcd" value="60" data-txt="��� �� �����ּ���"><span>��� �� �����ּ���</span></label>

                            </li>


                            <li>
                                <label><input type="radio" name="dlvMsgGbcd" value="70"
                                              data-txt="��Ÿ"><span>��Ÿ</span></label>

                                <div>
                                    <textarea title="��Ÿ" placeholder="300�� �̳� �Է�" name="dsrvCoMsgCntn"
                                              id="req_dsrvCoMsgCntn"></textarea>
                                </div>

                            </li>


                        </ul>
                    </fieldset>
                    <br>
                    <!-- <p class="txt">�����ǰ�� ��Ȩ�� �� �ձ��� ��� �� ��ǰȸ���� �ϱ� ����,<br/>���� ���� ��й�ȣ�� ������ �� �ֵ��� ���ǰ� �ʿ��մϴ�.</p> -->


                    <button type="button" class="btn fill orange" onclick="saveParcelRequest();">����</button>


                </form>
            </div>
        </div>
    </div>
    <!-- //�˾� : �ù��� ��û ���� -->

    <!-- footer// -->
	<jsp:include page="../Common/footer.jsp"/>
    <!-- //footer -->
</div>


</body>
</html>