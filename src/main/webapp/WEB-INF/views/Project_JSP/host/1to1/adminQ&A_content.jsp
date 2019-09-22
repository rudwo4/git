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
	<h2>상세 페이지</h2>
	<form action="adminQandASend" method = "post" name="1to1send">
		<input type = "hidden" name ="num" value ="${param.num}">
		<input type = "hidden" name ="pageNum" value = "${param.pageNum}">
	<table align ="center">
		<tr class="css">
			<th style = "width : 150px">글번호</th>
			<td style = "width : 150px" align = "center">${number}</td>
			<th style = "width : 150px">분류</th>
			<td style = "width : 150px" align = "center">${vo.kind}</td>
		</tr>
		
		<tr class="css">
			<th style = "width : 150px">작성자</th>
			<td style = "width : 150px" align = "center">${vo.strId}</td>
			<th style = "width : 150px">작성일</th>
			<td style = "width : 150px" align = "center">
				<fmt:formatDate type ="both" pattern = "yyyy-MM--dd" value="${vo.reg_date}"/>
			</td>
		</tr>
			
		<tr class="css">
			<th style = "width : 150px">글제목</th>
			<td colspan = "3" style = "width : 150px" align = "center">${vo.subject}</td>	
		</tr>
		
		<tr class="css" id = "content">
			<th>글내용</th>
			<td colspan = "3" style = "width : 200px; height : 200px;" word-break:break-all>${vo.content}</td>	
		</tr>
		<tr class="css" id ="content">
			<th>*답글 내용*</th>
			<td colspan = "3" style = "width : 200px; height : 200px" word-break:break-all>${vo.a_content}</td>	
		</tr>
		<tr class="css">
			<th>답글 쓰기</th>
			<td colspan ="3"><textarea type = "input" rows="10" cols="40" name = "content" style="width:400px" placeholder ="글내용을 입력하세요!!" word-break:break-all></textarea></td>
		</tr>
		<tr>
			<th colspan = "4" id = "button">
			<input type = "submit" value = "답글 쓰기">
			<input type = "button" value = "목록" onclick="window.location='adminQandAmanage?pageNum=${pageNum}'">
			</th>
		</tr>
	</table>
	</form>
</body>
</html>