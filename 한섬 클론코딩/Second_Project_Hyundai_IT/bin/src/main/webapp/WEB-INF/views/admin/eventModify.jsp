<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 수정</title>
<link rel="stylesheet" href="../resources/css/admin/eventModify.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<div id="bodyWrap">
		<h3 class="cnts_title">
			<span id="menuTitle">이벤트 수정</span>
		</h3>
		<div class=""
			style="position: relative; width: 834px; height: 0; display: block; left: 50%; margin-left: -338px;">
			<div class="delch_box tooltip1907" id="store_delbox"
				style="display: none;">
				<span class="arr">위치아이콘</span> 작성 가능한 상품평 확인하시고,<br> 상품평 작성해서
				추가 마일리지 적립하세요.
			</div>
		</div>
		<div class="sub_container">
			<!-- lnb -->
			<div class="lnb_wrap">
				<h4>
					<a href="/admin/main">관리자페이지<!-- 마이페이지 --></a>
				</h4>
				<%--  TODO :: 후에 링크 변경--%>
				<div class="lnb">
					<dl>
						<dt>관리메뉴</dt>
						<dd>
							<a href="/admin/productAdd">상품등록</a>
						</dd>
						<dd>
							<a href="/admin/productManage">상품목록</a>
						</dd>
						<dd>
							<a href="/admin/eventAdd">이벤트등록</a>
						</dd>
						<dd>
							<a href="/admin/eventManage">이벤트목록</a>
						</dd>
						<dd>
							<a href="/admin/eventManage">통계</a>
						</dd>
						<dd>
							<a href="/qna/qnaMain">고객센터</a>
						</dd>

					</dl>
				</div>
				<div class="ph_guide">
					<p class="tlt">고객센터 운영 안내</p>
					<p class="phone">
						1800-5700<span style="color: #c69c6d;" class="txt">(유료)</span>
					</p>
					<p class="txt">
						평일(월~금)<br>am 09:00 ~ pm 18:00<span>토/일, 공휴일 휴무</span>
					</p>
					<a href="mailto:shophelp@thehandsome.com">shophelp<br>@thehandsome.com
					</a>
				</div>
			</div>
			<!-- //lnb -->

			<!-- cnts -->
			<div class="sub_cnts">
				<div class="admin_content_main">
					<form id="modifyForm" action="/admin/eventModify" method="post">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<div class="form_section">
							<div class="form_section_title">
								<label>이벤트 번호</label>
							</div>
							<div class="form_section_content">
								<input class="input_block" name="eid" readonly="readonly" id = "eid"
									value="${event.eid}">
							</div>
						</div>
						<div class="form_section">
							<div class="form_section_title">
								<label>이벤트 이름</label>
							</div>
							<div class="form_section_content">
								<input name="ename" value="${event.ename}"> <span
									id="ename">이벤트 이름을 입력 해주세요.</span>
							</div>
						</div>

						<div class="form_section">
							<div class="form_section_title">
								<label>이벤트 소개</label>
							</div>
							<div class="form_section_content">
								<textarea name="edetail"><c:out
										value='${event.edetail}' /></textarea>
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
								<img height="100" width="300"
									src="../../../resources/upload/${event.eimage}">
								<!-- 이미지 타입으로 수정 필요 -->
							</div>
							<div class="form_section">
								<div class="form_section_title">
									<label>할인률</label>
								</div>
								<div class="form_section_content">
									<input class="input_block" name="eamount" readonly="readonly"
										value="${event.eamount}">
								</div>
							</div>
							<div class="form_section">
								<div class="form_section_title">
									<label>최대금액</label>
								</div>
								<div class="form_section_content">
									<input class="input_block" name="elimit" readonly="readonly"
										value="${event.elimit}">
								</div>
							</div>
						</div>
						<div class="btn_section">
							<button id="cancelBtn" class="btn wt">취소</button>
							<button id="modifyBtn" class="btn gray modify_btn">수 정</button>
							<button id="deleteBtn" class="btn wt delete_btn">삭 제</button>
						</div>
					</form>
				</div>
			</div>
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

		/* 이벤트 상세 페이지 이동 버튼 */
		$("#cancelBtn").on("click", function(e) {

			e.preventDefault();
			moveForm.attr("action", "/admin/eventDetail")
			moveForm.submit();

		});
		
		//이벤트 삭제
		$(".deleteBtn").click(function() {
			$("#modifyForm").attr("action", "/admin/eventDelete.do");
			$("#modifyForm").submit();
			alert("삭제가 완료되었습니다");
		});

		/* 이벤트 수정 버튼 작동 및 유효성 검사 */
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