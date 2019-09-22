<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../setting.jsp" %>    
<html>
<title>장바구니</title>
<script type="text/javascript" src="${project}js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	
	function mySubmit(index){
		if(index == 1){
			document.cartForm.action="deleteCart";
		}
		document.cartForm.submit();
	}
</script>
<style>
#img img{width : 200px; height : 150px; }
    
    #inputstyle input {width : 100px; height :40px;}	
    
    #check input {width : 30px; height :30px;}
    #title th {width: 800px;}
	
	section { width :960px;	padding : 20px; margin : 0 auto; border: 1px solid black;}}
        
	}
</style>
<body>

<jsp:include page="../Aft_top_main.jsp" />
<br><br><br><br><br><br><br><br><br><br>
<c:if test="${cnt>0}">
<h1 align = "center">SHOPPING BAG</h1>
<section>
	<form action="cartOrder?strId=${strId}" method = "post" name = "cartForm">
	
	<article>
	<hr>
		<table>
			<tr id = "title">
				<th>선택</th>
				<th>상품정보</th>
				<th>사이즈</th>
				<th>수량</th>
				<th>상품금액</th>
				<th>주문금액</th>
				<th></th>
			</tr>
			
			<c:forEach var ="dto" items ="${dtos}">		
				<input type = "hidden" id ="p_code" name ="p_code" value ="${dto.p_code}">
				<input type = "hidden" id ="p_name" name ="p_name" value ="${dto.p_name}">
				<input type = "hidden" id ="p_color" name ="p_color" value ="${dto.p_color}">
				<input type = "hidden" id ="p_kind" name ="p_kind" value ="${dto.p_kind}">
				<tr>
					<th id = "check"><input type = "radio" id = "select" name ="select" value ="${dto.num}" checked></th>
					<th id = "img"><img src = "${project}/pd_img/pd${dto.p_image}"></th>
					<th>${dto.p_size}<input type = "hidden" id ="p_size" name ="p_size" value ="${dto.p_size}"></th>
					<th>${dto.p_count}<input type = "hidden" id ="p_count" name ="p_count" value ="${dto.p_count}"></th>
					<th>${dto.p_salePrice}<input type = "hidden" id ="p_salePrice" name ="p_salePrice" value ="${dto.p_salePrice}"></th>
					<th>${dto.sum}<input type = "hidden" id ="sum" name ="sum" value ="${dto.sum}"></th>
					<th id ="inputstyle">
						<input type = "button" name = "delete" value = "삭제하기" onclick="mySubmit(1);">
					</th>
				</tr>
			</c:forEach>
		</table>	
	<hr>
		<br>
		<div align = "center">
		<table id = "button">
		<tr>
			<td>	
				<input type = "submit" value = "상품주문">
			</td>
			<td>	
				<input type = "button" value = "쇼핑계속하기" onclick="window.location='runningShoes?strId=${strId}'">
			</td>
		</tr>
		</table>
		</div>
	</article>
	</form>	
		<div align = "center">
		<table>
		<tr>
			<th colspan = "6">
			
				<c:if test="${cnt>0}">
					<!-- 처음 과 이전 블록 생성  -->
					<c:if test="${startPage>pageBlock}">
						<a href ="cartForm">◀◀</a>
						<a href = "cartForm?pageNum=${startPage-pageBlock}">◀</a>
					</c:if>
					
					<!-- 블록내의 페이지 번호  -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i==currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<c:if test="${i != currentPage }">
							<span><b><a href ="cartForm?pageNum=${i}">[${i}]</a></b></span>						
						</c:if>
					</c:forEach>
					
					<!-- 다음 블록과 끝 블록 생성 -->
					<c:if test="${pageCount>endPage}">
						<a href = "cartForm?pageNum=${startPage+pageBlock}">▶</a>
						<a href = "cartForm?pageNum=${pageCount}">▶▶</a>
					</c:if>
				</c:if>
			</th>
		</tr>
		</table>
		</div>
</section>
</c:if>
	<div align = "center">
	<c:if test="${cnt < 1}">
	<table>
		<tr>
			<td><h1>장바구니가 비어있습니다. 물건을 담아 주세요!</h1></td>
		</tr>
	</table>
	</c:if>
	</div>
</body>
<jsp:include page="../Common_Bot.jsp" />
</html>