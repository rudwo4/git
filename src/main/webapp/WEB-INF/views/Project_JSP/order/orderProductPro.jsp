<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../common/setting.jsp" %>        
<html>
<body>
	<c:if test="${orderCnt == 1 }">
		<c:if test="${strId != null}">
			<script type="text/javascript">
				alert("결제 완료 되었습니다");
				window.location="logAftMain.do";
			</script>
		</c:if>
		
		<c:if test="${strId == null}">
			<script type="text/javascript">
				alert("결제 완료 되었습니다");
				window.location="main.do";
		</script>
		</c:if>
	</c:if>
	
	<c:if test="${cartCnt != 1 }">
		<script type="text/javascript">
			alert("결제 취소 되었습니다.");
			window.history.back();
		</script>
	</c:if>
</body>
</html>