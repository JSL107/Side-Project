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

<%
    String style = request.getParameter("style");
    String style0 = request.getParameter("style0");
    String style1 = request.getParameter("style1");
    String style2 = request.getParameter("style2");
    String style3 = request.getParameter("style3");
    String style4 = request.getParameter("style4");
    String style5 = request.getParameter("style5");
    String imgsrc = request.getParameter("imgsrc");

%>
<input type="hidden" id="style0" value="<%=style0%>">
<input type="hidden" id="style1" value="<%=style1%>">
<input type="hidden" id="style2" value="<%=style2%>">
<input type="hidden" id="style3" value="<%=style3%>">
<input type="hidden" id="style4" value="<%=style4%>">
<input type="hidden" id="style5" value="<%=style5%>">

<div id="bodyWrap" class="products">
    <h3 class="cnts_title" style="font-weight:bold;">
      <span>Best Dresser<span>
    </h3>
    <div class="adaptive_wrap" id="videocam" style="text-align: center; justify-content: center; display: flex; align-items: center">
		<div class="adaptive_wrap" id="videocam" style="margin-top: 30px;overflow: hidden;border-radius: 15px;background-color: rgb(245,245,245); margin-left: auto; width: 750px; margin-right: auto;">
	        <div class="closetHeaderImg">
		    	<img style="max-width: 100%;" />
		    </div>
		    <div style="padding-top: 30px;height: 45px; background: rgb(203 203 203 / 75%);; text-align: center;">
		    	<h2 style="font-size: 28px;line-height: 10px;">스타일 분석 결과</h2>
		    </div>
		    
	        <div class="styleWrap" id="styleWrap" >
		        <div class="styleImgWrap" id="styleImgWrap" style="text-align: center;">
		              <img class='styleImg' src="<%=imgsrc%>" style="object-fit: cover;">
		        </div>
		        <div class="styleDescriptionWrap">
		       		 <h3 class="styleTitle"> </h3>

	        		<div class="styleDescription">
	              		<span class="styleContent">

                        </span>
	                </div>
	              <h3 class="styleTitle">스타일 분석 결과</h3>
	              <div class="styleChartWrap">
	              		
	              </div>
		        </div>
	              
	              
	        </div>
		    
		    <div class="closetFooter">
				<button type="closet_video_btn" id="searchStyle"  onclick="$('#styleanalysis').submit()">추천 상품 확인 하기</button>
			</div>
    </div>

<input type="hidden" val>
    <form id="styleanalysis" method="POST" action="http://localhost:8080/product/styleList/">
        <input type="hidden" id="style" name="style" value="<%=style%>">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>


</div>

<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script>
<%-- 페이지 로드시 작동 --%>
<%-- 스타일 출력--%>
$('.styleTitle').text($('#style').val()+' 스타일');

    if($('#style').val()==='로멘틱'){
        $('.styleContent').text('온순하고 부드러운 여성적인 스타일');
    }
	else if($('#style').val()==='로맨틱'){
		$('.styleContent').text('온순하고 부드러운 여성적인 스타일');
	}
    else if($('#style').val()==='내추럴'){
        $('.styleContent').text('자연스럽게 어우러지게 하는 스타일');
    }
    else if($('#style').val()==='클래식'){
        $('.styleContent').text('유행을 타지않고 전통적이고 전형화된 스타일');
    }
    else if($('#style').val()==='모던'){
        $('.styleContent').text('현대적이고 세련된 느낌을 주는 스타일');
    }
    else if($('#style').val()==='캐주얼'){
        $('.styleContent').text('평상시에 가볍게 입을 수 있는 스타일');
    }
    else if($('#style').val()==='페미닌'){
        $('.styleContent').text('여성스러우면서 우아한 분위기가 있는 스타일');
    }
//    화면에 출력한다음에 인코딩해서 처리
$('#style').attr('value',encodeURIComponent($('#style').val()));

	$().ready(function() {
        var options = {
                series: [{
                data: [$('#style0').val(),$('#style1').val(),$('#style2').val(),$('#style3').val(),$('#style4').val(),$('#style5').val(),]
              }],
                chart: {
                type: 'bar',
                height: 300
              },
              plotOptions: {
                bar: {
                  borderRadius: 4,
                  horizontal: true,
                }
              },
              dataLabels: {
                enabled: false
              },
              xaxis: {
                categories: ['로맨틱', '내추럴', '모던', '캐주얼', '클래식', '페미닌'
                ],
              }
              };

              var chart = new ApexCharts(document.querySelector(".styleChartWrap"), options);
              chart.render();
	});
</script>

<!-- footerWrap -->
<%@include file="/WEB-INF/views/common/footer.jspf" %>