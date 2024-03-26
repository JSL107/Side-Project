<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="/WEB-INF/views/common/header.jspf" %>
<!-- 회원 등록 알림 alert창 -->
<script>
    Swal.fire({
        icon: 'success',  // 여기다가 아이콘 종류를 쓰면 됩니다.
        title: '회원이 등록되었습니다.',
        text: '회원가입 축하 쿠폰이 지급되었습니다.',
    }).then(function(){
        location.href='/member/loginForm';
    });
</script>