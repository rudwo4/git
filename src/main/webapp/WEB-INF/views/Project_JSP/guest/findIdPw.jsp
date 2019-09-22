<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/setting.jsp" %>
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
    
    #userIdBirth{
    	width: 172px;
    }
</style> 
<script type="text/javascript">
function mySubmit(index){
	if(index == 1){
		document.login.action="findIdPro";
	}
	if(index == 2){
		document.login.action="findPwPro";
	}
	document.login.submit();
}
</script>
<html>
<body>
<jsp:include page="../common/top_main.jsp" />
	<br><br><br><br><br><br><br><br><br>
	<div align = "center">
	<h1>ID&PASSWORD SEARCH</h1>
	</div>
<form name = "login" action = "" method = "post">			
	
	<fieldset>
	<legend><h3>이메일 인증으로 아이디 찾기</h3></legend>
			<table>
				<tr>
					<th align = "left"><label for = "userIdName">이름</label></th>
					<td><input type = "text" id = "userIdName" name = "userIdName" size = "20" placeholder = "이름 입력" required autofocus></td>
				</tr>
				
				<tr>
					<th align = "left"><label for = "userIdEmail">이메일</label></th>
					<td><input type = "email" id = "userIdEmail" name ="userIdEmail" size = "20" placeholder = "이메일 입력"></td>
				</tr>
				<tr>
					<th align = "left"><label for = "date"> 생년월일</label></th>
					<td><input type ="date" id = "userIdBirth" name="userIdBirth"></td>
				</tr>
				<tr>
					<td colspan = "2">
						<span id = "noguest">
						<input type ="button" value = "인증번호 발송" onclick="mySubmit(1);">
						</span>
					</td>	
				</tr>
			</table>
	</fieldset>
	<br><Br>
	<fieldset>
	<legend><h4>이메일 인증으로 비밀번호 찾기</h4></legend>
			<table>
				<tr>
					<th colspan="2">(아이디 입력시 대소문자 꼭 확인 부탁드립니다)</th>
				</tr>
				<tr>
					<th align = "left"><label for = "userPwid">아이디</label></th>
					<td><input type = "text" id = "userPwid" name = "userPwid" size = "20" placeholder = "아이디 입력" required autofocus></td>
				</tr>
				
				<tr>
					<th align = "left"><label for = "userPwName">이름</label></th>
					<td><input type = "text" id = "userPwName" name ="userPwName" size = "20" placeholder = "이름 입력"></td>
				</tr>
				
				<tr>
					<th align = "left"><label for = "userPwEmail">이메일</label></th>
					<td><input type = "email" id = "userPwEmail" name ="userPwEmail" size = "20" placeholder = "이메일 입력"></td>
				</tr>
				<tr>
					<td colspan = "2">
						<span id = "noguest">
						<input type ="button" value = "인증번호 발송" onclick="mySubmit(2)">
						</span>
					</td>	
				</tr>
			</table>
	</fieldset>
</form>

<jsp:include page="../common/Common_Bot.jsp" />	
</body>
</html>