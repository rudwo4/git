<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../setting.jsp" %>    
<html>
<body>
	<c:if test="${cartCnt == 1 }">
		<script type="text/javascript">
			alert("장바구니에 담겼습니다");
			window.location="cartForm.do";
		</script>
	</c:if>
	
	<c:if test="${cartCnt != 1 }">
		<script type="text/javascript">
			alert("로그인 후 이용해주세요");
			window.history.back();
		</script>
	</c:if>
</body>
</html>