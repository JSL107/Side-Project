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
							<form id="loginform" method="post" aciton="login.jsp"
								onsubmit="return frm_check();">
								<input type="hidden" name="inputId" id="inputId" value="">
								<fieldset>
									<legend>로그인 입력항목</legend>
									<div class="login_section">
										<p class="login_err_txt" id="hpErrMsg"
											style="margin-left: 0px; margin-bottom: 35px;"></p>
										<div>
											<div>
												<input class="id_input" name="mid" type="text" id="mid"
													placeholder="아이디 입력하세요." title="아이디" value=""
													style="width: 410px; height: 35px;">
											</div>
											<div>
												<input class="pw_iput" name="mpassword" type="password"
													id="j_password" placeholder="비밀번호를 입력하세요." title="비밀번호"
													onkeyup="f_enterLogin()"
													style="width: 410px; height: 35px; margin-top: 5px;">
											</div>
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" />
										</div>
										<c:if test="${result == 0 }">
											<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
										</c:if>
										<div class="login_button_wrap"
											style="width: 410px; height: 35px; padding-top: 25px;">
											<input type="button" class="login_button btn add_ss join"
												href="javascript:f_loginCheck();" value="로그인"
												style="width: 410px; height: 35px;">
										</div>
										<div class="logSave">
											<input type="checkbox" class="save_id" name="checkId"
												id="saveId"> <label for="saveId">아이디 저장</label>
										</div>

									</div>
								</fieldset>

							</form>
						</div>
						<div class="section_bottom">
							<p>
								<span class="bul_sty01" style="margin-bottom: 30px;"> 아이디
									/ 비밀번호를 잊으셨나요?</span> <a onclick="showFindID()" target="_blank"
									class="btn add_ss">아이디 찾기</a> <a
									href="https://www.h-point.co.kr/cu/config/findCustPwd.nhd"
									target="_blank" class="btn add_ss">비밀번호 찾기</a>
							</p>
						</div>
					</div>
				</div>
				<div class="border_box2">
					<!-- 추가 190417 -->
					<div class="inner_box step2">
						<div class="title_wrap">
							<h4 class="tlt_typ1">H.Point 통합회원 가입</h4>
							<p class="txt">현대백화점 그룹의 모든 서비스를 모두 이용할 수 있는 ID를 만듭니다.</p>
							<p class="join_txt2 mt10">
								한섬 온라인/오프라인 매장에서 모두 사용하실 수 있으며, 구매 시 <br />한섬마일리지가 적립됩니다.<br />한섬
								온라인 멤버십 ‘THE 클럽’의 혜택을 받으실 수 있습니다
							</p>
						</div>
						<a href="https://www.h-point.co.kr/cu/join/start.nhd"
							id="hpoinJoinBtn" class="btn add_ss join"
							style="margin-bottom: 40px; width: 366px;">통합회원 가입</a>
						<div class="title_wrap">
							<h4 class="tlt_typ1">더한섬닷컴 간편회원 가입</h4>
							<p class="txt" style="line-height: 1.5;">
								본인인증 절차 없이, 더한섬닷컴에서 제공하는 서비스만 제한적으로<br />이용할 수 있는 ID를 만듭니다.
							</p>
							<p class="join_txt2 mt10">
								더한섬닷컴에서 사용 가능하며, 오프라인 매장에서는 사용할 수 없습니다.<br /> <span>한섬마일리지와
									현대백화점그룹 H.Point 혜택, 한섬의 온라인 멤버십 서비스<br />‘THE 클럽’의 혜택은 제공되지
									않습니다.
								</span>
							</p>
						</div>
						<div class="title_wrap hide" id="eg_block">
							<a href="/member/joinstart" class="btn add_ss join"
								style="width: 366px">간편회원 가입</a>
							<p class="join_txt2 mt20">
								<span>※ 간편회원은 e-Gift Card 구매 및 등록이 불가능합니다.<br>통합회원
									가입 후 이용해 주세요.
								</span>
							</p>
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
		$(".login_button").click(function() {
			/* 로그인 메서드 서버 요청 */
			$("#loginform").attr("action", "/member/login");
			$("#loginform").submit();
		});
	</script>
	<script>
		function showFindID() {
			window.open("/member/findID.do", "a",
					"width=600, height=700, left=100, top=50");
		}
		/* 로그인 버튼 클릭 메서드 */
		$(".login_button").click(function() {
			/* 로그인 메서드 서버 요청 */
			$("#loginform").attr("action", "/member/login");
			$("#loginform").submit();
		});

		function f_enterLogin() {
			if (window.event.keyCode == 13) {
				$("#loginform").attr("action", "/member/login");
				$("#loginform").submit();
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