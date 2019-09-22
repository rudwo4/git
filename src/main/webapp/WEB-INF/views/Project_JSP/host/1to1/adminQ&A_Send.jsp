<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = ../../common/setting.jsp" %>
<html>
<body>
	<h2>답글 전송</h2>
	
	<c:if test="${sendCnt == 1}">
		<script type="text/javascript">
			alert("답글 전송이 완료 되었습니다");
			window.location="Q&A_manage.do?pageNum=${pageNum}"
		</script>
	</c:if>
	
	<c:if test="${sendCnt != 1}">
		<script type="text/javascript">
			alert("작업이 취소 되었습니다!");
			window.history.back();
		</script>
	</c:if>
</body>
</html>