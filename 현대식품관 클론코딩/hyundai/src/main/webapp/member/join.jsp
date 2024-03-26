<%--written by 승준, 승준--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
String gender = "";
%>
<html>
<head>
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- jquery -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 주소api -->
<script>
        function go_save() {
            if (document.formm.id.value == "") {
                alert("아이디를 입력하여 주세요.");
                document.formm.id.focus();
            } else if (document.formm.id.value != document.formm.reid.value) {
                alert("중복확인을 클릭하여 주세요.");
                document.formm.id.focus();
            } else if (document.formm.pwd.value == "") {
                alert("비밀번호를 입력해 주세요.");
                document.formm.pwd.focus();
            } else if ((document.formm.pwd.value != document.formm.pwdCheck.value)) {
                alert("비밀번호가 일치하지 않습니다.");
                document.formm.pwd.focus();
            } else if (document.formm.name.value == "") {
                alert("이름을 입력해 주세요.");
                document.formm.name.focus();
            } else {
                document.formm.action = "TohomeServlet?command=join";
                document.formm.submit();
            }
        }

        function idcheck() {
            if (document.formm.id.value == "") {
                alert('아이디를 입력하여 주십시오.');
                document.formm.id.focus();
                return;
            }
            var url = "TohomeServlet?command=id_check_form&id=" + document.formm.id.value;
            window.open( url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=330, height=200");
        }
        window.onload = function(){
        document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
          //카카오 지도 발생
          new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
              document.getElementById("adress").value = data.address; // 주소 넣기
              document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
            }
          }).open();
        });
      }
    </script>
</head>
<body>
	<jsp:include page="../Common/Link.jsp" />
	<div id="wrap" class="main" style="width:500px; margin:auto;">
		<article>

			<h2>Join Us</h2>
			<form id="join" action="TohomeServlet?command=join" method="post"
				name="formm">
				<fieldset>
					<legend>Basic Info</legend>
					<label>User ID</label> <input type="text" name="id" size="12">
					<input type="hidden" name="reid"> <input type="button"
						value="중복 체크" class="dup" onclick="idcheck()"><br> <label>Password</label>
					<input type="password" class="pw" id="pw1" name="pwd"><br>
					<label>Retype Password</label> <input type="password" class="pw"
						id="pw2" name="pwdCheck"><br> <font id=check_pw></font><br>
					<label>Name</label> <input type="text" name="name"><br>
					생년월일 : <input type="date" name="birth_ymd" id="date" value="" /><br />
					핸드폰번호 : <input type="text" id="mobile_num" name="mobile_num"
						value="" /><br /> 성별 : <span><input type="radio"
						name="gender" value="1" onclick='getGender(event)'
						style="position: relative; left: 0;">남자 <input
						type="radio" name="gender" value="0" onclick='getGender(event)'
						style="position: relative; left: 0;">여자</span><br /> <font
						id="gender" value="" style="display: none;"></font> 주소 : <input
						type=text name="main_address" id="adress" value=""> <input
						type="button" id="address_kakao" name="address" value="주소검색"
						readonly /><br /> 상세 주소: <input type="text" id="address_detail"
						name="address_detail" value="" /> <br /> 주소 별명: <input
						type="text" id="address_name" name="address_name"
						placeholder="별명 :ex) 집, 회사 " value=""> <br />

				</fieldset>
				<div class="clear"></div>
				<div id="buttons">
					<input type="button" value="회원가입" class="submit"
						onclick="go_save()"> <input type="reset" value="취소"
						class="cancel">
				</div>
			</form>



		</article>
	</div>
	<!-- footer// -->
	<jsp:include page="../Common/footer.jsp" />
	<!-- //footer -->
	<script>
  //성별 값 넣기
  function getGender() {
    genderNodeList.forEach((node) => {
      if(node.checked)  {
        gender = node.value;
      }
    })
  }
  //비밀번호 같은지 확인
  $('.pw').keyup(function() { //pw의 이름을 가지는 모든클래스를 잡아준다
    var pass1 = $("#pw1").val(); //id 값이 pw1인값을 변수에 넣어준다
    var pass2 = $("#pw2").val();

    if (pass1 != "" || pass2 != "") { //하나라도 입력이 되면 작동
      if (pass1 == pass2) { //두개의 값이 같으면
        $("#check_pw").html('비밀번호가 일치합니다'); //<font> 안에 값을 출력
        $("#check_pw").attr('color', 'green'); // 색변경
      } else {
        $("#check_pw").html('비밀번호가 다릅니다');
        $("#check_pw").attr('color', 'red');
      }
    }
  })
</script>
</body>
</html>
