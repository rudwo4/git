<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
	a { text-decoration : none;
		color : black;
		}
	tr td {
		padding : 0px 60px;
		font-size : 15px;
		border-bottom : 2px inset gray;
		height : 50px;
	}
</style>
</head>
<body>
<div align = "center">
	<table>
		<tr>
			<td><a href = "faq_guest.do" target = "FAQ"> 회원 가입/변경/탈퇴 </a></td>
			<td><a href = "faq_as.do" target = "FAQ" > 취소/교환/반품/AS </a></td>
			<td><a href = "faq_order.do" target = "FAQ"> 주문/결제 </a></td>
			<td><a href = "faq_delivery.do" target = "FAQ"> 배송관련 </a></td>
			<td><a href = "faq_membership.do" target = "FAQ"> 멤버쉽 </a></td>
		</tr>
	</table>
</div>
	
	<iframe src = "faq_guest.do" width = "1000" height ="500px" name ="FAQ" frameborder = "0"></iframe>
</body>
</html>