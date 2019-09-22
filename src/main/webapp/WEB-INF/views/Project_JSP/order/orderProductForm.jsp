<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../common/setting.jsp" %>    
<html>
<style>
#img img{width : 200px; height : 150px; }
    
    #inputstyle input {width : 100px; height :40px;}	
    
    #check input {width : 30px; height :30px;}
    #check1 input {width : 200px; height :40px;}
    #title th {width: 800px;}
	
	section { width :960px;	padding : 20px; margin : 0 auto; border: 1px solid black;}}
	
	#custInf td {
		font-size : 30px;
	}
	
	#pay img{
		width : 200px;
		height : 200px;
	}
	
	#title {
		font-size :30px;
	}
	
	#private img{
		width : 400px;
		height : 400px;
	}
</style>
<body>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<c:if test="${strId != null}">
<jsp:include page="../common/Aft_top_main.jsp" />
<form action="orderProductPro.do?p_name?${vo.name}&p_size=${size}&p_color=${dto.p_color}&p_count=${amount}&p_price=${amount*dto.p_salePrice}&p_kind=${dto.p_kind}" method = "post">
<input type = "hidden" name = "strId" value="${strId}">
<input type = "hidden" name = "p_code" value="${p_code}">
<input type = "hidden" name = "p_name" value ="${dto.p_name}">
<section>
<br><br><br><br><br><br><br><br><br>
<h1 align = "center">구매 페이지</h1>
	<article>
	<hr>
		<table>
			<tr>
				<th>상품정보</th>
				<th>사이즈</th>
				<th>수량</th>
				<th>상품금액</th>
				<th>주문금액</th>
			</tr>
			
			<tr id = "title">
				<th id = "img"><img src = "${project}pd_img/pd${dto.p_image}"></th>
				<th>${size}</th>
				<th>${amount}</th>
				<th>${dto.p_salePrice}</th>
				<th>${amount*dto.p_salePrice}</th>
			</tr>
			<tr align = "right" style = "width : 100px; height : 50px">
				<td colspan = "6">
				<h1>상품 합계 : <span style = "color : red">${amount*dto.p_salePrice}</span>원</h1>
				</td>
			</tr>
		</table>	
		<hr>
		<h1>배송지 정보</h1>
		<table id = "custInf">
			<tr>
				<td id= "private">
					<img src="${project}images/icon/privateInf.jpg">
				</td>
				<td>
					<table>
					<tr style = "widht : 150px; height : 70px">
						<td>이름</td>
						<td>${vo.name}</td>
					</tr>
					<tr style = "widht : 150px; height : 70px">	
						<td>전화번호</td>
						<td>${vo.phone}</td>
					</tr>
					<tr style = "widht : 150px; height : 70px">	
						<td>이메일</td>
						<td>${vo.email}</td>
					</tr>
					<tr style = "border-bottom:none">	
						<td rowspan ="2">
							<label>주소<small>*</small></label>
						</td>
						<td style = "padding-top:4px; padding-bottom:4px; border-bottom:none" id ="inputstyle">
							<input type = "text" name = "addcode" id="sample6_postcode" placeholder ="우편번호" size ="6" 
							style = "padding :3px" required>
							<input type = "button" name = "address"  value ="주소 찾기" onclick="addressSearch();">
						</td>
					</tr>
					<tr style = "border-bottom:none">	
						<td style = "padding-top:4px; padding-bottom:4px; border-bottom:none" id ="check1">
							<input type = "text" name = "add1" id="sample6_address" placeholder ="주소" required>
							<input type = "text" name = "add2" id ="sample6_address2" placeholder ="상세 주소"
							onclick="addinput();" required>
						</td>
					</tr>
					</table>
				</td>
			</tr>
		</table>	
		
		<hr>
		<h1>결제 정보</h1>
		<div align = "center">
		<table>
			<tr id = "pay">
				<th><label><h2>크레딧 카드</h2>
					<input type ="radio" name = "pay" value = "card" checked>
					<img src="${project}images/icon/card.jpg">
					</label>
				</th>
				<th><label><h2>휴대폰 결제</h2>
					<input type ="radio" name = "pay" value = "phone">
					<img src="${project}images/icon/phone.jpg">
					</label>
				</th>
				<th><label><h2>계좌 이체</h2>
					<input type ="radio" name = "pay" value = "account">
					<img src="${project}images/icon/account.jpg">
					</label>
				</th>
			</tr>
		</table>
		</div>	
	</article>
	<hr>
		<br>
		<div align = "center">
		<table id = "button">
		<tr>
			<td>	
				<input type = "submit" value = "상품주문" onsubmit="orderChk();">
				<input type = "button" value = "뒤로가기">
			</td>
		</tr>
		</table>
		</div>
</section>
</form>
</c:if>
<c:if test="${strId == null}">
<jsp:include page="../common/top_main.jsp" />
<br><br><br><br><br><br><br><br><br>
<h1 align = "center">구매 페이지</h1>
<h1 align ="center">로그인 후 이용 가능한 페이지 입니다!</h1>
</c:if>
</body>
<jsp:include page="../common/Common_Bot.jsp" />
</html>