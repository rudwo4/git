<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "setting.jsp" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	footer {
		width: 1000px;
		height: 210px;
		margin: 20px auto 0;
		overflow: hidden;
		margin-top : 30px;
	}
	
	footer div {
		float: left;
		height: 250px;
		border: 1px solid #cccccc;
		box-sizing: border-box;
	}
	
	footer div:first-child {
		width: 200px;
		height : 120px;
	}
	
	footer div:nth-child(2) {
		width: 800px;
		height : 120px;
	}
	.office_logo img {
		width : 190px;
		margin-top : 30px;
		margin-left : 5px;
	}
	
	footer div:last-child {
		width: 1000px;
		height: 50px;
		margin: 10px auto 0;
		background-color: #9f9d9d;
		color: white;
		text-align: center;
		line-height: 50px;
		clear: both;
		border: 0;
	}
</style>
</head>
<body>
	<footer>
		<div class="office_logo"><img src="${project}/images/main/logo.jpg"></div>
		<div class="office_adress">
		서울특별시 금천구 가산디지털로 2 (가산동 426-5) 다이슈코리아(주)<br>  대표이사 이경재  법인명(상호명) 다이슈코리아(주) 통신판매업신고 가산 제 2019-00873호  <br>  
		사업자등록번호 111-22-33333 개인정보 관리책임자 이경재   FILA 대표번호 : 1577-1577    daishoe@daishoe.com <br>
		본 사이트의 상품이미지 저작권은 다이슈코리아(주)에 있으며, 내용의 무단복제를 금합니다.<br>
		COPYRIGHT C 2018. daishoe KOREA. CO.,LTD. ALL RIGHTS RESERVED. (2)
		</div>
		<div class="copyright"></div>
	</footer>
</body>
</html>