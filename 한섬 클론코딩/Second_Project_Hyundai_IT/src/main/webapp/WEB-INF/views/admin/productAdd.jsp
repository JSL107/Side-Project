<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/main.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<style type="text/css">
#result_card img {
	max-width: 100%;
	height: auto;
	display: block;
	padding: 5px;
	margin-top: 10px;
	margin: auto;
}

#result_card {
	position: relative;
}

.imgDeleteBtn {
	position: absolute;
	top: 0;
	right: 5%;
	background-color: #ef7d7d;
	color: wheat;
	font-weight: 900;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	line-height: 26px;
	text-align: center;
	border: none;
	display: block;
	cursor: pointer;
}
</style>
</head>
<body>

	<div class="wrapper">
		<div class="wrap">
			<!-- gnv_area -->
			<div class="top_gnb_area">
				<ul class="list">
					<li><a href="/main">메인 페이지</a></li>
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
						<lI><a class="admin_list_03" href="/admin/eventAdd">이벤트
								등록</a></lI>
						<li><a class="admin_list_04" href="/admin/eventManage">이벤트
								목록</a></li>
						<lI><a class="admin_list_05">회원 관리</a></lI>
					</ul>
				</div>
				<div class="admin_content_wrap">
					<div class="admin_content_subject">
						<span>상품 등록</span>
					</div>
					<div class="admin_content_main">
						<form action="/admin/eventAdd" method="post" id="addForm">
							<div class="form_section">
								<div class="form_section_title">
									<label>상품 이름</label>
								</div>
								<div class="form_section_content">
									<input name="ename" type="text">
								</div>
							</div>
							<div class="form_section">
								<div class="form_section_title">
									<label>이벤트 내용</label>
								</div>
								<div class="form_section_content">
									<input name="edetail" type="text">
								</div>

							</div>
							<div class="form_section">
								<div class="form_section_title">
									<label>이벤트 시작 날짜</label>
								</div>
								<div class="form_section_content">
									<input name="estartdate" type="date" max="2025-12-12"
										min="2020-01-01" value="2022-10-17">
								</div>
							</div>
							<div class="form_section">
								<div class="form_section_title">
									<label>이벤트 종료 날짜</label>
								</div>
								<div class="form_section_content">
									<input name="eenddate" type="date" max="2025-12-12"
										min="2020-01-01" value="2022-10-17">
								</div>
							</div>
							<div class="form_section">
								<div class="form_section_title">
									<label>쿠폰 이미지</label>
								</div>
								<div class="form_section_content">
									<input type="file" multiple id="eimage" name='eimage'
										style="height: 30px;">
									<div id="uploadResult"></div>
								</div>
							</div>
							<div class="form_section">
								<div class="form_section_title">
									<label>할인률</label>
								</div>
								<div class="form_section_content">
									<input name="eamount" type="text">
								</div>
							</div>
							<div class="form_section">
								<div class="form_section_title">
									<label>최대금액</label>
								</div>
								<div class="form_section_content">
									<input name="elimit" type="text">
								</div>
							</div>
						</form>
						<div class="btn_section">
							<button id="cancelBtn" class="cancelBtn">취 소</button>
							<button id="addBtn" class="addBtn">등 록</button>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
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
			if($(".imgDeleteBtn").length > 0){
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
					alert("이미지 파일이 아닙니다.");
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