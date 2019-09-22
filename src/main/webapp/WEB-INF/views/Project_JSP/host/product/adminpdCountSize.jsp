<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file ="../../common/setting.jsp" %>    
<html>
<script type="text/javascript" src="${project}js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	
	function mySubmit(index){
		if(index == 1){
			document.order.action="adminaddCountSize.do";
		}
		document.order.submit();
	}
</script>
<style>
	table tr td {
		border : 1px solid black;
		width : 100px;
		height : 50px;
	}
</style>

<body>
	<form action ="adminSCorderPro.do?PageNum=${pageNum}" method ="post" name = "order">
	<table>
		<tr>
			<th colspan = "5">상품정보</th>
		</tr>
		<tr>
			<td>상품코드</td>
			<td>사이즈</td>
			<td>현재 재고</td>
			<td>신청 수량</td>
			<td>발주 신청</td>
		</tr>
		
		<c:forEach var ="dto" items= "${dtos}">	
			<tr>
				<td>${dto.p_code}</td>
				<td>${dto.p_size}</td>
				<td>${dto.p_orderCount}</td>
				<td>${dto.p_count}</td>
				<td><input type = "text" name ="productCount" placeholder ="발주수량"></td>
			</tr>
		</c:forEach>
		
		
			<tr>
				<td><input type = "text" name = "p_code" value = "${code}" readonly></td>
				<td>
					<select size = "1" name = "p_size" id = "p_size">
						<optgroup label ="사이즈">
						  <option value = "220">220</option> 	
			              <option value = "230">230</option>
			              <option value = "240">240</option>
			              <option value = "250">250</option>
			              <option value = "260">260</option>
			              <option value = "270">270</option>
			              <option value = "280">280</option>
			              <option value = "290">290</option>
	         			 </optgroup>
					</select>
				</td>
				<td><input type = "text" disabled></td>
				<td><input type = "text" disabled></td>
				<td><input type = "text" name ="orderCount" placeholder ="발주수량"></td>
			</tr>
			<tr>
				<td colspan = "5" align ="right" id = "button" align ="center">
					<input type = "button" value = "목록" onclick = "window.history.back()">
					<input type = "button" value = "발주 품목 추가" onclick="mySubmit(1);">
					<input type = "submit" value = "발주 신청">
				</td>
			</tr>
	</table>
	</form>	
</body>
</html>