<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<form id="loginForm" name="loginForm" method="post">
    <input type="text" id="referer" name="referer" style="display: none;" value=" ">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <input type="text" name="username" value="${kakao_id}">
</form>
<script>
    var referer = "http://localhost:8080"
    console.log(referer);
    $("#referer").val(referer);
    $("#loginForm").attr("action", "/login");
    $('#loginForm').submit();
</script>
</body>
</html>
