<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./../common/setting.jsp" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %> 
<c:set var="path" value ="${pageContext.request.contextPath}" /> 
<html>
<style>
up {
		list-style-type : none;
	}
	
	fieldset {
		margin : 0 auto;
		max-width : 450px;
		border : 2px solid #8c97a8;
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
     color: WHITE;
     text-align: center;
     text-shadow: 0 1px 2px rgba(0, 0, 0, 		0.25);
     background: #f7e3e3;
     border: 0;
     border-bottom: 2px solid #8c97a8;
     border-radius: 5px;
     cursor: pointer;
     -webkit-box-shadow: inset 0 -2px 			#D76B60;
     box-shadow: inset 0 -2px #8c97a8;
     
  	}
  	
  	 #log input {
       position: relative;
       vertical-align: top;
       width: 200;
       height: 70px;
       padding: 0;
       font-size: 15px;
       color: WHITE;
       text-align: center;
       text-shadow: 0 1px 2px rgba(0, 0, 0, 		0.25);
       background: black;
       border: 0;
       border-bottom: 2px solid #8c97a8;
       border-radius: 5px;
       cursor: pointer;
       -webkit-box-shadow: inset 0 -2px 			black;
       box-shadow: inset 0 -2px #8c97a8;
    	background : #8c97a8;
    }
    
    #pw input {
       position: relative;
       vertical-align: top;
       width: 200px;
       height: 70px;
       padding: 0;
       font-size: 15px;
       color: WHITE;
       text-align: center;
       text-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
       background: #f7e3e3;
       border: 0;
       border-bottom: 2px solid #8c97a8;
       border-radius: 5px;
       cursor: pointer;
       -webkit-box-shadow: inset 0 -2px black;
       box-shadow: inset 0 -2px #8c97a8;
    	background : #8c97a8;
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
<jsp:include page="./../common/top_main.jsp" />
	<br><br><br><br><br><br><br><br><br>
	<div align = "center">
	<h1>MANAGER LOGIN</h1>
	</div>
<form name = "login" action = "${path}/user/login_check" method = "post">			
	
	<%-- 크로스 사이드 스크립팅 공격방어를 위해 스프링 시큐리티에서는 반드시 아랫값을 전달해야 에러가 발생 안함
		${_csrf.~}을 사용
		name, value는 반드시 아래 값을 사용해야 함
	 --%>
	<input type ="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	
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
					<td colspan = "4" align = "center">
						<br>
						<span id = "log">
						<input type ="submit" value = "로그인">
						</span>
					</td>	
				</tr>
			</table>
	</fieldset>
</form>
<jsp:include page="./../common/Common_Bot.jsp" />
</body>
</html>