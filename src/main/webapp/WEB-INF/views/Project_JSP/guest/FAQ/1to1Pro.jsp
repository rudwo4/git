<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../common/setting.jsp" %>    
<html>
<body>
	<c:if test="${sendCnt == 1}">
		<script type="text/javascript">
			alert("1:1문의 전송 되었습니다");
			window.location="1to1Main";
		</script>
	</c:if>
	
	<c:if test="${sendCnt != 1}">
		<script type="text/javascript">
			alert("로그인 후 이용가능합니다!");
			window.history.back();
		</script>
	</c:if>
</body>
</html>