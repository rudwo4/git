<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.io.*"%>

<%@ include file = "../common/setting.jsp" %>
<html>
<body>

	<c:if test="${guestCnt == 0}">
		<script type="text/javascript">
			alert("가입 실패했습니다. 다시 확인 해주세요");
			window.history.back();
		</script>
	</c:if>
	
	<c:if test="${guestCnt != 0}">
		<script type="text/javascript">
			alert("회원가입에 축하합니다!");
			window.location="main.do";
		</script>
	</c:if>
	
	
</body>
</html>