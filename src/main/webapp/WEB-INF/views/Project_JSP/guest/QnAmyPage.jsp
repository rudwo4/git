<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = ../common/setting.jsp" %>    
<html>
<jsp:include page="../common/Aft_top_main.jsp" />
<body>
	<br><br><br><br><br><br><br><br><br>
	<h2 align = "center">나의 문의 사항</h2>
	<table align ="center">
		<tr>
			<th style = "width : 150px">종류</th>
			<td style = "width : 150px" align = "center">${vo.kind}</td>
		</tr>
		
		<tr>
			<th style = "width : 150px">작성자</th>
			<td style = "width : 150px" align = "center">${vo.strId}</td>
			<th style = "width : 150px">작성일</th>
			<td style = "width : 150px" align = "center">
				<fmt:formatDate type ="both" pattern = "yyyy-MM--dd" value="${vo.reg_date}"/>
			</td>
		</tr>
			
		<tr>
			<th style = "width : 150px">글제목</th>
			<td style = "width : 150px" align = "center">${vo.subject}</td>	
		</tr>
		
		<tr>
			<th>글내용</th>
			<td colspan = "3" style = "width : 200px" word-break:break-all>${vo.content}</td>	
		</tr>
		<tr>
			<th>답글 쓰기</th>
			<td colspan = "3" style = "width : 200px" word-break:break-all>${vo.a_content }</td>
		</tr>
		<tr>
			<th><input type = "button" value = "목록" onclick="window.history.back();"></th>
		</tr>
	</table>
</body>
<jsp:include page="../common/Common_Bot.jsp" />
</html>