<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../common/setting.jsp" %>   
<html>
<style>
 #story input {
	width : 1000px;
	height : 600px; 
	font-size : 30px;
 }
 
 th {
 	font-size : 20px;
 }
 #Qtype {
 	font-size: 20px;
 }
 
 input{
 	width : 200px;
    height : 30px;
 }
 
 td #object {
 	width : 400px;
 	font-size: 15px;
 }
 
</style>
</head>
<body>
<form action ="1to1Pro" method ="post" name="1to1">
	<table>
		<tr>
		<th>문의유형</th>
          <td>
          <select size = "1" id = "Qtype" name = "kind">
          <optgroup label ="문의유형 선택">
              <option value = "반품/교환/AS">반품/교환/AS</option>
              <option value = "배송">배송</option>
              <option value = "주문/결제">주문/결제</option>
              <option value = "취소/환불">취소/환불</option>
              <option value = "쿠폰/포인트">쿠폰/포인트</option>
              <option value = "기타">기타</option>
              <option value = "회원">회원</option>
          </optgroup>
          </select>
          </td>
         </tr>
         
		
		<tr>
		<th>제목</th>
          <td><input type ="text" id = "object" name = "subject" size ="20" required autofocus></td>
		</tr>
        
        <tr>
		<th>내용</th>
        
        <td id = "story">
		<input type ="text" size = "500" name = "content" placeholder = "문의 내용을 입력해 주세요. 개인정보의 입력은 삼가해 주시기 바랍니다." required></td>
		
	<tr>
		<div align = "center">
			<td></td>
			<td><input type = "submit" id = "check" value = "확인"><input type = "reset" id = "reset" value = "취소"></td>
		</div>
	</tr>
    </table>
</form>
</body>
</html>