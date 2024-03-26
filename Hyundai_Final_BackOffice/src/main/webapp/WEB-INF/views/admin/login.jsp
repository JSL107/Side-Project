<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
%> 
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/login.css">
</head>
<body>
<div class="logo_area">
    <img class="logo" src="/resources/images/logo.png" style="display: block; margin: 0px auto;" alt />
</div>

<div class="body">
    <form id="login_form" class="login_form" method="post">
        <span class="login_text">로그인 </span>
        <input name="input_id" class="input_id" id="input_id"
               placeholder="아이디를 입력해주세요." />
        <input name="input_pw" class="input_pw" id="input_pw"
               type="password" placeholder="비밀번호를 입력해주세요." />
        <button class="login_button" onclick="login_button()" style="cursor:pointer" >
            <span class="login_button_text">로그인</span>
        </button>
        <br>
        <p class="-helphandsomecom">
            이용 문의는 담당자에게 문의 부탁드립니다.
        </p>
        <br>
        <p class="-helphandsomecom"><small>지원팀<small></p>
        <p class="-helphandsomecom"> help@handsome.com</p>
    </form>

   

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script>
    	$(document).ready(function(){
    		console.log(sessionStorage.length); //1	
    	});
        function login_button() {
        	let id = ("#input_id").val();
        	let password = ("#input_pw").val();
        	console.log(id);
        	console.log(password);
//         	if(id!=null||password!=null){
//         		$("#login_form").attr("action", "/admin/login");            
//                 $("#login_form").submit();	
//         	}
//         	else{
        		
//         	}
            
        }
        
    </script>

</div>
</body>
</html>
