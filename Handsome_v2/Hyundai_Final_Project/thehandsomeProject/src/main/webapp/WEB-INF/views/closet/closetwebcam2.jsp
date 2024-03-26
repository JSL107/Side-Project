<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="/WEB-INF/views/common/header.jspf"%>
<link href="../../../resources/css/closet/closet.css" rel="stylesheet" type="text/css" />

<!-- Loading -->
<div class="loading_bar" id="loadingBarDiv" style="display: none;">
    <img src="/_ui/desktop/common/images/common/loading.gif" alt="loading">
    <span> 로딩중</span>
</div>
<!-- //Loading -->

<div id="bodyWrap" class="products">
    <h3 class="cnts_title" style="font-weight: bold;">
      <span>Best Dresser<span>
    </h3>
    <div class="adaptive_wrap" id="videocam" style="margin-top: 30px;overflow: hidden;border-radius: 15px;background-color: rgb(245,245,245); margin-left: auto; width: 750px; margin-right: auto;">
        <div class="closetHeaderImg">
	    	<img style="max-width: 100%;" src="../../../resources/images/closet/closet_main_2.png"/>
	    </div>
	    <div style="padding-top: 30px;height: 45px; background: rgb(203 203 203 / 75%);; text-align: center;">
	    	<h2 style="font-size: 28px;line-height: 10px;">실시간 분석</h2>
	    </div>
	    <div class="videoWrap" id="videocam" style="text-align: center;">
              <video id="closet_video" name="closet_video" width="800" height="600" autoplay
              style="margin-bottom: 30px; margin-top: 30px; border-radius: 20px; transform: rotateY(180deg);"></video>
       		  <canvas id="closet_canvas" name="closet_canvas" width="800" height="600" style="display: block; position:absolute; top: 405px; left:97px; margin-top: 30px; margin-bottom:30px; border-radius: 20px; transform: rotateY(180deg);"></canvas>
        </div>
	    
       <div class="closet_capture">

        <div class="closet_capture2" id="closet_capture3"  style="display: none;" onclick="uploadCanvasToServer()">
            <button type="closet_video_btn" id="newwebcamBtn" onclick="uploadCanvasToServer();">스타일 진단하기</button>
        </div>
        <div class="closet_capture2" id="closet_capture2">
            <button type="closet_capture_btn" id="webcamBtn">촬영하기</button>
        </div>
    </div>

    <form id="styleanalysis" method="POST" action="http://localhost:8080/closet/closet_result/">
        <input type="hidden" id="style" name="style" value="">
        <input type="hidden" id="style0" name="style0" value="">
        <input type="hidden" id="style1" name="style1" value="">
        <input type="hidden" id="style2" name="style2" value="">
        <input type="hidden" id="style3" name="style3" value="">
        <input type="hidden" id="style4" name="style4" value="">
        <input type="hidden" id="style5" name="style5" value="">

        <input type="hidden" id="imgsrc" name="imgsrc" value="">

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
    </div>



</div>

<script>
    uploadCanvasToServer = function() {
        const canvas = document.getElementById('closet_canvas');
        const imgBase64 = canvas.toDataURL('image/jpeg', 'image/octet-stream');
        const decodImg = atob(imgBase64.split(',')[1]);

        $('#imgsrc').attr('value',imgBase64);

        let array = [];
        for (let i = 0; i < decodImg .length; i++) {
            array.push(decodImg .charCodeAt(i));
        }

        const file = new Blob([new Uint8Array(array)], {type: 'image/jpeg'});
        const fileName = 'canvas_img_' + new Date().getMilliseconds() + '.jpg';

        console.log(fileName);

        let formData = new FormData();
        formData.append('input_img', file, fileName);

        $.ajax({
            type: 'post',
            url: 'http://localhost:8000/predict',
            cache: false,
            data: formData,
            processData: false,
            contentType: false,
            success: function (data) {
                console.log(data);

                console.log(data);
                console.log(data.style[0]);

                $('input[name=style0]').attr('value', data.style[0]);
                $('input[name=style1]').attr('value', data.style[1]);
                $('input[name=style2]').attr('value', data.style[2]);
                $('input[name=style3]').attr('value', data.style[3]);
                $('input[name=style4]').attr('value', data.style[4]);
                $('input[name=style5]').attr('value', data.style[5]);

                var max = 0;
                var idx;
                for(var i=0;i<6;i++){
                    if(max<data.style[i]){
                        max=data.style[i];
                        idx=i;
                    }
                }
                var label =['로멘틱', '내추럴', '모던', '캐주얼', '클래식', '페미닌']
                $('input[name=style]').attr('value',label[idx]);
                // $("#style_span").text(data.style);
                $('#styleanalysis').submit();
            }
        })
    };


</script>

<script>

    if(navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
        navigator.mediaDevices.getUserMedia({ video: true }).then(function(stream) {
            var video = document.getElementById('closet_video');
            video.srcObject = stream;
            video.play();
        });
    }

    var canvas = document.getElementById('closet_canvas');
    var context = canvas.getContext('2d');
    var video = document.getElementById('closet_video');
    var btnElement = document.getElementById('webcamBtn');
    var newBtnElement = document.getElementById('closet_capture3');

    document.getElementById("closet_capture2").addEventListener("click",function() {
        // 캡쳐시 파이썬 통신 가보자~
        if (btnElement.innerText == '촬영하기') {
            btnElement.innerText = '다시찍기';
            context.drawImage(video, 0, 0, 800, 600);

            video.style.opacity = 0;
            canvas.style.opacity = 1;
            //video.style.display = 'none';
            //canvas.style.display = 'inline';
            newBtnElement.style.display = 'inline-block';

        } else {
            btnElement.innerText = '촬영하기';
            newBtnElement.style.display = 'none';
            video.style.opacity = 1;
            canvas.style.opacity = 0;
            //video.style.display = 'inline';
            //canvas.style.display = 'none';
        }

    });

</script>

<!-- footerWrap -->
<%@include file="/WEB-INF/views/common/footer.jspf" %>