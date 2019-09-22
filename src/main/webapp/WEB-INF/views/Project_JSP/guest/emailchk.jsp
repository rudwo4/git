<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../common/setting.jsp" %>    
<html>
<body>
<form action = "emailChkPro?userEmail=${userEmail}" method = "post" name="emailchk" onsubmit ="return ;" >
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<h2> 인증 번호 전송 후 번호 확인 창</h2>
	<table>
		<tr>
			<th> 이메일 인증 번호 입력 </th>
		</tr>
		<tr>
			<th>
				<input type = "text" name ="EmailChk" id="EmailChk">
			</th>
		</tr>
		<tr>
			<th>
				<input type ="submit" value = "확인">
			</th>
		</tr>
	</table>
</form>	
</body>
</html>