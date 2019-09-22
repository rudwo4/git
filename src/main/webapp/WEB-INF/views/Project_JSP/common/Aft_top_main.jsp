<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "setting.jsp" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		margin-right: 20px;
		float: right;
		list-style-type: none;
		font-color : black;
	}
	
	#logo{
		text-align : center;
		margin-left : 260px;
	}
	/* -------- 밑에부터는 드롭메뉴바 --------- */
	.menubar{
	font-size:20px;
	}
	
	.menubar table{
	height:50px;
	list-style:none;
	margin:0 auto;
	padding:0;
	}
	
	.menubar td a{	/*메뉴 창 사이즈 및 길이 변경*/
	background: white;	/* 메뉴 바 전체 색*/
	color:black;		/* 메뉴 바 글자 색*/
	display:block;
	font-size : 20px;	/* 메뉴 바 폰트 사이즈 */
	font-weight:bold;
	line-height:50px;
	padding:0px 25px;
	text-align:center;
	text-decoration:none;
	}
	
	.menubar td a:hover, .menubar td li:hover a{/*hover시 변경*/
	background: #ff4f80;
	color:white;
	text-decoration:none;
    font-weigh : bold;
    font-size : 20px;	/* 드롭메뉴 바 폰트 사이즈 */
	}
	
	.menubar td ul{
	background: black;
	display:none; /* 평상시에는 드랍메뉴가 안보이게 하기 */
	height:auto;
	padding:0px;
	margin:0px;
	border:0px;
	position:absolute;
	width:200px;
	z-index:200;
	/*top:1em;
	/*left:0;*/
	}
	
	.menubar td:hover ul{
	display:block; /* 마우스 커서 올리면 드랍메뉴 보이게 하기 */
	}
	
	.menubar td li {
	background: #ffd8e3;
	display:block;
	float:none;
	margin:0px;
	padding:0px;
	width:200px;
	}
	
	.menubar td:hover li a{
	background:none;
	}
	
	.menubar td ul a{
	display:block;
	height:50px;
	font-size:20px;
	font-style:normal;
    color:white;
	margin:0px;
	padding:0px 10px 0px 15px;
	text-align:left;
	}
	
	.menubar td ul a:hover, .menubar td ul li:hover a{
	background: #ed1a6e;
	border:0px;
	color:#ffffff;
	text-decoration:none;
	}
	
	.menubar p{
	clear:left;
	}
</style>
</head>
<body>
<header>
		<nav>
			<ul ID="menu">
				<li><a href ="logout">로그아웃</a></li>
				<li><a href="guestMyPage">마이페이지</a></li>
				<li><a href="Aft_cust_manage">고객센터</a></li>
				<li><a href="currentOrder">주문배송</a></li>
			</ul>
		</nav>
		<br>
		<div id = "logo">
			<a href="main"><img src = "${project}/images/main/logo.jpg"></a>
		 </div>
		<hr>
<div class="menubar">
	<table>
    	<tr>
           <td><a href="runningShoes?strId=${strId}">운동화</a>
              <ul>
               <li><a href="#">컨버스화</a></li>
               <li><a href="#">슬립온</a></li>
               <li><a href="#">스니커즈</a></li>
              </ul> 
           </td>
           <td><a href="#" id="current">스포츠.레저</a>
              <ul>
               <li><a href="#">런닝화</a></li>
               <li><a href="#">등산화</a></li>
               <li><a href="#">아쿠아슈즈</a></li>
               <li><a href="#">골프화</a></li>
              </ul>
           </td>
           <td><a href="#">구두</a>
              <ul>
               <li><a href="#">옥스포드</a></li>
               <li><a href="#">로퍼</a></li>
               <li><a href="#">데크슈즈</a></li>
               <li><a href="#">플랫</a></li>
               <li><a href="#">힐</a></li>
              </ul>
           </td>
           <td><a href="#">샌들</a>
           <ul>
               <li><a href="#">플립플랍</a></li>
               <li><a href="#">슬라이드</a></li>
               <li><a href="#">스트랩샌들</a></li>
              </ul>
           </td>
           <td><a href="#">부츠</a>
           <ul>
               <li><a href="#">워크부츠</a></li>
               <li><a href="#">앵클.부티</a></li>
               <li><a href="#">레인부츠</a></li>
               <li><a href="#">털부츠</a></li>
               <li><a href="#">패딩부츠</a></li>
              </ul>
           </td>
           <td><a href="#">용품</a>
           <ul>
               <li><a href="#">양말</a></li>
               <li><a href="#">인솔</a></li>
               <li><a href="#">신발끈</a></li>
               <li><a href="#">관리용품</a></li>
               <li><a href="#">기타</a></li>
              </ul>
           </td>
       </table>    
</div>
<hr>		
</header>
</body>
</html>