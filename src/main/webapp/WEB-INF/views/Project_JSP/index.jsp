<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<html>
<style>
	#host th{
        weight: 500px;
	}
</style>
<body>

	<sec:authorize access="isAuthenticated()"><!-- 사용자가 인증된 경우  -->
		<sec:authentication property="name"/> 님 환영합니다!!!
	</sec:authorize>
		<div align ="center">
		<table id="host">
			<tr>
				<th colspan="2">
					<img src="/Mybatis/resources/images/main/logo.jpg">
				</th>
			</tr>
			<tr>
				<th>
					<a href="<c:url value='/hostloginForm'/>">
					<img src="/Mybatis/resources/images/icon/admin.png">
					관리자 로그인</a>
				</th>
				<th>
					<a href="<c:url value='/main'/>">
					<img src="/Mybatis/resources/images/icon/shopping.png">
					고객 메인</a>
				</th>
			</tr>
		</table>
		</div>
		<!-- 인증된 경우에만 링크 출력 -->
		<sec:authorize access="isAuthenticated()">
		<ul>
			<li><a href="<c:url value='/adminhostMain' />">관리자 페이지</a>
			<li><a href="<c:url value='/j_spring_security_logout' />">j_spring_security_logout</a></li>
		</ul>
		</sec:authorize>
</body>
</html>