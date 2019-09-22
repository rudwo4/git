<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="setting.jsp" %> 
       
<!DOCTYPE html>
<html>
<head>
<title>고객센터</title>
<style>
	
	div {
		margin-top : 100px;
		font-size : 17px;
	}
	
	body {
		height:600px;
	}
	#add {
		
	}
</style>
</head>
<body>
	<table>
		<tr>
			<td>
			<!-- * 카카오맵 - 지도퍼가기 -->
			<!-- 1. 지도 노드 -->
			<div id="daumRoughmapContainer1558521190352" class="root_daum_roughmap root_daum_roughmap_landing"></div>
			
			<!--
				2. 설치 스크립트
				* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
			-->
			<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
			
			<!-- 3. 실행 스크립트 -->
			<script charset="UTF-8">
				new daum.roughmap.Lander({
					"timestamp" : "1558521190352",
					"key" : "tkxy",
					"mapWidth" : "520",
					"mapHeight" : "360"
				}).render();
			</script>
			</td>
			<td>
				<table id = "add">
					<tr>
						<th>CUSTOMER CENTER</th>
						<td>평일 9:00~18:00(토,일요일 및 공휴일 휴무)<br>
			           	 대표변호 1577-1577
			           	 </td>
	           	 	</tr>
	           	 	<tr>
						<th>교환 및 반품 주소</th>
						<td>서울특별시 금천구 가산디지털2로 123 월드메르디앙벤처센터II<br>
			            	문의사항은 고객센터(1577-1577) 및 1:1 문의주시기 바랍니다.</td>
			        </tr>
	           </table>
           	</td>
		</tr>
	</table>
</body>
</html>