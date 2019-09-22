<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../common/setting.jsp" %>
<html>
<style>
.table tr th,td {
        font-size : 20px;
        border-bottom : 1px inset gray;
        weigth : bold;
	}
    
    table tr {
    	height: 70px;
    }
    
    table tr th {
    	width: 200px;
    }
    .title{
    width : 800px;
    }
    a {text-decoration : none;}
    
    p {
    	font-size : 20px;
    }
</style>
<body>
	<h2>공지사항</h2>	
<c:if test="${cnt>0}">
	<table class= "table">	
		<tr>
			<th>번호</th>
			<th>구분</th>
			<td class = "title">제목</td>
			<th>일시</th>
		</tr>
	</table>	
	<c:forEach var ="dto" items="${dtos}">
	<table class= "table">
			
			<tr>
				<th>${number}
					<c:set var="number" value ="${number-1}" />	
				</th>
				<th>${dto.kind}</th>
				<td class = "title"><a href = "notice_content?pageNum=${pageNum}&num=${dto.num}&number=${number+1}">${dto.subject}</a></td>
				<th>
					<fmt:formatDate type = "both" pattern="yyyy-MM-dd" value="${dto.reg_date}" />
				</th>
			</tr>
	</table>
	</c:forEach>
</c:if>
<c:if test="${cnt<0}">
	<table>
		<tr>
			<td>게시글이 없습니다. 글을 작성 해주세요!</td>
		</tr>
	</table>
</c:if>
	<div align = "center">
	<table id = "block">
		<tr>
			<th colspan = "6">
				<c:if test="${cnt>0}">
					<!-- 처음 과 이전 블록 생성  -->
					<c:if test="${startPage>pageBlock}">
						<a href ="cust_notice">◀◀</a>
						<a href = "cust_notice?pageNum=${startPage-pageBlock}">◀</a>
					</c:if>
					
					<!-- 블록내의 페이지 번호  -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i==currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<c:if test="${i != currentPage }">
							<span><b><a href ="cust_notice?pageNum=${i}">[${i}]</a></b></span>						
						</c:if>
					</c:forEach>
					<!-- 다음 블록과 끝 블록 생성 -->
					<c:if test="${pageCount>endPage}">
						<a href = "cust_notice?pageNum=${startPage+pageBlock}">▶</a>
						<a href = "cust_notice?pageNum=${pageCount}">▶▶</a>
					</c:if>
				</c:if>
			</th>
		</tr>
	</table>
	</div>
</body>
</html>