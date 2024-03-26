<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="/WEB-INF/views/common/header.jspf" %>
<link href="../../../resources/css/makeup/makeup.css" rel="stylesheet" type="text/css"/>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<%
	String mnum = (String) session.getAttribute("makeup");
	if (mnum == null) {
		session.setAttribute("makeup", "1");
	} else {
		int cmnum = Integer.parseInt(mnum);
		cmnum++;
		session.setAttribute("makeup", cmnum + "");
	}
%>
<style>
   .makerupMain {
       position: relative;
       width: 995px;
   }

	.bx-wrapper {border:0; margin-bottom:0;}
   .coupon_section {
       position: relative
   }

   .coupon_section a {
       position: absolute;
       left: 50%;
       margin-left: -388px;
       top: 419px;
       width: 304px;
       height: 80px;
       text-indent: -9999px;
   }
   .mgz_view .evt_cnts {
   border-bottom:0;
   }

</style>
<div id="bodyWrap" class="products">
	<h3 class="cnts_title" style="font-weight: bold;">
		<span>Cosmetic Studio<span>
	</h3>
    <div class="adaptive_wrap" style="margin-top:0px;">
        <div class="evt_wrap" style="margin-top:0px;">
            <div class="mgz_view">
                <div class="evt_cnts" style="padding:0px;">
                    <div class="pic"><!-- 1 -->
                        
                        <div class="makerupMain" style="margin-left: auto; margin-right: auto">
                            <div>
                            	<img src="../../../resources/images/makeup/cosmetic-logo.png"/>
                                <img src="../../../resources/images/makeup/header.png"/>
                            </div>
                            <!-- <div class="slider"> -->
                               <!-- <img src="../../../resources/images/makeup/summer.png"/>
                               <img src="../../../resources/images/makeup/fall.png"/>
                               <img src="../../../resources/images/makeup/winter.png"/> -->
                               <img src="../../../resources/images/makeup/spring.png"/>
                            <!-- </div> -->
                            <div style="height: 110px; background-color:#EDBDB0;position: relative;top: -2px;">
	                            <button class="makeup_open_modal" id="makeup"
	                                    style="white-space: nowrap; border-radius: 8px; width: 252px;
										height: 68px; background-color: #f68c7a;
										color: white; font-family: Pretendard;
										box-sizing: border-box;
										font-size: 21px;
										cursor: pointer;
										border:none;
									    margin-top: 40px;"
	                                    onmouseover="hover()" onmouseout="hoverOut()">실시간 분석
	                            </button>
                            </div>
                            <div style="height: 150px; background-color:#EDBDB0;position: relative;top: -2px;">
	                            <button class="makeup_upload_img" id="makeup1"
	                                    style="white-space: nowrap; border-radius: 8px; width: 252px;
										height: 68px; background-color: #f68c7a;
										color: white; font-family: Pretendard;
										box-sizing: border-box;
										font-size: 21px;
										cursor: pointer;
										border:none;
									    margin-top: 40px;"
	                                    onmouseover="hover1()" onmouseout="hoverOut1()">이미지 업로드
	                            </button>
                            </div>
                        </div>
                        
                    </div>

                </div>

      			<form id="personal_form" method="post" action="result">
		            <input type="file" id="input_img" name="input_img" accept="image/*" onchange="submit2(this)"/>
		            <input type="hidden" value="" name="personalColor"/>
		            <input type="hidden" value="" name="fileName"/>
		            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          		</form>
            </div>
        </div>

    </div>
</div>

<div class="modal hidden">
    <div class="modalBox">
        <h1>주의</h1>
        <ul>
            <li>· 어두운 곳은 피해주세요</li>
            <li>· 직사광선이 많은 곳은 피해주세요</li>
            <li>· 그늘지지 않게 깨끗한 상태로 측정</li>
        </ul>
        <div class="makeup_close_modal">취소</div>
        <div class="makeup_ok_modal" onclick="location.href='shot'">체험하기</div>
    </div>
</div>

		<div class="modal hidden">
            <div class="modalBox" style="width: 350px; height: 180px;">
                <!-- 		    <h2>얼굴 인식 실패</h2> -->
                <ul>
                    <li style="text-align: center;">얼굴을 인식하는 데 실패했습니다.</li>
                    <li style="text-align: center;">다시 촬영해주세요.</li>
                    <!-- 	      <li>· 그늘지지 않게 깨끗한 상태로 측정</li> -->
                </ul>
                <div class="makeup_close_modal" style="margin-left:27%">확인</div>
                <!-- 	    <div class="makeup_ok_modal" onclick="location.href='shot'">체험하기</div> -->
            </div>
        </div>

<script>
const uploadBtn = document.querySelector('.makeup_upload_img');
const inputImg = document.querySelector('#input_img');

uploadBtn.addEventListener('click',()=>{
  inputImg.click();
});

// 업로드 시 실행되는 함수
function submit2(uploadImg) {

    var form2 = $('#personal_form')[0];
    var formData = new FormData(form2);
    $.ajax({
        type: 'post',
        url: 'http://127.0.0.1:8000/color2',
        cache: false,
        data: formData,
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        success: function (result) {
            console.log("result: " + result);
            if (result.personalColor == "nothing") {
                document.querySelector(".modal").classList.remove("hidden");
                document.querySelector(".makeup_close_modal").addEventListener("click", close);
            } else {
                $('input[name=fileName]').attr('value', result.fileName);
                $('input[name=personalColor]').attr('value', result.personalColor);
                $("#personal_form").submit();
                
                /* viewPopup("#myPersonalColor"); */
                /*     			result.attr("action","/makeup/artist");
                                result.submit(); */
            }
        }
    })
};

</script>

<script>
    const slider = $('.slider').bxSlider({
        pager: false,
        moveSlides: 1,
        maxSlides: 1,
        pause: 3000,
        auto: true,        // 자동 실행 여부
        controls:false
    });


</script>
<script>
    const open = () => {
        document.querySelector(".modal").classList.remove("hidden");
    }

    const close = () => {
        document.querySelector(".modal").classList.add("hidden");
    }

    document.querySelector(".makeup_open_modal").addEventListener("click", open);
    document.querySelector(".makeup_close_modal").addEventListener("click", close);
    document.querySelector(".bg").addEventListener("click", close);

</script>

<script>

    const uploadBtn = document.querySelector('.makeup_upload_img');
    const inputImg = document.querySelector('#input_img');

    uploadBtn.addEventListener('click', () => {
        inputImg.click();
    });

    // 업로드 시 실행되는 함수
    function submit(input) {
        var form = $('#makeup_img_from');
        form.submit(input);
    };
</script>

<script>
    function hover() {
        document.getElementById('makeup').style.background = "#9f9f9f";
        document.getElementById('makeup').style.transition = "all 0.5s ease";
        document.getElementById('makeup').style.transitionDuration = "0.5s";
        document.getElementById('makeup').style.transitionTimingFunction = "ease";
        document.getElementById('makeup').style.transitionDelay = "0s";
        document.getElementById('makeup').style.transitionProperty = "all";
    }
    
    function hover1() {
    	document.getElementById('makeup1').style.background = "#9f9f9f";
        document.getElementById('makeup1').style.transition = "all 0.5s ease";
        document.getElementById('makeup1').style.transitionDuration = "0.5s";
        document.getElementById('makeup1').style.transitionTimingFunction = "ease";
        document.getElementById('makeup1').style.transitionDelay = "0s";
        document.getElementById('makeup1').style.transitionProperty = "all";
    }

    function hoverOut() {
        document.getElementById('makeup').style.background = "#f68c7a";
        document.getElementById('makeup').style.transition = "all 0.5s ease";
        document.getElementById('makeup').style.transitionDuration = "0.5s";
        document.getElementById('makeup').style.transitionTimingFunction = "ease";
        document.getElementById('makeup').style.transitionDelay = "0s";
        document.getElementById('makeup').style.transitionProperty = "all";
    }
    
    function hoverOut1() {
    	document.getElementById('makeup1').style.background = "#f68c7a";
        document.getElementById('makeup1').style.transition = "all 0.5s ease";
        document.getElementById('makeup1').style.transitionDuration = "0.5s";
        document.getElementById('makeup1').style.transitionTimingFunction = "ease";
        document.getElementById('makeup1').style.transitionDelay = "0s";
        document.getElementById('makeup1').style.transitionProperty = "all";
    }
    
</script>

<!-- footerWrap -->
<%@include file="/WEB-INF/views/common/footer.jspf" %>