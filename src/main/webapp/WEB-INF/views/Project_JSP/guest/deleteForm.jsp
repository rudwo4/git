<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../common/setting.jsp" %>
<html>
<jsp:include page="../common/Aft_top_main.jsp" />
<body>
<br><br><br><br><br><br><br><br><br>
	<div align ="center">
	<h1>회원 탈퇴T.T</h1>
	<form action = "deletePro" method="post" name="deleteform">
		<table>
			<tr>
				<th colspan="2">
					비밀번호를 입력하세요!
				</th>	
			</tr>
			
			<tr>
				<th> 비밀번호 </th>
				<td><input type ="password" name="pwd" required autofocus></td>
			</tr>
			
			<tr>
				<th colspan="2"  id = "button">
					<input type="submit" value="탈퇴진행">
					<input type="reset" value="탈퇴취소"
						onclick="window.history.back();">
				</th>	
			</tr>
		</table>
	</form>	
	</div>
</body>
<jsp:include page="../common/Common_Bot.jsp" />
</html>