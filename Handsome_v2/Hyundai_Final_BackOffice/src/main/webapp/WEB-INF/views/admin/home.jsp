<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../common/header.jspf"%>
<%@include file="sidebar.jspf" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <!-- page content -->
        <div class="right_col" role="main">
            <!-- top tiles -->
            <div class="row" style="display: inline-block;">
                <div class="tile_count">
                    <div class="col-md-2 col-sm-4  tile_stats_count">
                        <span class="count_top"><i class="fa fa-user"></i> 총 회원수</span>
                        <div class="count">${total_user}명</div>                      
                    </div>
                    <div class="col-md-2 col-sm-4  tile_stats_count">
                        <span class="count_top"><i class="fa fa-user"></i> 남자 회원수</span>
                        <div class="count">${man_count}명</div>                        
                    </div>
                    <div class="col-md-2 col-sm-4  tile_stats_count">
                        <span class="count_top"><i class="fa fa-user"></i> 여자 회원수</span>
                        <div class="count">${woman_count}명</div>                       
                    </div>
                    <div class="col-md-2 col-sm-4  tile_stats_count " style="width: 400px;">
                        <span class="count_top"><i class="fa fa-cubes"></i> 오늘 주문수</span>
                        <div class="count">${orderCount}</div>                        
                    </div>
                    <div class="col-md-2 col-sm-4  tile_stats_count " style="width: 400px;">
                        <span class="count_top"><i class="fa fa-cubes"></i> 오늘 총매출 </span>
                        <div class="count"><fmt:formatNumber value="${orderSales }" pattern="#,###" /></div>
                                              
                    </div>
                    <div class="col-md-2 col-sm-4  tile_stats_count">
                        <span class="count_top"><i class="fa fa-user"></i> 오늘 접속수</span>
                        <div class="count">58</div>                        
                    </div>
                </div>
            </div>
            <!-- /top tiles -->

            <div class="row">
                <div class="col-md-12 col-sm-12 ">
                    <div class="dashboard_graph">

                        <div class="row x_title">
                            <div class="col-md-6">
                                <h3 font-family:'MalgunSemilight',sans-serif; ><strong>회원 통계 리스트</strong></h3>
                            </div>                      
                        </div>

                        <div id="memberchart"></div>                 

                        <div class="clearfix"></div>
                    </div>
                </div>

            </div>
<br>


	<div class="row">
		<div class="col-md-8 col-sm-8  ">
			<div class="x_panel">
				<div class=" x_title">
					<div class="col-md-6">
						<h2 font-family:'MalgunSemilight',sans-serif;><strong>회원 연령대</strong></h2>
					</div>					
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
						</li>



					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">

					<div style="width: 800px">
						<div id="agechart"></div>
					</div>

				</div>
			</div>
		</div>

		<div class="col-md-4 col-sm-4  ">
			<div class="x_panel">
				<div class="x_title">
					<div class="col-md-6">
						<h2 font-family:'MalgunSemilight',sans-serif;><strong>남녀 성비</strong></h2>
					</div>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
						</li>


					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					 <canvas id="pie-chart" width="300" height="186"></canvas>
				</div>
			</div>
		</div>
	</div>
	




</div>
        <!-- /page content -->

<%@include file="../common/footer.jspf" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.8.0/dist/chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.36.0/apexcharts.min.js"></script>
<script type="text/javascript">
let ages50 = "${ages50}";
let ages60 = "${ages60}";
let ages70 = "${ages70}";
let ages80 = "${ages80}";
let overages50 = parseInt(ages50)+parseInt(ages60)+parseInt(ages70)+parseInt(ages80);

var data = {
        datasets: [{
            data: [${man_count}, ${woman_count}],
            backgroundColor: [
            	"#7BACEB",
                "#F58E81"
                
            ],
        }],
        labels: ["남자", "여자"],
        borderColor: "#00021D"
    };
    var options = {
        plugins: {
            tooltips: {
                enabled: false
            },
            datalabels: {           
                formatter: function (value, context) {
                    return Math.round(value / context.chart.getDatasetMeta(0).total * 100) + "%"+
                    "\n"+context.chart.data.labels[context.dataIndex];
                },
                
                color: '#fff',
            }
        }
    };
    var ctx = document.getElementById("pie-chart").getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'pie',
        data: data,
        options: options,
        plugins: [ChartDataLabels]
    });
    
var options = {
        series: [{
          name: "신규 가입자 수",
          data: [${month1}, ${month2}, ${month3}, ${month4}, ${month5}, ${month6}, ${month7}, ${month8}, ${month9},${month10},${month11},${month12}]
      }],
        chart: {
        height: 350,
        type: 'line',
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
      title: {
        text: '2023년 신규 가입자 수',
        align: 'left'
      },
      grid: {
        row: {
          colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
          opacity: 0.5
        },
      },
      xaxis: {
        categories: ['01월', '02월', '03월', '04월', '05월', '06월', '07월', '08월', '09월',
        '10월','11월','12월'],
      }
      };
      var chart = new ApexCharts(document.querySelector("#memberchart"), options);
      chart.render();

      
var options = {
        series: [{
        name: '나이대',
        data: [${ages10}, ${ages20}, ${ages30}, ${ages40}, overages50]
      }],
        chart: {
        height: 350,
        type: 'bar',
      },
      plotOptions: {
        bar: {
          borderRadius: 10,
          dataLabels: {
            position: 'top', // top, center, bottom
          },
        }
      },
      dataLabels: {
        enabled: true,
        formatter: function (val) {
          return val + "%";
        },
        offsetY: -20,
        style: {
          fontSize: '12px',
          colors: ["#304758"]
        }
      },
      
      xaxis: {
        categories: ["10대","20대","30대","40대","50대 이상"],
        position: 'top',
        axisBorder: {
          show: false
        },
        axisTicks: {
          show: false
        },
        crosshairs: {
          fill: {
            type: 'gradient',
            gradient: {
              colorFrom: '#D8E3F0',
              colorTo: '#BED1E6',
              stops: [0, 100],
              opacityFrom: 0.4,
              opacityTo: 0.5,
            }
          }
        },
        tooltip: {
          enabled: true,
        }
      },
      yaxis: {
        axisBorder: {
          show: false
        },
        axisTicks: {
          show: false,
        },
        labels: {
          show: false,
          formatter: function (val) {
            return val + "%";
          }
        }
      
      },
      title: {
        text: '회원 연령대 통계',
        floating: true,
        offsetY: 330,
        align: 'center',
        style: {
          color: '#444'
        }
      }
      };
      var chart = new ApexCharts(document.querySelector("#agechart"), options);
      chart.render();
     
</script>
