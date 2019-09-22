<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../common/setting.jsp" %>    
<html>
<script type="text/javascript" src="${project}js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#orderAll").click(function(){
			//클릭시
			if($("#orderAll").prop("checked")){
				$("input[name=order]").prop("checked",true);
			}else{
				$("input[name=order]").prop("checked",false);
			}
		});
	});
</script>
<body>
	<form action = "adminorderSaleChk?pageNum=${pageNum}" method = "post">
	<h1>고객 주문 사항</h1>
	<table>
		<tr style = "background : #c4cad3">
			<td><input type ="checkBox" name = "orderAll" id="orderAll"></td>
			<th>번호</th>
			<th>주문번호</th>
			<th>아이디</th>
			<th class = "title">상품코드</th>
			<th>상품명</th>
			<th>사이즈</th>
			<th>색상</th>
			<th>수량</th>
			<th>가격</th>
			<th>주소</th>
			<th>상태처리</th>
		</tr>
			
		<c:forEach var = "dto" items="${dtos}">
			<tr>
				<th><input type ="checkBox" name = "order" id="order" value = "${dto.o_number}"></th>
				<th>${number}
					<c:set var="number" value ="${number-1}" />
				</th>
				<th><input type = "text" name ="orderNum" size ="5" value = "${dto.o_number}" readonly></th>
				<td>${dto.id}</td>
				<td>${dto.p_code}</td>
				<td>${dto.p_name}</td>
				<td>${dto.p_size}</td>
				<td>${dto.p_color}</td>
				<td>${dto.p_count}</td>
				<td>${dto.p_price}</td>
				<td>${dto.o_address}</td>
				<th>${dto.o_status}</th>
			</tr>
		</c:forEach>
			<tr>
				<th colspan = "12" align ="right"><input type = "submit" value = "판매 확정" onsubmit="checkOrderNum();"></th>
			</tr>
	</table>
	</form>
<c:if test="${cnt<0}">
	<table>
		<tr>
			<td>문의 내용이 없습니다.</td>
		</tr>
	</table>
</c:if>
<div align = "center">
	<table>
		<tr>
			<th colspan = "6">
				<c:if test="${cnt>0}">
					<!-- 처음 과 이전 블록 생성  -->
					<c:if test="${startPage>pageBlock}">
						<a href ="adminorderChk">◀◀</a>
						<a href = "adminorderChk?pageNum=${startPage-pageBlock}">◀</a>
					</c:if>
					
					<!-- 블록내의 페이지 번호  -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i==currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<c:if test="${i != currentPage }">
							<span><b><a href ="adminorderChk?pageNum=${i}">[${i}]</a></b></span>						
						</c:if>
					</c:forEach>
					
					<!-- 다음 블록과 끝 블록 생성 -->
					<c:if test="${pageCount>endPage}">
						<a href = "adminorderChk?pageNum=${startPage+pageBlock}">▶</a>
						<a href = "adminorderChk?pageNum=${pageCount}">▶▶</a>
					</c:if>
				</c:if>
			</th>
		</tr>
	</table>
</div>		
</body>
</html>