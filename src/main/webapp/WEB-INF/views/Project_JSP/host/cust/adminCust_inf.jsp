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
    a {text-decoration : none;}
    
    input{
    	width :100px;
        height : 40px;
    }	
</style>
<script type="text/javascript" src="${project}js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#selectAll").click(function(){
			//클릭시
			if($("#selectAll").prop("checked")){
				$("input[name=select]").prop("checked",true);
			}else{
				$("input[name=select]").prop("checked",false);
			}
		});
	});
</script>	 
<body>
<div align = "center">
	<h1>회원정보창</h1>
	<c:if test="${cnt>0}">
	<form action="adminhostDelCust.do?" method = "post" id = "deleteForm">
		<table>
			<tr style = "background : #c4cad3">
				<th><input type = "checkbox" name = "selectAll" id = "selectAll"></th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>이메일</th>
				<th>휴대폰번호</th>
				<th>생년월일</th>
				<th>성별</th>
			</tr>
			<c:forEach var = "dto" items ="${dtos}">
				<tr>	
					<th><input type = "checkbox" name = "select" id = "select" value = "${dto.id}"></th>
					<td>${dto.id}</td>
					<td>${dto.pwd}</td>
					<td>${dto.name}</td>
					<td>${dto.email}</td>
					<td>${dto.phone }</td>
					<td>${dto.birth }</td>
					<td>${dto.gender}</td>
				</tr>
			</c:forEach>
			<tr align = "right">
				<th colspan = "8" id = "button">
					<input type = "reset" value = "취소">
					<input type = "submit" value = "회원삭제">
				</th>
			</tr>
		</table>
	</form>	
	</c:if>
	<c:if test="${cnt<=0}">
	<table>
		<tr>
			<td>게시글이 없습니다. 글을 작성 해주세요!</td>
		</tr>
	</table>
	</c:if>
	<table id ="block">
		<tr>
			<th colspan = "6">
				<c:if test="${cnt>0}">
					<!-- 처음 과 이전 블록 생성  -->
					<c:if test="${startPage>pageBlock}">
						<a href ="adminCust_inf.do">◀◀</a>
						<a href = "adminCust_inf.do?pageNum=${startPage-pageBlock}">◀</a>
					</c:if>
					
					<!-- 블록내의 페이지 번호  -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i==currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<c:if test="${i != currentPage }">
							<span><b><a href ="adminCust_inf.do?pageNum=${i}">[${i}]</a></b></span>						
						</c:if>
					</c:forEach>
					
					<!-- 다음 블록과 끝 블록 생성 -->
					<c:if test="${pageCount>endPage}">
						<a href = "adminCust_inf.do?pageNum=${startPage+pageBlock}">▶</a>
						<a href = "adminCust_inf.do?pageNum=${pageCount}">▶▶</a>
					</c:if>
				</c:if>
			</th>
		</tr>
	</table>
</div>		
</body>
</html>