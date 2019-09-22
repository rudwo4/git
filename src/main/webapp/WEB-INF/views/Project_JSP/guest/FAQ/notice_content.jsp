<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../../common/setting.jsp" %>    
<html>
<style>
    table {
    	border : 1px inset gray;
    }
</style>
<body>
	<div align ="center">
	<h2>상세 페이지</h2>
	<table>
		<tr>
			<th style = "width : 150px">글번호</th>
			<td style = "width : 150px" align = "center">${number}</td>
			<th style = "width : 150px">분류</th>
			<td style = "width : 150px" align = "center">${dto.kind}</td>
		</tr>
		
		<tr>
			<th style = "width : 150px">작성자</th>
			<td style = "width : 150px" align = "center">${dto.hostId}</td>
			<th style = "width : 150px">작성일</th>
			<td style = "width : 150px" align = "center">
				<fmt:formatDate type ="both" pattern = "yyyy-MM-dd" value="${dto.reg_date}"/>
			</td>
		</tr>
			
		<tr>
			<th style = "width : 150px">글제목</th>
			<td style = "width : 150px" align = "center" colspan ="3">${dto.subject}</td>	
		</tr>
		
		<tr>
			<th>글내용</th>
			<td colspan = "3" style = "width : 200px; height: 500px;" word-break:break-all>${dto.content}</td>	
		</tr>
		
		<tr id = "button">
			<th colspan = "4" align ="right"><input type = "button" value = "목록" onclick="window.location='cust_notice.do?pageNum=${pageNum}'"></th>
		</tr>
	</table>
	</div>
</body>
</html>