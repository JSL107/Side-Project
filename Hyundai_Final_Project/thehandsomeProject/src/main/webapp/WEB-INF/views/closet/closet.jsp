<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="/WEB-INF/views/common/header.jspf"%>
<link href="../../../resources/css/closet/closet.css" rel="stylesheet" type="text/css" />

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>


<%
	String num = (String) session.getAttribute("closet");
	if (num == null) {
		session.setAttribute("closet", "1");
	} else {
		int cnum = Integer.parseInt(num);
		cnum++;
		session.setAttribute("closet", cnum + "");
	}
%>

  <div id="bodyWrap" class="products">
    <h3 class="cnts_title">
      <span>Best Dresser<span>
    </h3>
    <div class="adaptive_wrap">
      <div class="evt_wrap">

        <div class="evt_main_ban type1" style="text-align: center; background-color: rgb(245,245,245)">
          <p>
            <img style="margin: auto; width: 100%" src="../../../resources/images/closet/closet_main_2.png" >
          </p>
            <div class="bxslider">
              <div class="slider_container">
                    <img src="../../../resources/images/closet/ro.png" />
              </div>
              <div class="slider_container">
                <img src="../../../resources/images/closet/na.png" />
              </div>
              <div class="slider_container">
                <img src="../../../resources/images/closet/cl.png" />
              </div>
              <div class="slider_container">
                <img src="../../../resources/images/closet/mo.png" />
              </div>
              <div class="slider_container">
                <img src="../../../resources/images/closet/casual2.png" />
              </div>
              <div class="slider_container">
                <img src="../../../resources/images/closet/fe.png" />
              </div>
            </div>

          <div style="padding-top: 45px; padding-bottom: 70px; font-family: Georgia">
            <h1 style="font-weight: bold; font-size: 50px; color: black">당신의 스타일을 경험해 보세요</h1>
          </div>

          <div style="display: flex; align-content: center; text-align: center; margin-left: 20%">
            <div >
              <img src="../../../resources/images/closet/camera.png" style="width: 90px; height: 90px">
            </div>
            <div class="closet_open_modal" style="background-color: black; width: 50%; align-content: center; margin: 20px; padding: 20px; cursor: pointer;">
              <strong style="color: white; font-size: 30px"> 실시간 분석</strong>
            </div>
          </div>


          <div style="display: flex; align-content: center; text-align: center; margin-left: 20%">
            <div >
              <img src="../../../resources/images/closet/upload.png" style="width: 90px; height: 90px">
            </div>
            <div class="closet_upload_img" style="background-color: black; width: 50%; align-content: center; margin: 20px; padding: 20px;cursor: pointer;">
              <strong style="color: white; font-size: 30px"> 이미지 업로드</strong>
            </div>
          </div>


          <form class="closet_img_from" id="closet_img_from" method="post" action="http://localhost:8080/product/styleList/">
            <input type="file" id="input_img" name="input_img" accept="image/*" onchange="submit2(this)"/>
            <input type="hidden" id="style" name="style" value="">
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
    <div class="closet_close_modal">취소</div>
    <div class="closet_ok_modal" onclick="location.href='/closet/closetwebcam2/'">체험하기</div>.
  </div>
</div>

<div class="modal2" id="modalStyle" style="display: none">
  <div class="modalBox2">
    <div style="margin-bottom: 10px">
      <h2>회원님의 스타일은 <span id="style_span"></span> 스타일입니다</h2>
    </div>
    <img id="image_preview" style="width:auto; height: auto; max-width: 400px; max-height: 400px"></img>
    <div class="closet_ok_modal" onclick="submit3()">비슷한 옷 구매하러 가기</div>
  </div>
</div>

<script>
  const open = () => {
    document.querySelector(".modal").classList.remove("hidden");
  }

  const close = () => {
    document.querySelector(".modal").classList.add("hidden");
  }

  document.querySelector(".closet_open_modal").addEventListener("click", open);
  document.querySelector(".closet_close_modal").addEventListener("click", close);
  // document.querySelector(".bg").addEventListener("click", close);

  // 외부영역 클릭 시 팝업 닫기
  $(document).mouseup(function (e){
    var LayerPopup = $(".modal2");
    if(LayerPopup.has(e.target).length === 0){
      document.getElementById("modalStyle").style.display = "none";
    }
  });


</script>

<script>

  const uploadBtn = document.querySelector('.closet_upload_img');
  const inputImg = document.querySelector('#input_img');

  uploadBtn.addEventListener('click',()=>{
    inputImg.click();
  });


  // 업로드 시 실행되는 함수
  function submit2(uploadImg) {


    if (uploadImg.files && uploadImg.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        document.getElementById('image_preview').src = e.target.result;
      };
      reader.readAsDataURL(uploadImg.files[0]);
    } else {
      document.getElementById('image_preview').src = "";
    }


      var form2 = $('#closet_img_from')[0];
      var formData = new FormData(form2);
      $.ajax({
          type: 'post',
          url: 'http://192.168.137.122:8000/predict2',
          cache: false,
          data: formData,
          enctype: 'multipart/form-data',
          processData: false,
          contentType: false,
          success: function (data) {
              console.log(data);

              $('input[name=style]').attr('value',encodeURIComponent(data.style));
              document.getElementById("modalStyle").style.display = "";
              $("#style_span").text(data.style);

          }
      })
  };

  // 업로드한 사진으로 비슷한 스타일 옷 검색
  function submit3() {
    $('#closet_img_from').submit();
  }

  const slider = $('.bxslider').bxSlider({
    pager:false,
    touchEnabled:true,
    // mode: 'horizontal',// 가로 방향 수평 슬라이드
    // speed: 500,        // 이동 속도를 설정
    pause: 3000,
    // pager: false,      // 현재 위치 페이징 표시 여부 설정
    // moveSlides: 1,     // 슬라이드 이동시 개수
    // slideWidth: 100,   // 슬라이드 너비
    // minSlides: 4,      // 최소 노출 개수
    // maxSlides: 4,      // 최대 노출 개수
    // slideMargin: 5,    // 슬라이드간의 간격
    auto: true,        // 자동 실행 여부
    // autoHover: true,   // 마우스 호버시 정지 여부
    controls: false    // 이전 다음 버튼 노출 여부
    });


</script>




<!-- footerWrap -->
<%@include file="/WEB-INF/views/common/footer.jspf" %>
