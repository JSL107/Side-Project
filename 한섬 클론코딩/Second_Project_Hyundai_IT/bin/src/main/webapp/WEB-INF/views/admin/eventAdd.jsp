<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 추가</title>
<link rel="stylesheet" href="../resources/css/admin/main.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

</head>
<body>
	<div id="bodyWrap">
		<h3 class="cnts_title">
			<span id="menuTitle">이벤트 등록</span>
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
							<a href="/admin/chart">통계</a>
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
				<form action="/admin/eventAdd" method="post" id="addForm">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div class="title_wrap mt30">
						<h4 class="float_left">이벤트 등록</h4>
					</div>

					<fieldset>
						<legend>이벤트 내용 입력</legend>
						<div class="tblwrap">
							<table class="tbl_wtype1">
								<caption>이벤트 입력항목</caption>
								<colgroup>
									<col style="width: 140px">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" class="th_space"><strong class="reqd">*</strong>
											이벤트 이름</th>
										<td><input type="text" style="width: 200px" name="ename"></td>
									</tr>
									<tr>
										<th scope="row" class="th_space"><strong class="reqd">*</strong>
											이벤트 내용</th>
										<td><input type="text" style="width: 200px"
											name="edetail"></td>
									</tr>
									<tr>
										<th scope="row" class="th_space"><strong class="reqd">*</strong>
											이벤트 시작 날짜</th>
										<td><input name="estartdate" type="date" max="2025-12-12"
											min="2020-01-01" value="2022-10-27"></td>
									</tr>
									<tr>
										<th scope="row" class="th_space"><strong class="reqd">*</strong>
											이벤트 종료 날짜</th>
										<td><input name="eenddate" type="date" max="2025-12-12"
											min="2020-01-01" value="2022-11-01"></td>
									</tr>
									<tr>
										<th scope="row" class="th_space"><strong class="reqd">*</strong>
											쿠폰 이미지</th>
										<td><input type="file" multiple id="eimage" name='eimage'
											style="height: 30px;">
											<div id="uploadResult"></div></td>
									</tr>
									<tr>
										<th scope="row" class="th_space"><strong class="reqd">*</strong>
											할인률(%)</th>
										<td><input type="text" style="width: 120px"
											name="eamount"></td>
									</tr>
									<tr>
										<th scope="row" class="th_space"><strong class="reqd">*</strong>
											최대금액</th>
										<td><input type="text" style="width: 120px" name="elimit"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</fieldset>

					<!-- btn_btwrap -->

					<div class="btnwrap mypage2">
						<input type="button" class="btn wt" value="취 소" id="cancelBtn">
						<input type="button" class="btn gray" value="등 록" id="addBtn">
					</div>
					<!-- //btn_btwrap -->
				</form>
			</div>
		</div>
	</div>

	<script>
		/* 등록 버튼 */
		$("#addBtn").click(function() {
			$("#addForm").submit();
		});

		/* 취소 버튼 */
		$("#cancelBtn").click(function() {
			location.href = "/admin/eventManage"
		});
		/* 이미지 업로드 */
		$("input[type='file']").on("change", function(e) {
			/* 이미지 존재시 삭제 */
			if ($(".imgDeleteBtn").length > 0) {
				deleteFile();
			}
			let formData = new FormData();
			let fileInput = $('input[name="eimage"]');
			let fileList = fileInput[0].files;
			let fileObj = fileList[0];

			if (!fileCheck(fileObj.name, fileObj.size)) {
				return false;
			}

			formData.append("eimage", fileObj);

			$.ajax({
				url : '/admin/uploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				success : function(result) {
					console.log(result);
					showUploadImage(result);
				},
				error : function(result) {
					alert("이미지가 업로드 되었습니다.");
				}

			});

		});

		/* var, method related with attachFile */
		let regex = new RegExp("(.*?)\.(jpg|png)$");
		let maxSize = 1048576; //1MB	

		function fileCheck(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (!regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}

			return true;

		}
	</script>
</body>
</html>