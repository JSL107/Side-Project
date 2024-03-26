<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/productManage.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

	<div class="wrapper">
		<div class="wrap">
			<!-- gnv_area -->
			<div class="top_gnb_area">
				<ul class="list">
					<li><a href="/">메인 페이지</a></li>
					<li><a href="/member/logout.do">로그아웃</a></li>
					<li>고객센터</li>
				</ul>
			</div>
			<!-- top_subject_area -->
			<div class="admin_top_wrap">
				<span>관리자 페이지</span>

			</div>
			<!-- contents-area -->
			<div class="admin_wrap">
				<!-- 네비영역 -->
				<div class="admin_navi_wrap">
					<ul>
						<li><a class="admin_list_01" href="/admin/productAdd">상품
								등록</a></li>
						<li><a class="admin_list_02" href="/admin/productManage">상품
								목록</a></li>
						<lI><a class="admin_list_03" href="/admin/productAdd">상품
								등록</a></lI>
						<li><a class="admin_list_04" href="/admin/productManage">상품
								목록</a></li>
						<lI><a class="admin_list_05">회원 관리</a></lI>
					</ul>
				</div>
				<div class="admin_content_wrap">
					<div class="admin_content_subject">
						<span>상품 관리</span>
					</div>
					<div class="product_table_wrap">
						<!-- 게시물 O -->
						<c:if test="${listCheck != 'empty' }">
							<table class="product_table">
								<thead>
									<tr>
										<td class="th_column_1">상품 번호</td>
										<td class="th_column_2">상품 컬러 코드</td>
										<td class="th_column_3">브랜드 넘버</td>
										<td class="th_column_4">브랜드 이름</td>
										<td class="th_column_5">카테고리 대분류</td>
										<td class="th_column_6">카테고리 중분류</td>
										<td class="th_column_7">카테고리 소분류</td>
										<td class="th_column_8">할인최대금액</td>
									</tr>
								</thead>
								<c:forEach items="${list}" var="list">
									<tr>
										<td><c:out value="${list.eid}"></c:out></td>
										<td><a class="move" href='<c:out value="${list.eid}"/>'>
												<c:out value="${list.ename}"></c:out>
										</a></td>
										<td><c:out value="${list.edetail}"></c:out></td>
										<td><fmt:formatDate value="${list.estartdate}"
												pattern="yyyy-MM-dd" /></td>
										<td><fmt:formatDate value="${list.eenddate}"
												pattern="yyyy-MM-dd" /></td>
										<td><img
											src="../../../resources/upload/<c:out value="${list.eimage}"></c:out>">
										</td>
										<td><c:out value="${list.eamount}"></c:out></td>
										<td><c:out value="${list.elimit}"></c:out></td>
									</tr>
								</c:forEach>
							</table>
						</c:if>
						<c:if test="${listCheck == 'empty'}">
							<div class="table_empty">등록된 상품가 없습니다.</div>
						</c:if>
					</div>
					<!-- 검색 영역 -->
					<div class="search_wrap">
						<form id="searchForm" action="/admin/productManage" method="get">
							<div class="search_input">
								<input type="text" name="keyword"
									value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
								<input type="hidden" name="pageNum"
									value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
								<input type="hidden" name="amount"
									value='${pageMaker.cri.amount}'>
								<button class='btn search_btn'>검 색</button>
							</div>
						</form>
					</div>
					<!-- 페이지 이동 인터페이스 영역 -->
					<div class="pageMaker_wrap">

						<ul class="pageMaker">

							<!-- 이전 버튼 -->
							<c:if test="${pageMaker.prev}">
								<li class="pageMaker_btn prev"><a
									href="${pageMaker.startPage - 1}">이전</a></li>
							</c:if>

							<!-- 페이지 번호 -->
							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="num">
								<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? "active":""}">
									<a href="${num}">${num}</a>
								</li>
							</c:forEach>

							<!-- 다음 버튼 -->
							<c:if test="${pageMaker.next}">
								<li class="pageMaker_btn next"><a
									href="${pageMaker.endPage + 1 }">다음</a></li>
							</c:if>

						</ul>
						<form id="moveForm" action="/admin/productManage" method="get">
							<input type="hidden" name="pageNum"
								value="${pageMaker.cri.pageNum}"> <input type="hidden"
								name="amount" value="${pageMaker.cri.amount}"> <input
								type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
						</form>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<script>
		$(document).ready(function() {

			let result = '<c:out value="${enroll_result}"/>';
			let mresult = '<c:out value="${modify_result}"/>';
			checkResult(result);
			checkmResult(mresult);
			function checkResult(result) {

				if (result === '') {
					return;
				}

				alert("상품'${enroll_result}'를 등록하였습니다.");
			}
			function checkmResult(mresult) {

				if (mresult === '1') {
					alert("상품 수정을 완료하였습니다.");
				} else if (mresult === '0') {
					alert("상품 수정을 하지 못하였습니다.")
				}

			}

		});

		let moveForm = $('#moveForm');

		/* 페이지 이동 버튼 */
		$(".pageMaker_btn a").on("click", function(e) {

			e.prproductDefault();

			moveForm.find("input[name='pageNum']").val($(this).attr("href"));

			moveForm.submit();
		});

		let searchForm = $('#searchForm');

		/* 작거 검색 버튼 동작 */
		$("#searchForm button").on("click", function(e) {

			e.prproductDefault();

			/* 검색 키워드 유효성 검사 */
			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하십시오");
				return false;
			}

			searchForm.find("input[name='pageNum']").val("1");

			searchForm.submit();

		});

		/* 상품 상세 페이지 이동 */
		$(".move").on(
				"click",
				function(e) {

					e.prproductDefault();

					moveForm.append("<input type='hidden' name='eid' value='"
							+ $(this).attr("href") + "'>");
					moveForm.attr("action", "/admin/productDetail");
					moveForm.submit();

				});

		/* 삭제 결과 경고창 */
		let delete_result = '${delete_result}';

		if (delete_result == 1) {
			alert("삭제 완료");
		} else if (delete_result == 2) {
			alert("해당 상품 데이터를 사용하고 있는 데이터가 있어서 삭제 할 수 없습니다.")
		}
	</script>
</body>