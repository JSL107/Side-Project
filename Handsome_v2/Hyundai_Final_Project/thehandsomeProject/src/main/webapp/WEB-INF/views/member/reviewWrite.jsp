<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
	<title>Title</title>
</head>
<link rel="stylesheet" type="text/css" href="/resources/css/product.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/popup.css">
<link rel="stylesheet" type="text/css" href="/resources/css/contents.css">

<!-- 제이쿼리 cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%-- sweetalert를 위한--%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<body>
<!--상품평 쓰기 팝업 -->
<div class="popwrap w_type_4" id="customerReviewWriteDiv"
     style="display: block;">
  <div class="pop_tltwrap2 customerreviewwritediv1807">
    <h3 id="review_title">상품평 작성하기</h3>
    <p class="reqd_txt float_right">
      <strong class="reqd">*</strong> 표시는 필수항목입니다.
    </p>
  </div>
  <div class="pop_cnt evaluation_write1905 options1811">
     <form id="reviewForm" name="reviewForm" action="http://www.thehandsome.com/ko/HANDSOME/MEN/PANTS/%EC%A1%B0%EA%B1%B0-%ED%8A%B8%EB%9E%99/%5BSET%5D-%EC%9A%B8-%EC%A1%B0%EA%B1%B0-%ED%8C%AC%EC%B8%A0/p/TH2CBKPC033M_BK" method="post" enctype="multipart/form-data">
      <input type="hidden" name="reviewOrderId" value="">
      <input type="hidden" name="productCode"> <input
            type="hidden" name="productCodeType"> <input type="hidden"
                                                         name="orderNumber" id="orderNumber" value=""> <input
            type="hidden" name="purchaseColor" id="purchaseColor" value="">
      <input type="hidden" name="purchaseColorName" id="purchaseColorName"
             value=""> <input type="hidden" name="purchaseSize"
                              id="purchaseSize" value=""> <input type="hidden"
                                                                 name="purchaseProdYN" id="purchaseProdYN" value=""> <input
            type="hidden" name="orderWriteChk" id="orderWriteChk" value="">
      <input type="hidden" name="closeWriteChk" id="closeWriteChk"
             value=""> <input type="hidden" name="productId"
                              id="productId" value=""> <input type="hidden"
                                                              name="fileDeleteYN" id="fileDeleteYN">

      <!-- 상품평활성화 -->
      <fieldset>
        <legend>상품평쓰기</legend>
        <div class="tblwrap">
          <table class="tbl_wtype1">
            <caption>상품평쓰기 입력항목</caption>
            <colgroup>
              <col style="width: 135px">
              <col>
              <col style="width: 130px">
              <col>
            </colgroup>
            <tbody>
            <tr>
              <th scope="row" class="th_space">상품명</th>
              <td colspan="3" style="padding: 15px;">
                <div class="item_box" id="reviewProductDiv">
                  <div class="pt_list_all">
                    <a href="javascript:void(0);">
                      <img src="${thumbnail}" id="reviewProducImg"
                           alt="상품 이미지"
                           onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg'"
                           style="object-fit: cover">
                    </a>
                    <div class="tlt_wrap review_header_wrapper">
                      <!-- <div class="tlt_wrap review_header_wrapper nodata"> -->
                      <a href="#;" class="basket_tlt">
                        <span class="tlt" id="reviewProductBrandName">${bname}</span>
                        <span class="sb_tlt" id="reviewProductProductName">${pname}</span>
                        </a>
                      </a>
                      <p class="color_op" id="purchased_color_size" style="display:block;">COLOR : <span id="review_color_name">${cname}</span>   
                      <span class="and_line">/</span>  SIZE : <span id="review_size">${size}</span></p>
                    </div>
                    <!--20190529_selelct_group -->
                    <div class="select_group" id="productOption"
                         style="display: none;"></div>
                    <!--//20190529_selelct_group -->
                    <div class="select_checkbox" style="display: none;">
                      <input type="checkbox" id="packopt" name="packopt">
                      <label for="purchaseYN"> 매장에서 구매한 상품입니다.</label>
                    </div>
                  </div>
                </div>
              </td>
            </tr>
            <tr class="tbl_blank1807">
              <td colspan="4">&nbsp;</td>
            </tr>
            <tr class="radio_btn_1905 bk">
              <th scope="row" class="th_space">연 령</th>
              <td colspan="3">
                <input id="ageG1" type="radio" name="age" value="18세 이하">
                <label for="ageG1">18세 이하</label>
                <input id="ageG2" type="radio" name="age" value="20대">
                <label for="ageG2">20대</label>
                <input id="ageG3" type="radio" name="age" value="30대">
                <label for="ageG3">30대</label>
                <input id="ageG4" type="radio" name="age" value="40대">
                <label for="ageG4">40대</label>
                <input id="ageG5" type="radio" name="age" value="50대">
                <label for="ageG5">50대</label>
                <input id="ageG6" type="radio" name="age" value="60대 이상">
                <label for="ageG6">60대 이상</label>
              </td>
            </tr>
            <tr class="input_txt_1905">
              <th scope="row" class="th_space" id="thHeight">
                 키</th>
              <td><input type="text" name="height" id="height" style="width: 75%; margin-right: 10px">cm</td>
              <th scope="row" class="th_space" id="thEnjoySize">
                 평소 사이즈</th>
              <td><input type="text" name="enjoySize" id="enjoySize"></td>
            </tr>
            <tr class="radio_btn_1905">
              <th scope="row" class="th_space" id="thBodyType">
                 체 형</th>
              <td colspan="3">
                <input id="dark1" type="radio" name="bodyType" value="마른 체형">
                <label for="dark1">마른 체형</label>
                <input id="dark2" type="radio" name="bodyType" value="보통">
                <label for="dark2">보통</label>
                <input id="dark3" type="radio" name="bodyType" value="통통한 체형">
                <label for="dark3">통통한 체형</label>
              </td>
            </tr>
            <tr class="tbl_blank1807">
              <td colspan="4">&nbsp;</td>
            </tr>
            <tr class="write_star_wrap">
              <th colspan="4">
                <div class="write_star_score1807">
											<span class="cmt_star"> <span class="cmt_per star5">별점</span>
											</span>
                  <ul class="btn_star_score">
                    <li><a href="#;" value="1">1점</a></li>
                    <li><a href="#;" value="2">2점</a></li>
                    <li><a href="#;" value="3">3점</a></li>
                    <li><a href="#;" value="4">4점</a></li>
                    <li><a href="#;" value="5">5점</a></li>
                    <input type="hidden" id="rating" name="rating" value="5">
                  </ul>
                  <p>평점을 선택해 주세요.</p>
                </div>
              </th>
            </tr>
            <tr>
              <th scope="row" class="th_space">실 착용 사이즈</th>
              <td colspan="3">
                <!--20190529_상품평활성화-->
                <c:choose>
					<c:when test="${productVO.cmedium == '아우터' || productVO.cmedium == '탑' || productVO.csmall == '드레스셔츠' || productVO.csmall == '수트재킷'}">
		                <div class="cont_detail">
		                  <p class="left_txt">어깨너비 :</p>
		                  <ul class="rd_box_radio_list">
		                    <li>
			                    <input id="realWearSize1_01" type="radio" name="realWearSize1" value="1"> 
			                    <label for="realWearSize1_01">타이트함</label>
		                    </li>
		                    <li>
			                    <input id="realWearSize1_02" type="radio" name="realWearSize1" value="2"> 
			                    <label for="realWearSize1_02">적당함</label>
		                    </li>
		                    <li>
			                    <input id="realWearSize1_03" type="radio" name="realWearSize1" value="3"> 
			                    <label for="realWearSize1_03">여유있음</label>
		                    </li>
		                  </ul>
		                </div>
		                <div class="cont_detail">
		                  <p class="left_txt">가슴둘레 :</p>
		                  <ul class="rd_box_radio_list">
		                    <li><input id="realWearSize2_01" type="radio"
		                               name="realWearSize2" value="1"> <label
		                            for="realWearSize2_01">타이트함</label></li>
		                    <li><input id="realWearSize2_02" type="radio"
		                               name="realWearSize2" value="2"> <label
		                            for="realWearSize2_02">적당함</label></li>
		                    <li><input id="realWearSize2_03" type="radio"
		                               name="realWearSize2" value="3"> <label
		                            for="realWearSize2_03">여유있음</label></li>
		                  </ul>
		                </div>
		                <div class="cont_detail">
		                  <p class="left_txt">총길이 :</p>
		                  <ul class="rd_box_radio_list">
		                    <li><input id="realWearSize3_01" type="radio"
		                               name="realWearSize3" value="1"> <label
		                            for="realWearSize3_01">짧은 편</label></li>
		                    <li><input id="realWearSize3_02" type="radio"
		                               name="realWearSize3" value="2"> <label
		                            for="realWearSize3_02">적당함</label></li>
		                    <li><input id="realWearSize3_03" type="radio"
		                               name="realWearSize3" value="3"> <label
		                            for="realWearSize3_03">긴 편</label></li>
		                  </ul>
		                </div> 
	                </c:when>
	                <%-- 드레스, 팬츠, 스커트 --%>
					<c:when test="${productVO.cmedium == '드레스' || productVO.cmedium == '팬츠' || productVO.cmedium == '스커트'}">
						<div class="cont_detail">
		                  <p class="left_txt">허리둘레 :</p>
		                  <ul class="rd_box_radio_list">
		                    <li>
			                    <input id="realWearSize1_01" type="radio" name="realWearSize1" value="1"> 
			                    <label for="realWearSize1_01">타이트함</label>
		                    </li>
		                    <li>
			                    <input id="realWearSize1_02" type="radio" name="realWearSize1" value="2"> 
			                    <label for="realWearSize1_02">적당함</label>
		                    </li>
		                    <li>
			                    <input id="realWearSize1_03" type="radio" name="realWearSize1" value="3"> 
			                    <label for="realWearSize1_03">여유있음</label>
		                    </li>
		                  </ul>
		                </div>
		                <div class="cont_detail">
		                  <p class="left_txt">엉덩이둘레 :</p>
		                  <ul class="rd_box_radio_list">
		                    <li><input id="realWearSize2_01" type="radio"
		                               name="realWearSize2" value="1"> <label
		                            for="realWearSize2_01">타이트함</label></li>
		                    <li><input id="realWearSize2_02" type="radio"
		                               name="realWearSize2" value="2"> <label
		                            for="realWearSize2_02">적당함</label></li>
		                    <li><input id="realWearSize2_03" type="radio"
		                               name="realWearSize2" value="3"> <label
		                            for="realWearSize2_03">여유있음</label></li>
		                  </ul>
		                </div>
		                <div class="cont_detail">
		                  <p class="left_txt">총길이 :</p>
		                  <ul class="rd_box_radio_list">
		                    <li><input id="realWearSize3_01" type="radio"
		                               name="realWearSize3" value="1"> <label
		                            for="realWearSize3_01">짧은 편</label></li>
		                    <li><input id="realWearSize3_02" type="radio"
		                               name="realWearSize3" value="2"> <label
		                            for="realWearSize3_02">적당함</label></li>
		                    <li><input id="realWearSize3_03" type="radio"
		                               name="realWearSize3" value="3"> <label
		                            for="realWearSize3_03">긴 편</label></li>
		                  </ul>
		                </div> 
					</c:when>
                </c:choose>
                <!--//20190529_상품평활성화-->
              </td>
            </tr>
            <tr>
              <th scope="row" class="th_space">실
                제품 색상</th>
              <td colspan="3"><input id="dark" type="radio"
                                     name="realProductColor" value="1"> <label for="dark">어두워요</label>
                <input id="same" type="radio" name="realProductColor"
                       class="ml20" value="2"> <label for="same">화면과
                  같아요</label> <input id="light" type="radio" name="realProductColor"
                                     class="ml20" value="3"> <label for="light">밝아요</label>
              </td>
            </tr>
            <tr>
              <th scope="row"><strong class="reqd"
                                      style="margin-top: 6px;">*</strong> <label for="lb1"
                                                                                 style="margin-top: 6px;">상품평<br> <span
                      class="subtxt_1905"> (20자 이상<br>&nbsp;200자 이하)
										</span>
              </label></th>
              <td colspan="3"><textarea id="reviewHeadline"
                                        name="headline" cols="30" rows="5"
                                        style="width: 98%; height: 78px" maxlength="200"></textarea>
              </td>
            </tr>
            <tr>
              <th scope="row" id="thFile" class="th_space"><label
                      for="file">사진등록</label></th>
              <td colspan="3">
                <!-- File upload -->
                <div class="file_upload hs_input_file_wrap2003">
                  <div class="upload_wrap2003">
                    <input type="text" id="textReviewFile" class="text"
                           title="파일 첨부하기" readonly="readonly" name="fileText">
                    <div class="upload_btn">
                      <input type="file" name="reviewFile" id="reviewFile"
                             class="btn add_s" title="파일찾기" multiple> <label
                            for="reviewFile"> <!-- 	 <button type="button" id="uploadFile1" class="img_upload" title="파일찾기">  -->
                      <span id="uploadFile1" class="img_upload">파일찾기</span> <!--	 </button> -->
                    </label>

                    </div>
                  </div>
                  <ul class="file_image_wrap2003">

                  </ul>
                  <p class="txt_guide">10MB 미만의 jpg,gif,png 파일만 첨부하실 수
                    있습니다.</p>
                  <!-- //File upload -->
                </div>
              </td>
            </tr>
            </tbody>
          </table>
          <p class="txt_guide">
							<span style="color: #e46764; font-weight: bold;">- 상품평과
								무관한 내용이거나 상품 재판매, 광고, 동일 문자의 반복 및 기타 불법적인 내용은 통보 없이 삭제되며,<br>&nbsp;&nbsp;해당
								글 작성자 ID는 글쓰기 권한이 제한됩니다.
							</span><br>- 반품, 취소 등의 CS관련 글은 고객센터&gt;1:1문의로 이동될 수 있습니다.<br>
            <span>- 더한섬닷컴에서 구매한 상품의 상품평을 배송완료 30일 이내 작성 시, 추가 마일리지를
								지급합니다.</span><br> - 마일리지 지급에 대한 상세 내용은 마이페이지&gt;내 상품평 페이지에서 확인
            부탁드립니다.<br> &nbsp;&nbsp;(마일리지 적립은 오프라인 구매 및 간편회원 제외)
          </p>
        </div>
        <div class="btnwrap mt40">
          <input type="button" id="reviewCancle" value="취소하기" class="btn wt">
          <input type="button" id="reviewWriteSend" value="등록하기"
                 class="btn gray mr0">
        </div>

      </fieldset>
      <div>
        <input type="hidden" name="CSRFToken"
               value="7399b544-9191-4d49-af3a-9a782a52adc4">
      </div>
    </form>
  </div>
  <a href="javascript:void(0);" id="reviewCloseBtn"
     style="position: absolute; top: 20px; right: 20px; width: 20px; height: 20px;"><img
          src="http://cdn.thehandsome.com/_ui/desktop/common/images/popup/ico_close.png"
          alt="닫기"></a>
</div>
<script>
let fileObject = new Object();

$(document).ready(
		function() {
			//사진등록						
			var maxSize = 5242880; //한 이미지당 5MB를 넘을 수 없음

			function checkExtension(fileSize) {
				if (fileSize >= maxSize) {
                    Swal.fire({
                        text: '파일 사이즈가 초과되었습니다.',
                        icon: 'warning',
                    });

                    return false;
				}//end if

				return true;
			}

			function uploadImages() {//등록하기 버튼 눌렀을때 이미지 업로드 되게 하기!
				let formData = new FormData();
				
				formData.append('pid', '${pid}');

				let csrfHeaderName = "${_csrf.headerName}";
				let csrfTokenValue = "${_csrf.token}";

				let inputFile = $("input[name='reviewFile']");
				let files = inputFile[0].files;

				//파일 formdata에 추가
				for (var i = 0; i < files.length; i++) {
					// 크기 체크
					if (!checkExtension(files[i].size)) {
						return false;
					}
					formData.append("uploadFile", files[i])
				}//end for

				$.ajax({
					url : "/member/uploadAjaxAction",
					processData : false,
					contentType : false,
					data : formData,
					type : "post",
					dataType : 'json',
					beforeSend : function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					success : function(result) {
						//alert("Upload");
						fileObject = result;
					}//end suce..			
				});//end ajax	
			}
	
			$("#reviewFile").change(function() {//input으로 파일을 첨부하면 무슨 파일이 첨부됐는지 바뀐거 보여주기 !
				let inputFile = $("input[name='reviewFile']");
				let files = inputFile[0].files
				let filenames = '';

				for (i = 0; i < files.length; i++) {
					// 크기 체크
					if (!checkExtension(files[i].size)) {
						return false;
					}
					filenames += files[i]['name'] + ' ';
				}

				$("#textReviewFile").val(filenames);
				
				uploadImages();
			});
			
		});
			//--------------------------------- 사진등록
	//x버튼을 눌렀을때 상품평 작성 취소하기
	$("#reviewCancle").on('click', function() {
	
		//취소를 원하면 상품평 작성란을 숨기고 상품평 리스트를 보여줌

        Swal.fire({
            text: '작성을 취소 하시겠습니까?',
            icon: 'warning',

            showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
            confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
            cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
            confirmButtonText: '작성취소', // confirm 버튼 텍스트 지정
            cancelButtonText: '닫기', // cancel 버튼 텍스트 지정
        }).then(result => {
            if (result.isConfirmed) { // 만약모달창에서 confirm 버튼을 눌렀다면
                window.close();
            }
        });

		// if (confirm("취소하시겠습니까?")) {
		// 	window.close();
		// }
	
	});
	
	//상품평 작성 취소하기
	$("#reviewCloseBtn").on('click', function() {

        Swal.fire({
            text: '작성을 취소 하시겠습니까?',
            icon: 'warning',

            showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
            confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
            cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
            confirmButtonText: '작성취소', // confirm 버튼 텍스트 지정
            cancelButtonText: '닫기', // cancel 버튼 텍스트 지정
        }).then(result => {
            if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
                window.close();
            }
        });
	
		// //취소를 상품평 작성란을 숨기고 상품평 리스트를 보여줌
		// if (confirm("취소하시겠습니까?")) {
		// 	window.close();
		// }
	
	});
	
	// 상품평 평점 선택
	$(".btn_star_score li a").on("click",
			function() {
				var idx = $(this).parent('li').index() + 1;
				for (var i = 1; i < 6; i++) {
					$('.write_star_score1807 .cmt_star .cmt_per').removeClass(
							'star' + i);
				}
				// 선택한 별의 css 수정
				$('.write_star_score1807 .cmt_star .cmt_per').addClass(
						'star' + idx);
				// 선택한 요소의 value 값 가져오기
				$("#rating").val($(this).attr('value'));
			});

	// 상품평 등록하기 버튼 눌렀을 때
	$('#reviewWriteSend').on("click", function() {
		var content = $('textarea[id=reviewHeadline]').val()            // 생년월일 입력값
		//console.log("content : " + content);
		
        if(content===''||content===null){
        	console.log("null체크 content : " + content);
            Swal.fire({
                icon: 'warning',
                text: '리뷰 내용을 입력해주세요',
            });
        } else{
        	fn_reviewWriteSend();
        }
	});
	
	// 상품평 작성 처리
	function fn_reviewWriteSend() {

        Swal.fire({
            text: '작성 하시겠습니까?',
            icon: 'success',

            showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
            confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
            cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
            confirmButtonText: '확인', // confirm 버튼 텍스트 지정
            cancelButtonText: '닫기', // cancel 버튼 텍스트 지정
        }).then(result => {
            if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면

                let rcontent = new Map();
                rcontent.set('age', $("input[type=radio][name=age]:checked").val()); // 연령대
                rcontent.set('height', $('#height').val()); // 키
                rcontent.set('enjoySize', $('#enjoySize').val()); //실 착용 사이즈
                rcontent.set('bodyType', $("input[type=radio][name=bodyType]:checked")
                    .val()); //체형
                rcontent.set('rating', $('#rating').val()); //평점
                rcontent.set('realWearSize1', $(
                    "input[type=radio][name=realWearSize1]:checked").val()); //리뷰 옵션
                rcontent.set('realWearSize2', $(
                    "input[type=radio][name=realWearSize2]:checked").val()); //리뷰옵션
                rcontent.set('realWearSize3', $(
                    "input[type=radio][name=realWearSize3]:checked").val()); //리뷰옵션
                rcontent.set('realProductColor', $(
                    "input[type=radio][name=realProductColor]:checked").val()); //색감
                rcontent.set('headline', $("#reviewHeadline").val()); //내용
                rcontent.set('fileText', $('#fileText').val()); //파일이름
                rcontent.set('thumbnailImage',fileObject.thumbPath);
                rcontent.set('imagesPath',fileObject.imagesPath);

                //map 직렬화
                let serializedMap = JSON.stringify(Object.fromEntries(rcontent));

                // 스프링 시큐리티 토큰
                let csrfHeaderName ="${_csrf.headerName}";
                let csrfTokenValue="${_csrf.token}";

                // ajax에 삽입 위해서 pid,mid,rcontent 컬럼 삽입
                const params = {
                    pid : "${pid}",
                    oid : "${oid}",
                    ccolorcode:"${ccolorcode}",
                    rcontent : serializedMap
                };

                console.log("params :" + JSON.stringify(params));

                //let serializedMap = JSON.stringify(Object.fromEntries(params));

                $.ajax({
                    url : '/member/reviewWriteOk',
                    type : 'POST',
                    beforeSend: function(xhr) { xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);},
                    data : JSON.stringify(params), //직렬화
                    dataType : 'text',
                    contentType : 'application/json; charset=utf-8',
                    success : function(result) {
                        //작성 성공시 작성창 닫기
                        // alert("리뷰가 작성되었습니다.");
                        Swal.fire({
                            text: '리뷰가 작성되었습니다.',
                            icon: 'success',
                        });

                        opener.parent.location.reload();
                        self.close();
                    },
                    error : function(XMLHttpRequest, textStatus, errorThrown) {
                        // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                        Swal.fire({
                            icon:'error',
                            text:'통신실패.',
                        });
                    }
                });



            }
        });

		// if (!confirm("작성 하시겠습니까?"))
		// 	return false;
		//입력 값 rcontent 컬럼에 삽입 위해 map에 넣기


	}
	
</script>
<!--//상품평 쓰기 팝업 -->
</body>
</html>
