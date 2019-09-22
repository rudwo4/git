<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../common/setting.jsp" %>
<html>
<style>
table {
    	border : 1px inset gray;
    }
    
     #content td{
    	border-bottom : 1px inset black;
    	border-top : 1px inset black;
        
    }
    
    .css th {
	   position: relative;
       vertical-align: mid;
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
       -webkit-box-shadow: inset 0 -2px 			#f7e3e3;
       box-shadow: inset 0 -2px #f7e3e3;
    	background : #f7e3e3;
        color : gray;
	}
</style>
<body>
	<br><br>
	<div align = "center"><h2>공지사항 작성</h2></div>
	
	<form action="adminnoticeWritePro" method = "post" name="noticeWriteForm">
		<input type = "hidden" name = "num" value="${num}">
		<input type = "hidden" name = "pageNum" value="${pageNum}">
		<br><br>
		<table align ="center">
			<tr class="css">
				<th>작성자</th>
				<td colspan ="2">
					<input type = "text" name = "writer" maxlength = "20" placeholder ="작성자를 입력하세요!!" autofocus required>
				</td>
			</tr>
		
			<tr class="css">
				<th>비밀번호</th>
				<td colspan ="2">
					<input type = "password" name = "pw" maxlength = "20" placeholder ="비밀번호를 입력하세요" required>
				</td>
			</tr>
			<tr class="css">
				<th>문의 유형</th>
				<td colspan ="2">
					<select size = "1" name ="kind">
					<optgroup label="문의 유형 선택">
						 <option value = "전체">전체</option>
			             <option value = "E-shop">E-shop</option>
			             <option value = "브랜드">브랜드</option>
			             <option value = "지난 이벤트">지난 이벤트</option>
					</optgroup>
					</select>
				</td>
			</tr>
			<tr class="css">
				<th>제목</th>
				<td colspan ="2">
					<input type = "text" name = "subject" maxlength = "50" placeholder ="제목 입력하세요!!" style="width:270px" required>
				</td>
			</tr>			
			<tr class="css" id ="content">
				<th>내용</th>
				<td colspan ="2">
					<textarea type = "input" rows="10" cols="40" name = "content" style="width:700px; height:400px;" placeholder ="글내용을 입력하세요!!" word-break:break-all></textarea>
				</td>
			</tr>
			<tr id = "button">
				<th colspan="2">
					<input type ="submit" value="작성">
					<input type ="reset" value="취소">
					<input type ="button" value="목록" onclick="window.history.back();">
				</th>
			</tr>
		</table>
	</form>
</body>
</html>