<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../../common/setting.jsp" %>    
<html>
<style>
    table tr th,td{
    	border : 1px inset gray;
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
	<table align ="center">
		<tr class = "css">
			<th style = "width : 150px">글번호</th>
			<td style = "width : 150px" align = "center">${number}</td>
			<th style = "width : 150px">분류</th>
			<td style = "width : 150px" align = "center">${dto.kind}</td>
		</tr>
		
		<tr class = "css">
			<th style = "width : 150px">작성자</th>
			<td style = "width : 150px" align = "center">${dto.hostId}</td>
			<th style = "width : 150px">작성일</th>
			<td style = "width : 150px" align = "center">
				<fmt:formatDate type ="both" pattern = "yyyy-MM--dd" value="${dto.reg_date}"/>
			</td>
		</tr>
			
		<tr class = "css">
			<th style = "width : 150px">글제목</th>
			<td style = "width : 150px" align = "center" colspan = "3">${dto.subject}</td>	
		</tr>
		
		<tr class = "css">
			<th>글내용</th>
			<td colspan = "3" style = "width : 200px; height: 500px;" word-break:break-all>${dto.content}</td>	
		</tr>
		
		<tr id = "button">
			<th colspan ="4">
				<input type ="button" value = "수정" onclick="window.location='adminnoticeModifyForm?num=${num}&pageNum=${pageNum}'" >
				<input type = "button" value = "목록" onclick="window.location='adminnoticeMan?pageNum=${pageNum}'">
				<input type ="button" value = "삭제" onclick="window.location='admindeleteNoticeForm?num=${num}&pageNum=${pageNum}'" >
			</th>
		</tr>
	</table>
</body>
</html>