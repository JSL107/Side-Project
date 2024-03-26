<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
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
		<h3 class="cnts_title">
			<span>로그인</span>
		</h3>
		<div class="sub_container">
			<div id="handsomeCust" class="login_wrap box_type_1 renewal1904">
				<div class="border_box1">
					<div class="inner_box">
						<div class="title_wrap">
							<h4>회원</h4>
						</div>
						<div id="hpIPLogin">
							<form id="login_form" method="post" aciton="login.jsp"
								onsubmit="return frm_check();">
								<input type="hidden" name="inputId" id="inputId" value="">
								<fieldset>
									<legend>로그인 입력항목</legend>
									<div class="login_section">
										<p class="login_err_txt" id="hpErrMsg"
											style="margin-left: 0px;"></p>
										<div>
											<div>
												<input class="id_input" name="mid" type="text" id="mid"
													placeholder="아이디 입력하세요." title="아이디" value="">
											</div>
											<div>
												<input class="pw_iput" name="mpassword" type="password"
													id="j_password" placeholder="비밀번호를 입력하세요." title="비밀번호"
													onkeyup="f_enterLogin()" />
											</div>
										</div>
										<c:if test="${result == 0 }">
											<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
										</c:if>
										<div class="login_button_wrap">
											<button href="javascript:f_loginCheck();"
												class="login_button">로그인</button>
										</div>
										<div class="logSave">
											<input type="checkbox" class="save_id" name="checkId"
												id="saveId"> <label for="saveId">아이디 저장</label>
										</div>
									</div>
									<div class="memberFind">
										<div>
											<a onclick="showFindID()" id="otpShow" class="otp">아이디 찾기</a>
										</div>

									</div>
								</fieldset>


							</form>
						</div>
					</div>
				</div>
				<div class="border_box2">
					<!-- 추가 190417 -->
					<div class="inner_box step2" style="margin-top: 39px;">
						<div class="title_wrap">
							<h4 class="tlt_typ1">회원 가입</h4>
							<p class="txt">현대백화점 그룹의 모든 서비스를 모두 이용할 수 있는 ID를 만듭니다.</p>
							<p class="join_txt2 mt10">
								한섬 온라인/오프라인 매장에서 모두 사용하실 수 있으며, 구매 시 <br>한섬마일리지가 적립됩니다.<br>한섬
								온라인 멤버십 ‘THE 클럽’의 혜택을 받으실 수 있습니다
							</p>
						</div>
						<a href="/member/joinstart/" id="hpoinJoinBtn"
							class="btn add_ss join" style="margin-bottom: 40px">통합회원 가입</a>
					</div>
				</div>
			</div>
			<!--//login wrap-->
		</div>
		<!--//sub_container-->
	</div>
	<script>
		function showFindID() {
			window.open("/member/findID.do", "a",
					"width=600, height=700, left=100, top=50");
		}
		/* 로그인 버튼 클릭 메서드 */
		$(".login_button").click(function() {
			/* 로그인 메서드 서버 요청 */
			$("#login_form").attr("action", "/member/login");
			$("#login_form").submit();
		});

		function f_enterLogin() {
			if (window.event.keyCode == 13) {
				$("#login_form").attr("action", "/member/login");
				$("#login_form").submit();
			}
		}
		$(function() {

			fnInit();

		});

		function frm_check() {
			saveid();
		}

		function fnInit() {
			var cookieid = getCookie("saveid");
			console.log(cookieid);
			if (cookieid != "") {
				$("input:checkbox[id='saveId']").prop("checked", true);
				$('#mid').val(cookieid);
			}

		}

		function setCookie(name, value, expiredays) {
			var todayDate = new Date();
			todayDate.setTime(todayDate.getTime() + 0);
			if (todayDate > expiredays) {
				document.cookie = name + "=" + escape(value)
						+ "; path=/; expires=" + expiredays + ";";
			} else if (todayDate < expiredays) {
				todayDate.setDate(todayDate.getDate() + expiredays);
				document.cookie = name + "=" + escape(value)
						+ "; path=/; expires=" + todayDate.toGMTString() + ";";
			}

			console.log(document.cookie);
		}

		function getCookie(Name) {
			var search = Name + "=";
			console.log("search : " + search);

			if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
				offset = document.cookie.indexOf(search);
				console.log("offset : " + offset);
				if (offset != -1) { // 쿠키가 존재하면 
					offset += search.length;
					// set index of beginning of value
					end = document.cookie.indexOf(";", offset);
					console.log("end : " + end);
					// 쿠키 값의 마지막 위치 인덱스 번호 설정 
					if (end == -1)
						end = document.cookie.length;
					console.log("end위치  : " + end);

					return unescape(document.cookie.substring(offset, end));
				}
			}
			return "";
		}

		function saveid() {
			var expdate = new Date();
			if ($("#saveId").is(":checked")) {
				expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
				setCookie("saveid", $("#mid").val(), expdate);
			} else {
				expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
				setCookie("saveid", $("#mid").val(), expdate);

			}
		}
	</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>