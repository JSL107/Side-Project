<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>

.paging-div {
  padding: 15px 0 5px 10px;
  display: table;
  margin-left: auto;
  margin-right: auto;
  text-align: center;
}

 .right_col .admin_container{    
    box-shadow: 0 1px 14px 6px rgb(0 0 0 / 11%);
    border-radius: 10px 10px 10px 10px;
    postion: absolute;
    margin-right: auto;
    margin-left: 30px;
    width:85%    
  }
  .admin_container .top {
    background-color: #F3F3F3;
    height: 40px;
    border-radius: 10px 10px 0px 0px;
    vertical-align: middle;
  }



</style>

<body>
<%@ include file="../common/header.jspf"%>
<%@include file="../admin/sidebar.jspf" %>
	<div class="right_col" role="main">
            <!-- top tiles -->
            
				<div class="title_left" style="
   					 padding-left: 30;
    				 padding-top: 130;
    				 padding-bottom: 20;
    				 font-family:'MalgunSemilight',sans-serif;">
                <h3>이벤트 사이트 통계</h3>
                <h5>현재 진행하는 이벤트에 대한 통계 입니다.</h5>                
              	</div>				
	<div class="row">
		<div class="col-md-6 col-sm-6  ">
			<div class="x_panel">
				<div class="x_title">
					<h2>Best Dresser 일일별 유입량</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
						</li>



					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">

					<div style="width: 650px">
						<div id="areaChart3"></div>
					</div>

				</div>
			</div>
		</div>
		<div class="col-md-6 col-sm-6  ">
			<div class="x_panel">
				<div class="x_title">
					<h2>Best Dresser 시간별 유입량</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
						</li>



					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">

					<div style="width: 650px">
						<div id="areaChart"></div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6 col-sm-6  ">
			<div class="x_panel">
				<div class="x_title">
					<h2>Cosmetic Studio 일일별 유입량</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
						</li>


					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">

					<div style="width: 650px">
						<div id="areaChart2"></div>
					</div>

				</div>
			</div>
		</div>
		<div class="col-md-6 col-sm-6  ">
			<div class="x_panel">
				<div class="x_title">
					<h2>Cosmetic Studio 시간별 유입량</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
						</li>


					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">

					<div style="width: 650px">
						<div id="areaChart4"></div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<c:forEach items="${event }" var="eventdto" varStatus="status">
		<input type="hidden" id="closetcount${status.index}" value="${eventdto.closet }"/>
		<input type="hidden" id="makeupcount${status.index }" value="${eventdto.makeup }"/>
		<input type="hidden" id="eventdate${status.index }" value="${eventdto.eventdate }"/>
	</c:forEach>
            <!-- /top tiles -->
        </div>
	<%@include file="../common/footer.jspf" %>
	


	
<script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.36.0/apexcharts.min.js"></script>
<script>
var closet1=$("#closetcount0").val();
var closet2=$("#closetcount1").val();
var closet3=$("#closetcount2").val();
var closet4=$("#closetcount3").val();
var closet5=$("#closetcount4").val();

var makeup1=$("#makeupcount0").val();
var makeup2=$("#makeupcount1").val();
var makeup3=$("#makeupcount2").val();
var makeup4=$("#makeupcount3").val();
var makeup5=$("#makeupcount4").val();

var eventdate1=$("#eventdate0").val();
var eventdate2=$("#eventdate1").val();
var eventdate3=$("#eventdate2").val();
var eventdate4=$("#eventdate3").val();
var eventdate5=$("#eventdate4").val();
console.log(eventdate1.substring(6,8));

//시간별 유입량
  document.addEventListener("DOMContentLoaded", () => {
    const series = {
      "monthDataSeries1": {
        "prices": [
        	${closet.views1},
        	${closet.views2},
        	${closet.views3},
        	${closet.views4},
        	${closet.views5},
        	${closet.views6},
        	${closet.views7},
        	${closet.views8},
        ],
        "hours": [          
          "3 시",
          "6 시",
          "9 시", 
          "12 시",
          "15 시",
          "18 시",
          "21 시",
          "24 시",
        ]
      },
     
    }
    new ApexCharts(document.querySelector("#areaChart"), {
      series: [{
        name: "시간별 유입량",
        data: series.monthDataSeries1.prices
      }],
      chart: {
        type: 'area',
        height: 350,
        zoom: {
          enabled: false
        }
      },
      dataLabels: {
        enabled: false
      },
      stroke: {
        curve: 'straight'
      },
      subtitle: {
        text: 'Best Dresser 시간별 유입량',
        align: 'left'
      },
      labels: series.monthDataSeries1.hours,
      xaxis: {
        type: 'hour',
      },
      yaxis: {
        opposite: true
      },
      legend: {
        horizontalAlign: 'left'
      }
    }).render();
  });

  document.addEventListener("DOMContentLoaded", () => {
	    const series = {
	      "monthDataSeries1": {
	        "prices": [
	        	closet1,
	        	closet2,
	        	closet3,
	        	closet4,
	        	closet5,         
	        ],
	        "hours": [
	          eventdate1.substring(6,8)+"일",
	          eventdate2.substring(6,8)+"일",
	          eventdate3.substring(6,8)+"일",
	          eventdate4.substring(6,8)+"일", 
	          eventdate5.substring(6,8)+"일"
	        ]
	      },
	     
	    }
	    new ApexCharts(document.querySelector("#areaChart3"), {
	      series: [{
	        name: "일일별 유입량",
	        data: series.monthDataSeries1.prices
	      }],
	      chart: {
	        type: 'area',
	        height: 350,
	        zoom: {
	          enabled: false
	        }
	      },
	      dataLabels: {
	        enabled: false
	      },
	      stroke: {
	        curve: 'straight'
	      },
	      subtitle: {
	        text: 'Best dresser 일일 유입량',
	        align: 'left'
	      },
	      labels: series.monthDataSeries1.hours,
	      xaxis: {
	        type: 'hour',
	      },
	      yaxis: {
	        opposite: true
	      },
	      legend: {
	        horizontalAlign: 'left'
	      }
	    }).render();
	  });

  
  
  document.addEventListener("DOMContentLoaded", () => {
	    const series = {
	      "monthDataSeries1": {
	        "prices": [
	        	makeup1,
	        	makeup2,
	        	makeup3,
	        	makeup4,
	        	makeup5,         
	        ],
	        "hours": [
	        	eventdate1.substring(6,8)+"일",
		          eventdate2.substring(6,8)+"일",
		          eventdate3.substring(6,8)+"일",
		          eventdate4.substring(6,8)+"일", 
		          eventdate5.substring(6,8)+"일"
	        ]
	      },
	     
	    }
	    new ApexCharts(document.querySelector("#areaChart2"), {
	      series: [{
	        name: "일일별 유입량",
	        data: series.monthDataSeries1.prices
	      }],
	      fill:{
              colors:'#FF736F'                    
           },
	      chart: {
	        type: 'area',
	        height: 350, 	     
	        zoom: {
	          enabled: false
	        }
	      },
	      colors: ['#FF736F'],
	      dataLabels: {
	        enabled: false
	      },
	      stroke: {
	        curve: 'straight'
	      },
	      subtitle: {
	        text: 'Cosmetic Studio 일일 유입량',
	        align: 'left'
	      },
	      labels: series.monthDataSeries1.hours,
	      xaxis: {
	        type: 'hour',
	      },
	      yaxis: {
	        opposite: true
	      },
	      legend: {
	        horizontalAlign: 'left'
	      }
	    }).render();
	  });


  
  document.addEventListener("DOMContentLoaded", () => {
	    const series = {
	      "monthDataSeries1": {
	        "prices": [
	        	${makeup.views1},
	        	${makeup.views2},
	        	${makeup.views3},
	        	${makeup.views4},
	        	${makeup.views5},
	        	${makeup.views6},
	        	${makeup.views7},
	        	${makeup.views8}
	        ],
	        "hours": [
	        	 "3 시",
	             "6 시",
	             "9 시", 
	             "12 시",
	             "15 시",
	             "18 시",
	             "21 시",
	             "24 시"
	        ]
	      },
	     
	    }
	    new ApexCharts(document.querySelector("#areaChart4"), {
	      series: [{
	        name: "시간별 유입량",
	        data: series.monthDataSeries1.prices
	      }],
	      fill:{
            colors:'#FF736F'                    
         },
	      chart: {
	        type: 'area',
	        height: 350,  
	        zoom: {
	          enabled: false
	        }
	      },
	      colors: ['#FF736F'],
	      dataLabels: {
	        enabled: false
	      },
	      stroke: {
	        curve: 'straight'
	      },
	      subtitle: {
	        text: 'Cosmetic Studio 일일 유입량',
	        align: 'left'
	      },
	      labels: series.monthDataSeries1.hours,
	      xaxis: {
	        type: 'hour',
	      },
	      yaxis: {
	        opposite: true
	      },
	      legend: {
	        horizontalAlign: 'left'
	      }
	    }).render();
	  }); 
  
  
  
function orderCancle(index){
	if(index!=null){
		let imp_uid = $("#imp_uid_"+index).val();
		console.log(imp_uid);
		const param={
				imp_uid:imp_uid
			};
		$.ajax({
			url : '/order/canclepayment',
			type : 'POST',
			data :{imp_uid:imp_uid},
			success : function(result) {
				alert("결제 취소 완료");
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("ajax 통신에러 결제 취소");
			},
		});
		
	}
	
}
</script>
</body>
</html>