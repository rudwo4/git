<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../common/setting.jsp" %>    
<html>
<title>My page</title>
<body>
<style>
	#img img{
		width : 150px;
		height : 150px;
		padding : 30px;
	}
	#mypage ul li{
		list-style-type : none;
		font-weight : bold;
	}
</style>
<jsp:include page="../common/Aft_top_main.jsp" />
<br><br><br><br><br><br><br><br><br>
	<div align = "center" id ="mypage">
	<h1> MY PAGE </h1>
	<table border = "1" id ="info">
		<tr>
			<td style ="width:250px; height : 150px;">
				<ul>
					<li>${strId}님 안녕하세요</li>
					<li><a href = "modifyForm" style = "color : red">내 정보 변경</a></li>
					<li>이메일 : ${vo.email}</li>
					<li>휴대폰 번호 : ${vo.phone}</li>
				</ul>
			</td>
			
			<th style ="width:250px; height : 150px;">
				<a href = "QandAcustView?strId=${strId}">
				<h2>1:1 문의 사항</h2>
				</a>
			</th>
			
			<th style ="width:250px; height : 150px;">
				<a href ="currentOrder">
				<h2>주문 배송 현황</h2>
				${currentOrder}건
				</a>
			</th>
			
			<th style ="width:250px; height : 150px;">
				포인트
				<span style = "font-size : 20px; weight : bold">2000p</span>
			</th>
		</tr>	
	</table>
	<br><br>
	<table>
		<tr id = img style = "font-size : 20px;">
			
			<th>
				<a href = "cartForm?strId=${strId}">
				장바구니
				<img src="${project}images/icon/cart.jpg">
				</a>
			</th>
			
			<th>
				나의 구매 내역
				<a href = "myOrder?strId=${strId}">
				<img src="${project}images/icon/heart.jpg">
				</a>
			</th>
			
			<th>
				<a href = "deleteForm">
				회원탈퇴
				<img src="${project}images/icon/sad.jpg">
				</a>
			</th>
		</tr>	
	</table>
	</div>
</body>
<jsp:include page="../common/Common_Bot.jsp" />
</html>