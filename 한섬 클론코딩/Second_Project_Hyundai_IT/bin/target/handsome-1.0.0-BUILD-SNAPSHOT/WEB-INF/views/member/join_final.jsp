<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/join.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<link rel="shortcut icon"
	href="http://cdn.thehandsome.com/_ui/desktop/common/images/common/thehandsome_ic_16x16.ico" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/_ui/desktop/common/css/font_443.css" media="all" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/_ui/desktop/common/css/common.css?20220929" media="all" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/_ui/desktop/common/css/layout.css?20220826" media="all" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/_ui/desktop/common/css/popup.css?20210225" media="all" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/_ui/desktop/common/css/jquery-ui.min.css" media="all" />

<link rel="stylesheet" type="text/css"
	href="../../../resources/_ui/desktop/common/css/brand.css" media="all" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/_ui/desktop/common/css/footer.css?20220406" media="all" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/_ui/desktop/common/css/contents.css?20220907" media="all" />
<style type="text/css" media="print">
@IMPORT url("../../../resources/_ui/desktop/common/css/print.css");
</style>

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
						<li class="step02">step02 회원약관동의</li>
						<li class="step03">step03 회원정보 입력</li>
						<li class="step04 on">step04 가입완료</li>
					</ul>
				</div>
				<!--//join step-->
				<!--sub container-->
				<div class="sub_container">
					<div class="join_title">
						<p class="title">회원가입이 완료 되었습니다.</p>
						<p class="s_title">
							한섬통합몰의 회원이 되신 것을 축하드립니다.<br>입력하신 개인 정보는 <a
								href="/ko/mypage/personInfomationChangePWCheck"><em
								class="ft_point01">'마이페이지 &gt; 나의 정보관리 &gt; 개인정보변경'</em></a>에서 바로 수정
							가능합니다.
						</p>
					</div>
					<div class="btnwrap mt60">
						<input type="button" value="메인으로 이동" class="btn wt" id="mainBtn" onClick="location.href='/'"/>
						<input type="button" value="로그인" class="btn gray mr0"
							id="loginBtn" onClick="location.href='./login'"/>
					</div>
				</div>
				<!--//sub container-->
			</div>
		</form>
	</div>
	<script>
		$(document).ready(function() {
			//회원가입 버튼(회원가입 기능 작동)
			$(".join_button").click(function() {
				/* 최종 유효성 검사 */
				$("#memberJoinForm").attr("action", "/member/join_sec");
				$("#memberJoinForm").submit();
				return false;
			});
		});
		$(document).ready(function() {
			//취소 버튼(메인 페이지로 이동)
			$(".cancle_button").click(function() {
				/* 최종 유효성 검사 */
				$("#memberJoinForm").attr("action", "/member/join_sec");
				$("#memberJoinForm").submit();
				return false;
			});

		});
	</script>
</body>
</html>