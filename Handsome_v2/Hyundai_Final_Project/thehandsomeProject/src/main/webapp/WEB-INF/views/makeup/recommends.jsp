<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="/WEB-INF/views/common/header.jspf"%>
<link href="../../../resources/css/makeup/makeup.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<input type="hidden" name="CSRFToken"
	value="77b0e71f-1c68-403d-8ba3-1c8b76071cce">

<style>
.bx-viewport {
	height: 400px ! important; 
}

.bx-wrapper {
/*     -moz-box-shadow: 0 0 5px #ccc; */
    /* -webkit-box-shadow: 0 0 5px #ccc; */
   /*  box-shadow: none; */
    border: 0; 
    background: #fff;
    margin-bottom: 20px;
    margin-top: 20px;
    margin: 0 auto;
}

.slider li{
	margin-right:0px !important;
}

.item_img {
	margin-top: 20px;
}

.item_info2 {
	margin-top: 10px ! important;
}

</style>

<div id="bodyWrap" class="products">
	<h3 class="cnts_title">
		<span>Cosmetic Studio<span>
	</h3>
	<div class="adaptive_wrap">
	<!-- 여기서 부터가 상품 진열 -->
		<div class="items_list cate_item4" id="listContent">
			<ul class="clearfix" id="listBody">
			
			<!-- <h4 class="cnts_title"> 
				<span>페이스<span> 
			</h4>  -->
			<div style="color: black; font-weight: bold; font-size: 25px; text-align: center; margin-top: 20px; margin-bottom: 20px;">F A C E</div>
				<c:if test="${empty faceList}">
					<div style="text-align: center;padding: 100px;font-size: 15px;border-bottom: 1px solid #d4d4d4;">추천 상품이 없습니다</div>
				</c:if>
				<c:if test="${not empty faceList}">
				<div class="slider">
				
				<c:forEach items="${faceList}" var="face">
					<li>
						<div class="item_box">
 							<a href="" class="item_info1"
								onclick="setEcommerceData('0', 'CATEGORY');"> <span
								class="item_img"> <img src="" id="T01_IMG_0"
									alt="${face.pname}" targetcode="TM2CAWOT761W_BK"
									class="respon_image"
									onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img3.jpg'" />
									<img src="" id="T02_IMG_0" alt="${face.pname}"
									targetcode="TM2CAWOT761W_BK" class="respon_image on"
									onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img3.jpg'"
									style="opacity: 0;" /> <input type="hidden" id="newImage1_0"
									value="http://newmedia.thehandsome.com/TM/2C/FW/TM2CAWOT761W_BK_T01.jpg" />
									<input type="hidden" id="newImage2_0"
									value="http://newmedia.thehandsome.com/TM/2C/FW/TM2CAWOT761W_BK_T02.jpg" />
							</span> 
							</a> <a href="http://www.thehandsome.com/ko/p/TM2CAWOT761W_BK?categoryCode=we052"
								class="item_info2" onclick="setEcommerceData('0', 'CATEGORY');">
								<span class="brand">${product.bname}</span> <span class="title">${face.pname}</span>

								<span class="price"><span id="price_TM2CAWOT761W_BK"><span>₩<fmt:formatNumber value="${face.pprice}" pattern="#,###"></fmt:formatNumber></span></span></span>
 	<!-- 							테그는 일단생략하자               <span class="flag">
                <span class="product">NEW</span>
              </span> -->
							</a>
							
								<a href="javascript:void(0);" class="cl wt"
									productid="${face.pid}" colorcode="${face.ccolorcode}"
									thumbnailimage1="${face.c_thumbnail1}"
									thumbnailimage2="${face.c_thumbnail2}"></a>
							
								<!-- <a href="javascript:addWishListClick('TM2CAWOT761W');"
									class="add_wishlist" id="wish_TM2CAWOT761W"
									onclick="GA_Category('wish', $(this));"
									data-value="TM2CAWOT761W_BK">위시리스트 담기</a>  -->
						</div>
					</li>
 				</c:forEach> 
 				</div>
 				</c:if>

 			<!-- <h4 class="cnts_title">
				<span>아이<span>
			</h4> -->
			<div style="color: black; font-weight: bold; font-size: 25px; text-align: center; margin-top: 40px; margin-bottom: 20px;">E Y E</div>
			<c:if test="${empty eyeList}">
				<div style="text-align: center;padding: 100px;font-size: 15px;border-bottom: 1px solid #d4d4d4;">추천 상품이 없습니다</div>
			</c:if>
			<c:if test="${not empty eyeList}">
			<div class="slider">
				<c:forEach items="${eyeList}" var="eye">
					<li>
						<div class="item_box">
							<a href="" class="item_info1"
								onclick="setEcommerceData('0', 'CATEGORY');"> <span
								class="item_img"> <img src="" id="T01_IMG_0"
									alt="${eye.pname}" targetcode="TM2CAWOT761W_BK"
									class="respon_image"
									onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img3.jpg'" />
									<img src="" id="T02_IMG_0" alt="${eye.pname}"
									targetcode="TM2CAWOT761W_BK" class="respon_image on"
									onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img3.jpg'"
									style="opacity: 0;" /> <input type="hidden" id="newImage1_0"
									value="http://newmedia.thehandsome.com/TM/2C/FW/TM2CAWOT761W_BK_T01.jpg" />
									<input type="hidden" id="newImage2_0"
									value="http://newmedia.thehandsome.com/TM/2C/FW/TM2CAWOT761W_BK_T02.jpg" />
							</span> 
							</a> <a href="http://www.thehandsome.com/ko/p/TM2CAWOT761W_BK?categoryCode=we052"
								class="item_info2" onclick="setEcommerceData('0', 'CATEGORY');">
								<span class="brand">${product.bname}</span> <span class="title">${eye.pname}</span>
								<span class="price"><span id="price_TM2CAWOT761W_BK"><span>₩<fmt:formatNumber value="${eye.pprice}" pattern="#,###"></fmt:formatNumber></span></span></span>
								<!-- 테그는 일단생략하자 --> <!--               <span class="flag">
                <span class="product">NEW</span>
              </span> -->
							</a>
							
								<a href="javascript:void(0);" class="cl wt"
									productid="${eye.pid}" colorcode="${eye.ccolorcode}"
									thumbnailimage1="${eye.c_thumbnail1}"
									thumbnailimage2="${eye.c_thumbnail2}"></a>
							
							<!-- 							<a href="javascript:addWishListClick('TM2CAWOT761W');"
									class="add_wishlist" id="wish_TM2CAWOT761W"
									onclick="GA_Category('wish', $(this));"
									data-value="TM2CAWOT761W_BK">위시리스트 담기</a> -->
						</div>
					</li>
				</c:forEach>
				</div>
				</c:if>

			<!-- <h4 class="cnts_title">
				<span>립<span>
			</h4> -->
			<div style="color: black; font-weight: bold; font-size: 25px; text-align: center; margin-top: 40px; margin-bottom: 20px;">L I P</div>
			<c:if test="${empty lipList}">
				<div style="text-align: center;padding: 100px;font-size: 15px;border-bottom: 1px solid #d4d4d4;">추천 상품이 없습니다</div>
			</c:if>
			<c:if test="${not empty lipList}">
			<div class="slider">
				<c:forEach items="${lipList}" var="lip">
					<li>
						<div class="item_box">
							<a href="" class="item_info1"
								onclick="setEcommerceData('0', 'CATEGORY');"> <span
								class="item_img"> <img src="" id="T01_IMG_0"
									alt="${lip.pname}" targetcode="TM2CAWOT761W_BK"
									class="respon_image"
									onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img3.jpg'" />
									<img src="" id="T02_IMG_0" alt="${lip.pname}"
									targetcode="TM2CAWOT761W_BK" class="respon_image on"
									onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img3.jpg'"
									style="opacity: 0;" /> <input type="hidden" id="newImage1_0"
									value="http://newmedia.thehandsome.com/TM/2C/FW/TM2CAWOT761W_BK_T01.jpg" />
									<input type="hidden" id="newImage2_0"
									value="http://newmedia.thehandsome.com/TM/2C/FW/TM2CAWOT761W_BK_T02.jpg" />
							</span> 
							</a> <a href="http://www.thehandsome.com/ko/p/TM2CAWOT761W_BK?categoryCode=we052"
								class="item_info2" onclick="setEcommerceData('0', 'CATEGORY');">
								<span class="brand">${product.bname}</span> <span class="title">${lip.pname}</span>
								<span class="price"><span id="price_TM2CAWOT761W_BK"><span>₩<fmt:formatNumber value="${lip.pprice}" pattern="#,###"></fmt:formatNumber></span></span></span>
								<!-- 테그는 일단생략하자 --> <!--               <span class="flag">
                <span class="product">NEW</span>
              </span> -->
							</a>
							
								<a href="javascript:void(0);" class="cl wt"
									productid="${lip.pid}" colorcode="${lip.ccolorcode}"
									thumbnailimage1="${lip.c_thumbnail1}"
									thumbnailimage2="${lip.c_thumbnail2}"></a>
							
							<!-- 							<a href="javascript:addWishListClick('TM2CAWOT761W');"
									class="add_wishlist" id="wish_TM2CAWOT761W"
									onclick="GA_Category('wish', $(this));"
									data-value="TM2CAWOT761W_BK">위시리스트 담기</a> -->
						</div>
					</li>
				</c:forEach> 
				</div>
				</c:if>

		</div>
		<!-- 상품진열 끝 -->
	</div>
	
</div>
<script src="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
slider = $('.slider').bxSlider({
	mode: 'horizontal',
	minSlides: 4,
	maxSlides: 4,
	slideWidth : 300, //색깔 폼의 크기 
    //slideMargin: 20,
	pager:false,
	touchEnabled: false,
	infiniteLoop: false,
	hideControlOnEnd: true,
}); 

//slider.reloadSlider();

//로드될때 이미지들 색깔에 맞게 띄우기
const products = document.querySelectorAll(".item_box")
for(i=0; i< products.length ; i++){
    const img1 = products[i].getElementsByClassName("cl")[0].getAttribute("thumbnailimage1");	
    const img2 = products[i].getElementsByClassName("cl")[0].getAttribute("thumbnailimage2");
    
    const pid = products[i].getElementsByClassName("cl")[0].getAttribute("productid");
    const ccode = products[i].getElementsByClassName("cl")[0].getAttribute("colorcode");
    
    products[i].getElementsByClassName("respon_image")[0].setAttribute("src", img1);
    products[i].getElementsByClassName("respon_image")[1].setAttribute("src", img2);
    
    
    products[i].getElementsByClassName("item_info1")[0].setAttribute("href", "../product/product_detail?pid="+pid+"&colorcode="+ccode);
    products[i].getElementsByClassName("item_info2")[0].setAttribute("href", "../product/product_detail?pid="+pid+"&colorcode="+ccode);
    
/*     products[i].getElementsByClassName("item_info1")[0].setAttribute("href", "../product/product_detail?pid="+pid+"&colorcode=none");
    products[i].getElementsByClassName("item_info2")[0].setAttribute("href", "../product/product_detail?pid="+pid+"&colorcode=none");
     */
/*     if (ccode != null) {
    	products[i].getElementsByClassName("item_info1")[0].setAttribute("href", "/product/product_detail?pid="+pid+"&colorcode=");
        products[i].getElementsByClassName("item_info2")[0].setAttribute("href", "/product/product_detail?pid="+pid+"&colorcode=");
    } else {
        products[i].getElementsByClassName("item_info1")[0].setAttribute("href", "/product/product_detail?pid="+pid);
        products[i].getElementsByClassName("item_info2")[0].setAttribute("href", "/product/product_detail?pid="+pid);
   } */
}
</script>

<!-- footerWrap -->
<%@include file="/WEB-INF/views/common/footer.jspf"%>