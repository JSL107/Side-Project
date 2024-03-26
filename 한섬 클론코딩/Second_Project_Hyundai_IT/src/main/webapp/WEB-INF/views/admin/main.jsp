<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인</title>
<link rel="stylesheet" href="../resources/css/admin/main.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	// Load the Visualization API and the corechart package.
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});

	// Set a callback to run when the Google Visualization API is loaded.
	google.charts.setOnLoadCallback(drawChart);

	// Callback that creates and populates a data table,
	// instantiates the pie chart, passes in the data and
	// draws it.
	function drawChart() {

		// Create the data table.
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'sex');
		data.addColumn('number', 'stock');
		data.addRows([ [ '남성', 1080 ], [ '여성', 3500 ], [ '잡화', 1725 ] ]);

		// Set chart options
		var options = {
			'title' : '상품비율',
			'width' : 500,
			'height' : 500
		};

		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.PieChart(document
				.getElementById('sex_chart'));
		chart.draw(data, options);
	}
</script>

<script type="text/javascript">
	// Load the Visualization API and the corechart package.
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});

	// Set a callback to run when the Google Visualization API is loaded.
	google.charts.setOnLoadCallback(drawChart);

	// Callback that creates and populates a data table,
	// instantiates the pie chart, passes in the data and
	// draws it.
	function drawChart() {

		// Create the data table.
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'bno');
		data.addColumn('number', 'stock');
		data.addRows([ [ '3.1 Phillip Lim', 56 ], [ 'BALLY', 134 ],
				[ 'CLUB MONACO', 384 ], [ 'FOURM MENS LOUNGE', 154 ],
				[ 'FOURM STUDIO', 357 ], [ 'FOURM THE STORE', 627 ],
				[ 'H : SCENE', 20 ], [ 'LANVIN COLLECTION', 313 ],
				[ 'LANVIN PARIS', 82 ], [ 'MINE', 368 ], [ 'MUE', 485 ],
				[ 'O2nd', 242 ], [ 'OBZEE', 243 ], [ 'ROCHAS', 24 ],
				[ 'SJSJ', 263 ], [ 'SYSTEM', 376 ], [ 'SYSTEM HOMME', 271 ],
				[ 'the CASHMERE', 386 ], [ 'TIME', 422 ],
				[ 'TIME HOMME', 573 ], [ 'TOM GREYHOUND', 525 ] ]);

		// Set chart options
		var options = {
			'title' : '브랜드비율',
			'width' : 500,
			'height' : 500
		};

		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.PieChart(document
				.getElementById('bno_chart'));
		chart.draw(data, options);
	}
</script>
</head>
</head>
<body>
	<div id="bodyWrap">
		<h3 class="cnts_title">
			<span id="menuTitle">관리자페이지</span>
		</h3>
		<div class=""
			style="position: relative; width: 834px; height: 0; display: block; left: 50%; margin-left: -338px;">
			<div class="delch_box tooltip1907" id="store_delbox"
				style="display: none;">
				<span class="arr">위치아이콘</span> 작성 가능한 상품평 확인하시고,<br> 상품평 작성해서
				추가 마일리지 적립하세요.
			</div>
		</div>
		<div class="sub_container">
			<!-- lnb -->
			<div class="lnb_wrap">
				<h4>
					<a href="/admin/main">관리자페이지<!-- 마이페이지 --></a>
				</h4>
				<%--  TODO :: 후에 링크 변경--%>
				<div class="lnb">
					<dl>
						<dt>관리메뉴</dt>
						<dd>
							<a href="/admin/productAdd">상품등록</a>
						</dd>
						<dd>
							<a href="/admin/productManage">상품목록</a>
						</dd>
						<dd>
							<a href="/admin/eventAdd">이벤트등록</a>
						</dd>
						<dd>
							<a href="/admin/eventManage">이벤트목록</a>
						</dd>
						<dd>
							<a href="/admin/chart">통계</a>
						</dd>
						<dd>
							<a href="/qna/qnaMain">고객센터</a>
						</dd>

					</dl>
				</div>
				<div class="ph_guide">
					<p class="tlt">고객센터 운영 안내</p>
					<p class="phone">
						1800-5700<span style="color: #c69c6d;" class="txt">(유료)</span>
					</p>
					<p class="txt">
						평일(월~금)<br>am 09:00 ~ pm 18:00<span>토/일, 공휴일 휴무</span>
					</p>
					<a href="mailto:shophelp@thehandsome.com">shophelp<br>@thehandsome.com
					</a>
				</div>
			</div>
			<!-- //lnb -->

			<!-- cnts -->
			<div class="sub_cnts">
				<!-- Google Chart -->
				<!--Div that will hold the pie chart-->
				<div id="sex_chart"></div>
				<div id="bno_chart"></div>
			</div>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>