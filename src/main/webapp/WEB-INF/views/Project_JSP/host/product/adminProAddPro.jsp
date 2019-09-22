<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../common/setting.jsp" %>    
<html>
<body>
	<c:if test="${resultCnt == 1}">
		<script type="text/javascript">
			alert("상품 등록 처리 되었습니다");
			window.location="uploadfile";
		</script>
	</c:if>
	
	<c:if test="${resultCnt != 1}">
		<script type="text/javascript">
			alert("다시 시도 해주세요!");
			window.history.back();
		</script>
	</c:if>
</body>
</html>