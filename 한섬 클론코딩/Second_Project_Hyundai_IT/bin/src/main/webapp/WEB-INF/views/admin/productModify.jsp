<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/eventModify.css">

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
			<form id="modifyForm" action="/admin/eventModify" method="post">
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
						<input name="ename" value="<c:out value='${event.ename}'></c:out>">
						<span id="ename">이벤트 이름을 입력 해주세요.</span>
					</div>
				</div>

				<div class="form_section">
					<div class="form_section_title">
						<label>이벤트 소개</label>
					</div>
					<div class="form_section_content">
						<textarea name="edetail"><c:out
								value='${event.edetail }' /></textarea>
						<span id="edetail">이벤트 소개를 입력 해주세요.</span>
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
				</div>
				<div class="btn_section">
					<button id="cancelBtn" class="btn">취소</button>
					<button id="modifyBtn" class="btn modify_btn">수 정</button>
					<button id="deleteBtn" class="btn delete_btn">삭 제</button>
				</div>
			</form>
		</div>
	</div>

	<form id="moveForm" method="get">
		<input type="hidden" name="eid" value='<c:out value="${event.eid}"/>'>
		<input type="hidden" name="pageNum"
			value='<c:out value="${cri.pageNum}"/>'> <input type="hidden"
			name="amount" value='<c:out value="${cri.amount}"/>'> <input
			type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
	</form>
	<script>
		let moveForm = $("#moveForm");
		let modifyForm = $("#modifyForm");

		/* 작가 상세 페이지 이동 버튼 */
		$("#cancelBtn").on("click", function(e) {

			e.preventDefault();
			moveForm.attr("action", "/admin/eventDetail")
			moveForm.submit();

		});
		/* 삭제 버튼 */
		$("#deleteBtn")
				.on(
						"click",
						function(e) {
							e.preventDefault();
							moveForm.find("input").remove();
							moveForm.append('<input type="hidden" name="eid" value="${event.eid}">');
							moveForm.attr("action", "/admin/eventDelete");
							moveForm.attr("method", "post");
							moveForm.submit();
						});

		/* 작가 수정 버튼 작동 및 유효성 검사 */
		$("#modifyBtn").on("click", function(e) {

			let ename = $(".form_section_content input[name='ename']").val();
			let edetail = $(".form_section_content textarea").val();

			let nameCk = false;
			let detailCk = false;

			e.preventDefault();

			if (!ename) {
				$("#ename").css("display", "block");
			} else {
				$("#ename").css("display", "none");
				nameCk = true;
			}
			if (!edetail) {
				$("#edetail").css("display", "block");
			} else {
				$("#edetail").css("display", "none");
				introCk = true;
			}

			if (nameCk && detailCk) {
				modifyForm.submit();
			} else {
				return false;
			}

		});
	</script>
</body>
</html>