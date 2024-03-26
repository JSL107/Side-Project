<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 상세</title>
<link rel="stylesheet" href="../resources/css/admin/eventDetail.css">

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
							<img height="100" width="300"
								src="../../../resources/upload/<c:out value="${event.eimage}"></c:out>">
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
						<button id="cancelBtn" class="btn wt">이벤트 목록</button>
						<button id="modifyBtn" class="btn grey modify_btn">수 정</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<form id="moveForm" method="get">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" /> <input type="hidden" name="eid"
			value='<c:out value="${event.eid }"/>'> <input type="hidden"
			name="pageNum" value='<c:out value="${cri.pageNum }"/>'> <input
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