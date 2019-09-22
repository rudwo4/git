<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/setting.jsp" %>    
<html>
<jsp:include page="../common/Aft_top_main.jsp" />
<body>
<br><br><br><br><br><br><br><br><br>
<form action ="cancleOrder"name = "order" method="post">	
	<div align = "center" id ="mypage">
	<h1> 주문 된 물품 </h1>
	<table>
		<tr style = "background : #f77676">
			<th>번호</th>
			<th>주문번호</th>
			<th>아이디</th>
			<th>상품명</th>
			<th>사이즈</th>
			<th>색상</th>
			<th>수량</th>
			<th>가격</th>
			<th>주소</th>
			<th>환불 및 취소</th>
		</tr>
		<c:forEach var = "dto" items="${dtos}">
		
			<tr style = "background : #f2e3e3">
				<th>${number}
					<c:set var="number" value ="${number-1}" />
				</th>
				<th><input type = "text" name ="orderNum" size ="5" value = "${dto.o_number}" readonly></th>
				<td>${dto.id}</td>
				<td>${dto.p_name}</td>
				<td>${dto.p_size}</td>
				<td>${dto.p_color}</td>
				<td>${dto.p_count}</td>
				<td>${dto.p_price}</td>
				<td>${dto.o_address}</td>
				<td><input type = "submit" value = "환불 및 취소 신청"></td>
			</tr>
		</c:forEach>
	</table>
	</div>
</form>	
<c:if test="${cnt==0}">
	<center>
	<table>

		<tr>
			<td><h1>현재 배송중인 제품이 없습니다.</h1></td>
		</tr>
	</table>
	</center>
</c:if>
<div align = "center">
	<table>
		<tr>
			<th colspan = "6">
				<c:if test="${cnt>0}">
					<!-- 처음 과 이전 블록 생성  -->
					<c:if test="${startPage>pageBlock}">
						<a href ="myOrder">◀◀</a>
						<a href = "myOrder?pageNum=${startPage-pageBlock}">◀</a>
					</c:if>
					
					<!-- 블록내의 페이지 번호  -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i==currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<c:if test="${i != currentPage }">
							<span><b><a href ="myOrder?pageNum=${i}">[${i}]</a></b></span>						
						</c:if>
					</c:forEach>
					
					<!-- 다음 블록과 끝 블록 생성 -->
					<c:if test="${pageCount>endPage}">
						<a href = "myOrder?pageNum=${startPage+pageBlock}">▶</a>
						<a href = "myOrder?pageNum=${pageCount}">▶▶</a>
					</c:if>
				</c:if>
			</th>
		</tr>
	</table>
</div>		
</body>
<jsp:include page="../common/Common_Bot.jsp" />
</html>