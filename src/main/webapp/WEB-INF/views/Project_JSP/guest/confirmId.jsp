<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../common/setting.jsp" %>    
<html>
<body>
<form action = "confirmId" method = "post" name="confirm" onsubmit ="return confirmIdCheck();" >
	<c:if test="${confirmCnt ==1}">
		<table>
			<tr>
				<th colspan = "2">
					${strId}는 사용 할 수 없습니다.
				</th>
			</tr>
			<tr>
				<th> 아이디 : </th>
				<td align = "center">
					<input type="text" name="ID" maxlength="20" style="width:150px">
				</td>
			</tr>
			<tr>	
				<td id="button">
					<input type="submit" value="확인" >
				</td>
				<td id="button">	
					<input type="reset" value = "취소" onclick="self.close()";> 			
				</td>
			</tr>
		</table>
	</c:if>
</form>	
	<c:if test="${confirmCnt !=1}">
		<table>
			<tr>
				<th align = "center">
					${strId}는 사용 할 수 있습니다.
				</th>
			</tr>
			<tr>
				<th id="button" align = "center">
					<input type="button" value="확인" onclick="setId('${strId}');">
				</th>
			</tr>
		</table>
	</c:if>

</body>
</html>