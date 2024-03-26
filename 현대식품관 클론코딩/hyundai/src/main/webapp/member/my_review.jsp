<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
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
    <title>베스트</title>
    <link rel="shortcut icon" type="image/x-icon" href="../UIUX/images/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../UIUX/css/css-library.min.css?ver=2">
    <link rel="stylesheet" type="text/css" href="../UIUX/css/common.min.css?ver=2">

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
<!-- 마이페이지 공용 웹자원 -->
<link rel="stylesheet" type="text/css" href="/UIUX/css/mypage.min.css?ver=12346">

<div id="wrap" class="mypage review">
    <!-- header// -->

    <!-- header// -->
    <jsp:include page="../Common/Link.jsp"/>
    <!-- //header -->

    <% 
    
    
    if (session.getAttribute("UserId") == null) {
        String url = "login_form.jsp";
        request.getRequestDispatcher(url).forward(request, response);
    } %>

    <!-- contents// -->
    <div id="contents">
        <div class="innercon">
            <!-- mypage lnb// -->
            <section class="lnbarea">
                <h2>마이페이지</h2>
                <ul>
                    <li class="lnb-depth1">
                        <a href="#">주문관리</a>
                        <ul class="lnb-depth2">
                            <li><a href="./" onclick="fn_GaEvent(this);">주문 내역</a></li>
                            <li><a href="./" onclick="fn_GaEvent(this);">주문취소</a></li>
                            <li><a href="./" onclick="fn_GaEvent(this);">반품/교환</a></li>
                            <li><a href="./" onclick="fn_GaEvent(this);">대량주문 문의</a></li>
                            <li><a href="./" onclick="fn_GaEvent(this);">투홈구독</a></li>
                            <li><a href="./" onclick="fn_GaEvent(this);">정기배송 설정</a></li>
                        </ul>
                    </li>

                    <li class="lnb-depth1">
                        <a href="#">쇼핑 혜택</a>
                        <ul class="lnb-depth2">
                            <li><a href="./">쿠폰</a></li>
                            <li><a href="./">H.Bonus</a></li>
                            <li><a href="./">투홈패스</a></li>
                            <li><a href="./">H.Point</a></li>

                            <li><a href="./">상품권 전환금</a></li>
                        </ul>
                    </li>
                    <li class="lnb-depth1">
                        <a href="#">나의 활동</a>
                        <ul class="lnb-depth2">
                            <li class="active"><a href="./">리뷰</a></li>
                            <li><a href="./">좋아요</a></li>
                            <li><a href="./">최근 본 상품</a></li>
                            <li><a href="./">매거진 보관함</a></li>
                            <li><a href="./">늘 필요한 상품</a>
                            </li>

                            <li><a href="./">이벤트 참여현황</a></li>
                            <li><a href="./">투홈백 관리</a></li>
                            <li><a href="./">재입고 알림</a></li>
                        </ul>
                    </li>
                    <li class="lnb-depth1">
                        <a href="#">나의 정보</a>
                        <ul class="lnb-depth2">
                            <li><a href="./">회원정보
                                변경</a></li>
                            <li><a href="./">배송지 관리</a></li>
                            <!-- <li><a href="#">간편계정연결관리</a></li> -->
                            <li><a href="./">로그인 기록</a></li>

                            <li><a href="./">H.Point
                                Pay</a></li>

                            <li><a href="./">Home Pay</a></li>
                            <li><a href="./">개인정보
                                이용현황</a></li>
                            <li><a href="./">환불계좌/현금영수증</a></li>
                            <li><a href="./">임직원 인증</a></li>
                            <li><a href="./">차량 등록</a></li>

                        </ul>
                    </li>

                </ul>
            </section>
            <!-- //mypage lnb -->

            <section class="conarea">
                <h3 class="tit">리뷰</h3>
                <h4>내가 작성한 리뷰를 확인할 수 있습니다.</h4>

                <!-- tabs// -->
                <div class="tab-menu">
                    <a href="./" id="tabMenu1"
                       class="active"><span>리뷰 목록<em>${fn:length(reviewList)}</em></span></a>
                </div>
                <!-- //tabs -->

                <%--TODO :: NODATA 형태는 이렇게 사용한다.--%>
                <!-- nodata// -->
                
                <c:set var="review_cnt" value="${fn:length(reviewList)}" />
                <c:if test="${review_cnt eq 0}">    
                	<div class="nodata">
                    작성한 리뷰가 없습니다.
                	</div>	
                </c:if>
                <c:if test="${review_cnt ne 0}">   
                	<!-- 리뷰 리스트 동적 구현 -->
                        <div class="review-list">
								<ul>
								<c:forEach items="${reviewList}"  var="reviewDTO">
									<li>
										<div class="star">
											<div class="grade-star">
												<span><span style="width: ${reviewDTO.review_star * 20}%;">${reviewDTO.review_star}</span></span>
											</div>
										</div>
										<div class="recont">
										<!-- 	<div class="pic">
												<button type="button">
													
												</button>
											</div> -->
											<div class="ti" style="height:50px;" >
												<span class="txt-review">${reviewDTO.review_write}</span>
											</div>
										</div>
										<div class="info">
											<span class="txt-id">${reviewDTO.user_id}</span> <span class="txt-date">${reviewDTO.review_upload_date}</span>
										</div>
										<div class="btnwrap">
											<!-- <button type="button" class="btn-notify" onclick="fnClickReviewReport(this)">수정</button> -->
											<button type="button" class="btn-notify" onclick="deleteReview('${reviewDTO.user_id}', '${reviewDTO.review_no}')">삭제</button>
										</div>
									</li>
									</c:forEach>
								</ul>
								<!-- pagination// -->
								<div class="pagination">
									<span class="num"> <a
										href="javascript:fnReviewAjaxPcList('B', '1');" class="active">1</a>
									<!-- 현재페이지 class="active" --> <a
										href="javascript:fnReviewAjaxPcList('B', '2');">2</a> <a
										href="javascript:fnReviewAjaxPcList('B', '3');">3</a> <a
										href="javascript:fnReviewAjaxPcList('B', '4');">4</a> <a
										href="javascript:fnReviewAjaxPcList('B', '5');">5</a> <a
										href="javascript:fnReviewAjaxPcList('B', '6');">6</a> <a
										href="javascript:fnReviewAjaxPcList('B', '7');">7</a> <a
										href="javascript:fnReviewAjaxPcList('B', '8');">8</a> <a
										href="javascript:fnReviewAjaxPcList('B', '9');">9</a> <a
										href="javascript:fnReviewAjaxPcList('B', '10');">10</a>
									</span> <a href="javascript:fnBlockCnt('A', 'B');" class="next">다음</a>
								</div>
								<!-- //pagination -->
							</div>
                </c:if>
                

                
                	
                
                
                <!-- //nodata -->
                
                
                
                  
                
                


                <div class="infotxt big">
                    <ul>
                        <li>텍스트리뷰 50P 지급, 포토리뷰 150P 지급</li>
                        <li>부적합한 게시물의 경우 무통보 삭제되며 지급된 포인트는 회수될 수 있습니다.</li>
                        <li>리뷰작성 후 반품 시 지급된 리뷰 포인트는 회수됩니다.</li>
                        <li>포인트는 H.Point로 지급되며 H.Point통합회원이 아닌 경우 지급받을 수 없습니다.</li>
                    </ul>
                </div>
            </section>
        </div>
    </div>
    <!-- //contents -->


    <!-- //contents -->

    <!-- footer// -->
	<jsp:include page="../Common/footer.jsp"/>
    <!-- //footer -->
</div>

</body>
</html>