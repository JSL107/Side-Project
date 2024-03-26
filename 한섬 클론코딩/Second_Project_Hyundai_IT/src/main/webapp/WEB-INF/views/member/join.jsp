<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/resources/css/member/join.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div class="input_infomation"
		style="margin-left: 80px; margin-right: 80px; margin-bottom: 80px;">

		<!-- 회원가입 제출 form -->
		<form method="post" action="/member/join" id="mFrm"
			onsubmit="return joinCheck();">
			<!-- 아이디  비밀번호 -->
			<div id="bodyWrap">
				<!--title-->
				<h3 class="cnts_title">
					<span>회원가입</span>
				</h3>
				<div class="sub_container">
					<div class="join_title">
						<p class="title" style="margin-top: 30px;">고객님의 회원정보를 입력해주세요.</p>
					</div>
					<fieldset>
						<legend>회원정보입력</legend>
						<div class="box_type_1">
							<div class="title_wrap clearfix">
								<h4 class="float_left">회원정보</h4>
								<p class="reqd_txt float_right">
									<strong class="reqd">*</strong> 표시는 필수항목입니다.
								</p>
							</div>
							<div class="tblwrap">
								<table class="tbl_wtype1">
									<caption>회원가입 입력항목</caption>
									<colgroup>
										<col style="width: 160px" />
										<col />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><strong class="reqd">*</strong><label
												for="mid">아이디</label></th>

											<td><input type="text" style="width: 120px" id="id"
												name='mid' oninput="checkId()" required class="id_input"/> <span
												class="id_input_re_1">사용 가능한 아이디입니다.</span> <span
												class="id_input_re_2">아이디가 이미 존재합니다.</span> <span
												class="final_id_ck">아이디를 입력해주세요.</span></td>
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
											<th scope="row"><strong class="reqd">*</strong><label
												for="pw">비밀번호</label></th>
											<td><input type="password" id="pw" name='mpassword'
												style="width: 150px" title="비밀번호" required class="pw_input" />
												<span class="guide_comment lh_30" id="pwMsg"></span> <span
												class="guide_comment lh_30" id="pwcapsLockMsg"></span></td>
										</tr>

										<tr>
											<th scope="row"><strong class="reqd">*</strong> <label
												for="pw2">비밀번호 확인</label></th>
											<td><input type="password" id="pwc" style="width: 150px"
												title="비밀번호 확인" required class="pwck_input" /> <span
												class="pwck_input_re_1">비밀번호가 일치합니다.</span> <span
												class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span></td>
										</tr>

										<tr>
											<th scope="row"><strong class="reqd">*</strong><label
												for="name">이름</label></th>
											<td><input type="text" style="width: 150px" id="name"
												name='mname' required /></td>
										</tr>
										<tr>
											<th scope="row"><strong class="reqd">*</strong><label
												for="mtel">전화번호</label></th>
											<td><input type="text" style="width: 150px" id="name"
												name='mtel' required /></td>
										</tr>
										<tr>
											<th scope="row"><strong class="reqd">*</strong><label
												for="mzipcode">우편번호</label></th>
											<td><input type="text" style="width: 150px"
												id="maddress1" name='maddress1' class="add1_input" /><input type="button" class="address_button" value="주소찾기"
										onclick="execution_daum_address()"></td>
										</tr>
										<tr>
											<th scope="row"><strong class="reqd">*</strong><label
												for="maddress1">주소</label></th>
											<td><input type="text" style="width: 200px"
												id="maddress2" name='maddress2' class="add2_input" /></td>
										</tr>
										<tr>
											<th scope="row"><label for="maddress2">상세 주소</label></th>
											<td><input type="text" style="width: 200px"
												id="maddress3" name='maddress3'class="add3_input"  /></td>
										</tr>
									</tbody>
								</table>
							</div>


							<div class="btnwrap">
								<input type="button" value="취소" class="btn wt" id="cancleBtn"
									onClick="location.href='login'" />
								<button type="submit" id="join_button" class="btn gray mr0">회원가입</button>

							</div>
						</div>
					</fieldset>
				</div>
				<!--//sub container-->
			</div>
			<!--// 확인, 취소 -->
		</form>
	</div>

	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


	<script>
		/* 유효성 검사 통과유무 변수 */
		var idCheck = false; // 아이디
		var idckCheck = false; // 아이디 중복 검사
		var pwCheck = false; // 비번
		var pwckCheck = false; // 비번 확인
		var pwckcorCheck = false; // 비번 확인 일치 확인
		var nameCheck = false; // 이름
		var addressCheck = false // 주소

		$(document).ready(
				function() {
					//회원가입 버튼(회원가입 기능 작동)
					$(".join_button").click(
							function() {
								$(".join_button").click(
										function() {

											/* 입력값 변수 */
											var id = $('.id_input').val(); // id 입력란
											var pw = $('.pw_input').val(); // 비밀번호 입력란
											var pwck = $('.pwck_input').val(); // 비밀번호 확인 입력란
											var name = $('.user_input').val(); // 이름 입력란
											var addr = $('.add3_input').val(); // 주소 입력란

											/* 아이디 유효성검사 */
											if (id == "") {
												$('.final_id_ck').css(
														'display', 'block');
												idCheck = false;
											} else {
												$('.final_id_ck').css(
														'display', 'none');
												idCheck = true;
											}

											/* 비밀번호 유효성 검사 */
											if (pw == "") {
												$('.final_pw_ck').css(
														'display', 'block');
												pwCheck = false;
											} else {
												$('.final_pw_ck').css(
														'display', 'none');
												pwCheck = true;
											}
											/* 비밀번호 확인 유효성 검사 */
											if (pwck == "") {
												$('.final_pwck_ck').css(
														'display', 'block');
												pwckCheck = false;
											} else {
												$('.final_pwck_ck').css(
														'display', 'none');
												pwckCheck = true;
											}

											/* 이름 유효성 검사 */
											if (name == "") {
												$('.final_name_ck').css(
														'display', 'block');
												nameCheck = false;
											} else {
												$('.final_name_ck').css(
														'display', 'none');
												nameCheck = true;
											}

											/* 주소 유효성 검사 */
											if (addr == "") {
												$('.final_addr_ck').css(
														'display', 'block');
												addressCheck = false;
											} else {
												$('.final_addr_ck').css(
														'display', 'none');
												addressCheck = true;
											}

											/* 최종 유효성 검사 */
											if (idCheck && idckCheck && pwCheck
													&& pwckCheck
													&& pwckcorCheck
													&& nameCheck
													&& addressCheck) {
												$("#join_form").attr("action",
														"/member/join");
												$("#join_form").submit();
											}
											return false;
										});
							});
				});
		//아이디 중복검사
		$('.id_input').on(
				"propertychange change keyup paste input",
				function() {
					var mid = $('.id_input').val(); // .id_input에 입력되는 값
					var data = {
						mid : mid
					} // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
					$.ajax({
						type : "post",
						url : "/member/memberIdChk",
						data : data,
						success : function(result) {// console.log("성공 여부" + result);
							if (result != 'fail') {
								$('.id_input_re_1').css("display",
										"inline-block");
								$('.id_input_re_2').css("display", "none");
								// 아이디 중복이 없는 경우
								idckCheck = true;
							} else {
								$('.id_input_re_2').css("display",
										"inline-block");
								$('.id_input_re_1').css("display", "none");
								// 아이디 중복된 경우
								idckCheck = false;
							}
						}
					});
				});
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
							$(".add1_input").val(data.zonecode);
							$(".add2_input").val(addr);
							// 커서를 상세주소 필드로 이동한다.
							$(".add3_input").focus();
						}
					}).open();

		}
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
	</script><%@ include file="/WEB-INF/views/common/footer.jsp"%>