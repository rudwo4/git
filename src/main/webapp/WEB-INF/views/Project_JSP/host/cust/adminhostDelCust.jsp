<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../common/setting.jsp" %>    
<html>
<body>
	<c:if test="${delCnt == 1 }">
		<script type="text/javascript">
			alert("회원 삭제 완료 되었습니다");
			window.location="Cust_inf.do";
		</script>
	</c:if>
	
	<c:if test="${delCnt != 1 }">
		<script type="text/javascript">
			alert("작업이 취소되었습니다");
			window.history.back();
		</script>
	</c:if>
</body>
</html>