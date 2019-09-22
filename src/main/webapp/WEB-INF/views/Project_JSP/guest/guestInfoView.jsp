<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/setting.jsp" %>
<html>
<style>
	fieldset{
		margin : 0 auto;
		height : 500px;
		width : 700px;
		border : 2px solid #f2a9a9;
	}
	
	legend { color : gray;}
	
	td {
		width : 200px;
		font-size : 20px;
		font-weight : bold;
	}
	
	#inf input {
		height : 40px;
		width : 500px;
	}
	
	gen {
		font-size : 10px;
	}
	
</style>
<body>
<header>
<jsp:include page="../common/Aft_top_main.jsp" />
</header>
	<br><br><br><br><br><br><br><br><br><br>

<c:if test="${cnt == 1}">	
<form action = "guestinfoPro" method = "post" name="guest" onsubmit="return infoCheck();">	
<fieldset>
	<legend><h1>정보수정</h1></legend>
		<table id = "inf">
			<tr>
				<td>아이디</td>
				<td>${vo.getId()}</td>
			</tr>
			
			<tr>
				<td><label for ="pwd">비밀번호</label></td>
				<td><input type ="password" id = "pwd" name ="userPwd" placeholder = "(8~16자 이내 영대소문자,숫자,특수문자 가능)" required autofocus></td>
			</tr>
			
			<tr>
				<td><label for ="pwdre">비밀번호 확인</label></td>
				<td><input type ="password" id = "pwdre" name ="userrePwd" required></td>
			</tr>
			
			<tr>
				<td>이름</td>
				<td>${vo.getName()}</td>
			</tr>
			
			<tr>
				<td>이메일</td>
				<td><input type ="email" id = "email" name ="userEmail" value="${vo.getEmail()}" required></td>
			</tr>
			
			<tr>
				<td><label for ="Phone">휴대폰번호</label></td>
				<td><input type ="text" id = "Phone" name ="userPhone" placeholder = "'-'을 제외한 번호만 입력하세요" value="${vo.getPhone()}" ></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>${vo.getBirth()}</td>
			</tr>
			<tr>
				<td> 성별 </td>
				<td> ${vo.getGender()}</td>
			</tr>
		</table>
		<div align = "right">
		<table>
			<tr id = "button">
				<td><input type = "submit" value = "수정완료"></td>
				<td><input type = "reset" value = "재작성"></td>
				<td><input type = "button" value=" 수정취소" onclick="window.history.back(-2);"></td>
			</tr>
		</table>
		</div>	
</fieldset>
</form>
</c:if>

<c:if test="${cnt != 1}">
	<script type="text/javascript">
		alert("비밀번호를 다시 확인 해주세요!");	
		window.history.back();
	</script>
</c:if>
<jsp:include page="../common/Common_Bot.jsp" />
</body>
</html>