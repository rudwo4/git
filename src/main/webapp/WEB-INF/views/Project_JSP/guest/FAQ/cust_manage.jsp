<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../common/setting.jsp" %>    
<html>
<style>
a { text-decoration : none;
		color : black;}
	#FAQ tr td {
		padding : 0px 60px;
		font-size : 25px;
		border : 2px solid gray;
		height : 50px;
	}
</style>
<jsp:include page="../../common/top_main.jsp" />
<body>
<br><br><br><br><br><br><br><br><br><br><br>
	<section>
		<article>
			<div align = "center">
			<table id = "FAQ">
				<tr>
					<td><span><a href = "center.do" target = "cust"> 고객센터 </a></span></td>
					<td><span><a href = "cust_notice.do" target = "cust" > 공지사항 </a></span></td>
					<td><span><a href = "1to1Main.do" target = "cust"> 1대1 문의 </a></span></td>
					<td><span><a href = "asCenter.do" target = "cust"> A/S 안내조회 </a></span></td>
					<td><span><a href = "faq.do" target = "cust">FAQ</a></span></td>
				</tr>
			</table>
			</div>
		</article>
		<br><br>
		<article>
			<div align = "center">
				<iframe src = "cust_notice.do" width = "1200" height ="800" name ="cust" frameborder = "0"></iframe>
			</div>
		</article>
	</section>
</body>
<jsp:include page="../../common/Common_Bot.jsp" />
</html>