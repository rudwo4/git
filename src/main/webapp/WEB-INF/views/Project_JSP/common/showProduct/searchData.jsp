<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../setting.jsp" %>    
<html>

<c:if test="${strId != null}">
<jsp:include page="../Aft_top_main.jsp" />
</c:if>

<c:if test="${strId == null}">
<jsp:include page="../top_main.jsp" />
</c:if>
<style>
	#product ul li {
		list-style-type : none;
		width :300px;
	}
	
	tr{
		height : 50px;
	}
	
	#product img{
		width : 250px;
		height : 300px;
	}
</style>
<body>
<br><br><br><br><br><br><br><br><br><br>
	<center><h1>'${keyword}'의 검색결과 ${cnt} 건</h1></center>
	<div>
	<table align = "center">
		<tr>
			<c:forEach var = "dtos" items="${dtos}" begin="0" end="2">
			<th id = "product">
				<ul>
					<a href ="shoesContent?p_code=${dtos.p_code}&pageNum=${pageNum}&num=${dtos.num}&number=${number+1}&strId=${strId}">
					<li><img src ="${project}/pd_img/pd${dtos.p_image}"></li>
					<li>${dtos.p_name}</li>
					<li>${dtos.p_salePrice}</li>
					</a>
				</ul>
			</th>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach var = "dtos" items="${dtos}" begin="3" end="5">
			<th id = "product">
				<ul>
					<a href ="shoesContent?p_code=${dtos.p_code}&pageNum=${pageNum}&num=${dtos.num}&number=${number+1}&strId=${strId}">
					<li><img src ="${project}/pd_img/pd${dtos.p_image}"></li>
					<li>${dtos.p_name}</li>
					<li>${dtos.p_salePrice}</li>
					</a>
				</ul>			
			</th>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach var = "dtos" items="${dtos}" begin="6" end="8">
			<th id = "product">
				<ul>
					<a href ="shoesContent?p_code=${dtos.p_code}&pageNum=${pageNum}&num=${dtos.num}&number=${number+1}&strId=${strId}">
					<li><img src ="${project}/pd_img/pd${dtos.p_image}"></li>
					<li>${dtos.p_name}</li>
					<li>${dtos.p_salePrice}</li>
					</a>
				</ul>			
			</th>
			</c:forEach>
		</tr>
	</table>
	</div>
	<div align = "center">
	<table>
		<tr>
			<th colspan = "6">
				<c:if test="${cnt>0}">
					<!-- 처음 과 이전 블록 생성  -->
					<c:if test="${startPage>pageBlock}">
						<a href ="searchData">◀◀</a>
						<a href = "searchData?pageNum=${startPage-pageBlock}">◀</a>
					</c:if>
					
					<!-- 블록내의 페이지 번호  -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i==currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<c:if test="${i != currentPage }">
							<span><b><a href ="searchData?pageNum=${i}">[${i}]</a></b></span>						
						</c:if>
					</c:forEach>
					
					<!-- 다음 블록과 끝 블록 생성 -->
					<c:if test="${pageCount>endPage}">
						<a href = "searchData?pageNum=${startPage+pageBlock}">▶</a>
						<a href = "searchData?pageNum=${pageCount}">▶▶</a>
					</c:if>
				</c:if>
			</th>
		</tr>
	</table>
	</div>	
</body>
<jsp:include page="../Common_Bot.jsp" />
</html>