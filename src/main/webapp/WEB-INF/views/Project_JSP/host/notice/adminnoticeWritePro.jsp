<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../../common/setting.jsp" %>    
<html>
<body>
	<h2> 공지사항 작성 처리 </h2>
	<c:if test="${insertCnt ==1}">
		<script type="text/javascript">
			alert("공지사항이 작성 되었습니다");
			window.location="adminnoticeMan?pageNum=${pageNum}";
		</script>
	</c:if>
	
	<c:if test="${insertCnt !=1}">
		<script type="text/javascript">
			alert("작성 실패했습니다");
			window.history.back();
		</script>
	</c:if>
</body>
</html>