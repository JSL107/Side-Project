<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<head>
<meta charset="UTF-8">
<title>회원가입</title>

<script type="text/javascript"
	src="../../../resources/_ui/desktop/common/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript"
	src="../../../resources/_ui/desktop/common/js/jquery.vticker.js"></script>
</head>

<body>
	<div class="wrapper">
		<form id="memberJoinForm" method="POST">
			<input type="hidden" name="uidDuplChk" id="uidDuplChk" value=""
				title="이메일 아이디 중복" /> <input type="hidden" name="emailDuplChk"
				id="emailDuplChk" value="" title="이메일 중복" />

			<!-- bodyWrap -->
			<div id="bodyWrap">
				<!--title-->
				<h3 class="cnts_title">
					<span>회원가입</span>
				</h3>
				<!--//title-->
				<!--join step-->
				<div class="email_step">
					<ul class="clearfix">
						<li class="step01">step01 이메일인증</li>
						<li class="step02 on">step02 회원약관동의</li>
						<li class="step03">step03 회원정보 입력</li>
						<li class="step04">step04 가입완료</li>
					</ul>
				</div>
				<!--//join step-->
				<!--sub container-->
				<div class="sub_container">
					<div class="join_title">
						<p class="title">더한섬닷컴 회원가입을 환영합니다!</p>
						<p class="s_title">
							등록하신 개인정보는 외부로 유출되지 않으며 동의하지 않은 목적으로는 사용되지 않습니다.<br> <em
								class="ft_point01">만 14세 미만 어린이는 가입이 불가능</em>하며 아래 약관에 모두 동의해주셔야
							회원가입이 가능합니다.
						</p>
					</div>
					<fieldset>
						<legend>본인인증</legend>
						<div class="box_type_1 terms_agree">
							<!-- 서비스 이용약관 -->
							<div class="box">
								<div class="title_wrap clearfix">
									<h4 class="float_left">더한섬닷컴 서비스이용약관</h4>
									<div class="agree_ck float_right">
										<input type="checkbox" id="agree_ck1" name="allcheck">
										<label for="agree_ck1">전체 약관 동의</label>
									</div>
								</div>
								<div class="terms_box box_type_2">
									제1조 목적<br> <br> 이 약관은 주식회사 한섬(이하 “회사”라고 함)이 운영하는 오프라인
									매장(이하 “오프라인 매장”) 및 온라인 쇼핑몰 THEHANDSOME.COM(이하 “더한섬닷컴”)에서 제공하는
									인터넷 관련 서비스(이하 “서비스”)를 이용함에 있어 “회사”와 이용자의 권리ㆍ의무 및 책임사항을 규정함을
									목적으로 합니다. <br> <br> ※ PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그
									성질에 반하지 않는 한 이 약관을 준용합니다.<br> <br> <br> 제2조 정의<br>
									<br> 이 약관에서 사용하는 용어는 다음과 같이 정의합니다.<br> <br> ①
									“오프라인 매장”이란 “회사”가 재화 또는 용역(이하 “재화 등”)을 이용자에게 제공하기 위하여 “재화 등”을
									거래할 수 있도록 물리적 장소에 설정한 영업장을 말합니다.<br> ② "더한섬닷컴"이란 “회사”가 재화
									또는 용역(이하 “재화 등”)을 이용자에게 제공하기 위하여 컴퓨터, 모바일 등 정보통신설비를 이용하여 “재화
									등”을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 “더한섬닷컴”을 운영하는 사업자의 의미로도
									사용합니다.<br> ③ “한섬마일리지”란 “회사”의 회원으로 가입된 이용자가 “오프라인 매장”과
									“더한섬닷컴”에서 “재화 등”을 구매한 경우 “회사”가 회원약관 등에 따라 부여하는 마일리지로 구매 시
									할인수단으로 사용할 수 있는 결제수단입니다.<br> ④ “이용자”란 이 약관에 따라 “회사”가 제공하는
									“서비스”를 받는 회원 및 비회원을 말합니다.<br> ⑤ “회원”이라 함은 “회사”에 회원등록을 한
									자로서, 계속적으로 “회사”가 제공하는 “서비스”를 이용할 수 있는 자를 말합니다.<br> ⑥
									“비회원”이라 함은 회원에 가입하지 않고 “회사”가 제공하는 “서비스”를 이용하는 자를 말합니다.<br>

									⑦ “판매관리자”는 “회사”와 판매관리계약을 체결하고 “오프라인 매장”을 위탁운영하는 자를 말합니다.(본 이용약관
									하에서는 “회사”와 대리점계약을 체결하고 “오프라인 매장”을 운영하는 자도 포함하여 지칭합니다).<br>

									⑧ “생체정보"라 함은 지문ㆍ얼굴 등 개인을 식별할 수 있는 신체적 또는 행동적 특징에 관한 정보를 의미합니다.<br>

									⑨ “인증정보”란 "서비스" 절차에 이용되는 회원인증수단으로 "결제 비밀번호", "생체정보", “공인인증서” 등
									"더한섬닷컴"이 인정한 본인확인수단이 인증정보에 해당합니다.<br> <br> <br>
									제3조 약관의 명시와 개정<br> <br> ① “회사”는 이 약관의 내용과 상호, 영업소
									소재지, 대표자의 성명, 사업자등록번호, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 쉽게 알 수
									있도록 “회사”의 온라인 쇼핑몰 “더한섬닷컴” 초기 “서비스” 화면(전면)에 게시합니다. 다만, 약관의 내용은
									이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.<br> ② “회사”는 이용자가 약관에
									동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회ㆍ배송책임ㆍ환불조건 등과 같은 중요한 내용을 이용자가 이해할
									수 있도록 제시하거나 “더한섬닷컴” 내 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야
									합니다.<br> ③ “회사”는 「소비자기본법」, 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의
									규제 등에 관한 법률」, 「전자거래기본법」, 「전자서명법」, 「정보통신망 이용촉진 등에 관한 법률」 등 관련
									법령을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br> ④ “회사”가 약관을 개정할
									경우에는 적용일자 및 개정사유를 명시하여 현행 약관과 함께 “더한섬닷컴”에 그 적용일자 7일 이전부터 적용일자
									전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을
									두고 공지합니다. 이 경우 “회사”는 개정 전과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록
									표시합니다.<br> ⑤ “회사”가 약관을 개정할 경우에는 그 개정약관은 그 적용 일자 이후에 체결되는
									계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미
									계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제4항에 의한 개정약관의 공지기간 내에
									“회사”에 송신하여 “회사”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br> ⑥ 이 약관에서
									정하지 아니한 사항과 이 약관의 해석에 관하여는 「민법」, 「소비자기본법」, 「전자상거래 등에서의 소비자보호에
									관한 법률」, 「약관의 규제 등에 관한 법률」, 공정거래위원회가 정하는 「전자상거래 등에서의 소비자보호지침」 등의
									관계 법령 또는 상관례에 따릅니다.<br> <br> <br> 제4조 서비스의 제공 및
									변경<br> <br> ① “회사”가 제공하는 “서비스”는 아래와 같습니다.<br> 1.
									“재화 등”에 대한 정보 제공 및 구매계약의 체결<br> 2. 구매계약이 체결된 “재화 등”의 배송<br>
									3. “회원”에 대한 회원서비스 제공<br> 4. “회사”의 “재화 등”과 각종 프로모션 제공<br>
									5. “회사”의 “서비스”에 관한 상담 제공<br> 6. 기타 “회사”가 정하는 업무<br> ②
									"회사"는 전항의 “서비스” 전부 또는 일부를 “판매관리자”에게 위탁할 수 있습니다.<br> ③
									“회사”는 “더한섬닷컴”과 관련하여 “재화 등”의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는
									계약에 의해 제공할 “재화 등”의 내용을 변경할 수 있고, 이 경우에는 변경된 “재화 등”의 내용 및 제공일자를
									명시하여 현재의 “재화 등”의 내용을 게시한 곳에 즉시 공지합니다.<br> ④ “회사”는 제공하기로
									이용자와 계약을 체결한 “서비스”의 내용을 “재화 등”의 품절 또는 원부자재 수급 불가 등의 사유로 변경할
									경우에는 그 사유를 이용자에게 통지 가능한 방법(이메일 등)으로 즉시 통지합니다.<br> ⑤ 전항의 경우
									“회사”는 이로 인하여 이용자가 입은 손해를 배상합니다. 단, “회사”의 고의 또는 과실이 없음을 입증하는
									경우에는 그러하지 아니합니다.<br> <br> <br> 제5조 서비스의 중단<br>
									<br> ① “회사”는 “더한섬닷컴”의 경우 컴퓨터 등 정보통신설비의 보수점검ㆍ교체 및 고장, 통신의
									두절 등의 사유가 발생한 경우에는 “서비스”의 제공을 일시적으로 중단할 수 있습니다.<br> ②
									“회사”는 제1항의 사유 등 합리적인 사유 없이 “서비스”의 제공이 일시적으로 중단됨으로 인하여 이용자 또는
									제3자가 입은 손해에 대하여 배상합니다. 단 “회사”가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지
									아니합니다.<br> ③ 사업종목의 전환, 사업의 포기, 업체간의 통합 등의 이유로 “서비스”를 제공할 수
									없게 되는 경우에는 “회사”는 제8조에 정한 방법으로 이용자에게 통지하고 당초 “회사”가 제시한 조건에 따라
									소비자에게 보상합니다. 다만, “회사”가 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지를 “오프라인
									매장” 또는 “더한섬 닷컴”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.<br>
									<br> <br> 제6조 회원가입<br> <br> ① 이용자는 “회사”가 정한
									가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.<br>
									② “회사”는 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로
									등록합니다.<br> 1. 가입신청자가 이 약관 제7조 제3항에 의하여 이전에 회원자격을 상실한 적이 있는
									경우, 다만 제7조 제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “회사”의 회원 재가입 승낙을 얻은
									경우에는 예외로 한다.<br> 2. 등록 내용에 허위, 기재누락, 오기가 있는 경우<br> 3.
									기타 회원으로 등록하는 것이 “회사”의 기술상, 영업정책상 현저히 지장이 있다고 판단되는 경우<br> ③
									회원가입계약의 성립시기는 “회사”의 승낙이 회원에게 도달한 시점으로 합니다.<br> ④ 회원은 회원가입
									시, 등록한 사항에 변경이 있는 경우, 즉시 전자우편 또는 기타 방법으로 “회사”에 그 변경사항을 알려야 합니다.<br>
									<br> <br> 제7조 회원탈퇴 및 자격상실<br> <br> ① 회원은
									“회사”에 언제든지 탈퇴를 요청할 수 있으며 “회사”는 즉시 회원탈퇴를 처리합니다.<br> ② 회원이
									다음 각 호의 사유에 해당하는 경우, “회사”는 회원 자격을 제한 및 정지시킬 수 있습니다.<br> 1.
									가입 신청 시에 허위 내용을 등록한 경우<br> 2. 구입한 “재화 등”의 대금, 기타 “회사”가
									제공하는 “재화 등” 이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우<br> 3.
									“재화 등”을 구매한 후, 법률상 또는 정당한 이유 없이 상습적으로 취소ㆍ교환 및 반품하거나, “재화 등”의
									인도를 수반하지 않는 허위 결제 등을 통하여, “회사” 또는 “판매관리자”의 업무를 방해하는 경우<br>
									4. “서비스” 이용 과정에서 “회사”의 직원 또는 “판매관리자”에게 폭언∙협박 또는 음란한 언행을 하는 등
									부적절한 방법으로 “회사” 또는 “판매관리자”의 업무를 방해하는 경우<br> 5. “회사”의 “서비스”
									제공과 관련하여 제3자에게 “회사”의 명예 또는 신뢰성을 해하는 사실을 적시 또는 유포하는 경우<br>
									6. 다른 사람의 “재화 등” 이용을 방해하거나 그 정보를 도용하는 등 거래질서를 위협하는 경우<br>
									7. “회사”를 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우<br> ③
									“회사”는 “회사” 내부 정책에 따라 회원 자격의 제한 및 정지의 구체적인 내용을 정하여 회원에게 통지할 수
									있습니다.<br> ④ “회사”가 회원자격을 제한ㆍ정지시킨 후, 동일한 행위가 2회 이상 반복되거나 30일
									이내에 그 사유가 시정되지 아니하는 경우 “회사”는 회원자격을 상실시킬 수 있습니다.<br> ⑤
									“회사”가 회원자격을 상실 시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소
									전에 최소한 30일 이상의 기간을 정하여 소명 할 기회를 부여합니다.<br> <br> <br>
									제8조 회원에 대한 통지<br> <br> ① “회사”가 회원에 대한 통지를 하는 경우, 회원이
									“회사”와 미리 약정하여 지정한 매체(SMS, MMS, E-Mail 등)로 할 수 있습니다. <br> ②
									“회사”는 불특정다수 회원에 대한 통지의 경우 1주일 이상 “회사”의 온라인 게시판(게시판 주소)에 게시함으로써
									개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별
									통지합니다.<br> <br> <br> 제9조 구매 신청<br> <br>
									① “회사”의 이용자는 “오프라인 매장” 혹은 “더한섬닷컴” 상에서 다음 또는 이와 유사한 방법에 의하여 구매를
									신청하며, “회사”는 이용자가 구매 신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. 단,
									회원인 경우 제2호 내지 제4호의 적용을 제외할 수 있습니다. <br> 1. “재화 등”의 검색 및 선택<br>
									2. 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력<br> 3. 약관내용,
									청약철회권이 제한되는 “서비스”, 배송료ㆍ설치비 등의 비용부담과 관련한 내용에 대한 확인<br> 4. 이
									약관에 동의하고 위3.호의 사항을 확인하거나 거부하는 표시 (예 : 마우스클릭)<br> 5. "재화
									등"의 구매 신청/의사표시 및 이에 관한 확인 또는 “회사”의 확인에 대한 동의<br> 6. 결제방법의
									선택<br> ② “회사”가 제3자에게 구매자 개인정보를 제공할 필요가 있는 경우 “회사”는 제공되는
									개인정보 항목, 제공받는 자, 제공받는 자의 개인정보 이용 목적 및 보유ㆍ이용 기간 등을 서면 혹은
									“더한섬닷컴”을 통하여 구매자에게 명시하여야 합니다.<br> <br> <br> 제10조
									계약의 성립<br> <br> ① “회사”는 아래 각 호와 같은 “회원” 혹은 아래와 같은
									구매신청 건에 대하여, 구매신청을 승낙하지 않거나, 장래의 거래를 지속적으로 거절할 수 있습니다. 다만 미성년자와
									계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는
									내용을 고지하여야 합니다. <br> 1. 동일 “회원”이 상품의 하자가 없음에도 불구하고 상품 구매 후
									반품(환불)하는 행위를 반복함으로 인해, 다른 “회원”의 상품 구매기회가 제한되는 등 다른 “회원” 에게 피해를
									줄 우려가 있다고 판단되는 “회원” 혹은 구매신청 건의 경우<br> 2. 구매한 상품의 반품 시,
									반품비용 부담을 피하기 위해 상품을 고의로 손상한 후 반품하거나, 복수의 상품을 구매한 후 반품하면서 일부 상품을
									고의로 누락하여 반품하는 것이 정황상 명백한 “회원” 혹은 구매신청 건의 경우<br> 3. 재판매,
									구매대행 등의 상행위를 목적으로 하는 구매신청이거나, 거래 정황상 이러한 상행위를 목적으로 구매하는 것으로
									판단되는 “회원” 혹은 구매신청건의 경우<br> 4. 해당 상품 디자인 및 상표의 모방, 복제 등
									지적재산권의 침해를 목적으로 하는 구매행위 또는 거래 정황상 이러한 침해를 목적으로 하는 구매행위로 판단되는
									“회원” 혹은 구매신청 건의 경우<br> 5. 기타 사은품 수령을 목적으로, 사은품만을 취득한 채
									구매상품만을 반품하는 등 비정상적인 거래행위를 하는 “회원” 혹은 구매신청 건의 경우<br> 6.
									신청내용에 허위, 기재누락, 오기가 있는 경우<br> 7. 기타 구매 신청에 승낙하는 것이 “회사”
									기술상, 영업정책상 현저히 지장이 있다고 판단하는 경우<br> ② “회사”의 승낙이 제12조 제1항의
									수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.<br> ③ “회사”의 승낙의
									의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능여부, 구매신청의 정정, 취소 등에 관한 정보 등을
									포함하여야 합니다.<br> <br> <br> 제11조 지급방법<br> <br>
									“회사”에서 구매한 "재화 등"에 대한 대금지급방법은 다음 각 호의 방법 중 가용한 방법으로 할 수 있습니다.<br>
									단, “회사”는 이용자의 지급방법에 대하여 “재화 등”의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수
									없습니다.<br> 1. 폰뱅킹, 인터넷 뱅킹 등의 각 종 계좌이체<br> 2. 선불카드,
									직불카드, 신용카드 등의 각 종 카드 결제<br> 3. 전자화폐에 의한 결제<br> 4.
									마일리지 등 “회사”가 지급한 한섬마일리지에 의한 결제<br> 5. 기타 전자적 지급방법에 의한 대금
									지급 등<br> <br> <br> 제12조 더한섬닷컴 수신확인통지, 구매신청 변경 및
									취소<br> <br> ① “회사”는 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를
									합니다.<br> ② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은
									후 즉시 구매신청 변경 및 취소를 요청할 수 있고, “회사”는 배송 전에 이용자의 요청이 있는 경우에는 지체 없이
									그 요청에 따라 처리하여야 합니다. 다만, 이미 대금을 지불한 경우에는 제16조의 청약철회 등에 관한 규정에
									따릅니다.<br> <br> <br> 제13조 한섬마일리지 등 제도 운영<br>
									<br> ① 한섬마일리지 적립<br> 1. 한섬마일리지 적립율은 구매금액의 5%(아울렛
									1%)이며 “회사”가 정한 기준에 따라 추가 적립될 수 있습니다.<br> 2. 적립된 한섬마일리지는
									본인만 사용 가능하며 직계가족을 포함하여 타인에게 양도할 수 없습니다.<br> 3. 적립된 한섬마일리지는
									최종 구매일로부터 2년간 거래 실적이 없는 경우 소멸되며, 소멸된 한섬마일리지는 복구가 불가합니다. “회사”는
									소멸대상자에게 적립된 한섬마일리지의 소멸에 대해 통보할 의무가 없습니다.<br> 4. 세일상품, 일부
									아울렛 또는 수입 상품은 한섬마일리지가 적립되지 않습니다. “회사”가 정한 상품과 브랜드에 따라 적립 여부가
									상이할 수 있습니다. <br> ② 적립된 한섬마일리지 사용<br> 1. 1한섬마일리지는 1원으로
									환산되어 상품 구매 시 현금 또는 신용카드와 합산하여 천점 단위로 결제할 수 있습니다.<br> 2.
									적립된 한섬마일리지를 사용하면 해당 한섬마일리지 만큼 차감되며 차후 구매 시 계속 적립이 이루어집니다.<br>
									3. 기존 누적 한섬마일리지가 있던 사용자의 경우 실명인증 회원으로 가입된 후 기존의 한섬마일리지는 전환되며,
									전환된 한섬마일리지는 실명인증 회원가입일에 발생된 것으로 간주합니다.<br> 4. 회원의 누적
									한섬마일리지는 “회사”의 전 매장 및 “더한섬닷컴”에서 적립, 조회 및 사용이 가능합니다. 단, “회사”에서
									특별할인 행사를 진행하는 기간에는 일시적으로 한섬마일리지 적립 및 사용이 제한될 수 있습니다. 이러한 경우에는
									행사 이전에 홈페이지와 매장 포스터 등을 통해 공지합니다. (세일 상품, 일부 아울렛 또는 수입 상품은
									한섬마일리지 사용이 제한됩니다.)<br> 5. 회원탈퇴 및 자격상실 시 적립된 한섬마일리지는 소멸되며
									일단 소멸된 한섬마일리지는 복구가 불가합니다.<br> 6. 한섬마일리지 적립이 누락된 경우 구매
									증빙자료(구매영수증 또는 카드대금 청구서)를 구입 후 1개월 이내에 구매처에 제시하면 즉시 적립해드립니다.<br>
									③ 제도 변경 및 기타<br> 1. “회사”는 관련 법령의 제정, 개정 및 폐지, 다른 업체와 업무제휴
									개시 또는 변경 등과 관련하여 기존 제도의 변경이 불가피한 경우, 예상치 못한 국내외 경영환경의 급격한 변화,
									기타 관련 산업의 중대한 위기를 초래할 우려가 있는 불가항력적 사정이 상당 기간 지속되는 경우 등 상당한 이유가
									발생한 경우 회원에게 4개월 전에 고지하고 한섬마일리지의 적립률, 허용한도 및 기간 등 세부적인 조건을 변경하거나
									“서비스”를 종료할 수 있습니다. 한섬마일리지 제도의 세부조건이 변경되거나 종료된 경우 회원은 제도변경일 전까지
									취득한 한섬마일리지를 제도변경일로부터 6개월 이상의 기간으로 “회사”가 고지한 상당한 기간 내에 기존조건에 따라
									사용할 수 있으며 기간 내 사용하지 않은 한섬마일리지는 변경된 제도의 적용을 받거나 소멸 됩니다.<br>
									2. 회원은 본인 거래에 대해서만 한섬마일리지를 적립ㆍ사용할 수 있으며, 지인(직계가족 포함) 거래 시
									한섬마일리지를 적립ㆍ사용하거나 지인(직계가족 포함)에게 한섬마일리지를 양도할 수 없습니다.<br> <br>
									<br> 제14조 재화 등 공급<br> <br> ① “더한섬닷컴”의 경우, “회사”는
									이용자와 “재화 등”의 공급시기에 관하여 별도의 약정이 없는 이상 이용자가 청약을 한 날로부터 7일 이내에 “재화
									등”을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “회사”가 이미 “재화 등”의
									대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다.
									이때 “회사”는 이용자가 “재화 등”의 공급절차 및 진행사항을 확인할 수 있도록 적절한 조치를 합니다.<br>
									② “오프라인 매장”의 경우, “회사”는 제10조에 따라 계약이 성립한 경우 즉시 “재화 등”을 공급하며, 다만,
									이용자의 요청에 따라 배송하게 될 경우에는 “재화 등”의 공급절차 및 비용 등에 관하여 이용자에게 별도로
									안내합니다.<br> ③ “회사”는 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별
									배송기간 등을 명시합니다. 만약 “회사”가 합리적인 이유없이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의
									손해를 배상하여야 합니다. 다만, “회사”가 고의ㆍ과실이 없음을 입증한 경우에는 그러하지 아니합니다.<br>
									④ “회사”와 소비자간에 상품의 인도시기 또는 용역의 제공시기에 관하여 별도의 약정이 있는 경우에는 당해 약정이
									이 약관에 우선합니다.<br> <br> <br> 제15조 환급<br> <br>
									“회사”는 이용자가 구매 신청한 “재화 등”이 품절 등의 사유로 인도 또는 용역의 제공을 할 수 없을 때에는 지체
									없이 그 사유를 이용자에게 통지하고, 전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 2영업일 이내에
									환급하거나 환급에 필요한 조치를 취합니다.<br> <br> <br> 제16조 청약철회
									등<br> <br> ① “회사”와 “재화 등”의 구매에 관한 계약을 체결한 고객은 수신확인의
									통지를 받은 날부터 7일 이내에 청약을 철회할 수 있습니다.<br> ② 이용자는 “재화 등”을 배송 받은
									경우 또는 “재화 등”을 인도받은 경우, 다음 각호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.<br>
									1. 이용자에게 책임 있는 사유로 “재화 등”이 멸실 또는 훼손된 경우(다만, “재화 등”의 내용 확인을 위하여
									포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다.)<br> 2. 이용자의 사용 또는 일부 소비에
									의하여 “재화 등”의 가치가 현저히 감소한 경우<br> 3. 시간의 경과에 의하여 재판매가 곤란할 정도로
									“재화 등”의 가치가 현저히 감소한 경우<br> 4. 같은 성능을 지닌 “재화 등”으로 복제가 가능한
									경우 그 원본인 “재화 등”의 포장을 훼손한 경우<br> 5. 이용자의 주문에 따라 제품이 개별적으로
									생산∙수선 또는 이와 유사한 방식으로 제공된 경우 <br> ③ 제2항 제2호 내지 제5호의 경우에
									“회사”가 사전에 청약철회 등이 제한되는 사실을 재화의 포장이나 그 밖에 소비자가 쉽게 알 수 있는 곳에
									명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.<br>
									④ 이용자는 제1항 및 제2항의 규정에 불구하고 “재화 등”의 내용이 표시ㆍ광고 내용과 다르거나, 계약내용과
									다르게 이행된 경우에는 당해 “재화 등”을 공급받은 날로부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던
									날로부터 30일 이내에 청약철회 등을 할 수 있습니다.<br> <br> <br>
									제17조 청약철회 등의 효과<br> <br> ① “더한섬닷컴”의 경우, “회사”는 본 약관
									제16조에 따라 청약철회가 있은 후 이용자로부터 “재화 등”을 반환받은 경우 3영업일 이내에 이미 지급받은 “재화
									등”의 대금을 환급합니다. 이 경우 “회사”가 이용자에게 “재화 등”의 환급을 지연한 때에는 그 지연기간에 대하여
									공정거래위원회가 정하여 고시하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.<br> ② “오프라인
									매장”의 경우, 반품 사유에 해당하여 “회사”가 이용자로부터 “재화 등”을 반환받는 경우 그 즉시 지급받은 “재화
									등”의 대금을 환급합니다. 이 경우 “회사”가 이용자에게 “재화 등”의 환급을 지연한 때에는 그 지연기간에 대하여
									공정거래위원회가 정하여 고시하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.<br> ③ “회사”는
									위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 “재화 등”의 대금을 지급한 때에는
									지체 없이 당해 결제수단을 제공한 사업자로 하여금 “재화 등”의 대금의 청구를 정지 또는 취소하도록 요청합니다.<br>
									④ 청약철회 등의 경우 공급받은 “재화 등”의 반환에 필요한 비용은 이용자가 부담합니다.“회사”는 이용자에게
									청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만, “재화 등”의 내용이 표시ㆍ광고 내용과
									다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 “재화 등”의 반환에 필요한 비용은 “회사”가
									부담합니다.<br> ⑤ 이용자가 “재화 등”을 제공받을 때 발송비를 부담한 경우에 “회사”는 청약철회 시
									그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.<br> <br> <br>
									제18조 개인정보보호<br> <br> ① “회사”는 이용자의 개인정보수집 시 “서비스”제공을
									위하여 필요 최소한의 개인정보만을 수집합니다.<br> ② “회사”는 회원가입 시 구매계약이행에 필요한
									정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서
									최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.<br> ③ “회사”는 이용자의 개인정보를
									수집ㆍ이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는
									경우에는 예외로 합니다.<br> ④ “회사”는 수집된 개인정보를 목적 외의 용도로 이용할 수 없으며,
									새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용ㆍ제공 단계에서 당해 이용자에게 그 목적을
									고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.<br> ⑤
									“회사”가 제2항과 제3항에 의해 이용자의 동의를 받아야하는 경우에 개인정보관리 책임자의 신원(소속, 성명 및
									전화번호 기타 연락처), 정보의 수집목적 및 이용 목적, 제3자에 대한 정보제공 관련 사항(제공 받는 자,
									제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 등에 관한 법률」 제22조 제2항이 규정한 사항을 미리
									명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.<br> ⑥ 이용자는 언제든지
									“회사” 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “회사”는 이에 대해 지체 없이
									필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에 “회사”는 그 오류를 정정할 때까지 당해
									개인정보를 이용하지 않습니다.<br> ⑦ “회사”는 개인정보 보호를 위하여 관리자를 한정하여 그 수를
									최소화하며 신용카드, 은행계좌 등을 포함한 이용자의 개인 정보의 분실, 도난, 유출, 변조 등으로 인한 이용자의
									손해에 대하여 모든 책임을 집니다.<br> ⑧ “회사” 또는 그로부터 개인정보를 제공받은 제3자는
									개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.<br> ⑨
									“회사”는 개인정보의 수집ㆍ이용ㆍ제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의
									수집ㆍ이용ㆍ제공에 관한 이용자의 동의 거절시 제한되는 “서비스”를 구체적으로 명시하고, 필수수집항목이 아닌
									개인정보의 수집ㆍ이용ㆍ제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 “서비스” 제공을 제한하거나 거절하지
									않습니다. <br> <br> <br> 제19조 회사의 의무<br> <br>
									① “회사”는 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라
									지속적이고, 안정적으로 “재화 등”을 제공하는 데 최선을 다하여야 합니다.<br> ② “회사”는 이용자가
									안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야
									합니다.<br> ③ “회사”가 “재화 등”에 대하여 「표시ㆍ광고의 공정화에 관한 법률」제3조 소정의
									부당한 표시ㆍ광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.<br> ④
									“회사”는 이용자가 원하지 않는 영리목적의 광고성 정보를 발송하지 않습니다.<br> <br> <br>
									제20조 회원의 ID및 비밀번호에 대한 의무<br> <br> ① 제17조의 경우를 제외한 ID와
									비밀번호에 관한 관리책임은 회원에게 있습니다.<br> ② 회원은 자신의 ID 및 비밀번호를 제3자에게
									이용하게 해서는 안됩니다.<br> ③ 회원이 자신의 ID 및 비밀번호를 도난 당하거나 제3자가 사용하고
									있음을 인지한 경우에는 바로 “회사”에 통보하고 “회사”의 안내가 있는 경우에는 그에 따라야 합니다.<br>
									<br> <br> 제21조 이용자의 의무<br> 이용자는 다음 행위를 하여서는
									안됩니다.<br> <br> 1. 신청 또는 변경 시 허위내용의 등록<br> 2. 타인의
									정보 도용<br> 3. “회사”에 게시된 정보의 변경<br> 4. “회사”가 정한 정보 이외의
									정보(컴퓨터 프로그램 등)의 송신 또는 게시<br> 5. “회사” 기타 제3자의 저작권 등 지적재산권에
									대한 침해<br> 6. “회사” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위<br>
									7. 외설 또는 폭력적인 메시지ㆍ화상ㆍ음성 기타 공서양속에 반하는 정보를 오프라인 또는 온라인에 공개 또는
									게시하는 행위<br> <br> <br> 제22조 저작권의 귀속 및 이용제한<br>
									<br> ① “회사”가 작성한 저작물에 대한 저작권 기타 지적재산권은 “회사”에 귀속합니다. <br>

									② 이용자는 “회사”의 “오프라인 매장” 및 “더한섬닷컴”을 이용함으로써 얻은 정보 중 “회사”에게 지적재산권이
									귀속된 정보를 “회사”의 사전 승낙없이 복제, 송신, 출판,배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나
									제3자에게 이용하게 하여서는 안됩니다.<br> ③ “회사”는 약정에 따라 이용자에게 귀속된 저작권을
									사용하는 경우 당해 이용자에게 통보하여야 합니다.<br> <br> <br> 제23조
									분쟁해결<br> <br> ① “회사”는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그
									피해를 보상처리하기 위하여 피해보상처리기구를 설치ㆍ운영합니다.<br> ② “회사”는 이용자로부터 제출되는
									불만사항 및 의견은 우선적으로 그 사항을 처리합니다.다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와
									처리일정을 즉시 통보해 드립니다.<br> ③ “회사”와 이용자간에 발생한 분쟁과 관련하여 이용자의
									피해구제신청이 있는 경우에는 공정거래위원회 또는 시ㆍ도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.<br>
									<br> <br> 제24조 재판권 및 준거법<br> <br> ① “회사”와
									이용자간에 발생한 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는
									지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는
									민사소송법상의 관할법원에 제기합니다.<br> ② “회사”와 이용자간에 제기된 소송에는 한국법을
									적용합니다.<br> <br> <br>

								</div>
								<div class="agree_ck">
									<input type="radio" name="checkag1" id="checkagY_ck1" value="Y">
									<label for="checkagY_ck1">동의합니다.</label> &nbsp; <input
										type="radio" name="checkag1" id="checkagN_ck1" value="N">
									<label for="checkagN_ck1">동의하지않습니다.</label>
								</div>
							</div>
							<!-- 개인정보 수집(필수) -->
							<div class="box">
								<div class="title_wrap">
									<h4>개인정보 수집 및 이용에 관한 동의 (필수)</h4>
								</div>
								<div class="terms_box box_type_2">
									■ 개인정보의 수집항목 및 이용<br> <br> 더한섬닷컴은 별도의 회원가입 절차 없이 대부분의
									컨텐츠에 자유롭게 접근할 수 있습니다. 더한섬닷컴의 서비스를 이용하시는 경우 다음의 정보를 고객의 동의를 받아
									수집할 수 있으며 선택항목을 입력하지 않아도 서비스 이용에 제한은 없습니다.<br> <br>
									1) 회원가입 및 주문 등 필요시점에 수집하는 개인정보의 범위
									<table class="tbl_ltype">
										<caption>회원가입 및 주문 등 필요시점에 수집하는 개인정보의 범위</caption>
										<colgroup class="showDesktop">
											<col style="width: 12%;">
											<col style="width: 30%;">
											<col style="width: 10%;">
											<col style="width: 34%;">
											<col>
										</colgroup>

										<colgroup class="showMobile">
											<col style="width: 20%;">
											<col style="width: 30%;">
											<col style="width: 13%;">
											<col>
										</colgroup>
										<thead>
											<tr>
												<th scope="col">수집 방법</th>
												<th scope="col">이용 목적</th>
												<th scope="col">수집 정보</th>
												<th scope="col">수집 항목</th>
												<th scope="col" class="showDesktop">보유 기간</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="frt bdln" style="font-size: 10pt;"
													style="border-left: none;">간편회원가입</td>
												<td style="font-size: 10pt;">더한섬닷컴 서비스 이용 및 상담, 본인확인</td>
												<td style="font-size: 10pt;">필수</td>
												<td class="al_left" style="font-size: 10pt;">이름, 생년월일,
													아이디, 비밀번호, 이메일, 본인확인 값(CI, DI)</td>
												<td rowspan="5"
													style="vertical-align: middle; font-size: 10pt;"
													class="showDesktop"><strong>회원 탈퇴 시 또는 동의 철회
														시</strong></td>
											</tr>
											<tr>
												<td class="frt bdln" rowspan="2" style="font-size: 10pt;">구매
													및 배송</td>
												<td style="font-size: 10pt;">구매결제</td>
												<td style="font-size: 10pt;">필수</td>
												<td class="al_left" style="font-size: 10pt;">신용카드 번호,
													은행 계좌번호, 휴대폰 번호</td>
											</tr>
											<tr>
												<td style="font-size: 10pt;">상품배송, 배송지 관리</td>
												<td style="font-size: 10pt;">필수</td>
												<td class="al_left" style="font-size: 10pt;">주문자 정보 :
													주문자 성명, 휴대폰 번호, 이메일<br />배송지 정보 : 수령인 성명, 휴대폰 번호, 배송지 주소
												</td>
											</tr>
											<tr>
												<td class="frt bdln" style="font-size: 10pt;"
													style="border-left: none;">환불</td>
												<td style="font-size: 10pt;">주문건 환불</td>
												<td style="font-size: 10pt;">필수</td>
												<td class="al_left" style="font-size: 10pt;">이름, 신용카드
													번호, 은행 계좌번호</td>
											</tr>
										</tbody>
									</table>
									<span class="showMobile" style="font-size: 13px;">* 보유
										기간 : <strong>회원 탈퇴 시 또는 동의 철회 시</strong><br>
									</span> <br> 2) 서비스 이용과정에서 생성되는 정보
									<table class="tbl_ltype">
										<caption>서비스 이용과정에서 생성되는 정보</caption>
										<colgroup>
											<col style="width: 13%;">
											<col style="width: 13%;">
											<col style="width: 13%;">
											<col>
											<col style="width: 30%;">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">수집 방법</th>
												<th scope="col">이용 목적</th>
												<th scope="col">수집 정보</th>
												<th scope="col">수집 항목</th>
												<th scope="col">보유 기간</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="frt bdln" style="font-size: 10pt;" rowspan="2"
													style="word-break:break-all;">더한섬닷컴<br />Web site<br />Mobile
													App<br />Mobile Web
												</td>
												<td style="font-size: 10pt;">본인확인</td>
												<td style="font-size: 10pt;">필수</td>
												<td class="al_left"
													style="font-size: 10pt; font-weight: bold;">본인확인 값(CI,
													DI)</td>
												<td class="al_left"
													style="font-size: 10pt; font-weight: bold;">회원 탈퇴 시 또는
													법정 의무 보유기간</td>
											</tr>
											<tr>
												<td style="font-size: 10pt;">서비스 이용기록</td>
												<td style="font-size: 10pt;">필수</td>
												<td class="al_left"
													style="font-size: 10pt; font-weight: bold;">- IP
													Address, 쿠키, 방문 일시, 서비스 이용기록 및 중지기록, 모바일 기기정보(모바일 서비스 이용 시)<br />
													- 모바일 서비스 이용 시 모바일 기기정보 : OS종류 및 버전, 디바이스 종류, 광고식별자<br />
													- 앱 이용 시 추가 모바일 기기정보 : UUID(임의 생성한 앱 고유값), 푸시 토른(생성값), 회원의
													경우 ID
												</td>
												<td class="al_left"
													style="font-size: 10pt; font-weight: bold;">- 쿠키의 경우,
													브라우저 종료 시 또는 로그아웃 시 만료<br /> - 앱 이용 시 수집 정보는 앱 삭제 시 만료
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="agree_ck">
									<input type="radio" name="checkag2" id="checkagY_ck2" value="Y">
									<label for="checkagY_ck2">동의합니다.</label> &nbsp; <input
										type="radio" name="checkag2" id="checkagN_ck2" value="N">
									<label for="checkagN_ck2">동의하지않습니다.</label>
								</div>
							</div>
							<!-- 개인정보 수집(선택)  -->
							<div class="box">
								<div class="title_wrap clearfix">
									<h4>개인정보 수집 및 이용에 관한 동의 (선택)</h4>
								</div>
								<div class="terms_box box_type_2">
									■ 개인정보의 수집항목 및 이용<br> <br> 더한섬닷컴은 별도의 회원가입 절차 없이 대부분의
									컨텐츠에 자유롭게 접근할 수 있습니다. 더한섬닷컴의 서비스를 이용하시는 경우 다음의 정보를 고객의 동의를 받아
									수집할 수 있으며 선택항목을 입력하지 않아도 서비스 이용에 제한은 없습니다.<br> <br>
									1) 회원가입 및 주문 등 필요시점에 수집하는 개인정보의 범위
									<table class="tbl_ltype">
										<caption>회원가입 및 주문 등 필요시점에 수집하는 개인정보의 범위</caption>
										<colgroup class="showDesktop">
											<col style="width: 12%;">
											<col style="width: 24%;">
											<col style="width: 12%;">
											<col style="width: 30%;">
											<col>
										</colgroup>

										<colgroup class="showMobile">
											<col style="width: 20%;">
											<col style="width: 30%;">
											<col style="width: 13%;">
											<col>
										</colgroup>

										<thead>
											<tr>
												<th scope="col">수집 방법</th>
												<th scope="col">이용 목적</th>
												<th scope="col">수집 정보</th>
												<th scope="col">수집 항목</th>
												<th scope="col" class="showDesktop" class="showDesktop">보유
													기간</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="frt bdln">구매 및 배송</td>
												<td>상품배송/배송지 관리</td>
												<td>선택</td>
												<td class="al_left">수령인 연락처, 수령인 이메일</td>
												<td rowspan="3" style="font-size: 12px;" class="showDesktop">회원
													탈퇴 시 또는 동의 철회 시</td>
											</tr>
											<tr>
												<td class="frt bdln">기타</td>
												<td>현금영수증 발급, 앱설치 URL 전송</td>
												<td>선택</td>
												<td class="al_left">휴대폰 번호</td>
											</tr>
										</tbody>
									</table>
									<span class="showMobile" style="font-size: 13px;">* 보유
										기간 : <strong>회원 탈퇴 시 또는 동의 철회 시</strong><br>
									</span> <br> 2) 서비스 이용과정에서 생성되는 정보
									<table class="tbl_ltype">
										<caption>서비스 이용과정에서 생성되는 정보</caption>
										<colgroup>
											<col style="width: 13%;">
											<col style="width: 15%;">
											<col style="width: 13%;">
											<col>
											<col style="width: 30%;">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">수집 방법</th>
												<th scope="col">이용 목적</th>
												<th scope="col">수집 정보</th>
												<th scope="col">수집 항목</th>
												<th scope="col">보유 기간</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="frt bdln">더한섬닷컴<br />Web site<br />Mobile
													App<br />Mobile Web
												</td>
												<td>고객만족도<br />설문조사
												</td>
												<td>선택</td>
												<td class="al_left">고객만족도 설문조사에 의한 항목별 응답기록</td>
												<td class="al_left"><u class="upSize"><strong>회원탈퇴
															시 또는 법정 의무 보유기간</strong></u></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="agree_ck">
									<input type="radio" name="checkOptionalAg" id="checkagY"
										value="Y"> <label for="checkagY">동의합니다.</label> &nbsp;
									<input type="radio" name="checkOptionalAg" id="checkagN"
										value="N"> <label for="checkagN">동의하지않습니다.</label>
									<p style="margin-top: 5px;">선택사항의 동의항목에 선택하지 않으셔도 회원가입 및
										구매결제를 이용하실 수 있습니다.</p>
								</div>
							</div>
							<!-- 개인정보처리위탁 안내 -->
							<div class="box">
								<div class="title_wrap">
									<h4>개인정보 처리 위탁 안내 (필수)</h4>
								</div>
								<div class="terms_box box_type_2">
									■ 개인정보 처리 위탁 안내 <br /> <br /> 더한섬닷컴은 서비스 향상을 위해서 고객의 개인정보를
									외부에 수집, 처리, 관리 등을 위탁하여 처리할 수 있습니다.<br /> - 개인정보의 처리를 위탁하는 경우에는
									위탁기관 및 그 사실을 홈페이지를 통해 지체 없이 고객께 고지하겠습니다.
									<table class="tbl_ltype">
										<caption>개인정보의 위탁처리</caption>
										<colgroup>
											<col style="width: 30%;">
											<col style="width: 70%;">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">위탁업무</th>
												<th scope="col">수탁자</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="al_left frt bdln"
													style="font-size: 10pt; font-weight: bold;">고객 상담 업무</td>
												<td class="al_left" style="font-size: 10pt;">㈜유베이스,
													㈜SK엠앤서비스</td>
											</tr>
											<tr>
												<td class="al_left frt bdln"
													style="font-size: 10pt; font-weight: bold;">주문 상품의 배송</td>
												<td class="al_left" style="font-size: 10pt;">우정사업본부,
													씰리프로모션, ㈜DHL코리아, ㈜고고밴코리아, CJ대한통운㈜, ㈜굿투럭</td>
											</tr>
											<tr>
												<td class="al_left frt bdln"
													style="font-size: 10pt; font-weight: bold;">본인확인</td>
												<td class="al_left" style="font-size: 10pt;">NICE평가정보㈜,
													한국정보인증㈜</td>
											</tr>
											<tr>
												<td class="al_left frt bdln"
													style="font-size: 10pt; font-weight: bold;">결제 정보</td>
												<td class="al_left" style="font-size: 10pt;">㈜KG이니시스,
													㈜LG CNS, ㈜KRP</td>
											</tr>
											<tr>
												<td class="al_left frt bdln"
													style="font-size: 10pt; font-weight: bold;">SMS, MMS,
													APP PUSH 발송</td>
												<td class="al_left" style="font-size: 10pt;">㈜KG이니시스,
													㈜LG CNS, ㈜KRP, ㈜휴머스온</td>
											</tr>
											<tr>
												<td class="al_left frt bdln"
													style="font-size: 10pt; font-weight: bold;">상품배송업무 등의
													서비스 제공</td>
												<td class="al_left" style="font-size: 10pt;">㈜아이패스</td>
											</tr>
											<tr>
												<td class="al_left frt bdln"
													style="font-size: 10pt; font-weight: bold;">정보전산 처리 및
													유지/관리</td>
												<td class="al_left" style="font-size: 10pt;">㈜이노트리,
													㈜뉴프롬, (주)현대IT&E, (주)메가존클라우드</td>
											</tr>
											<tr>
												<td class="al_left frt bdln"
													style="font-size: 10pt; font-weight: bold;">콜센터 장비 및
													시스템 제공</td>
												<td class="al_left" style="font-size: 10pt;">HCN</td>
											</tr>
											<tr>
												<td class="al_left frt bdln"
													style="font-size: 10pt; font-weight: bold;">의뢰 상품의
													세탁/수선 업무</td>
												<td class="al_left" style="font-size: 10pt;">그린어스코리아(유),
													㈜트로반트</td>
											</tr>
											<tr>
												<td class="al_left frt bdln"
													style="font-size: 10pt; font-weight: bold;">고객 상담
													챗봇/채팅상담</td>
												<td class="al_left" style="font-size: 10pt;">㈜카카오엔터프라이즈,
													㈜스펙트라</td>
											</tr>
										</tbody>
									</table>
									<br> * 공유하는 정보는 당해 목적을 달성하기 위하여 필요한 최소한의 정보에 국한됩니다.
								</div>
								<div class="agree_ck">
									<input type="radio" name="checkag3" id="checkagY_ck3" value="Y">
									<label for="checkagY_ck3">동의합니다.</label> &nbsp; <input
										type="radio" name="checkag3" id="checkagN_ck3" value="N">
									<label for="checkagN_ck3">동의하지않습니다.</label>
								</div>
							</div>
							<div class="btnwrap">
								<p style="display: none;">전체 약관에 모두 동의합니다.</p>
								<input type="button" value="취소" class="btn wt"
									id="cancleBtn" onClick="location.href='/'" /> <input
									type="button" value="다음" class="btn gray mr0" onClick="location.href='/member/join'" />
							</div>
						</div>
					</fieldset>
				</div>
				<!--//sub container-->
			</div>
		</form>
	</div>
	<script>
		$(document).ready(function() {
			//회원가입 버튼(회원가입 기능 작동)
			$(".btn gray mr0").click(function() {
				/* 최종 유효성 검사 */
				$("#memberJoinForm").attr("action", "/member/join_sec");
				$("#memberJoinForm").submit();
				return false;
			});
		});
		
		$(document).ready(
				function() {
					$(".showMobile").remove();

					$("input[name=allcheck]").change(function() {
						if ($(this).is(":checked")) {
							$("#checkagY_ck1").prop("checked", true);
							$("#checkagY_ck2").prop("checked", true);
							$("#checkagY_ck3").prop("checked", true);
							$("#checkagY").prop("checked", true);
							$(".btnwrap > p").css("display", "block");
						} else {
							$("#checkagN_ck1").prop("checked", true);
							$("#checkagN_ck2").prop("checked", true);
							$("#checkagN_ck3").prop("checked", true);
							$("#checkagN").prop("checked", true);
							$(".btnwrap > p").css("display", "none");
						}
					});

					$("input[name=checkag1]").change(
							function() {
								if (!$("#checkagY_ck1").is(":checked")) {
									$("input[name=allcheck]").prop("checked",
											false);
									$(".btnwrap > p").css("display", "none");
								} else {
									if ($("#checkagY_ck2").is(":checked")
											&& $("#checkagY_ck3")
													.is(":checked")
											&& $("#checkagY").is(":checked")) {
										$("input[name=allcheck]").prop(
												"checked", true);
										$(".btnwrap > p").css("display",
												"block");
									}
								}
							});

					$("input[name=checkag2]").change(
							function() {
								if (!$("#checkagY_ck2").is(":checked")) {
									$("input[name=allcheck]").prop("checked",
											false);
									$(".btnwrap > p").css("display", "none");
								} else {
									if ($("#checkagY_ck1").is(":checked")
											&& $("#checkagY_ck3")
													.is(":checked")
											&& $("#checkagY").is(":checked")) {
										$("input[name=allcheck]").prop(
												"checked", true);
										$(".btnwrap > p").css("display",
												"block");
									}
								}
							});

					$("input[name=checkag3]").change(
							function() {
								if (!$("#checkagY_ck3").is(":checked")) {
									$("input[name=allcheck]").prop("checked",
											false);
									$(".btnwrap > p").css("display", "none");
								} else {
									if ($("#checkagY_ck1").is(":checked")
											&& $("#checkagY_ck2")
													.is(":checked")
											&& $("#checkagY").is(":checked")) {
										$("input[name=allcheck]").prop(
												"checked", true);
										$(".btnwrap > p").css("display",
												"block");
									}
								}
							});

					$("input[name=checkOptionalAg]").change(
							function() {
								if ($("#checkagN").is(":checked")) {
									$("input[name=allcheck]").prop("checked",
											false);
									$(".btnwrap > p").css("display", "none");
								} else {
									if ($("#checkagY_ck1").is(":checked")
											&& $("#checkagY_ck2")
													.is(":checked")
											&& $("#checkagY_ck3")
													.is(":checked")) {
										$(".btnwrap > p").css("display",
												"block");
										$("input[name=allcheck]").prop(
												"checked", true);
									}
								}

							});

					$("#cancleBtn").click(
							function() {
								var lc = new layerConfirm('회원가입을 취소하시겠습니까?',
										'확인', '취소');
								lc.confirmAction = function() {
									location.href = "/ko/";
								};
							});

					$("#nextBtn").click(
							function() {
								var agreeAll = true;

								if (!$("#checkagY_ck1").is(":checked")) {
									agreeAll = false;
									layerAlert("약관에 모두 동의해 주세요.");
									return false;
								}

								if (!$("#checkagY_ck2").is(":checked")) {
									agreeAll = false;
									layerAlert("약관에 모두 동의해 주세요.");
									return false;
								}

								if (!$("#checkagY_ck3").is(":checked")) {
									agreeAll = false;
									layerAlert("약관에 모두 동의해 주세요.");
									return false;
								}

								if ($("#checkagY").is(":checked")) {
									$("#checkOptional").val("Y");
								} else {
									$("#checkOptional").val("N");
								}

								if (agreeAll) {
									$("#resultSend").attr("action",
											"/ko/member/joininfoform");
									$("#resultSend").submit();
								}
							});
				});
	</script>
</body><%@ include file="/WEB-INF/views/common/footer.jsp"%>