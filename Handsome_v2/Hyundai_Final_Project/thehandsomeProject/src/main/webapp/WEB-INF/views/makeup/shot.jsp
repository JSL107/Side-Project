<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/WEB-INF/views/common/header.jspf" %>
<link href="../../../resources/css/makeup/makeup.css" rel="stylesheet"
      type="text/css"/>

<!-- Loading -->
<div class="loading_bar" id="loadingBarDiv" style="display: none;">
    <img src="/_ui/desktop/common/images/common/loading.gif" alt="loading">
    <span>�로딩중</span>
</div>
<!-- //Loading -->

<div id="bodyWrap" class="products">
    <h3 class="cnts_title" style="font-weight: bold;">
        <span>Cosmetic Studio</span>
    </h3>
    <div id="camArea"
         style="margin-top: 30px;overflow: hidden;border-radius: 15px;background-color: #EDBDB0; margin-left: auto; width: 750px; margin-right: auto;">
         <div>
	    	<img style="max-width: 100%;" src="../../../resources/images/makeup/cosmetic-logo.png"/>
	    </div>
         <div style="padding-top: 30px;height: 45px; background: rgba(215,145,133, 0.5); text-align: center;">
	    	<h2 style="font-size: 28px;line-height: 10px;">실시간 분석</h2>
	    </div>
        <div class="videoWrap" id="videocam"
             style="width:680px;margin-left: 40px;margin-right: 40px;">
            <video id="makeup_video" name="makeup_video" autoplay
                   style="margin-bottom: 30px; margin-top: 30px;height: 500px; border-radius: 20px; transform: rotateY(180deg);"></video>
            <canvas id="makeup_canvas" width="666.67px" height="500px"
                    style="position: absolute; top: 530px;display: block; margin-top: 30px; margin-bottom:30px; border-radius: 20px; transform: rotateY(180deg);"></canvas>
        </div>


        <%--로딩 창 구현--%>
        <div class="makeup_loadingbar"></div>

        <div class="makeup_capture">
            <div class="makeup_capture2" id="makeup_capture3" style="display: none; margin-top:20px; margin-bottom:20px;">
                <button class="retry btnMakeup" id="retry" onclick="retry();"><span>다시 찍기</span></button>
                <button class="newwebcamBtn btnMakeup" id="newwebcamBtn" onclick="uploadCanvasToServer();"><span>컬러 진단하기</span></button>
            </div>
            <script>
                function retry() {
                     	window.location.reload();
                }
            </script>

            <div class="makeup_capture2" id="makeup_capture2" >
                <input type="hidden" id="webcamBtn" value="촬영하기"/> <img id="btnCapture"
                   style="cursor: pointer;" src="../../../resources/images/cam_button2.png"/>
            </div>
        </div>

        <input type="hidden" name="CSRFToken"
               value="77b0e71f-1c68-403d-8ba3-1c8b76071cce">


        <!--퍼스널 컬러 진단 팝업-->
        <div class="popwrap w_type_4" id="myPersonalColor"
             style="display: none; position: fixed">
            <div class="pop_tltwrap2 pb0">
                <img
                        src="http://cdn.thehandsome.com/_ui/desktop/common/images/main/top-header-handsome-logo.png">
            </div>

            <%--Info :: airesult로 차후 대체--%>

            <div class="clearfix">
                <form action="result" id="personal_form" method="post">
                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}"/> <input value="" name="fileName"
                                                           type="hidden"/> <input value="" name="personalColor"
                                                                                  type="hidden"/>
                    <canvas id="makeup_canvas2" width="600" height="450"></canvas>
                    <button type="submit">메이크업하기</button>
                </form>
            </div>
            --%>

            <a href="javascript:void(0);" class="btn_close"><img
                    src="http://cdn.thehandsome.com/_ui/desktop/common/images/popup/ico_close.png"
                    alt="닫기"></a>
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
    </div>


</div>
<script>
    const close = () => {
        document.querySelector(".modal").classList.add("hidden");
    }

    //QnA 팝업 창의 크기를 조절하고 띄우는 함수(공홈을 참고함)
    function viewPopup(v, n) {

        var obj = $("#" + v.split("#")[1]);
        var lp = ($(window).width() - obj.outerWidth()) / 2;
        var tp = ($(window).height() - obj.outerHeight()) / 2
            + $(window).scrollTop();
        var scrollTop = $(window).scrollTop();
        if (lp < 0)
            lp = 0;
        if (tp < 0)
            tp = 0;
        $('#productLayer').show();
        if ($(window).height() < obj.outerHeight()) {
            obj.css("top", scrollTop).css("position", "absolute").css(
                "z-index", 101);
        } else {
            obj.css("top", tp).css("position", "absolute").css("z-index", 101);
        }
        obj.show();
        return false;
    }

    if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
        navigator.mediaDevices.getUserMedia({video: true}).then(function (stream) {
            var video = document.getElementById('makeup_video');
            video.srcObject = stream;
            video.play();
        });
    }

    var canvas = document.getElementById('makeup_canvas');
    var canvas2 = document.getElementById('makeup_canvas2');
    var context = canvas.getContext('2d');
    var context2 = canvas2.getContext('2d');
    var video = document.getElementById('makeup_video');
    var btnElement = document.getElementById('webcamBtn');
    var newBtnElement = document.getElementById('makeup_capture3');
    const btn_div = document.getElementById("makeup_capture2");

    document.getElementById("btnCapture").addEventListener("click", function () {
        // 캡쳐시 파이썬 통신 가보자~
        if (btnElement.value === '촬영하기') {
            btnElement.value = '다시찍기';
            context.drawImage(video, 0, 0, 666.67, 500);
            context2.drawImage(video, 0, 0, 600, 450);
			
            btn_div.style.display = 'none';
            video.style.opacity = 0;
            canvas.style.opacity = 1;
            //video.style.visibility = 'hidden';
            //video.style.display = 'none';
            //canvas.style.display = 'block';
            newBtnElement.style.display = 'inline-block';

        } else {
            btnElement.value = '촬영하기';
            newBtnElement.style.display = 'none';
            video.style.display = 'block';
            canvas.style.display = 'none';
        }

    });

    function goToResultPage() {
        window.location.href="http://localhost:8080/makeup/airesult";
    }

    uploadCanvasToServer = function () {
        const canvas = document.getElementById('makeup_canvas');
        const imgBase64 = canvas.toDataURL('image/jpeg', 'image/octet-stream');
        console.log(imgBase64);
        /*     	strImg = imgBase64.replace(/^data:image\/[a-z]+;base64,/, "");
                console.log(strImg); */
        const decodImg = atob(imgBase64.split(',')[1]);
        console.log(decodImg);

        let array = [];
        for (let i = 0; i < decodImg.length; i++) {
            array.push(decodImg.charCodeAt(i));
        }

        const file = new Blob([new Uint8Array(array)], {type: 'image/jpeg'});
        const fileName = 'canvas_img_' + new Date().getMilliseconds() + '.jpg';

        let formData = new FormData();
        formData.append('file', file, fileName);
        console.log(formData);

        $.ajax({
            type: 'post',
            url: 'http://192.168.137.122:8000/color',
            cache: false,
            data: formData,
            processData: false,
            contentType: false,
            success: function (result) {
                console.log("result : " + result);
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


<!-- footerWrap -->
<%@include file="/WEB-INF/views/common/footer.jspf" %>