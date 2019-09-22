<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../../common/setting.jsp" %>    
<html>
<style>
   #qna {
    	border : 1px inset gray;
    }
</style>
<jsp:include page="../../common/Aft_top_main.jsp" />
<body>
	<br><br><br><br><br><br><br><br><br>
	<div align ="center"><h2>1:1 문의 상세 페이지</h2></div>
		<input type = "hidden" name ="num" value ="${param.num}">
		<input type = "hidden" name ="pageNum" value = "${param.pageNum}">
	<table align ="center" id = "qna">
		<tr>
			<th style = "width : 150px">글번호</th>
			<td style = "width : 150px" align = "center">${number}</td>
			<th style = "width : 150px">분류</th>
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
			<td colspan = "3" style = "width : 150px" align = "center">${vo.subject}</td>	
		</tr>
		
		<tr>
			<th>글내용</th>
			<td colspan = "3" style = "width : 200px" word-break:break-all>${vo.content}</td>	
		</tr>
		<tr>
			<th>답글 내용</th>
			<td colspan = "3" style = "width : 200px" word-break:break-all>${vo.a_content}</td>	
		</tr>
		<tr>
			<th colspan = "4" id = "button">
			<input type = "button" value = "목록" onclick="window.location='adminQandAcustView?pageNum=${pageNum}'">
			</th>
		</tr>
	</table>
</body>
<jsp:include page="../../common/Common_Bot.jsp" />
</html>