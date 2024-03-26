<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<jsp:include page="../Common/Link.jsp" />

   
<div id="wrap" class="main">
    <!-- header// -->
    <!--begin:ca-exclude-->


    <%-- 정렬 관련 필터부분 작성  --%>
    <script>
    </script>
	<link rel="stylesheet" type="text/css" href="./UIUX/css/main.min.css?ver=2">
    <div id="contents">
        <div class="innercon">
            <h2></h2>

            <!-- contents// -->
            <section>
                <%--후에 상품을 for문으로 있는 데이터 값을 모두 가져오는 방법으로 작성--%>
                <h3>
                    <span class="bl" style="border-top:4px solid ">
                    <i style="border-bottom:4px solid "></i>
                </span>
                    <strong style="color:;font-weight:bold">투홈 신상품</strong>
                    <small style="color:;font-weight:normal">현대식품관 투홈 신상품</small></h3>
                <!-- filter// -->
			            <section class="list-filter">
			                <strong class="txt-total"></strong>
			                <div class="filter-wrapper">
				                <div class="form-filter">
				                    <ul class="btn-group" id="sortType" onchange="fnAddItemList('N');">
				                        <li><button type="button"  onclick="location='TohomeServlet?command=latest_productList&top_num=0&filter=1'">낮은가격순</button></li>
				                        <li><button type="button"  onclick="location='TohomeServlet?command=latest_productList&top_num=0&filter=2'">높은가격순</button></li>
				                    </ul>
				                </div>
				            </div>
				        </section>
	            <!-- filternav// -->
	            <ul class="best-list type2">
                <c:forEach items="${latestProductList}"  var="productDTO">
			      <li class="pro">
                        <%--상품 상세 페이지와 연결 해주기--%>
                        <a href="TohomeServlet?command=product_detail&prod_no=${productDTO.prod_no}"
                           class="soldout"><span class="thumb">
                            <img src="${productDTO.prod_img}"
                                 alt="">
                            <div class="badgewrap"></div></span><span class="info">
                            
                            <span class="state" style="color : #ff6913">NEW</span>
                            <strong>${productDTO.prod_name}</strong>
                        </span>
                        </a>
                        <div class="bottom">
                            <span class="txt-price">
                            <strong><em>${productDTO.price}</em>원</strong>
                            </span>
                            <!-- <a href="#" class="btn-weighting"></a> -->
                        </div>
                    </li>
			    </c:forEach>
                   

                </ul>
            </section>

            <!-- contents// -->

        </div>
    </div>

    <!-- //contents -->

    <!-- footer// -->
	<jsp:include page="../Common/footer.jsp"/>
    <!-- //footer -->

</div>
</body>
</html>