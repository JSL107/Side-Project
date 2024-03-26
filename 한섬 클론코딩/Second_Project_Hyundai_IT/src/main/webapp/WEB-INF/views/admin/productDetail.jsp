<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/eventDetail.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>이벤트 상세</span>
		</div>
		<div class="admin_content_main">
			<div class="form_section">
				<div class="form_section_title">
					<label>이벤트 번호</label>
				</div>
				<div class="form_section_content">
					<input class="input_block" name="eid" readonly="readonly"
						value="<c:out value='${event.eid}'></c:out>">

				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>이벤트 이름</label>
				</div>
				<div class="form_section_content">
					<input class="input_block" name="ename" readonly="readonly"
						value="<c:out value='${event.ename}'></c:out>">
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>이벤트 소개</label>
				</div>
				<div class="form_section_content">
					<input class="input_block" name="ename" readonly="readonly"
						value="<c:out value='${event.edetail }'></c:out>">
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>등록 날짜</label>
				</div>
				<div class="form_section_content">
					<input class="input_block" type="text" readonly="readonly"
						value="<fmt:formatDate value="${event.estartdate}" pattern="yyyy-MM-dd"/>">
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>종료 날짜</label>
				</div>
				<div class="form_section_content">
					<input class="input_block" type="text" readonly="readonly"
						value="<fmt:formatDate value="${event.eenddate}" pattern="yyyy-MM-dd"/>">
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>쿠폰 이미지</label>
				</div>
				<div class="form_section_content">
					<img src="../../../resources/upload/<c:out value="${event.eimage}"></c:out>">
					<!-- 이미지 타입으로 수정 필요 -->
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>할인률</label>
				</div>
				<div class="form_section_content">
					<input class="input_block" name="eamount" readonly="readonly"
						value="<c:out value='${event.eamount}'></c:out>">
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>최대금액</label>
				</div>
				<div class="form_section_content">
					<input class="input_block" name="elimit" readonly="readonly"
						value="<c:out value='${event.elimit}'></c:out>">
				</div>
			</div>
			<div class="btn_section">
				<button id="cancelBtn" class="btn">이벤트 목록</button>
				<button id="modifyBtn" class="btn modify_btn">수 정</button>
			</div>
		</div>
	</div>

	<form id="moveForm" method="get">
		<input type="hidden" name="eid" value='<c:out value="${event.eid }"/>'>
		<input type="hidden" name="pageNum"
			value='<c:out value="${cri.pageNum }"/>'> <input
			type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>
		<input type="hidden" name="keyword"
			value='<c:out value="${cri.keyword }"/>'>
	</form>
	<script>
		let moveForm = $("#moveForm");

		/* 이벤트 관리 페이지 이동 버튼 */
		$("#cancelBtn").on("click", function(e) {

			e.preventDefault();

			$("input[name=eid]").remove();
			moveForm.attr("action", "/admin/eventManage")
			moveForm.submit();

		});

		/* 이벤트 수정 페이지 이동 버튼 */
		$("#modifyBtn").on("click", function(e) {

			e.preventDefault();

			moveForm.attr("action", "/admin/eventModify");
			moveForm.submit();

		});
	</script>
</body>
</html>