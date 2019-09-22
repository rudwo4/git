<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../common/setting.jsp" %>
<html>
<body>
	<h2>삭제 완료 되었습니다</h2>
	
	<c:if test="${deleteCnt == 1}">
		<script type="text/javascript">
			alert("삭제 완료 되었습니다");
			window.location="adminnoticeMan?pageNum=${pageNum}"
		</script>
	</c:if>
	
	<c:if test="${deleteCnt != 1}">
		<script type="text/javascript">
			alert("작업이 취소 되었습니다!");
			window.history.back();
		</script>
	</c:if>
</body>
</html>