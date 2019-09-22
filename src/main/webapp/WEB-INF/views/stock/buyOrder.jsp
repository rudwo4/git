<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/header.jsp" %>    
<html>
<body style="background:#252525;">
	
	<c:if test="${buyCnt==0}">
		<script type="text/javascript">
		alert("매수 신청이 취소 되었습니다.");
		window.open('', '_self', '');
		window.close();
		</script>
	</c:if>
	
	<c:if test="${buyCnt==1}">
		<script type="text/javascript">
		alert("매수 신청이 완료 되었습니다.");
		</script>
		<div class="box-body">
		<div class="table-responsive">
			<table class="table table-bordered">
			  <thead>
				<tr class="bg-warning">
				  <th scope="col">회사 명 / 회사 코드</th>
				  <th scope="col">매수 가격</th>
				  <th scope="col">매수 수량</th>
				  <th scope="col">합계</th>
				</tr>
			  </thead>
			  <tbody>
				<tr>
				  <th scope="row">${vo.stockName} / ${vo.stockCode}</th>
				  <th>${buy_price}</th>
				  <th>${buy_cnt}</th>
				  <th>${buy_total}</th>
				</tr>
			  </tbody>
			</table>
			<div align ="center">
				<input type = "button" class="btn btn-block btn-success btn-lg" value = "확인" onclick="window.close();"> 			
			</div>
		</div>
        </div>
      <!-- /.box-body -->
	</c:if>
</body>
</html>