<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %> 
<c:set var="path" value ="${pageContext.request.contextPath}" />   
<!DOCTYPE html>
<html>
<head>


<!-- 3초 지나면 해당 url 즉 home으로 이동 -->
<meta http-equiv="refresh" content="3, ${path}">
<title>Insert title here</title>
</head>
<body>
	<p>${errMsg}</p>
</body>
</html>