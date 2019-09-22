<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../common/setting.jsp" %>    
<html>
<body>
	<c:if test="${NameMailCnt == 1}">
		<script type="text/javascript">
			alert("이메일에 전송되었습니다. 이메일을 통해 확인 해주세요");
			window.location="findIdPw";
		</script>
	</c:if>
	
	<c:if test="${NameMailCnt != 1}">
		<script type="text/javascript">
			alert("등록되지 않은 정보 입니다! 다시 확인 해주세요");
			window.history.back();
		</script>
	</c:if>
</body>
</html>