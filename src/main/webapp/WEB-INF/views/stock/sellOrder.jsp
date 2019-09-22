<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/header.jsp" %>    
<html>
<body>
	<c:if test="${sellCnt==0}">
		<script type="text/javascript">
		alert("매도 신청이 취소 되었습니다.");
		window.open('', '_self', '');
		window.close();
		</script>
	</c:if>
	
	<c:if test="${sellCnt==1}">
		<script type="text/javascript">
		alert("매도 신청이 완료 되었습니다.");
		</script>
		<div class="box-body">
		<div class="table-responsive">
			<table class="table table-bordered">
			  <thead>
				<tr class="bg-warning">
				  <th scope="col">회사 명 / 회사 코드</th>
				  <th scope="col">매도 가격</th>
				  <th scope="col">매도 수량</th>
				  <th scope="col">합계</th>
				</tr>
			  </thead>
			  <tbody>
				<tr>
				  <th scope="row">${vo.stockName} / ${vo.stockCode}</th>
				  <th>${sell_price}</th>
				  <th>${sell_cnt}</th>
				  <th>${sell_total}</th>
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