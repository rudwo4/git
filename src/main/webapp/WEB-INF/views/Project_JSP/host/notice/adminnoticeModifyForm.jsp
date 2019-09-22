<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../common/setting.jsp" %>
<html>
<body>
	<form action="adminnoticeModify" method ="post" name="pwdform">
	<input type="hidden" name ="num" value ="${param.num}">
	<input type="hidden" name ="pageNum" value = "${param.pageNum}">
		
		<table align="center">
			<tr>
				<th colspan="2">
					비밀번호를 입력하세요!!
				</th>
			</tr>
			
			<tr>
				<th> 비밀번호 </th>
				<td>
					<input class="input" type ="password" name="pwd" maxlength="10" placeholder="비밀번호 입력" autofocus required>
				</td>
			</tr>
			
			<tr>
				<th colspan="2">
					<input class="inputButton" type="submit" value="확인">
					<input class="inputButton" type="reset" value="취소"
						onclick="window.history.back();">
				</th>
			</tr>	
		</table>
	</form>
</body>
</html>