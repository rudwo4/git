<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/setting.jsp" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<style>
up {
		list-style-type : none;
	}
	
	fieldset {
		margin : 0 auto;
		max-width : 400px;
		border : 2px solid #f2a9a9;
	}
	
	fieldset legend {
		font-size : 25px;
		font-weight : bold;
		color : gray;
	}
	
	label {
		font-weight : bold;
		font-size : 15 px;
		width : 120;
	}
	
		
    .guest input {
     position: relative;
     vertical-align: top;
     width: 400px;
     height: 54px;
     padding: 0;
     font-size: 22px;
     color: gray;
     text-align: center;
     text-shadow: 0 1px 2px rgba(0, 0, 0, 		0.25);
     background: #f7e3e3;
     border: 0;
     border-bottom: 2px solid #f7e3e3;
     border-radius: 5px;
     cursor: pointer;
     -webkit-box-shadow: inset 0 -2px 			#D76B60;
     box-shadow: inset 0 -2px #f7e3e3;
     
  	}
  	
  	 #log input {
       position: relative;
       vertical-align: top;
       width: 150px;
       height: 25px;
       padding: 0;
       font-size: 15px;
       color: gray;
       text-align: center;
       text-shadow: 0 1px 2px rgba(0, 0, 0, 		0.25);
       background: black;
       border: 0;
       border-bottom: 2px solid #f7e3e3;
       border-radius: 5px;
       cursor: pointer;
       -webkit-box-shadow: inset 0 -2px 			black;
       box-shadow: inset 0 -2px #f7e3e3;
    	background : #f7e3e3;
    }
    
    #pw input {
       position: relative;
       vertical-align: top;
       width: 150px;
       height: 25px;
       padding: 0;
       font-size: 15px;
       color: gray;
       text-align: center;
       text-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
       background: #f7e3e3;
       border: 0;
       border-bottom: 2px solid #f7e3e3;
       border-radius: 5px;
       cursor: pointer;
       -webkit-box-shadow: inset 0 -2px black;
       box-shadow: inset 0 -2px #f7e3e3;
    	background : #f7e3e3;
    }

  .guest input:active {
     top: 1px;
     outline: none;
     -webkit-box-shadow: none;
     box-shadow: none;
  	}
	
	#noguest td {
		width : 100px;
	}
	
	#noguest input {
    	position: relative;
       vertical-align: top;
       width: 200px;
       height: 25px;
       padding: 0;
       font-size: 15px;
       color: white;
       text-align: center;
       text-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
       background: black;
       border: 0;
       border-bottom: 2px solid black;
       border-radius: 5px;
       cursor: pointer;
       -webkit-box-shadow: inset 0 -2px 			black;
       box-shadow: inset 0 -2px black;
    	background : black;
        color : white;
    }
</style>
<body>
<jsp:include page="../common/top_main.jsp" />
	<br><br><br><br><br><br><br><br><br>
	<div align = "center">
	<h1>MENBER LOGIN</h1>
	</div>
<form name = "login" action = "${path}/user/login_check" method = "post">			
	
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<fieldset>
	<legend><h3>로그인</h3></legend>
			<table>
				<tr>
					<th align = "left"><label for = "userid">아이디</label></th>
					<td><input type = "text" id = "userid" name = "userid" size = "20" placeholder = "아이디 입력" required autofocus></td>
				</tr>
				
				<tr>
					<th align = "left"><label for = "userpw">비밀번호</label></th>
					<td><input type = "password" id = "userpw" name ="password" size = "20" placeholder = "비밀번호 입력"></td>
				</tr>
				
				<tr>
					<td colspan = "4" align = "right">
						<br>
						<span id = "log">
						<input type ="submit" value = "로그인">
						</span>
						<span id = "pw">
						<input type ="button" value = "비밀번호 찾기" onclick="window.location='findIdPw'">
						</span>
					</td>	
				</tr>
				<tr>
					<td>
						<label><input type = "checkbox" value ="아이디저장">아이디 저장</label>
					</td>
				</tr>
			</table>
	</fieldset>
</form>
	<div align = "center">
	<table class = "guest">
		<tr>
			<td class = "guest"><input type ="button" value = "회원가입" onclick = "membership();"></td>	
		</tr>
	</table>
	</div>

<jsp:include page="../common/Common_Bot.jsp" />
</body>
</html>