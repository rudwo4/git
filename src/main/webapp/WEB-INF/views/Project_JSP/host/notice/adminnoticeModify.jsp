<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../../common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>수정페이지</h2>
	
	<c:if test="${modifyCnt == 1}" >
		<form action="adminnoticeModifyPro" method ="post" name ="noticeModifyform">
			
			<!-- hidden은 form 태그내에 있어야 한다. -->
			<input type="hidden" name ="num" value="${num}">
			<input type="hidden" name ="pageNum" value="${pageNum}">
			
			<table>
			<tr>
				<th>작성자</th>
				<td>
					<input type = "text" name = "writer" maxlength = "20" placeholder ="작성자를 입력하세요!!" autofocus required>
				</td>
			</tr>
		
			<tr>
				<th>비밀번호</th>
				<td>
					<input type = "password" name = "pw" maxlength = "20" placeholder ="비밀번호를 입력하세요" required>
				</td>
			</tr>
			<tr>
				<th>문의 유형</th>
				<td>
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
			<tr>
				<th>제목</th>
				<td>
					<input type = "text" name = "subject" maxlength = "50" placeholder ="제목 입력하세요!!" style="width:270px" required>
				</td>
			</tr>			
			<tr>
				<th>내용</th>
				<td>
					<textarea type = "input" rows="10" cols="40" name = "content" style="width:270px" placeholder ="글내용을 입력하세요!!" word-break:break-all></textarea>
				</td>
			</tr>
				
			<tr>
				<th colspan="2">
					<input type="submit" value="글수정">
					<input type="reset"  value="수정취소">
					<input type="button" value="목록 보기"
						onclick = "window.location='adminnoticeMan?pageNum=${pageNum}'">
			</tr>
			</table>
		</form>
	</c:if>
	
	<c:if test="${modifyCnt != 1}">
		<script type="text/javascript">
			alert("작업이 취소되었습니다. 다시 시도해주세요!");
		</script>
	</c:if>	
</body>
</html>