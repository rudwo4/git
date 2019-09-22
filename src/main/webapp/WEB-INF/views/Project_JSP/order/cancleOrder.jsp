<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/setting.jsp" %>
<html>
<body>
	<h3>수정 완료</h3>
	
	<c:if test="${orderNumCnt == 1}">
		<script type="text/javascript">
			alert("취소 및 환불 신청 되었습니다!");
			window.location="currentOrder";
		</script>
	</c:if>
	
	<c:if test="${orderNumCnt != 1}">
		<script type="text/javascript">
			alert("다시 시도 해주세요!");
			window.history.back();
		</script>
	</c:if>
</body>
</html>