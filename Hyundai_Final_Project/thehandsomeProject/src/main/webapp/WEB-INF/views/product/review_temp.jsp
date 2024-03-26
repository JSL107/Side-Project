<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jspf"%>

<div id="bodyWrap" class="item_detail">
<div class="popwrap w_type_4" id="customerReviewWriteDiv" style="display:block;">
    <div class="pop_tltwrap2 customerreviewwritediv1807">
        <h3 id="review_title">상품평 작성하기</h3>
        <p class="reqd_txt float_right"><strong class="reqd">*</strong> 표시는 필수항목입니다.</p>
    </div>
    <div class="pop_cnt evaluation_write1905 options1811">
        <form id="reviewForm" name="reviewForm" action="http://www.thehandsome.com/ko/p/TM2C8WTO625W_GY/login?returnType=review" method="post"
            enctype="multipart/form-data"><input type="hidden" name="productCode">
            <input type="hidden" name="productCodeType">
            <input type="hidden" name="orderNumber" id="orderNumber" value="">
            <input type="hidden" name="purchaseColor" id="purchaseColor" value="GY">
            <input type="hidden" name="purchaseColorName" id="purchaseColorName" value="GREY">
            <input type="hidden" name="purchaseSize" id="purchaseSize" value="">
            <input type="hidden" name="purchaseProdYN" id="purchaseProdYN" value="">
            <input type="hidden" name="orderWriteChk" id="orderWriteChk" value="Y">
            <input type="hidden" name="closeWriteChk" id="closeWriteChk" value="">
            <input type="hidden" name="productId" id="productId" value="">
            <input type="hidden" name="fileDeleteYN" id="fileDeleteYN">

            <!-- 상품평활성화 -->
            <input type="hidden" name="categoryCode" id="categoryCode" value="SZ01">
            <input type="hidden" name="shoulderWidth" id="shoulderWidth" value="">
            <input type="hidden" name="chestSize" id="chestSize" value="">
            <input type="hidden" name="waistSize" id="waistSize" value="">
            <input type="hidden" name="buttSize" id="buttSize" value="">
            <input type="hidden" name="totalSize" id="totalSize" value="">
            <input type="hidden" name="photoAccumulationRightYn" id="photoAccumulationRightYn" value="">
            <input type="hidden" name="offlineOrdDt" id="offlineOrdDt" value="">
            <input type="hidden" name="offlineShpCd" id="offlineShpCd" value="">
            <input type="hidden" name="offlineShpNm" id="offlineShpNm" value="">
            <input type="hidden" name="tempProductId" id="tempProductId" value="">
            <input type="hidden" name="reviewFileCd" id="reviewFileCd" value="">
            <input type="hidden" name="reviewFileCd1" id="reviewFileCd1" value="">
            <input type="hidden" name="reviewFileCd2" id="reviewFileCd2" value="">
            <input type="hidden" name="reviewFileCd3" id="reviewFileCd3" value="">
            <input type="hidden" name="reviewFileCd4" id="reviewFileCd4" value="">
            <fieldset>
                <legend>상품평쓰기</legend>
                <div class="tblwrap">
                    <table class="tbl_wtype1">
                        <caption>상품평쓰기 입력항목</caption>
                        <colgroup>
                            <col style="width:135px">
                            <col>
                            <col style="width:130px">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row" class="th_space">상품명</th>
                                <td colspan="3" style="padding:15px;">
                                    <div class="item_box" id="reviewProductDiv">
                                        <div class="pt_list_all">
                                            <a href="#;"><img
                                                    src="http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg"
                                                    id="reviewProducImg" alt="상품 이미지"
                                                    onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg'"></a>
                                            <div class="tlt_wrap review_header_wrapper">
                                                <!-- <div class="tlt_wrap review_header_wrapper nodata"> -->
                                                <a href="#;" class="basket_tlt">
                                                    <span class="tlt" id="reviewProductBrandName"></span>
                                                    <span class="sb_tlt" id="reviewProductProductName"></span> / <span
                                                        id="reviewProducPrice"></span>
                                                </a>
                                                <!-- 주문조회에서 넘어올시 이거 보여줌<p class="color_op" id="purchased_color_size" style="display:none;">COLOR : <span id="review_color_name"></span>   <span class="and_line">/</span>  SIZE : <span id="review_size"></span></p> -->
                                                <div class="select_options_wrap" style="display:none;">
                                                    <ul class="select_options">
                                                        <li class="select_colors">
                                                            <p style="color: rgb(0, 0, 0); font-weight: normal;"><span
                                                                    class="compulsory">*</span> 색상
                                                                <!-- 색상 -->
                                                            </p>
                                                            <ul class="color_chip clearfix">
                                                                <input type="hidden" id="colorName" value="GREY">
                                                                <li id="TM2C8WTO625W_GY">
                                                                    <input type="hidden" class="colorNameVal"
                                                                        value="GREY">
                                                                    <a href="#;" class="beige" data-color="GREY"
                                                                        style="background:#989898 url('http://newmedia.thehandsome.com/TM/2C/FW/TM2C8WTO625W_GY_C01.jpg/dims/resize/24x24');"
                                                                        onclick="javascript:fn_clickColorCode('TM2C8WTO625W_GY', 'GREY');"
                                                                        onmouseover="setColorName('GREY');"
                                                                        onmouseout="setColorName('');"></a>
                                                                </li>
                                                                <li>
                                                                    <span class="cl_name" id="colorNameContent"></span>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                        <li class="select_size">
                                                            <p style="color: rgb(0, 0, 0); font-weight: normal;"><span
                                                                    class="compulsory">*</span> 사이즈
                                                                <!-- 사이즈 -->
                                                            </p>
                                                            <ul class="size_chip clearfix" id="review_size_btn_area">
                                                                <li id="TM2C8WTO625W_GY_82">
                                                                    <a
                                                                        onclick="javascript:fn_clickSizeCode('TM2C8WTO625W_GY_82');">82</a>
                                                                    <productdetails:popupsizequickreference>
                                                                    </productdetails:popupsizequickreference>
                                                                </li>
                                                            </ul>
                                                            <!-- <ul class="size_chip clearfix">
                                                            <li id="MN1IBKTO483W_MB_90">
                                                                <a href="javascript:fn_detailProductAjax('MN1IBKTO483W_MB_90')">90</a>
                                                            </li>
                                                 </ul> -->
                                                        </li>
                                                    </ul>
                                                </div>

                                                <!-- <div class="select_checkbox">
                                                <input type="checkbox" name="" value="" id="storePickTFC">
                                                <label for="storePickTFC">상품을 매장에서 구매하셨나요?</label>
                                            </div> -->
                                            </div>
                                            <!--20190529_selelct_group -->
                                            <div class="select_group" id="productOption" style="display:none;">
                                            </div>
                                            <!--//20190529_selelct_group -->
                                            <div class="select_checkbox" style="display:none;">
                                                <input type="checkbox" id="packopt" name="packopt">
                                                <label for="purchaseYN">
                                                    매장에서 구매한 상품입니다.</label>
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
                                <th scope="row" class="th_space" id="thHeight"
                                    style="color: rgb(0, 0, 0); font-weight: normal;">
                                    <strong class="reqd">*</strong>
                                    키</th>
                                <td><input type="text" name="height" id="height" style="width:75%amrgin-right:10px">cm
                                </td>
                                <th scope="row" class="th_space" id="thEnjoySize"
                                    style="color: rgb(0, 0, 0); font-weight: normal;">
                                    <strong class="reqd">*</strong>
                                    평소 사이즈</th>
                                <td><input type="text" name="enjoySize" id="enjoySize"></td>
                            </tr>
                            <tr class="radio_btn_1905">
                                <th scope="row" class="th_space" id="thBodyType"
                                    style="color: rgb(0, 0, 0); font-weight: normal;">
                                    <strong class="reqd">*</strong>
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
                                        <span class="cmt_star">
                                            <span class="cmt_per star5">별점</span>
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
                                <th scope="row" class="th_space" style="color: rgb(0, 0, 0); font-weight: normal;">
                                    <strong class="reqd">*</strong>실 착용 사이즈</th>
                                <td colspan="3">
                                    <!--20190529_상품평활성화-->
                                    <div class="cont_detail">
                                        <p class="left_txt">어깨너비 : </p>
                                        <ul class="rd_box_radio_list">
                                            <li>
                                                <input id="realWearSize1_01" type="radio" name="realWearSize1"
                                                    value="1">
                                                <label for="realWearSize1_01">타이트함</label>
                                            </li>
                                            <li>
                                                <input id="realWearSize1_02" type="radio" name="realWearSize1"
                                                    value="2">
                                                <label for="realWearSize1_02">적당함</label>
                                            </li>
                                            <li>
                                                <input id="realWearSize1_03" type="radio" name="realWearSize1"
                                                    value="3">
                                                <label for="realWearSize1_03">여유있음</label>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="cont_detail">
                                        <p class="left_txt">가슴둘레 : </p>
                                        <ul class="rd_box_radio_list">
                                            <li>
                                                <input id="realWearSize2_01" type="radio" name="realWearSize2"
                                                    value="1">
                                                <label for="realWearSize2_01">타이트함</label>
                                            </li>
                                            <li>
                                                <input id="realWearSize2_02" type="radio" name="realWearSize2"
                                                    value="2">
                                                <label for="realWearSize2_02">적당함</label>
                                            </li>
                                            <li>
                                                <input id="realWearSize2_03" type="radio" name="realWearSize2"
                                                    value="3">
                                                <label for="realWearSize2_03">여유있음</label>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="cont_detail">
                                        <p class="left_txt">총길이 : </p>
                                        <ul class="rd_box_radio_list">
                                            <li>
                                                <input id="realWearSize3_01" type="radio" name="realWearSize3"
                                                    value="1">
                                                <label for="realWearSize3_01">짧은 편</label>
                                            </li>
                                            <li>
                                                <input id="realWearSize3_02" type="radio" name="realWearSize3"
                                                    value="2">
                                                <label for="realWearSize3_02">적당함</label>
                                            </li>
                                            <li>
                                                <input id="realWearSize3_03" type="radio" name="realWearSize3"
                                                    value="3">
                                                <label for="realWearSize3_03">긴 편</label>
                                            </li>
                                        </ul>
                                    </div>
                                    <!--//20190529_상품평활성화-->
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_space" style="color: rgb(0, 0, 0); font-weight: normal;">
                                    <strong class="reqd">*</strong>실 제품 색상</th>
                                <td colspan="3">
                                    <input id="dark" type="radio" name="realProductColor" value="1">
                                    <label for="dark">어두워요</label>
                                    <input id="same" type="radio" name="realProductColor" class="ml20" value="2">
                                    <label for="same">화면과 같아요</label>
                                    <input id="light" type="radio" name="realProductColor" class="ml20" value="3">
                                    <label for="light">밝아요</label>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" style="color: rgb(0, 0, 0); font-weight: normal;">
                                    <strong class="reqd" style="margin-top:6px;">*</strong>
                                    <label for="lb1" style="margin-top:6px;">상품평<br>
                                        <span class="subtxt_1905">
                                            (20자 이상<br>&nbsp;200자 이하)</span>
                                    </label>
                                </th>
                                <td colspan="3">
                                    <textarea id="reviewHeadline" name="headline" cols="30" rows="5"
                                        style="width:98%;height:78px" maxlength="200"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" id="thFile" class="th_space"
                                    style="color: rgb(0, 0, 0); font-weight: normal;"><label for="file">사진등록</label>
                                </th>
                                <td colspan="3">
                                    <!-- File upload -->
                                    <div class="file_upload hs_input_file_wrap2003">
                                        <div class="upload_wrap2003">
                                            <input type="text" id="textReviewFile" class="text" title="파일 첨부하기"
                                                readonly="readonly" name="fileText">
                                            <div class="upload_btn">
                                                <input type="file" name="reviewFile" id="reviewFile" class="btn add_s"
                                                    title="파일찾기" accept="image/png, image/jpeg" multiple><!-- accept는 받는파일 형태를 제한 함 -->
                                                <label for="reviewFile">
                                                    <!-- 	 <button type="button" id="uploadFile1" class="img_upload" title="파일찾기">  -->
                                                    <span id="uploadFile1" class="img_upload">파일찾기</span>
                                                    <!--	 </button> -->
                                                </label>

                                            </div>
                                        </div>
                                        <ul class="file_image_wrap2003">

                                        </ul>
                                        <p class="txt_guide">10MB 미만의 jpg,gif,png 파일만 첨부하실 수 있습니다.</p>
                                        <!-- //File upload -->
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <p class="txt_guide">
                        <span style="color:#e46764; font-weight: bold;">- 상품평과 무관한 내용이거나 상품 재판매, 광고, 동일 문자의 반복 및 기타 불법적인
                            내용은 통보 없이 삭제되며,<br>&nbsp;&nbsp;해당 글 작성자 ID는 글쓰기 권한이 제한됩니다.</span><br>- 반품, 취소 등의 CS관련 글은
                        고객센터&gt;1:1문의로 이동될 수 있습니다.<br>
                        <span>- 더한섬닷컴에서 구매한 상품의 상품평을 배송완료 30일 이내 작성 시, 추가 마일리지를 지급합니다.</span><br>

                        - 마일리지 지급에 대한 상세 내용은 마이페이지&gt;내 상품평 페이지에서 확인 부탁드립니다.<br>
                        &nbsp;&nbsp;(마일리지 적립은 오프라인 구매 및 간편회원 제외)</p>
                </div>
                <div class="btnwrap mt40">
                    <input type="button" id="reviewCancle" value="취소하기" class="btn wt">
                    <input type="button" id="reviewWriteSend" value="등록하기" class="btn gray mr0">
                </div>

            </fieldset>
            <div>
                <input type="hidden" name="CSRFToken" value="451e291a-3c08-4de3-b1d6-13058c7a6248">
            </div>
        </form>
    </div>
    <a href="javascript:void(0);" id="reviewCloseBtn"
        style="position: absolute; top: 20px; right: 20px; width: 20px; height: 20px;"><img
            src="http://cdn.thehandsome.com/_ui/desktop/common/images/popup/ico_close.png" alt="닫기"></a>
</div>
</div>
<script>
	$(document).ready(function(){
		
		var maxSize = 5242880 ; //한 이미지당 5MB를 넘을 수 없음

		function checkExtension(fileSize) {
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}//end if

			return true;
		}

		$("#reviewFile").change(function(){//input으로 파일을 첨부하면 무슨 파일이 첨부됐는지 바뀐거 보여주기 !
			let inputFile = $("input[name='reviewFile']");
			let files = inputFile[0].files
			let filenames = '';
			
			for(i=0; i< files.length;i++){
				// 크기 체크
				if( !checkExtension(files[i].size ) ){
					return false;
				}
				filenames += files[0]['name'] + ' ';
			}

			$("#textReviewFile").val(filenames);
		});
		$('#reviewWriteSend').click(function(){//등록하기 버튼 눌렀을때 이미지 업로드 되게 하기!
			let formData = new FormData();
		
		
			let inputFile = $("input[name='reviewFile']");
			let files = inputFile[0].files;
			
			//파일 formdata에 추가
			for(var i =0; i < files.length; i++){
				// 크기 체크
				if( !checkExtension(files[i].size ) ){
					return false;
				}
				formData.append("uploadFile", files[i])
			}//end for
			
			$.ajax({
				url: "/review/uploadAjaxAction",
				processData: false,
				contentType: false,
				data: formData,
				type:"post",
				dataType:'json',
				success:function(result){
					alert("Upload");
					console.log(result);
				}//end suce..			
			});//end ajax	


		});
	});
</script>
<%@include file="/WEB-INF/views/common/footer.jspf"%>