<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>         
<html>
<title>상단 메인</title>
<style>
header {
		width: 100%;
		position: fixed ;
		top:0px;
		z-index: 99;
		background: white;
		align : center;
	}
	
	nav ul li {
		display: inline-block;
		align : center;
	}
	
	a {
		text-decoration: none;
		color:black;
	}
	
	#menu {
		margin-right: 90px;
		float: right;
		list-style-type: none;
		font-color : black;
	}
	
	#logo{
		text-align : center;
	}
</style>
</head>
<body>
<header>
		<br>
		<div id = "logo"><img src = "/Mybatis/resources/images/main/logo.jpg"></div>
		<nav>
			<ul ID="menu">
				<li><h3><sec:authentication property="name"/>님 환영합니다 / </h3></li>
				
				<li><a href="j_spring_security_logout"> 로그아웃</a></li>
			</ul>
		</nav>
</header>
</body>
</html>