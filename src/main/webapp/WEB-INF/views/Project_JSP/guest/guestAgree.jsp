<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %> 
<c:set var="path" value ="${pageContext.request.contextPath}" />
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<%@ include file = "../common/setting.jsp" %>    
<html>
<head>
<meta charset="UTF-8">
<title>로그인+약관 동의 화면</title>
<style>
	fieldset{
		margin : 0 auto;
		width : 700px;
		border : 2px solid #f2a9a9;
	}
	
	legend { color : gray;}
	
	
	.inf input {
		height : 40px;
		width : 500px;
	}
	
	gen {
		font-size : 10px;
	}
	#ID{
		height : 40px;
		width : 400px;
	}
	
	#email{
		height : 40px;
		width : 400px;
	}
	#dupChk{
	   width : 95px;
	   height : 40px;
	   position: relative;
       vertical-align: top;
       padding: 0;
       font-size: 15px;
       color: white;
       text-align: center;
       text-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
       background: black;
       border: 0;
       border-bottom: 2px solid #f7e3e3;
       border-radius: 5px;
       cursor: pointer;
       -webkit-box-shadow: inset 0 -2px #f7e3e3;
       box-shadow: inset 0 -2px #f7e3e3;
    	background : #f7e3e3;
        color : gray;
	}
	input{
	  border-left-width:0; 
	　border-right-width:0; 
	　border-top-width:0; 
	　border-bottom-width:1px; 
	}
	
</style>
</head>
<body>
<header>
<jsp:include page="../common/top_main.jsp" />
</header>
	<br><br><br><br><br><br><br><br><br><br>
<form action = "${path}/user/insertUser" method = "post" name="guest" onsubmit="return submit_check();">	
<fieldset>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<input type="hidden" name="hiddenId" value = "0">
	<input type="hidden" name="hiddenEmail" value =  "0">
	<legend><h1>회원가입</h1></legend>
		<table>
			
			<tr>
				<td><label for ="ID">아이디</label></td>
				<td>
					<input type ="text" id = "ID" name ="userid" required >	
					<input type ="button" id="dupChk" name="dupChk" value="중복확인" onclick="confirm();">
				</td>
			</tr>
			
			<tr>
				<td><label for ="pwd">비밀번호</label></td>
				<td class = "inf"><input type ="password" id = "pwd" name ="passwd" placeholder = "(8~16자 이내 영대소문자,숫자,특수문자 가능)"required></td>
			</tr>
			
			<tr>
				<td><label for ="pwd">비밀번호 확인</label></td>
				<td class = "inf"><input type ="password" id = "pwdre" name ="userrePwd"required></td>
			</tr>
			
			<tr>
				<td><label for ="Name">이름</label></td>
				<td class = "inf"><input type ="text" id = "Name" name ="userName" required></td>
			</tr>
			
			<tr>
				<td><label for ="email">이메일</label></td>
				<td>
					<input type ="email" id = "email" name ="userEmail" required>
					<input type ="button" id = "dupChk" name = "Email" value = "인증번호전송" onclick="sendEmailChk();">
				</td>
			</tr>
			
			<tr>
				<td><label for ="Phone">휴대폰번호</label></td>
				<td class = "inf"><input type ="text" id = "Phone" name ="userPhone" placeholder = "'-'을 제외한 번호만 입력하세요"></td>
			</tr>
			<tr>
				<td><label for = "date"> 생년월일</label></td>
				<td class = "inf"><input type ="date" id = "date" name="userBirth"></td>
			</tr>
		</table>
		<table>
			<tr>
				<td><label for = "men" > 성별 </label></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td><input type ="radio" id = "men" name = "gender" value ="남성">남성<input type ="radio" id = "women" name = "gender" value="여성">여성</td>
			</tr>
		</table>
		<br>
		<legend>회원 약관</legend>
        ========================================================<br>
        1. 회원정보는 웹사이트의 운영정보를 위해서만 사용 됩니다.<br>
        2. 웹사이트의 정상 운영을 방해하는 회원은 회원 탈퇴 처리 됩니다.<br>
        ========================================================<br>
        	위의 약관에 동의하시겠습니까?
        
        <input type = "checkbox" name = "agree" value = "YES" required> 동의함
		<br>
		<div align = "center">
		<table>
			<tr id = "button">
				<td><input type = "submit" value = "회원가입" checked></td>
				<td><input type = "reset" value = "취소"></td>
			</tr>
		</table>
		</div>	
</fieldset>
<jsp:include page="../common/Common_Bot.jsp" />
</form>	
</body>
</html>