<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html> <!-- 	//Written  by 미림 -->
<html>
<head>
	
    <style class="vjs-styles-defaults">
        .video-js {
            width: 300px;
            height: 150px;
        }

        .vjs-fluid {
            padding-top: 56.25%
        }
    </style>
    <!-- 새벽배송 공통 태그-->
    <meta charset="UTF-8">
    <title>상품상세>[배송종류]{상품이름}</title>
    <link rel="shortcut icon" type="image/x-icon" href="UIUX/images/favicon.ico">
    <link rel="stylesheet" type="text/css" href="UIUX/css/css-library.min.css?ver=2">
    <link rel="stylesheet" type="text/css" href="UIUX/css/common.min.css?ver=2">
    <%--data aos css , script 설정--%>
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script>
        AOS.init();
    </script>
</head>
<body data-aos-easing="ease" data-aos-duration="400" data-aos-delay="0">

<!-- body -->
<link rel="stylesheet" type="text/css" href="./UIUX/css/s-style_v2.min.css">
<link rel="stylesheet" type="text/css" href="./UIUX/css/product.min.css">

<div id="wrap" class="product detail">

    <!-- header// -->
    <header id="header">

    </header>
    <!-- //header -->

    <!-- header// -->
    <!--
    <header id="header">
    </header>
    -->
    <!-- //header -->

    <form name="productPDForm" id="productPDForm" method="post">
        <input type="text" name="slitmCd" class="hide">
        <input type="text" name="convertSlitmCd" class="hide" value="S02011022802">
        <input type="text" name="basktGbcd" class="hide" value="">
        <input type="text" name="sectId" class="hide" value="">
        <input type="text" name="ctgrId" class="hide" value="">
        <input type="text" name="preview" class="hide" value="N">
        <input type="text" name="chngReqSeq" class="hide" value="">
        <input type="text" name="postNo" class="hide" value="">
        <input type="hidden" name="tagNm" class="hide" value="">
        <input type="hidden" name="rintrvSubscrbSeqnSeq" class="hide" value=""> <!-- 정기구독차수순번  -->
    </form>

    <form name="couponPDForm" id="couponPDForm" method="post">
        <input type="hidden" name="copnNo" class="hide" value="">
    </form>

    <form name="popQnaPDForm" id="popQnaPDForm" method="get">
        <input type="hidden" name="convertSlitmCd" class="hide">
        <input type="hidden" name="itemQnaQstnNo" class="hide">
        <input type="hidden" name="inqrTypeCd" class="hide">
        <input type="hidden" name="qstnTitl" class="hide">
        <input type="hidden" name="qstnCntn" class="hide">
        <input type="hidden" name="answNotfYn" class="hide">
        <input type="hidden" name="scretYn" class="hide">
    </form>

    <form name="essentialForm" id="essentialForm" method="post">
        <input type="hidden" name="slitmCd" value="S02011022802">
        <input type="hidden" name="seqn">
        <input type="hidden" name="sellStrtDt">
        <input type="hidden" name="page" value="1">
        <input type="hidden" name="addBtnYn" value="">
    </form>

    <!-- contents// -->
    <div id="contents">
        <div class="innercon">
            <section class="proinfo-area">
                <!-- propic// -->
                <div class="propic">
                    <div class="propicbig">

                        <!-- 이미지가 있을 경우 첫번째 이미지를 넣어줌. -->
                        <div class="zoomWrapper" style="height: 624px; width: 520px;">
                            <img data-zoom-image="https://tohomeimage.thehyundai.com/PD/PDImages/S/5/4/8/2810000048845_00.jpg?RS=720x864"
                                 src="https://tohomeimage.thehyundai.com/PD/PDImages/S/5/4/8/2810000048845_00.jpg?RS=720x864"
                                 onerror="this.src='/UIUX/w/pjtCom/images/common/noimage_720x864.jpg'"
                                 style="position: absolute;">
                        </div>
                    </div>
                </div>
                <!-- //propic -->


                <!-- proinfo// -->
                <div class="proinfo">
                    <h2>
                        <strong>[새벽배송] 한우 순우리 소담 죽</strong>
                    </h2>

                    <!-- 가격(fnPDSetPriceSection)  -->
                    <div class="price" id="price_section">
                        <%--가격 받아줄 부분--%>
                        <span class="txt-price">
                        <strong><em>190,000</em>원</strong>
                        </span>
                        <div class="probtn">
                            <button type="button" class="btn-wish">좋아요
                            </button>
                        </div>
                    </div>

                    <div class="detailinfo">
                        <dl>

                            <!--1. 구독상품 아닐때 -->


                            <!-- 선물배송은 원산지, 포장타입, 알레르기 정보 안나옴.  -->
                            <dt>포장타입</dt>
                            <dd>냉동</dd>

                            <dt>배송형태</dt>
                            <%--수정 할 부분--%>
                            <dd id="deliverySection"> 새벽배송 / 밤 11시까지 결제 시<br>
                                배송비 3,500원 (5만원 이상 구매 시 무료)<br>
                                <button type="button" class="btn-linedown btn-deliveryinfo">
                                    배송안내
                                </button>
                                <button type="button" class="btn-round">
                                    정기배송
                                </button>
                            </dd>

                            <dt>상품선택</dt>
                            <dd>
                                <!-- 상품선택// start-->
                                <div class="optionarea" id="top_optionarea">
                                    <div class="optionls">
                                        <div>
                                            <strong class="txt-ti">[새벽배송] 한우 순우리 소담 죽
                                            </strong>
                                            <%--수량관련--%>
                                            <div class="ea-area" style="display:none">
                                                <input type="number" title="수량 입력" value="1" readonly="">
                                                <button type="button" class="btn-down" onclick="fnOptionEaDown(this);">
                                                    수량 낮추기
                                                </button>
                                                <button type="button" class="btn-up" onclick="fnOptionEaUp(this);">수량
                                                    올리기
                                                </button>
                                            </div>
                                            <span class="txt-price"><em>190,000</em>원</span>
                                        </div>
                                    </div>
                                </div>
                            </dd>
                        </dl>
                    </div>

                    <%--후에 주문하기 페이지와 연결해주기--%>
                    <div class="buybutton" id="top_buybutton"><p class="txt-total">총 금액
                        <strong><em>190,000</em>원</strong></p>
                        <div class="btns">
                            <%--장바구니 insert 메소드와 연결해주기--%>
                            <button type="button" class="btn orange bigger btn-buy">장바구니
                            </button>
                            <%--주문 페이지와 연결해주기--%>
                            <button type="button" class="btn fill orange bigger btn-buy"
                                    onclick="location.href='order.jsp'">바로구매
                            </button>
                        </div>
                    </div>

                </div>
                <!-- //proinfo -->
            </section>

            <div class="prodetailcont" style="min-height: 363px;">
                <div class="prodetail-area">

                    <!-- tabs// -->
                    <div class="tab-menu protabs" style="position: absolute; inset: 0px auto auto 0px;">
                        <a href="./product_details.jsp#p_proDetail" class="" style="width: 25%;"><span>상세정보</span></a>
                        <a href="./product_details_review.jsp#p_proReview" class="active"
                        <%--리뷰 컬럼 카운트 후 집어넣어주기--%>
                           style="width: 25%;"><span>리뷰 <em id="reviewCnt">0</em></span></a>
                    </div>
                    <!-- //tabs -->

                    <!-- 리뷰// -->
                    <section id="p_proReview" class="tab-contents proreview active">
                        <h3 class="hide"><strong>리뷰</strong></h3>

                        <div class="list-top">
                            <button type="button" class="btn black btn-review"
                                    onclick="login_check();">리뷰 작성
                            </button>
                            <span class="grade-star big">
                                <span>
                                    <span style="width:96%;"></span>
                                </span>
                                <strong><em>4.8</em><i class="bar">/</i>5</strong>
                            </span>
                        </div>

                        <%--정렬 부분--%>
                        <div class="list-sort">
                            <label><input type="checkbox" name="pic" id="onlyPic" data-pic-yn="N"
                                          onclick="fnGaEventReview('B');fnReviewAjaxPcList('A', 1);"><span>포토 리뷰</span></label>
                            <div class="form-sort" id="reviewImgYn">
                                <label><input type="radio" name="sort" value="1"
                                              onclick="fnGaEventReview('C');fnReviewAjaxPcList('A', 1);"><span>베스트순</span></label>
                                <label><input type="radio" name="sort" value="2" checked=""
                                              onclick="fnGaEventReview('C');fnReviewAjaxPcList('A', 1);"><span>최신순</span></label>
                            </div>
                        </div>

                        <!-- 리뷰 리스트 동적 구현 -->
                        <div class="review-list">
                            <ul>
                                <%--리뷰 테이블 불러와줄 부분--%>
                                <li data-no="694661" data-wrt-id="art362" data-ord-no="22060500249923"
                                    data-slitm-cd="S02011022802" data-opt-cd=""
                                    data-img-path="PD/PDImages/S/6/2/7/8806079812726_00.jpg"
                                    data-contents="냉동고에 넣어 놓고 시간 없을때 먹고 있네요. 너무 맛있습니다" data-img-path1=""
                                    data-img-path2="" data-img-path3="" data-slitm-nm="[현대그린푸드] 영광 참굴비(마리당 각 110g/3마리)"
                                    data-slitm-desc="큰 사이즈의 영광굴비가 3마리" data-atfl-no="" data-scrg="5">
                                    <div class="star">
                                        <div class="grade-star"><span><span style="width:100%;">5</span></span></div>
                                    </div>
                                    <div class="recont">
                                        <div class="ti">
                                            <%--리뷰 테이블 값 가져오기--%>
                                            <span class="txt-option">
                                            큰 사이즈의 영광굴비가 3마리
                                            </span>
                                            <span class="txt-review">냉동고에 넣어 놓고 시간 없을때 먹고 있네요. 너무 맛있습니다</span>
                                        </div>
                                    </div>

                                    <div class="info">
                                        <%--user테이블의 userId 컬럼 가져오기--%>
                                        <span class="txt-id">art*****</span>
                                        <span class="txt-date">2022.09.03</span>
                                    </div>

                                    <div class="btnwrap">
                                        <button type="button" class="btn-notify" onclick="fnClickReviewReport(this)">
                                            신고
                                        </button>
                                    </div>
                                </li>
                            </ul>
                            <!-- pagination// -->

                            <%-- 리뷰 개수가 늘어남에 따라 페이지 처리 어떻게 할지 구분 하기--%>
                            <div class="pagination">
                                   <span class="num">
                                   <a href="javascript:fnReviewAjaxPcList('B', '1');" class="active">1</a>
                                       <!-- 현재페이지 class="active" -->
                                   <a href="javascript:fnReviewAjaxPcList('B', '2');">2</a>
                                   <a href="javascript:fnReviewAjaxPcList('B', '3');">3</a>
                                   <a href="javascript:fnReviewAjaxPcList('B', '4');">4</a>
                                   <a href="javascript:fnReviewAjaxPcList('B', '5');">5</a>
                                   <a href="javascript:fnReviewAjaxPcList('B', '6');">6</a>
                                   <a href="javascript:fnReviewAjaxPcList('B', '7');">7</a>
                                   <a href="javascript:fnReviewAjaxPcList('B', '8');">8</a>
                                   <a href="javascript:fnReviewAjaxPcList('B', '9');">9</a>
                                   <a href="javascript:fnReviewAjaxPcList('B', '10');">10</a>
                                   </span>
                                <a href="javascript:fnBlockCnt('A', 'B');" class="next">다음</a>
                            </div>
                            <!-- //pagination -->
                        </div>

                    </section>
                    <!-- //리뷰 -->

                    <section id="p_proReviewWrite" class="tab-contents prowrite review">
                        <h3>리뷰작성</h3>
                        <div class="product-list vertical">
                        <span class="thumb">
                            <img src="" alt="" id="popReviewWriteImg">
                        </span>
                            <!-- data-no: 글번호, data-cd:패키지일 경우 상품코드,  data-ord-no: 주문번호-->
                            <div class="contr" data-no="" data-cd="" data-ord-no="">
                                <strong class="txt-ti"></strong>
                                <span class="txt-option"></span>
                            </div>
                        </div>
                        <%--리뷰작성 폼 연결해주기--%>
                        <form id="fileForm" method="post" enctype="multipart/form-data">
                            <fieldset>
                                <legend class="hide">리뷰작성</legend>
                                <input type="hidden" name="itemEvalAtclNo" value="">
                                <input type="hidden" name="ordNo" value="">
                                <input type="hidden" name="slitmCd" value="">
                                <input type="hidden" name="optItemCd" value="">
                                <input type="hidden" name="pckgItemYn" value="">
                                <input type="hidden" name="itemEvalScrg" id="itemEvalScrg" value="">
                                <input type="hidden" name="itemEvalCntn" id="itemEvalCntn" value="">
                                <input type="hidden" name="imgCnt" id="imgCnt" value="">
                                <input type="hidden" name="imgYn1" id="imgYn1" value="">
                                <input type="hidden" name="imgYn2" id="imgYn2" value="">
                                <input type="hidden" name="imgYn3" id="imgYn3" value="">
                                <input type="hidden" name="pathType1" id="pathType1" value="">
                                <input type="hidden" name="pathType2" id="pathType2" value="">
                                <input type="hidden" name="atflNo" id="atflNo" value="">

                                <div class="write-area">
                                    <div class="reviewstar">
                                        <div class="grade-star big active">
                                            <span class="active" id="start1">1점</span>
                                            <span class="active" id="start2">2점</span>
                                            <span class="active" id="start3">3점</span>
                                            <span class="active" id="start4">4점</span>
                                            <span class="active" id="start5">5점</span>
                                            <input type="hidden" name="starV" value="5">
                                            <div class="txt" id="totstart"><em class="tot">5</em>/<em>5</em></div>
                                        </div>
                                    </div>

                                    <div class="form-default horizon form-file" id="expsY2">
                                        <strong>사진 첨부</strong>
                                        <div class="upload-file">
                                            <label><input type="file" class="upload-hidden" title="사진 첨부"
                                                          name="uploadImg" id="uploadImg1" accept="image/*"></label>
                                        </div>
                                        <div class="upload-file">
                                            <label><input type="file" class="upload-hidden" title="사진 첨부"
                                                          name="uploadImg" id="uploadImg2" accept="image/*"></label>
                                        </div>
                                        <div class="upload-file">
                                            <label><input type="file" class="upload-hidden" title="사진 첨부"
                                                          name="uploadImg" id="uploadImg3" accept="image/*"></label>
                                        </div>
                                    </div>

                                    <label class="form-counter" id="expsY1">
                                        <textarea title="리뷰 입력"
                                                  placeholder="최소 글자수는 10자 이상입니다. 고객님의 취향과 경험을 좀 더 자세히 공유해주세요."
                                                  name="reviewTextarea" id="reviewTextarea"></textarea>
                                        <span class="counter"><em>0</em> /500 자</span>
                                    </label>
                                    <p class="txt-star" id="expsN1" style="display: none;">
                                        개인별 주관적인 의견으로 인해 상품의 기능 및 효과에 대한
                                        오해의 소지가 있을 수 있어 평점만 선택 가능합니다.
                                    </p>
                                </div>

                                <div class="btns">
                                    <button type="button" class="btn gray middle btn-cancel"
                                            onclick="fn.addClass('#p_proReview');fn.removeClass('#p_proReviewWrite');">
                                        취소
                                    </button>
                                    <button type="button" class="btn fill black middle btn-confirm"
                                            onclick="fnReviewSave();">확인
                                    </button>
                                </div>
                            </fieldset>
                        </form>
                        <%--리뷰작성 규칙--%>
                        <div class="infotxt">
                            <strong>리뷰 작성 안내</strong>
                            <ul>
                                <li id="expsY3">권한<br>현대식품관에서 구입한 상품만 가능하며, 배송 완료일 기준 90일까지 작성하실 수 있습니다.</li>
                                <li id="expsY4">혜택<br>리뷰 작성 혜택은 H.Point로 지급되며 H.Point 통합회원이 아닌 경우 지급받으실 수 없습니다.</li>
                                <li id="expsY5">텍스트 리뷰 50P / 포토 리뷰 150P</li>
                                <li id="expsY6">리뷰<br>아래 내용에 해당하는 사유라고 판단되는 경우 작성자 동의 없이 미전시할 수 있으며, 지급된 포인트는 회수됩니다.
                                </li>
                                <li id="expsY7">부적합한 내용의 작성(허위 사실, 욕설, 비난, 일반식품의 효능, 효과, 해석 불가능한 리뷰, 타 상품에 대한 리뷰 등) 타인의
                                    권리 혹은 개인정보 침해 우려가 있는 경우 (캡처. 제3자 사진 도용 등) 리뷰 작성 후 반품
                                </li>

                                <li id="expsN2" style="display: none;">리뷰 작성 후 반품 시 지급된 리뷰 포인트는 회수됩니다.</li>
                                <li id="expsN3" style="display: none;">포인트는 H.Point로 지급되며 H.Point가 없으신 경우 지급받을 수 없습니다.
                                </li>
                            </ul>
                        </div>
                    </section>
                    <!-- //리뷰작성 -->

                </div>

            </div>

        </div>
    </div>
    <!-- //contents -->

    <!-- footer// -->
    <footer id="footer">

    </footer>
    <!-- //footer -->

</div>

</body>
<script>
		function login_check(){ 
	        var uid = '<%=session.getAttribute("UserId")%>';
	
	         if(uid=="null"){ 
	            alert("로그인이 필요한 항목입니다."); 
	         }
	         else{
	            location.href("TohomeServlet?command=");
	         }
   		}   
	</script>
</html>