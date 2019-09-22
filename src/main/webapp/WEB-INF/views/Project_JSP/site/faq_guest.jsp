<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
	/* 드롭메뉴 */
	.board ,li {
		list-style-type : none;
	}
    
    ul{display : none;}
    .blind:hover+.a{display: block;}
    
    /* FAQ 공통 부분 */
    .blind {
    	font-size : 25px;
        font-weight : bold;
    }
    
    li {
    	font-size : 20px;
    }
</style>
<body>
<br><br><hr>
<div class="board">
<span class="blind">회원정보 - 본인인증이 되지 않아 회원가입이 안됩니다.</span>
  <ul class = "a">
    <li>Q.회원정보 - 본인인증이 되지 않아 회원가입이 안됩니다.</li>
    <br>
    <li>A.핸드폰 본인 인증이 되지 않는 경우는 통신사와 인증 업체간의 일시적인 통신장애가 생길수 있습니다.</li>
    <li>이런 경우 인증이 되지 않아 회원가입을 못하신 경우가 발생할 수 있습니다.</li>
    <li>핸드폰 본인 인증이 원활하게 이루어 지지 않을 경우, 잠시 후에 다시 한번 시도해 보시기 바랍니다.</li>
  </ul>
  <br><br><hr>
<span class="blind">회원정보 - 회원아이디는 변경할 수 없나요?</span> 
  <ul class = "a">
	<li>Q.회원정보-회원아이디는 변경할 수 없나요?</li>
	<li>A.회원 아이디는 최초 가입 이후에는 변경하실 수 없습니다.</li>
  </ul>
  <br><br><hr>
 
<span class="blind">회원정보 - 회원정보를 변경하려면 어떻게 해야 하나요?</span>   
  <ul class = "a">
  	<li>Q. 회원정보-회원정보를 변경하려면 어떻게 해야 하나요?</li>
  	<li>회원 로그인 후, My page의 '정보변경'을 클릭하시고 인증을 먼저 진행하셔야 합니다.</li>
  	<li>인증이 끝난 후에는 회원정보를 변경하실 수 있습니다.</li>
  </ul>  
</div>
	<p align = "center">
	<
	<button id = "1pg" onclick = ""><h3>1</h3></button>
	>
	</p> 
</body>
</html>