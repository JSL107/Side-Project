<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="/WEB-INF/views/common/header.jspf"%>
<link href="../../../resources/css/makeup/makeup.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<style>
/* .test_obj {
	float: left;
	list-style: none;
	position: relative;
	width: auto;
	margin-right: 20px;
} */

.test_obj input[type="radio"] {
	display: none;
}

.test_obj input[type="radio"]+span {
	display: inline-block;
	padding: 38px 28px;
	border: 1px solid #dfdfdf;
	background-color: #ffffff;
	text-align: center;
	cursor: pointer;
	border-radius: 5%;
}

.test_obj input[type="radio"]:checked+span {
	background-color: #113a6b;
	color: #ffffff;
}

.bx-wrapper {
/*     -moz-box-shadow: 0 0 5px #ccc; */
    /* -webkit-box-shadow: 0 0 5px #ccc; */
    box-shadow: none;
    border: 0; 
    background: #000;
    margin-bottom: 20px;
    margin-top: 10px;
}
</style>

<input type="hidden" name="CSRFToken"
	value="77b0e71f-1c68-403d-8ba3-1c8b76071cce">

<div id="bodyWrap" class="products">
	<h3 class="cnts_title">
		<span>스마트 화장<span>
	</h3>

	<div class="sub_container" >
		<div style="background-color: #000; width:850px; margin:auto; padding-top:60px; padding-bottom:60px; text-align:center">
			<div id="personalColor" val="${personalColor}">
				<span style="color:white; font-size:26px"> ${personalColor} </span>
			</div>
		</div>
		<div style="background-color: #000; display : flex; width:850px; margin:auto"> 
			<div style="width:500px; height:250px; float:left;">
				<img id="origin_image" src="" style="width:390px; height:465px; margin-left: 60px; margin-right: 40px; display:none">
				<img id="image" src="" style="width:390px; height:465px; margin-left: 60px; margin-right: 40px; display:block"><br>
			</div>
			<div style="float:left; align-items : center; margin-left: 10px;">
			<form action="recommends" id="color_form" method="post">
				<span id="face" style="color:white; font-size:19px;">페이스</span><br>
				<div class="slider">
					<label class="test_obj"> 
						<input type="radio" name="face" value="None" checked> 
						<span style="background-color: #3E3E3E "></span>
					</label>
					<c:forEach items="${colorList}" var="personalColorVO">
						<c:if test="${personalColorVO.ctg == '페이스'}">
							<label class="test_obj"> 
								<input type="radio" name="face" value="${personalColorVO.rgb}"> 
								<span style="background-color: ${personalColorVO.rgb}"></span>
							</label>
						</c:if>
					</c:forEach>
				</div>
				
				<br> <span id="eye" style="color:white; font-size:19px;">아이</span><br>
				<div class="slider">
				<label class="test_obj"> 
					<input type="radio" name="eye" value="None" checked> 
					<span style="background-color: #3E3E3E"></span>
				</label>
				<c:forEach items="${colorList}" var="personalColorVO">
					<c:if test="${personalColorVO.ctg == '아이'}">
						<label class="test_obj"> 
							<input type="radio" name="eye" value="${personalColorVO.rgb}"> 
							<span style="background-color: ${personalColorVO.rgb}"></span>
						</label>
					</c:if>
				</c:forEach>
				</div>
				
				<br> <span id="lip" style="color:white; font-size:19px;">립</span><br>
				<div class="slider">
				<label class="test_obj"> 
					<input type="radio" name="lip" value="None" checked> 
					<span style="background-color: #3E3E3E"></span>
				</label>
				<c:forEach items="${colorList}" var="personalColorVO">
					<c:if test="${personalColorVO.ctg == '립'}">
						<label class="test_obj"> 
						<input type="radio" name="lip" value="${personalColorVO.rgb}"> 
						<span style="background-color: ${personalColorVO.rgb}"></span>
						</label>
					</c:if>
				</c:forEach>
				</div>
				
				<%-- <div id="personalColor" val="${personalColor}">${personalColor}</div> --%>
				<div id="fileName" val="${fileName}" style="display:none">${fileName}</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				
			</form>
			</div>
		</div>
		<div style="background-color: #000; width:850px; margin:auto; padding-top:80px; padding-bottom:60px;">
			<button type="button" style="border: none; background-color: black; margin:auto; display: block; cursor:pointer" onclick="submit1()">
				<img src="../../../resources/images/makeup/상품보기 버튼.jpg" alt="">
			</button>
		</div>
	</div>
</div>

<script src="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
/* 
$(document).ready(function(){
    $( '.slider' ).bxSlider({
    	mode: 'horizontal',
    	moveSlides: 2,
    	minSlides: 4,
    	maxSlides: 4,
    	slideWidth : 100,
    	slideMargin: 5,
    	pager:false,
    });
}); */

slider = $('.slider').bxSlider({
	mode: 'horizontal',
	moveSlides: 2,
	minSlides: 4,
	maxSlides: 4,
	slideWidth : 65, //색깔 폼의 크기 
// 	slideMargin: 20,
	pager:false,
	touchEnabled: false,
	infiniteLoop: false,
	hideControlOnEnd: true,
}); 
//slider.reloadSlider();

function hexToRgb(hexType) { 
	if (hexType === "None") {
		return "None";
	}
	
	var hex = hexType.replace("#", "");
	var r = parseInt(hex.substr(0, 2), 16);
	var g = parseInt(hex.substr(2, 2), 16);
	var b = parseInt(hex.substr(4, 2), 16);
	
    return "rgb(" + r + ", " + b + ", " + g + ")"; 
} 

$("input[name='face']").change(function(){
	makeup();
});

$("input[name='lip']").change(function(){
	makeup();
});

$("input[name='eye']").change(function(){
	makeup();
});

		function makeup() {
			
			var fileName = document.getElementById("fileName").innerText;
			var image = $('#origin_image').attr("src");
			image = image.substr(23);
			var faceColor = $('input[name=face]:checked').val();
			var eyeColor = $('input[name=eye]:checked').val();
			var lipColor = $('input[name=lip]:checked').val();
			var fileName = document.getElementById("fileName").innerText;
			
			console.log("image: " + image);
			let formData = new FormData();
			formData.append('fileName', fileName);
			formData.append('image', image);
			formData.append('faceColor', hexToRgb(faceColor));
			formData.append('eyeColor', hexToRgb(eyeColor));
			formData.append('lipColor', hexToRgb(lipColor));
			
			console.log('faceColor : ' + hexToRgb(faceColor));
			console.log('eyeColor : ' + hexToRgb(eyeColor));
			console.log('lipColor : ' + hexToRgb(lipColor));

			if (hexToRgb(faceColor) == "None" && hexToRgb(eyeColor) == "None" && hexToRgb(lipColor) == "None") {
				$("#image").css('display', 'none')
				$("#origin_image").css('display', 'block');
			}
			
			else {
				$.ajax({
			 		type: 'post',
			 		url: 'http://127.0.0.1:8000/makeup',
		    		cache: false,
		    		data: formData,
		    		processData: false,
		    		contentType: false,
			 		success: function(result) {
						/* console.log(result.image); */
						$("#image").attr("src", "data:image/jpeg;base64," + result.image);
						$("#image").css('display', 'block')
						$("#origin_image").css('display', 'none');
			 		}
			 	})
			}
		}
		
		$(function() {
			var fileName = document.getElementById("fileName").innerText;
			var origin_image = document.getElementById("origin_image");
			var img = document.getElementById("image");
		 	
			console.log("fileName: " + fileName);
			let formData = new FormData();
			formData.append('fileName', fileName);
			console.log(formData);
			
		 	$.ajax({
		 		type: 'post',
		 		url: 'http://127.0.0.1:8000/img',
	    		cache: false,
	    		data: formData,
	    		processData: false,
	    		contentType: false,
		 		success: function(result) {
					console.log(result.image);
					$("#image").attr("src", "data:image/jpeg;base64," + result.image);
					$("#origin_image").attr("src", "data:image/jpeg;base64," + result.image);
					$("#fileName").text(result.fileName);
					console.log("fileName은 " + result.fileName);
		 		}
		 	})
		 });
		
		
		function submit1(){
			$('#color_form').submit();
		}

	</script>

<!-- footerWrap -->
<%@include file="/WEB-INF/views/common/footer.jspf"%>