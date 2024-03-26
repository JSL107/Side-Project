<%--Written  by 여명--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Session</title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp" />
	<%
	request.setCharacterEncoding("UTF-8");
	%>
	<div id="wrap" class="main" style="width:500px; margin:auto;">
		<h2>로그인 페이지</h2>
		<span style="color: red; font-size: 1.2em;"> <%=request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")%>
		</span>
		<%
		if (session.getAttribute("UserId") == null) { // 로그인 상태 확인
			// 로그아웃 상태
		%>
		<script>
			function validateForm(form) {
				if (!form.user_id.value) {
					alert("아이디를 입력하세요.");
					return false;
				}
				if (form.user_pw.value == "") {
					alert("패스워드를 입력하세요.");
					return false;
				}
			}
		</script>
		<form action="TohomeServlet?command=login" method="post"
			name="loginFrm" onsubmit="return validateForm(this);">
			아이디 : <input type="text" name="user_id" /><br /> 패스워드 : <input
				type="password" name="user_pw" /><br /> <input type="submit"
				value="로그인하기" />
			<div>
				<input type="button" value="회원가입"
					onclick="location='TohomeServlet?command=join_form'">
			</div>
		</form>

		<%
		} else { // 로그인된 상태
		%>
		<%=session.getAttribute("UserName")%>
		회원님, 로그인하셨습니다.<br />
		<%
		}
		%>
	</div>
	<!-- footer// -->
	<jsp:include page="../Common/footer.jsp" />
	<!-- //footer -->
</body>
</html>