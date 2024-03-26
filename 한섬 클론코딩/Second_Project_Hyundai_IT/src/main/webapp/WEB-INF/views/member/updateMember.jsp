<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>더한섬닷컴 | THE HANDSOME.COM</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="/resources/css/layout.css" />
<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" href="/resources/css/contents.css" />

<!-- 제이쿼리 cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- ui 공통 스크립트 -->
<script type="text/javascript" src="/resources/js/ui.js"></script>

<title>더한섬닷컴</title>

<link rel="stylesheet" href="/resources/css/member/updateMember.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/font_443.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/layout.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/brand.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/contents.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/jquery-ui.min.css">

</head>

<body>

	<!-- bodyWrap -->
	<div id="bodyWrap">
		<h3 class="cnts_title">
			<span id="menuTitle">개인정보 변경</span>
		</h3>
		<div class="sub_container">
			<!-- lnb -->
			<div class="lnb_wrap">
				<h4>
					<a href="/member/mypage">마이페이지 <!-- 마이페이지 --></a>
				</h4>
				<div class="lnb">
					<dl>
						<dt>주문조회</dt>
						<dd>
							<a href="/ko/mypage/order/myorders"
								onclick="GA_Event('마이페이지','LNB','주문/배송/반품/취소');">주문/배송/반품/취소</a>
						</dd>
					</dl>
					<dl>
						<dt>혜택관리</dt>
						<dd>
							<a href="/ko/mypage/myGradeInfo"
								onclick="GA_Event('마이페이지','LNB','나의 회원 등급');">나의 회원 등급</a>
						</dd>
						<dd>
							<a href="/ko/mypage/voucher"
								onclick="GA_Event('마이페이지','LNB','나의 쿠폰');">나의 쿠폰 <!-- 쿠폰함 --></a>
						</dd>


					</dl>
					<dl>
						<dt>나의 상품관리</dt>
						<dd>
							<a href="/ko/mypage/myWish"
								onclick="GA_Event('마이페이지','LNB','위시리스트');">위시리스트 <!-- 위시리스트 --></a>
						</dd>

					</dl>
					<dl>
						<dt>나의 정보관리</dt>
						<dd>
							<a href="/member/mypage"
								onclick="GA_Event('마이페이지','LNB','개인정보 변경/탈퇴');">개인정보 변경/탈퇴</a>
						</dd>
						<dd>
							<a href="/ko/mypage/shoppingAddressPWCheck"
								onclick="GA_Event('마이페이지','LNB','배송지 관리');">배송지 관리</a>
						</dd>

					</dl>
					<dl>
						<dt>나의 활동관리</dt>
						<dd>
							<a href="/member/qna" onclick="GA_Event('마이페이지','LNB','상품 Q&A');">상품
								Q&A</a>
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
				<form id="updateMember" method="post">
				<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" />
					<!-- //lnbWrap -->
					<div>
						<div class="title_wrap mt30">
							<h4 class="float_left">개인정보 변경</h4>
							<p class="txt_line">회원정보를 확인하고, 변경할 수 있습니다.</p>
							<p class="reqd_txt">
								<strong class="reqd">*</strong> 표시는 필수항목입니다.
							</p>
						</div>

						<fieldset>
							<legend>회원정보입력</legend>
							<div class="tblwrap">
								<table class="tbl_wtype1">
									<caption>회원가입 입력항목</caption>
									<colgroup>
										<col style="width: 140px">
										<col>
									</colgroup>
									<tbody>

										<tr>
											<th scope="row" class="th_space">아이디</th>
											<td>${member.mid}</td>
										</tr>
										<tr>
											<th scope="row" class="th_space"><strong class="reqd">*</strong>
												비밀번호</th>
											<td><input type="password" style="width: 120px"
												id="mpassword" name="mpassword" class="pw_input"></td>
										</tr>
										<tr>
											<th scope="row" class="th_space"><strong class="reqd">*</strong>
												비밀번호 확인</th>
											<td><div>
													<input type="password" style="width: 120px" id="password"
														name="password" value="" class="pwck_input"><span
														class="pwck_input_re_1">비밀번호가 일치합니다.</span> <span
														class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
												</div></td>
										</tr>

										<tr>

											<th scope="row"><label for="inforcvemail">E-mail(정보수신용)</label></th>
											<td><input type="text" style="width: 120px"
												title="이메일아이디" id="email" name="email" value=""> <span
												class="andmail" id="middle">@</span> <select
												id="emailDomainSel" style="width: 120px" title="이메일계정">
													<option value="06">직접입력</option>
													<option value="naver.com">naver.com</option>
													<option value="daum.net">daum.net</option>
													<option value="gmail.com">gmail.com</option>
													<option value="yahoo.co.kr">yahoo.co.kr</option>
													<option value="lycos.co.kr">lycos.co.kr</option>
													<option value="nate.com">nate.com</option>
													<option value="empas.com">empas.com</option>
													<option value="hotmail.com">hotmail.com</option>
													<option value="msn.com">msn.com</option>
													<option value="hanmir.com">hanmir.com</option>
													<option value="chol.net">chol.net</option>
													<option value="korea.com">korea.com</option>
													<option value="netsgo.com">netsgo.com</option>
													<option value="dreamwiz.com">dreamwiz.com</option>
													<option value="hanafos.com">hanafos.com</option>
													<option value="freechal.com">freechal.com</option>
													<option value="hitel.net">hitel.net</option>
											</select> <input type="text" id="emailDomain" style="width: 120px"
												value="" title="이메일 도메인" style="disply:none;"> <span
												class="guide_comment" id="emailMsg"></span> <input
												id="memail" name="memail" style="display: none;"
												value="${member.memail}">
										</tr>
										<tr>
											<th scope="row" class="th_space"><strong class="reqd">*</strong>
												이름</th>
											<td><input type="text" style="width: 120px" id="mname"
												name="mname" value="${member.mname}"></td>
										</tr>
										<tr>
											<th scope="row" class="th_space"><strong class="reqd">*</strong>
												전화번호</th>
											<td><input type="text" style="width: 120px" id="mtel"
												name="mtel" value="${member.mtel}"><font
												id="telCheckSpan"></font>
										</tr>


									</tbody>
								</table>
							</div>
						</fieldset>

						<!-- btn_btwrap -->

						<div class="btnwrap mypage2">
							<input type="button" class="btn wt deleteBtn" value="회원탈퇴"
								id="deleteBtn"> <input type="button" class="btn gray"
								value="취소" id="cancleBtn"
								onclick="location.href='/member/mypage'"> <input
								type="button" class="btn wt update_button" value="변경사항 저장"
								id="update_button">
						</div>
						<!-- //btn_btwrap -->
					</div>

				</form>
				<!-- 다국어 한국 이외의 언어에서 사용 -->
			</div>
			<!-- //cnts -->

		</div>
	</div>
	<script>
		//회원가입 버튼(회원가입 기능 작동)
		$(".update_button").click(function() {
			$("#updateMember").attr("action", "/member/updateMember");
			$("#updateMember").submit();
		});

		//회원탈퇴
		$(".deleteBtn").click(function() {
			$("#updateMember").attr("action", "/member/deleteMember.do");
			$("#updateMember").submit();
			alert("탈퇴가 완료되었습니다");
		});

		/* 비밀번호 확인 일치 유효성 검사 */
		$('.pwck_input').on("propertychange change keyup paste input",
				function() {

					var pw = $('.pw_input').val();
					var pwck = $('.pwck_input').val();
					$('.final_pwck_ck').css('display', 'none');

					if (pw == pwck) {
						$('.pwck_input_re_1').css('display', 'block');
						$('.pwck_input_re_2').css('display', 'none');
						pwckcorCheck = true;
					} else {
						$('.pwck_input_re_1').css('display', 'none');
						$('.pwck_input_re_2').css('display', 'block');
						pwckcorCheck = false;
					}

				});

		// 클릭시 email함수 호출
		$("#emailDubChkBtn").click(function() {
			email();
		});

		//직접입력을 눌러야만 입력창이 나오는 함수
		$("#emailDomainSel").click(function() {

			if ($("#emailDomainSel").val() == "06") {

				$("#emailDomain").show();
				console.log($("#emailDomain").val());
			} else {

				$("#emailDomain").hide();

			}

		})
	</script>

</body>
<%@include file="/WEB-INF/views/common/footer.jsp" %>