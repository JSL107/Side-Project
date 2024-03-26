<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/member/join.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<link rel="shortcut icon"
	href="http://cdn.thehandsome.com/_ui/desktop/common/images/common/thehandsome_ic_16x16.ico" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/_ui/desktop/common/css/font_443.css"
	media="all" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/_ui/desktop/common/css/common.css?20220929"
	media="all" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/_ui/desktop/common/css/layout.css?20220826"
	media="all" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/_ui/desktop/common/css/popup.css?20210225"
	media="all" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/_ui/desktop/common/css/jquery-ui.min.css"
	media="all" />

<link rel="stylesheet" type="text/css"
	href="../../../resources/_ui/desktop/common/css/brand.css" media="all" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/_ui/desktop/common/css/footer.css?20220406"
	media="all" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/_ui/desktop/common/css/contents.css?20220907"
	media="all" />
<style type="text/css" media="print">
@IMPORT url("../../../resources/_ui/desktop/common/css/print.css");
</style>

<script type="text/javascript"
	src="/_ui/desktop/common/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript"
	src="/_ui/desktop/common/js/jquery.vticker.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>

<body>
	<div class="wrapper">
		<form id="memberJoinForm" method="POST">

			<!-- bodyWrap -->
			<div id="bodyWrap">
				<!--title-->
				<h3 class="cnts_title">
					<span>회원가입</span>
				</h3>
				<!--//title-->
				<!--email step-->
				<div class="email_step">
					<ul class="clearfix">
						<li class="step01 on">step01 이메일인증</li>
						<li class="step02">step02 회원약관동의</li>
						<li class="step03">step03 회원정보 입력</li>
						<li class="step04">step04 가입완료</li>
					</ul>
				</div>
				<!--/email  step-->
				<!--sub container-->
				<div class="sub_container">
					<div class="join_title">
						<p class="title">더한섬닷컴에 가입을 환영합니다.</p>
						<p class="s_title">
							<strong>본인인증 절차 없이, 더한섬닷컴에서 제공하는 서비스만 제한적으로 이용할 수 있습니다.</strong><br />더한섬닷컴에서
							사용 가능하며, <span
								style="color: #c69c6c; font-weight: normal; text-decoration: underline;">오프라인
								매장에서는 사용할 수 없습니다.<br />한섬마일리지와 현대백화점그룹 H.Point 혜택, 한섬의 온라인 멤버십
								서비스 ‘THE 클럽’의 혜택은 제공되지 않습니다.
							</span>
						</p>
					</div>
					<fieldset>
						<legend>본인인증</legend>
						<div class="box_type_1">

							<div class="mail_wrap">

								<p>
									<strong>이메일인증으로 회원가입</strong>
								</p>
								<p>정보입력은 입력한 메일을 통한 인증 후 가능합니다.</p>
								<div class="mail_name">이메일</div>
								<div class="mail_input_box">
									<input class="mail_input" name="memail"> <span
										class="final_mail_ck">이메일을 입력해주세요.</span>
									<div class="mail_check_wrap">
										<div class="mail_check_input_box"
											id="mail_check_input_box_false">
											<input class="mail_check_input" disabled="disabled">
										</div>
										<div class="mail_check_button">
											<span>인증번호 전송</span>
										</div>
										<div class="clearfix"></div>
										<span id="mail_check_input_box_warn"></span>
									</div>
								</div>
							</div>
							<div class="join_button_wrap">
								<input type="button" class="join_button" value="인증완료">
							</div>
						</div>
					</fieldset>
					<div class="jo_bottom_banner">
						<div class="left_banner">
							<a
								href="http://www.thehandsome.com/ko/magazine/events/8802941687680"
								target="_blank">통합회원 가입 시 <br />가입 축하 <span
								style="color: #c69c6c;">정상 15% & 아울렛 5% 쿠폰</span> 증정<span
								class="dtil_viw">자세히 보기 >></span></a>
						</div>
						<div class="right_banner">
							<a href="/ko/svcenter/theClubInfo" target="_blank">통합회원을 위한<br />한섬
								온라인 멤버십 <span style="color: #c69c6c;">THE 클럽</span><span
								class="dtil_viw">자세히 보기 >></span></a>
						</div>
					</div>
				</div>
				<!--//sub container-->
			</div>
		</form>
	</div>
	<!-- //bodyWrap -->
	<script>
		var code = ""; //이메일전송 인증번호 저장위한 코드
		/* 인증번호 이메일 전송 */
		$(".mail_check_button").click(function() {

			var email = $(".mail_input").val(); // 입력한 이메일
			var cehckBox = $(".mail_check_input"); // 인증번호 입력란
			var boxWrap = $(".mail_check_input_box"); // 인증번호 입력란 박스

			$.ajax({
				type : "GET",
				url : "/member/mailCheck?email=" + email,
				success : function(data) {
					console.log("data : " + data);
					cehckBox.attr("disabled", false);
					boxWrap.attr("id", "mail_check_input_box_true");
					code = data;
				}
			});

		});
		/* 인증번호 비교 */
		$(".mail_check_input").blur(function() {

			var inputCode = $(".mail_check_input").val(); // 입력코드    
			var checkResult = $("#mail_check_input_box_warn"); // 비교 결과     

			if (inputCode == code) { // 일치할 경우
				checkResult.html("인증번호가 일치합니다.");
				checkResult.attr("class", "correct");
			} else { // 일치하지 않을 경우
				checkResult.html("인증번호를 다시 확인해주세요.");
				checkResult.attr("class", "incorrect");
			}

		});

		/* 유효성 검사 통과유무 변수 */
		var mailCheck = false; // 이메일

		$(document).ready(
				function() {
					//회원가입 버튼(회원가입 기능 작동)
					$(".join_button").click(
							function() {
								$(".join_button").click(
										function() {

											/* 입력값 변수 */
											var mail = $('.mail_input').val(); // 이메일 입력란

											/* 이메일 유효성 검사 */
											if (mail == "") {
												$('.final_mail_ck').css(
														'display', 'block');
												mailCheck = false;
											} else {
												$('.final_mail_ck').css(
														'display', 'none');
												mailCheck = true;
											}

											/* 최종 유효성 검사 */
											if (mailCheck) {
												$("#memberJoinForm").attr(
														"action",
														"/member/joinstart");
												$("#memberJoinForm").submit();
											} else {
												consol.log("ㅆㅂ");
											}
											return false;
										});
							});
				});
	</script>

</body>
</html>