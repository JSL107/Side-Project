<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.ArrayList"%>
<%  ArrayList<Integer> datas = (ArrayList)request.getAttribute("datas");
	int first = datas.get(0);
	int second = datas.get(1);
	int third = datas.get(2);

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>
<body>

	<div
		style="width: 900px; height: 900px; display: flex; justify-content: center; align-items: center; margin: auto;">
		<h2> 카테고리별 물건 갯수 </h2>
		<!--차트가 그려질 부분-->
		<canvas id="myChart"></canvas>
	</div>

	<script type="text/javascript">
		var context = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(context, {
			type : 'bar', // 차트의 형태
			data : { // 차트에 들어갈 데이터
				labels : [
				//x 축
				'과일과 채소', '곡물과 견과', '생선과 해산물,건우물' ],
				datasets : [ { //데이터
					label : '항목별 구매량', //차트 제목
					fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
					data : [ <%= first%>, <%= second%>, <%= third%> //x축 label에 대응되는 데이터 값
					],
					backgroundColor : [
					//색상
					'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)',
							'rgba(164, 136, 241, 0.2)'

					],
					borderColor : [
					//경계선 색상
					'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)',
							'rgba(164, 136, 241, 0.2)'

					],
					borderWidth : 1
				//경계선 굵기
				} ]
			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
	</script>
</body>
</html>
</body>
</html>