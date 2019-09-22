<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../common/setting.jsp" %>    
<html>
<jsp:include page="../../common/Aft_top_main.jsp" />
<body>
	<div align = "center">
	<br><br><br><br><br><br><br><br><br>
	<h1>나의 문의 사항</h1>
	<table id = info>
		<tr style = "background : #f77676">
			<th style ="width:150px; height : 50px;">번호</th>
			<th style ="width:150px; height : 50px;">문의 유형</th>
			<th style ="width:500px; height : 50px;">제목</th>
		</tr>
			
	<c:if test="${cnt > 0 }">			
		<c:forEach var = "dto" items="${dtos}">
			<tr style = "background : #f2e3e3">
				<th style ="width:150px; height : 100px;">${number}
					<c:set var="number" value ="${number-1}" />
				</th>
				<th style ="width:150px; height : 100px;">${dto.kind}</th>
				<td style ="width:500px; height : 100px;">
					<a href = "adminQandAcustContent?pageNum=${pageNum}&num=${dto.num}&number=${number}">${dto.content}</a>
				</td>
			</tr>
		</c:forEach>
	</c:if>		
	</table>
	</div>
<c:if test="${cnt<0}">
	<table>
		<tr>
			<td>문의 내용이 없습니다.</td>
		</tr>
	</table>
</c:if>
<div align = "center">
	<table>
		<tr>
			<th colspan = "6">
				<c:if test="${cnt>0}">
					<!-- 처음 과 이전 블록 생성  -->
					<c:if test="${startPage>pageBlock}">
						<a href ="adminQandAcustView">◀◀</a>
						<a href = "adminQandAcustView?pageNum=${startPage-pageBlock}">◀</a>
					</c:if>
					
					<!-- 블록내의 페이지 번호  -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i==currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<c:if test="${i != currentPage }">
							<span><b><a href ="adminQandAcustView?pageNum=${i}">[${i}]</a></b></span>						
						</c:if>
					</c:forEach>
					
					<!-- 다음 블록과 끝 블록 생성 -->
					<c:if test="${pageCount>endPage}">
						<a href = "adminQandAcustView?pageNum=${startPage+pageBlock}">▶</a>
						<a href = "adminQandAcustView?pageNum=${pageCount}">▶▶</a>
					</c:if>
				</c:if>
			</th>
		</tr>
	</table>
</div>		
</body>
<jsp:include page="../../common/Common_Bot.jsp" />
</html>