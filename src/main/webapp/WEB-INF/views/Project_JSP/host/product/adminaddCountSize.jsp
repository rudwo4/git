<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../common/setting.jsp" %>    
<html>
<body>
	<c:if test="${cnt == 1}">
		<script type="text/javascript">
			alert("발주 처리 되었습니다");
			window.location="adminproduct_view.do";
		</script>
	</c:if>
	
	<c:if test="${cnt != 1}">
		<script type="text/javascript">
			alert("다시 시도 해주세요!");
			window.history.back();
		</script>
	</c:if>
</body>
</html>