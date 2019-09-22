<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../common/setting.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    ul,li{list-style:none;}
    .slide{height:700px;overflow:hidden;}
    .slide ul{width:calc(100% * 4);display:flex;animation:slide 8s infinite;} /* slide를 8초동안 진행하며 무한반복 함 */
    .slide li{width:calc(100% / 4);height:300px;}
    @keyframes slide {
      0% {margin-left:0;} /* 0 ~ 10  : 정지 */
      10% {margin-left:0;} /* 10 ~ 25 : 변이 */
      25% {margin-left:-100%;} /* 25 ~ 35 : 정지 */
      35% {margin-left:-100%;} /* 35 ~ 50 : 변이 */
      50% {margin-left:-200%;}
      60% {margin-left:-200%;}
      75% {margin-left:-300%;}
      85% {margin-left:-300%;}
      100% {margin-left:0;}
    }
    .slide img {
    	width : 100%;
    }

	section {	
		text-align: center;
	}
	
	#top table {
		display: inline-block;
		margin: 20px;
	}
	
	#mid table {
		display: inline-block;
		margin: 20px;
	}
	
	#bot table {
		display: inline-block;
		margin: 20px;
	}
	
	table tr td img {	/* 사진 이미지 */
		width: 200px;
		height: 200px;
	}
	
	#add {
		position : relative;
		float:left;
	}
	
	#youtube {
		float:left;
		margin-left: 20px;
	}
	
	aside {
		height : 400px;
		margin : 0 auto;
		width : 1150px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/top_main.jsp" />
	<br><br><br><br><br><br><br><br>
	<section>
		<article>
			<div class="slide">
			    <ul>
			      <li><img src = "${project}/images/main/main1.jpg"></li>
			      <li><img src = "${project}/images/main/main2.jpg"></li>
			      <li><img src = "${project}/images/main/main3.jpg"></li>
			      <li><img src = "${project}/images/main/main4.jpg"></li>
			    </ul>
			  </div>
		</article>
	</section>
	<section>
		<div id="top">
			<table>
				<tr>
					<td><a href ="<c:url value='/index.jsp' />"><img src="${project}/images/shoes/main1_BEG.jpg"></a></td>
				</tr>
				<tr>
					<td>남녀공용<br> 레이 런 스크립트<br> 69,000원
					</td>
				</tr>
			</table>

			<table>
				<tr>
					<td><img src="${project}/images/shoes/main2_BEG.jpg"></td>
				</tr>
				<tr>
					<td>남녀공용<br> ItShoe 레이 스크립트<br> 59,000원
					</td>
				</tr>
			</table>

			<table>
				<tr>
					<td><img src="${project}/images/shoes/main3_BEG.jpg"></td>
				</tr>
				<tr>
					<td>남녀공용<br> ItShoe 레인져 스크립트<br> 49,000원
					</td>
				</tr>
			</table>

			<table>
				<tr>
					<td><img src="${project}/images/shoes/main3_BEG.jpg"></td>
				</tr>
				<tr>
					<td>남녀공용<br> 오크먼트 TR<br> 69,000원
					</td>
				</tr>
			</table>
		</div>

		<div id="mid">
			<table>
				<tr>
					<td><img src="${project}/images/shoes/main3.jpg"></td>
				</tr>
				<tr>
					<td>남녀공용<br> 오크먼트 TR<br> 69,000원
					</td>
				</tr>


			</table>

			<table>
				<tr>
					<td><img src="${project}/images/shoes/main4.jpg"></td>
				</tr>
				<tr>
					<td>남녀공용<br> 오크먼트 TR<br> 69,000원
					</td>
				</tr>
			</table>

			<table>
				<tr>
					<td><img src="${project}/images/shoes/main5.jpg"></td>
				</tr>
				<tr>
					<td>남녀공용<br> ItShoe 바리케이드엑스티 97<br> 69,000원
					</td>
				</tr>

				<table>
					<tr>
						<td><img src="${project}/images/shoes/main3_BEG.jpg"></td>
					</tr>
					<tr>
						<td>남녀공용<br> 디스럽터3<br> 69,000원
						</td>
					</tr>
				</table>
			</table>
		</div>

		<div id="bot">
			<table>
				<tr>
					<td><img src="${project}/images/shoes/main6.jpg"></td>
				</tr>
				<tr>
					<td>남녀공용<br> 오크먼트 TR<br> 69,000원
					</td>
				</tr>
			</table>

			<table>
				<tr>
					<td><img src="${project}/images/shoes/main7.jpg"></td>
				</tr>
				<tr>
					<td>남녀공용<br> 오크먼트 TR<br> 69,000원
					</td>
				</tr>
			</table>

			<table>
				<tr>
					<td><img src="${project}/images/shoes/main8.jpg"></td>
				</tr>
				<tr>
					<td>남녀공용<br> 오크먼트 TR<br> 69,000원
					</td>
				</tr>

				<table>
					<tr>
						<td><img src="${project}/images/shoes/main3_BEG.jpg"></td>
					</tr>
					<tr>
						<td>남녀공용<br> 오크먼트 TR<br> 69,000원
						</td>
					</tr>
				</table>
			</table>
		</div>
	</section>
	<aside>
		<table id = "add">
			<tr>
				<td><img src="${project}/images/main/main-bot1.gif"></td>
				<td><img src="${project}/images/main/main-bot2.gif"></td>
			</tr>
			<tr>
				<td><img src="${project}/images/main/main-bot3.gif"></td>
				<td><img src="${project}/images/main/main-bot4.gif"></td>
			</tr>
		</table>	
		<iframe id= "youtube" width="700" height="394" src="https://www.youtube.com/embed/Ww9GIKxCpKE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</aside>
	<jsp:include page="../common/Common_Bot.jsp" />
</body>
</html>

