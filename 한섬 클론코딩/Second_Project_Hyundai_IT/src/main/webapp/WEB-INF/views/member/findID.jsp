<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" href="/resources/css/layout.css" />
<link rel="stylesheet" href="/resources/css/content.css" />
</head>

<body>
	<!-- 다국어 한국에서만 사용 -->
	<input type="hidden" name="loginLayer" id="loginLayer" value="E">
	<div id="bodyWrap" class="login">

		<div class="sub_container">
			<div id="handsomeCust" class="login_wrap box_type_1 renewal1904">
				<div class="border_box1">
					<!-- 추가 190417 -->
					<div class="inner_box">
						<div class="title_wrap">
							<h4>아이디 찾기</h4>
						</div>
						<div id="hpIPLogin">
							<form id="find_form" method="post" aciton="findID.jsp"
								onsubmit="return frm_check();">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input type="hidden" name="inputId"
									id="inputId" value="">
								<fieldset>
									<legend>개인정보 입력항목</legend>
									<div class="login_section">
										<p class="login_err_txt" id="hpErrMsg"
											style="margin-left: 0px;"></p>
										<div>
											<div>
												<input class="name_input" name="mname" type="text"
													id="mname" placeholder="이름을 입력하세요." title="이름" value="">
											</div>
											<div>
												<input class="email_input" name="memail" type="text"
													id="memail" placeholder="이메일를 입력하세요." title="이메일"
													onkeyup="f_enterLogin()" />
											</div>
										</div>
										<c:if test="${result == 0 }">
											<div class="login_warn">입력된 정보와 같은 아이디가 없습니다.</div>
										</c:if>
										<c:if test="${result == 1}">
											<div class="login_warn">아이디는 : ${member.mid} 입니다</div>
										</c:if>
										<div class="find_button_wrap">
											<button href="javascript:f_loginCheck();" class="find_button">찾기</button>

										</div>

									</div>
								</fieldset>


							</form>
						</div>
					</div>
				</div>
			</div>
			<!--//login wrap-->
		</div>
		<!--//sub_container-->
	</div>
	<script>
		/* 로그인 버튼 클릭 메서드 */
		$(".find_button").click(function() {
			/* 로그인 메서드 서버 요청 */
			$("#find_form").attr("action", "/member/findID.do");
			$("#find_form").submit();
		});

		function f_enterLogin() {
			if (window.event.keyCode == 13) {
				$("#find_form").attr("action", "/member/findID.do");
				$("#find_form").submit();
			}
		}
	</script>