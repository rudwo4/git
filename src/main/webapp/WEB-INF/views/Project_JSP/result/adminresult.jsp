<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/setting.jsp" %>    
<html>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	google.charts.load('current',{packages:['corechart']});
</script>
<body>
	<h2>상품 총 결산 그래프</h2>
	
	<c:set var ="total" value ="${firstChat['total']}"></c:set>
	<c:set var ="running" value ="${firstChat['운동화']}"></c:set>
	<c:set var ="sports" value ="${firstChat['스포츠,레저']}"></c:set>
	<c:set var ="shoes" value ="${firstChat['구두']}"></c:set>
	<c:set var ="sandle" value ="${firstChat['샌들']}"></c:set>
	<c:set var ="boots" value ="${firstChat['부츠']}"></c:set>
	<c:set var ="etc" value ="${firstChat['용품']}"></c:set>
	
	<c:set var ="man" value ="${secondChat['남성']}"></c:set>
	<c:set var ="woman" value ="${secondChat['여성']}"></c:set>
	
	<div>
		<div><h1>총 매출액 : ${totalSale}</h1></div>
		<div style ="display : -webkit-box;">
			<div id="firstChat"></div>
			<div id ="secondChat"></div>
		</div>
	</div>
	<script type="text/javascript">
		google.charts.setOnLoadCallback(drawChartFirst);
		google.charts.setOnLoadCallback(drawChartSecond);
		
		var firstChart_options = {
			title : '판매수량',
			width : 600,
			hegiht : 400,
			bar : {
				groupwidth : '50%'
			},
			legend : {
				position : 'bottom'
			}
		};
		
		function drawChartFirst(){
			var data = google.visualization.arrayToDataTable([
				['Element','종류별'],
				['운동화',${running}],
				['스포츠',${sports}],
				['구두',${shoes}],
				['샌들',${sandle}],
				['부츠',${boots}],
				['용품',${etc}]
			]);
			var firstChart = new google.visualization.ColumnChart(document.getElementById('firstChat'));
			firstChart.draw(data,firstChart_options);
		}
		
		var secondChart_options = {
			title : '구매비율',
			width : 550,
			height : 400,
			bar : {
				groupWidth : '100%'
			},
			series :{
				0:{ color : '#a561bd'},
				1:{ color : '#c784de'}
			}
		}	
		
		function drawChartSecond(){
			var data = google.visualization.arrayToDataTable([
				['Element','성별'],
				['여성',${woman}],
				['남성',${man}]
			]);
			var secondChart = new google.visualization.PieChart(document.getElementById('secondChat'));
			secondChart.draw(data,secondChart_options);
		}
	</script>
</body>
</html>