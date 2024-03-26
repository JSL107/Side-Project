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
	padding: 28px 28px;
	margin: 15px;
	margin-left:3px;
	margin-right:3px;
 	border: 1px solid #d4d4d4; 
	background-color: #ffffff;
	text-align: center;
	cursor: pointer;
	border-radius: 5%;
}

.test_obj input[type="radio"]:checked+span {
	background-color: #3E3E3E;
	color: #ffffff;
	border: 3px solid #fff;
}

.bx-wrapper {
    box-shadow: none;
    border: 0; 
    margin-bottom: 10px;
    margin-top: 10px;
    border-radius: 10px;
    background-color: #2c2c2c00; 
}

</style>

<input type="hidden" name="CSRFToken"
	value="77b0e71f-1c68-403d-8ba3-1c8b76071cce">

<div id="bodyWrap" class="products">
 <h3 class="cnts_title" style="font-weight: bold;">
        <span>Cosmetic Studio</span>
 </h3>
 
	<div class="cosmeticContainer sub_container">
		<div class="headerLogo">
	    	<img style="max-width: 100%;" src="../../../resources/images/makeup/cosmetic-logo.png"/>
	    </div>
		<div class="makeupHeader" id="personalColor" val="${personalColor}">
			<span class="personalText"> ${personalColor} </span>
		</div>
		
		<div class="makeupBody"> 
			<div class="makeupImgDiv" style="position: relative;">
				<img id="origin_image" style="position: absolute; transform: rotateY(180deg);" src="">
				<img id="image" style="position: absolute; transform: rotateY(180deg);" src="" >
				<div class="loading" style="position: absolute; width:312px; height:372px; margin:60px 40px; display:block; border-radius: 20px; background-color: white; opacity:0.5;  ">
					<!-- Loading -->
					<div class="waveform" style="margin:48%;">
					  <div class="waveform__bar"></div>
					  <div class="waveform__bar"></div>
					  <div class="waveform__bar"></div>
					  <div class="waveform__bar"></div>
					</div>
					<!-- //Loading -->
				</div>
			</div>
			<div class="makeupPaletteDiv">
				<form action="recommends" id="color_form" method="post">
					<span class="paletteTitle" id="face">FACE</span><br>
					<div class="makeupPalette" style="width:400px;height:91px;">
						<div class="slider">
							<label class="test_obj" style="margin-left:15px; margin-right:-2px; padding:0px; width:120px"> 
								<input type="radio" style="padding:0" name="face" value="None" checked > 
								<span style="background-color: #3E3E3E; padding:0" >
									<img src="../../../resources/images/makeup/x3.png" style="width:57.33px; height:57.33px">
								</span>
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
					</div>
					
					<span class="paletteTitle" >EYE</span>
					<div class="makeupPalette">
						<div class="slider">
						<label class="test_obj" style="margin-left:15px; margin-right:-2px; padding:0px; width:120px"> 
							<input type="radio" name="eye" value="None" checked> 
							<span style="background-color: #3E3E3E;  padding:0"">
								<img src="../../../resources/images/makeup/x3.png" style="width:57.33px; height:57.33px">
							</span>
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
					</div>
					
					<span class="paletteTitle">LIP</span><br>
					<div class="makeupPalette">
						<div class="slider">
						<label class="test_obj" style="margin-left:15px; margin-right:-2px; padding:0px; width:120px"> 
							<input type="radio" name="lip" value="None" checked> 
							<span class="palette"  style="background-color: #3E3E3E;  padding:0"">
								<img src="../../../resources/images/makeup/x3.png" style="width:57.33px; height:57.33px">
							</span>
						</label>
						<c:forEach items="${colorList}" var="personalColorVO">
							<c:if test="${personalColorVO.ctg == '립'}">
								<label class="test_obj"> 
								<input type="radio" name="lip" value="${personalColorVO.rgb}"> 
								<span class="palette" style="background-color: ${personalColorVO.rgb}"></span>
								</label>
							</c:if>
						</c:forEach>
						</div>
					</div>
					<%-- <div id="personalColor" val="${personalColor}">${personalColor}</div> --%>
					<div id="fileName" val="${fileName}" style="display:none">${fileName}</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
			</div>
		</div>
		<div class="makeupFooter">
			<!-- <button type="button" class="btnMakeup" onclick="submit1()" ><span>요약 설명</span></button> -->
			<button type="button" class="btnMakeup" onclick="submit1()" ><span>추천 상품 보기</span></button>
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
	minSlides: 5,
	maxSlides: 5,
	slideWidth : 80, //색깔 폼의 크기 
/*  	slideMargin: 20, */
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
			 		url: 'http://192.168.137.122:8000/makeup',
		    		cache: false,
		    		data: formData,
		    		processData: false,
		    		contentType: false,
		    		beforeSend: function() {
		    			$(".loading").show();
		    		},
		    		complete: function() {
		    			$(".loading").hide();
		    		},
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
		 		url: 'http://192.168.137.122:8000/img',
	    		cache: false,
	    		data: formData,
	    		processData: false,
	    		contentType: false,
	    		beforeSend: function() {
	    			$(".loading").show();
	    		},
	    		complete: function() {
	    			$(".loading").hide();
	    		},
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