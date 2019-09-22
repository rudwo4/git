<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../common/setting.jsp" %>    
<html>
<style>
#add tr th,td {
    font-size : 20px;
    border-bottom : 1px inset gray;
    weigth : bold;
	}
    
    #add tr {
    	height: 60px;
    }
    
    #add tr th {
    	width: 200px;
    }
    
	#add table tr th,td {
		border : 1px solid black;
	}
		
	input{
    	width :50px;
        height : 40px;
    }
    
    #img img{
    	width : 100px;
    	height : 100px;
    }
    
</style>
<body>
<div align = "center">
<h1>상품 발주</h1>
<form action ="adminpdCountSize" method = "post" name = "view">
	<c:if test="${cnt>0}">
	<table id = "add">
		<tr style = "background : #c4cad3">
			<th></th>
			<th>상품번호</th>
			<th>제품 이미지</th>
			<th>상품 이름</th>
			<th>색상</th>
			<th>분류</th>
			<th>판매가</th>
			<th>입고가</th>
		</tr>
		<c:forEach var = "dto" items ="${dtos}">
			<tr>
				<td><input type ="radio" id = "code" name ="code" value ="${dto.p_code}"></td>
				<td>${dto.p_code}</td>
				<td id ="img"><img src="${project}/pd_img/pd${dto.p_image}"></td>
				<td>${dto.p_name}</td>
				<td>${dto.p_color}</td>
				<td>${dto.p_kind}</td>
				<td>${dto.p_salePrice}</td>
				<td>${dto.p_purchaseCost}</td>
			</tr>
		</c:forEach>
			<tr>
				<th id = "button" colspan ="8" align = "right"><input type = "submit" value ="발주하기"></th>
			</tr>
	</table>
	</c:if>
	<c:if test="${cnt<=0}">
	<table>
		<tr>
			<td>게시글이 없습니다. 글을 작성 해주세요!</td>
		</tr>
	</table>
	</c:if>
	<table id = "block">
		<tr>
			<th colspan = "6">
				<c:if test="${cnt>0}">
					<!-- 처음 과 이전 블록 생성  -->
					<c:if test="${startPage>pageBlock}">
						<a href ="adminproduct_view">◀◀</a>
						<a href = "adminproduct_view?pageNum=${startPage-pageBlock}">◀</a>
					</c:if>
					
					<!-- 블록내의 페이지 번호  -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i==currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<c:if test="${i != currentPage }">
							<span><b><a href ="adminproduct_view?pageNum=${i}">[${i}]</a></b></span>						
						</c:if>
					</c:forEach>
					
					<!-- 다음 블록과 끝 블록 생성 -->
					<c:if test="${pageCount>endPage}">
						<a href = "adminproduct_view?pageNum=${startPage+pageBlock}">▶</a>
						<a href = "adminproduct_view?pageNum=${pageCount}">▶▶</a>
					</c:if>
				</c:if>
			</th>
		</tr>
	</table>
</form>			
</div>		
</body>
</html>