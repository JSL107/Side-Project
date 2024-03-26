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
<body>
<!--상품평 쓰기 팝업 -->
<div class="popwrap w_type_4" id="customerReviewWriteDiv"
     style="display: block;">
  <div class="pop_tltwrap2 customerreviewwritediv1807">
    <h3 id="review_title">상품평 조회하기</h3>
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
        <legend>상품평보기</legend>
        <div class="tblwrap">
          <table class="tbl_wtype1">
            <caption>상품평 조회항목</caption>
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
                      <img src="${review.c_thumbnail1}" id="reviewProducImg"
                           alt="상품 이미지"
                           onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg'"
                           style="object-fit: cover">
                    </a>
                    <div class="tlt_wrap review_header_wrapper">
                      <!-- <div class="tlt_wrap review_header_wrapper nodata"> -->
                      <a href="#;" class="basket_tlt">
                        <span class="tlt" id="reviewProductBrandName">${review.bname}</span>
                        <span class="sb_tlt" id="reviewProductProductName">${review.pname}</span>
                        </a>
                      </a>
                      <p class="color_op" id="purchased_color_size" style="display:block;">COLOR : <span id="review_color_name">${review.cname}</span>   
                      <span class="and_line">/</span>  SIZE : <span id="review_size">${review.ssize}</span></p>
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
                <label>${review.rcontentMap.age}</label>
              </td>
            </tr>
            <tr class="input_txt_1905">
              <th scope="row" class="th_space" id="thHeight">키</th>
              <td>${review.rcontentMap.height} cm</td>
              <th scope="row" class="th_space" id="thEnjoySize">평소 사이즈</th>
              <td>${review.rcontentMap.enjoySize}</td>
            </tr>
            <tr class="radio_btn_1905">
              <th scope="row" class="th_space" id="thBodyType">체 형</th>
              <td colspan="3">
                ${review.rcontentMap.bodyType}
              </td>
            </tr>
            <tr class="tbl_blank1807">
              <td colspan="4">&nbsp;</td>
            </tr>
            <tr class="write_star_wrap">
              <th colspan="4">
                <div class="write_star_score1807">
                    <span>평점</span>
					<span class="cmt_star"> <span class="cmt_per star${review.rcontentMap.rating}">별점</span>
					</span>
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
		                    <li>
		                    	<input id="realWearSize2_01" type="radio" name="realWearSize2" value="1"> 
		                    	<label for="realWearSize2_01">타이트함</label>
	                    	</li>
		                    <li>
		                    	<input id="realWearSize2_02" type="radio" name="realWearSize2" value="2"> 
		                    	<label for="realWearSize2_02">적당함</label>
	                    	</li>
		                    <li>
		                    	<input id="realWearSize2_03" type="radio" name="realWearSize2" value="3">
		                    	<label for="realWearSize2_03">여유있음</label>
	                    	</li>
		                  </ul>
		                </div>
		                <div class="cont_detail">
		                  <p class="left_txt">총길이 :</p>
		                  <ul class="rd_box_radio_list">
		                    <li>
		                    	<input id="realWearSize3_01" type="radio" name="realWearSize3" value="1">
		                    	<label for="realWearSize3_01">짧은 편</label>
	                    	</li>
		                    <li>
		                    	<input id="realWearSize3_02" type="radio" name="realWearSize3" value="2"> 
		                    	<label for="realWearSize3_02">적당함</label>
		                    	</li>
		                    <li>
		                    	<input id="realWearSize3_03" type="radio" name="realWearSize3" value="3"> 
                               	<label for="realWearSize3_03">긴 편</label>
                            </li>
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
		                    <li>
		                    	<input id="realWearSize2_01" type="radio" name="realWearSize2" value="1"> 
		                    	<label for="realWearSize2_01">타이트함</label>
	                    	</li>
		                    <li>
		                    	<input id="realWearSize2_02" type="radio" name="realWearSize2" value="2"> 
		                    	<label for="realWearSize2_02">적당함</label>
	                    	</li>
		                    <li>
		                    	<input id="realWearSize2_03" type="radio" name="realWearSize2" value="3">
		                    	<label for="realWearSize2_03">여유있음</label>
	                    	</li>
		                  </ul>
		                </div>
		                <div class="cont_detail">
		                  <p class="left_txt">총길이 :</p>
		                  <ul class="rd_box_radio_list">
		                    <li>
		                    	<input id="realWearSize3_01" type="radio" name="realWearSize3" value="1">
		                    	<label for="realWearSize3_01">짧은 편</label>
	                    	</li>
		                    <li>
		                    	<input id="realWearSize3_02" type="radio" name="realWearSize3" value="2"> 
		                    	<label for="realWearSize3_02">적당함</label>
		                    	</li>
		                    <li>
		                    	<input id="realWearSize3_03" type="radio" name="realWearSize3" value="3"> 
                               	<label for="realWearSize3_03">긴 편</label>
                            </li>
		                  </ul>
		                </div> 
					</c:when>
                </c:choose>
                <!--//20190529_상품평활성화-->
              </td>
            </tr>
            <tr>
              <th scope="row" class="th_space">실 제품 색상</th>
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
              <th scope="row" class="th_space">
              	상품평
              </th>
              <td colspan="3">
              	${review.rcontentMap.headline }
              </td>
            </tr>
            <tr>
              <th scope="row" id="thFile" class="th_space"><label
                      for="file">첨부 사진</label></th>
              <td colspan="3">
	              <ul class="slides">
				  	<c:forEach items="${review.rcontentMap.imagesPath}" var="image">
						<li>											
							<img style= "max-width: 640px;  max-height: 390px;" src="${image}" alt="리뷰 이미지" />
						</li>
					</c:forEach>
				  </ul>
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
          <input type="button" id="reviewCancle" value="창닫기" class="btn wt">
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
$(document).ready(
	function() {
		let realwearsize1 = "<c:out value='${review.rcontentMap.realWearSize1}'/>";
		let realwearsize2 = "<c:out value='${review.rcontentMap.realWearSize2}'/>";
		let realwearsize3 = "<c:out value='${review.rcontentMap.realWearSize3}'/>";
		$('input[id=realWearSize1_0'+realwearsize1+']').prop("checked",true);
		$('input[id=realWearSize2_0'+realwearsize2+']').prop("checked",true);
		$('input[id=realWearSize3_0'+realwearsize3+']').prop("checked",true);
		$('input[type=radio]').attr("disabled", true);
		
		let realProductColorVal = "<c:out value='${review.rcontentMap.realProductColor}'/>";
		if(realProductColorVal == 1){
			$('input[id=dark').prop("checked",true);
		} else if(realProductColorVal == 2){
			$('input[id=same').prop("checked",true);
		} else if(realProductColorVal == 3){
			$('input[id=light').prop("checked",true);
		}
	});
	//x버튼을 눌렀을때 상품평 작성 취소하기
	$("#reviewCancle").on('click', function() {
		window.close();
	});
	
	//상품평 작성 취소하기
	$("#reviewCloseBtn").on('click', function() {
		window.close();
	});
	
</script>
<!--//상품평 쓰기 팝업 -->
</body>
</html>
