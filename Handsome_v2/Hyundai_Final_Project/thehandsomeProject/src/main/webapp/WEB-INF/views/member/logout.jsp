
<html>
<!-- 제이쿼리 cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<body>
<form id='logoutAction' action="/member/customLogout" method='post'>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<script>
    // location.href='http://localhost:8080/product/styleList/'+style;
    var form = $('#logoutAction')
    form.submit();

</script>
</body>
</html>