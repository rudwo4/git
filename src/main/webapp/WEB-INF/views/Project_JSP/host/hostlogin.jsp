<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "./../common/setting.jsp" %>    
<html>
<body>
	<c:if test="${loginCnt == 0}">
		<script type="text/javascript">
			alert("아이디를 확인해주세요!");
			window.history.back();
		</script>
	</c:if>
	
	<c:if test="${loginCnt == 1}">
		<script type="text/javascript">
			alert('${strId}' + "님 환영 합니다!");
			window.location="hostMain?strId=${strId}";
		</script>
	</c:if>
	
	<c:if test="${loginCnt == 2}">
		<script type="text/javascript">
			alert("비밀번호를 확인해주세요!");
			window.history.back();
		</script>
	</c:if>
</body>
</html>