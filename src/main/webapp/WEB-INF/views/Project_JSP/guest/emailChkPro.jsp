<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../common/setting.jsp" %>  
<html>
<body>
	<c:if test="${emailCnt == 1}">
		<script type="text/javascript">
			alert("인증 완료되었습니다");
			opener.document.guest.hiddenEmail.value= "1";
			window.self.close();
		</script>
	</c:if>
	
	<c:if test="${emailCnt != 1}">
		<script type="text/javascript">
			alert("인증 번호가 틀렸습니다");
			window.history.back();
		</script>
	</c:if>
</body>
</html>