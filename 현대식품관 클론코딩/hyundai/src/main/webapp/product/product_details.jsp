<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% 
   int login_yn = 0;
   if (session.getAttribute("UserId") != null) { 
      login_yn = 1;
} %>
	<%
	int basketInsertYN = 0;
	if (request.getAttribute("basketInsertYN") != null){
		basketInsertYN = 1;
	}
	%>
<!DOCTYPE html> <!-- Written by 미림-->
<head>
    <style class="vjs-styles-defaults">
        .video-js {
            width: 300px;
            height: 150px;
        }

        .vjs-fluid {
            padding-top: 56.25%
        }

        .btn-wish {
            position: relative;
            display: inline-block;
            margin-left: 14px;
            width: 34px;
            height: 32px;
        }

        .btn-wish:after {
            content: "";
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: inline-block;
            width: 24px;
            height: 21px;
            background: url("../images/btn.png") no-repeat 0 -150px;
        }

        .btn-wish.active {
            animation: wishMotion .4s ease-in-out both;
        }

        .btn-wish.active:after {
            background-position: -50px -150px;
        }
    </style>
    <!-- 새벽배송 공통 태그-->
    <meta charset="UTF-8"><!-- ./{productDTO.category_id}/{productDTO.prod_id} -->
    <title>상품상세>${productDTO.prod_name}</title>
    <link rel="shortcut icon" type="image/x-icon" href="./UIUX/images/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../UIUX/css/css-library.min.css?ver=2">
    <link rel="stylesheet" type="text/css" href="../UIUX/css/common.min.css?ver=2">
    <%--data aos css , script 설정--%>
	<script>
	window.onload = function(){
		$('input:radio[name="review_star"]').change(function() {
	        $("#review_point").text($(this).val()); 
	    });
		
		
		 var urlParams = location.search.split(/[?&]/).slice(1).map(function(paramPair) {

		        return paramPair.split(/=(.+)?/).slice(0, 2);

		    }).reduce(function(obj, pairArray) {

		        obj[pairArray[0]] = pairArray[1];

		        return obj;

		    }, {});
		
		  
		  var tab_info = urlParams.tab_info;
		  if(tab_info == "review"){
			  tab_change("p_proReview");
		  }
			  
	}
	
	</script>
    <script type="text/javascript">
        function tab_change(tab) {
            var tab_info = document.getElementById(tab);
            tab_info.classList.add('active');

            if (tab == "p_proDetail") {
                document.getElementById("proDetail").classList.add('active');
                document.getElementById("proReview").classList.remove('active');
                document.getElementById("p_proReview").classList.remove('active');
                location.href="#p_proDetail";
            } else if (tab == "p_proReview") {
                document.getElementById("proReview").classList.add('active');
                document.getElementById("proDetail").classList.remove('active');
                document.getElementById("p_proDetail").classList.remove('active');
                location.href="#p_proReview";
            }
        }

        function review_write(review) {
            var review_info = document.getElementById(review);
            review_info.classList.add('active');
            location.href="#fileForm";
        }

        function review_cancel(review) {
            var review_info = document.getElementById(review);
            review_info.classList.remove('active');
            location.href="#p_proReview";
        }
        
        function deleteReview(review_user_id, review_no){
        	if("<%=(String)session.getAttribute("UserId")%>" != review_user_id){
        		alert("본인이 작성한 리뷰만 삭제 가능합니다.");
        		return;
        	}
        	else{
        		var url = "TohomeServlet?command=review_delete&prod_no="+${productDTO.prod_no}+"&review_no="+review_no;
        		location.href = url;
        	}
        	
        }
    </script>
    <style>
        .star-rating {
            display: flex;
            flex-direction: row-reverse;
            font-size: 2.25rem;
            line-height: 2.5rem;
            justify-content: space-around;
            padding: 0 0.2em;
            text-align: center;
            width: 5em;
        }

        .star-rating input {
            display: none;
        }

        .star-rating label {
            -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
            -webkit-text-stroke-width: 2.3px;
            -webkit-text-stroke-color: #2b2a29;
            cursor: pointer;
        }

        .star-rating :checked ~ label {
            -webkit-text-fill-color: gold;
        }

        .star-rating label:hover,
        .star-rating label:hover ~ label {
            -webkit-text-fill-color: #fff58c;
        }
    </style>
</head>

<body data-aos-easing="ease" data-aos-duration="400" data-aos-delay="0">

<!-- body -->
<!-- 상품 공통 -->
<link rel="stylesheet" type="text/css" href="./UIUX/css/product.min.css">
<link rel="stylesheet" type="text/css" href="./UIUX/css/s-style_v2.min.css">
<!-- // 상품 공통 -->

<div id="wrap" class="product detail">
    <!-- header// -->
    <jsp:include page="../Common/Link.jsp"/>
    <!--begin:ca-exclude-->

    <input type="hidden" name="addBtnYn" value="">

    <!-- contents// -->
    <div id="contents">
        <div class="innercon">
            <section class="proinfo-area">
                <!-- propic// -->
                <div class="propic">
                    <%--큰사진--%>
                    <div class="propicbig">

                        <div class="zoomWrapper" style="height: 624px; width: 520px;">
                            <img src="${productDTO.prod_img}"></div>
                    </div>
                </div>
                <!-- //propic -->

                <!-- proinfo// -->
                <div class="proinfo">
                    <h2>
                        <strong>${productDTO.prod_name}</strong>
                    </h2>

                    <!-- 가격(fnPDSetPriceSection)  -->
                    <div class="price" id="price_section">
                        <%--가격 받아줄 부분--%>
                        <span class="txt-price">
                        <strong>${productDTO.price}원</strong>
                        </span>
                        <div class="probtn">

                            <button id="like" type="button" class="btn-wish" onclick="changeClass();">


                            </button>
                        </div>
                    </div>
                    <script type="text/javascript">
                        function changeClass() {
                            if (document.getElementById('like').className === "btn-wish") {
                                document.getElementById('like').className = "btn-wish active";
                            } else {
                                document.getElementById('like').className = "btn-wish";
                            }
                        }
                    </script>

                    <div class="detailinfo">
                        <dl>
                            <!--1. 구독상품 아닐때 -->
                            <!-- 선물배송은 원산지, 포장타입, 알레르기 정보 안나옴.  -->
                            <dt>포장타입</dt>
                            <dd>냉동</dd>

                            <dt>배송형태</dt>
                            <dd id="deliverySection">
                                <label>
                                    <input type="checkbox" name="" value="1"> 정기배송
                                </label>
                            </dd>

                            <dt>상품선택</dt>
                            <dd>
                                <!-- 상품선택// start-->
                                <div class="optionarea" id="top_optionarea">
                                    <div class="optionls">
                                        <div>
                                            <strong class="txt-ti">${productDTO.prod_name}</strong>
                                            <script>
                                            let prodQuant = 1
                                                function count(type) {
                                                    let result = document.getElementById('countNumber');
                                                    let number = result.value;
                                                    let totalPrice =  ${productDTO.price};
                                                    if (type === 'plus') {
                                                        number = parseInt(number) + 1;
                                                        document.getElementsByClassName('price_output')[0].value = totalPrice * number;
                                                        document.getElementsByClassName('price_output')[1].value = totalPrice * number;
                                                    }
                                                    if (type === 'minus') {
                                                        number = parseInt(number);
                                                        if (number < 0) {
                                                            number = 0;
                                                        } else if (number > 0) {
                                                            number -= 1;
                                                        }
                                                        document.getElementsByClassName('price_output')[0].value = totalPrice * number;
                                                        document.getElementsByClassName('price_output')[1].value = totalPrice * number;
                                                    }
                                                    result.value = number;
                                                    prodQuant = number;
                                                }
                                            </script>
                                            <%--수량관련--%>
                                            <div class="ea-area">
                                                <input id="countNumber" type="number" title="수량 입력" readonly=""
                                                       value="1">
                                                <button type="button" class="btn-down" onclick='count("minus")'>
                                                </button>
                                                <button type="button" class="btn-up" onclick='count("plus")'>
                                                </button>


                                            </div>
                                            <span class="txt-price"><em><input
                                                    style="
                                                    width: 100px;
                                                    border: none;
                                                    background-color: #f8f8f8"
                                                    class="price_output" readOnly="" value="${productDTO.price}"></em>원</span>


                                        </div>
                                    </div>
                                </div>
                            </dd>
                        </dl>
                    </div>

                    <script>
                        function is_login_basket() {
                        	console.log("눌렸나?");
                            if (<%=login_yn%> == 1
                        )
                            {
                                location.href = "TohomeServlet?command=basket_insert&userNo="+<%=session.getAttribute("UserNo")%>+"&prodNo="+${productDTO.prod_no}+"&prodQuant="+prodQuant+"" ;
                            }
                        else
                            {
                                location.href = "TohomeServlet?command=login_form";
                            }
                        }

                        function is_login_buy() {
                            if (<%=login_yn%> == 1
                        )
                            {
                                location.href = "TohomeServlet?command=order_page&prod_no="+${productDTO.prod_no}+"&quantity="+prodQuant+"";
                            }
                        else
                            {
                                location.href = "TohomeServlet?command=login_form";
                            }
                        }
                    </script>
                    <%--후에 주문하기 페이지와 연결해주기--%>
                    <div class="buybutton" id="top_buybutton"><p class="txt-total">총 금액
                        <strong><em>
                            <input
                                style="
                                width: 150px;
                                border: none;
                                background: #ffffff;"
                                class="price_output" readOnly="" value="${productDTO.price}"></em>원</strong></p>
                        <div class="btns">
                            <%--장바구니 insert 메소드와 연결해주기--%>
                            <button type="button" class="btn orange bigger btn-buy" onclick="is_login_basket()">장바구니
                            </button>
                            <%--주문 페이지와 연결해주기--%>
                            <button type="button" class="btn fill orange bigger btn-buy"
                                    onclick="is_login_buy()">바로구매
                            </button>
                        </div>
                    </div>

                </div>
                <!-- //proinfo -->
            </section>

            <div class="prodetailcont" style="min-height: 339px;">
                <div class="prodetail-area">

                    <!-- tabs//미림 -->
                    <div class="tab-menu protabs" style="position: absolute; inset: 0px auto auto 0px;">
                        <%--상세 정보 링크 조인--%>
                        <a href="#p_proDetail" id="proDetail" class="active" onclick="tab_change('p_proDetail');"
                           style="width: 50%;"><span>상세정보</span></a>
                        <%--리뷰 정보 링크 조인--%>
                        <a href="#p_proReview" id="proReview" onclick="tab_change('p_proReview');" style="width: 50%;"
                           class=""><span>리뷰 <em id="reviewCnt">${fn:length(reviewList)}</em></span></a>
                    </div>

                    <!-- //tabs -->

                    <!-- 상품상세// -->
                    <section id="p_proDetail" class="tab-contents prodetail active">
                        <img src="../crawling_images/${productDTO.prod_no}.png">
                    </section>
                    <!-- //상품상세 -->

                    <!-- 리뷰// -->
                    <section id="p_proReview" class="tab-contents proreview ">
                        <h3 class="hide">
                            <strong>리뷰</strong>
                        </h3>
						<%if (login_yn != 0){ %>
                        <div class="list-top">
                            <button type="button" class="btn black btn-review"
                                    onclick="review_write('p_proReviewWrite')">리뷰
                                작성
                            </button>
                            <p>
                                고객님들의 소중한 상품 리뷰를 남겨주세요!<br> 리뷰 작성 시 포인트 혜택을 드립니다.
                            </p>
                        </div>
                        <%} %>


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
							</section>

                        <!-- //리뷰 -->
                        <section id="p_proReviewWrite"
                                 class="tab-contents prowrite review ">

                            <h3>리뷰작성</h3>


                            <form id="fileForm" method="post" action="TohomeServlet?command=review_write">
                                <fieldset>
                                    <legend class="hide">리뷰작성</legend>
                                    <input type="hidden" name="prod_no" value="${productDTO.prod_no}">

                                    <div class="write-area">
                                        <div class="reviewstar">
                                           


                                            <div class="grade-star big active star-rating space-x-4 mx-auto">
                                                <input type="radio" id="5-stars" name="review_star" value="5"
                                                       v-model="ratings" checked/>
                                                <label for="5-stars" class="star pr-4">★</label>
                                                <input type="radio" id="4-stars" name="review_star" value="4"
                                                       v-model="ratings"/>
                                                <label for="4-stars" class="star">★</label>
                                                <input type="radio" id="3-stars" name="review_star" value="3"
                                                       v-model="ratings"/>
                                                <label for="3-stars" class="star">★</label>
                                                <input type="radio" id="2-stars" name="review_star" value="2"
                                                       v-model="ratings"/>
                                                <label for="2-stars" class="star">★</label>
                                                <input type="radio" id="1-star" name="review_star" value="1"
                                                       v-model="ratings"/>
                                                <label for="1-star" class="star">★</label>

                                                <div class="txt" id="totstart" style="display:inline-flex;">
                                                    <em class="tot"><p id="review_point">5</p></em>/<em>5</em>
                                                </div>
                                            </div>
                                        </div>


                                        <label class="form-counter" id="expsY1"> 
                                        <textarea title="리뷰 입력"
                                                placeholder="최소 글자수는 10자 이상입니다. 고객님의 취향과 경험을 좀 더 자세히 공유해주세요."
                                                name="review_write" id="reviewTextarea"
                                                onkeyup="javascript:fnReviewTextareaLimit(this, 500, 'B');"></textarea>
                                            <!-- <span class="counter"><em>0</em> /500 자</span> -->
                                        </label>
                                        <p class="txt-star" id="expsN1" style="display: none;">
                                            개인별 주관적인 의견으로 인해 상품의 기능 및 효과에 대한 오해의 소지가 있을 수 있어 평점만 선택
                                            가능합니다.</p>
                                    </div>

                                    <div class="btns">
                                        <button type="button" class="btn gray middle btn-cancel"
                                                onclick="review_cancel('p_proReviewWrite');">
                                            취소
                                        </button>
                                        <button type="submit"
                                                class="btn fill black middle btn-confirm">확인
                                        </button>
                                    </div>
                                </fieldset>
                            </form>
   
                            <div class="infotxt">
                                <strong>리뷰 작성 안내</strong>
                                <ul>
                                    <li id="expsY3">권한<br>현대식품관에서 구입한 상품만 가능하며, 배송 완료일 기준
                                        90일까지 작성하실 수 있습니다.
                                    </li>
                                    <li id="expsY4">혜택<br>리뷰 작성 혜택은 H.Point로 지급되며 H.Point
                                        통합회원이 아닌 경우 지급받으실 수 없습니다.
                                    </li>
                                    <li id="expsY5">텍스트 리뷰 50P / 포토 리뷰 150P</li>
                                    <li id="expsY6">리뷰<br>아래 내용에 해당하는 사유라고 판단되는 경우 작성자 동의
                                        없이 미전시할 수 있으며, 지급된 포인트는 회수됩니다.
                                    </li>
                                    <li id="expsY7">부적합한 내용의 작성(허위 사실, 욕설, 비난, 일반식품의 효능, 효과,
                                        해석 불가능한 리뷰, 타 상품에 대한 리뷰 등) 타인의 권리 혹은 개인정보 침해 우려가 있는 경우 (캡처.
                                        제3자 사진 도용 등) 리뷰 작성 후 반품
                                    </li>

                                    <li id="expsN2" style="display: none;">리뷰 작성 후 반품 시 지급된 리뷰
                                        포인트는 회수됩니다.
                                    </li>
                                    <li id="expsN3" style="display: none;">포인트는 H.Point로 지급되며
                                        H.Point가 없으신 경우 지급받을 수 없습니다.
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
    <jsp:include page="../Common/footer.jsp"/>
    <!-- //footer -->
</div>
<script >
	$(document).ready(function(){
		if (<%=basketInsertYN%> == 1){
			alert('상품이 장바구니에 담겼습니다.')
		}
	    $('#like').click(function(){
	        AjaxConGet();
	    })
	});
	 
	function AjaxConGet(){
	    var url = "TohomeServlet?command=like_click";
	    $.ajax({
	        type:"post",
	        url:url,
	        dataType:"html",
	        data:{
	            prod_no :<%= request.getParameter("prod_no")%> 
	        },
	        success : function(data){

	        },
	        error : function(request,status,error){
	            alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
	            alert(e);
	        }
	    })
	}

</script>
</body>
</html>