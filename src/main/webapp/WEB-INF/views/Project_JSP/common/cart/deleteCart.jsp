<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../setting.jsp" %>    
<html>
<body>
	<c:if test="${saleCnt == 1 }">
		<script type="text/javascript">
			alert("장바구니에 담긴 물건을 삭제했습니다");
			window.location="cartForm.do";
		</script>
	</c:if>
	
	<c:if test="${saleCnt != 1 }">
		<script type="text/javascript">
			alert("작업이 취소 되었습니다.");
			window.history.back();
		</script>
	</c:if>
</body>
</html>