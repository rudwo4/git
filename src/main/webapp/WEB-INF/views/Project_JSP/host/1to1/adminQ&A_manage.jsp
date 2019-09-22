<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../common/setting.jsp" %>    
<html>
<style>
	table tr th,td {
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
    select{
    	width : 200px;
   		height : 30px;
   		font-size : 20px;
    }
   	option{
   		font-size :20px;
   	}
   	
   	select #wait{
   		color : red;
   	}
    
    select #complete{
   		color : green;
   	}
    input{
    	width :100px;
        height : 40px;
    }	
</style>
<body>
	<div align = "center">
	<h1>고객 문의 사항</h1>
	<table>
		<tr style = "background : #c4cad3">
			<th>번호</th>
			<th>아이디</th>
			<th>문의유형</th>
			<th class = "title">제목</th>
			<th>처리상태</th>
		</tr>
			
	<c:if test="${cnt > 0 }">			
		<c:forEach var = "dto" items="${dtos}">
			<tr>
				<th>${number}
					<c:set var="number" value ="${number-1}" />
				</th>
				<th>${dto.strId}</th>
				<td>${dto.kind}</td>
				<td class = "title">
					<a href = "adminQandAcontent?pageNum=${pageNum}&num=${dto.num}&number=${number}">${dto.content}</a>
				</td>
				<td>
					<select>
						<option value = "답변상태">답변상태</option>
						<option id = "wait" value = "답변대기">답변대기</option>
						<option id = "complete" value = "답변완료">답변완료</option>
					</select>
				</td>
			</tr>
		</c:forEach>
	</c:if>		
	</table>
	</div>
<c:if test="${cnt<0}">
	<table>
		<tr>
			<td>게시글이 없습니다. 글을 작성 해주세요!</td>
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
						<a href ="adminQandAmanage">◀◀</a>
						<a href = "adminQandAmanage?pageNum=${startPage-pageBlock}">◀</a>
					</c:if>
					
					<!-- 블록내의 페이지 번호  -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i==currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<c:if test="${i != currentPage }">
							<span><b><a href ="adminQandAmanage?pageNum=${i}">[${i}]</a></b></span>						
						</c:if>
					</c:forEach>
					
					<!-- 다음 블록과 끝 블록 생성 -->
					<c:if test="${pageCount>endPage}">
						<a href = "adminQandAmanage?pageNum=${startPage+pageBlock}">▶</a>
						<a href = "adminQandAmanage?pageNum=${pageCount}">▶▶</a>
					</c:if>
				</c:if>
			</th>
		</tr>
	</table>
</div>		
</body>
</html>