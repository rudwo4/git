<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../setting.jsp" %>    
<html>
<style>
#big_image {		/* 상단 초기이미지 */
		position :relative;
		float : left;
	}
	
	
	#goods_detail th{
		float : left;
		
	}
	
	#goods th{	/* 상단  정보*/
		float : left;	
		margin-left : 15px;
	}
	
	#goods td{	/* 상단 정보 */
		margin-left : 100px;
		float : right;	
	}
	
	#goodsImages{
		position : relative;
		float : left;
		display : block;
	}
	
	
	td img{
		width: 800px;
		hieght : 800px;
	}
	
	#big_image img{
		width : 300px;
		height : 300px;
	}
	
	#cart{
	   position: relative;
       vertical-align: top;
       width: 150px;
       height: 55px;
       padding: 0;
       font-size: 15px;
       color: white;
       text-align: center;
       text-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
       border: 0;
       border-bottom: 2px solid black;
       border-radius: 5px;
       cursor: pointer;
    	background : black;
        color : white;	
	}
	
	#buy{
	   position: relative;
       vertical-align: top;
       width: 150px;
       height: 55px;
       padding: 0;
       font-size: 15px;
       color: white;
       text-align: center;
       text-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
       border: 0;
       border-radius: 5px;
       cursor: pointer;
       background :red;
       color : white;	
	}
	
	section { width :960px;	padding : 20px; margin : 0 auto;}
	aside{width :960px;	padding : 20px; margin : 0 auto;}
</style>
<script type="text/javascript">
	function mySubmit(index){
		if(index == 1){
			if(${strId == null}){
				alert("로그인 후 이용 가능 한 페이지 입니다");
			}
			else{
			document.shoes.action="cartPro?p_image=${dto.p_image}&p_salePrice=${dto.p_salePrice}&strId=${strId}&p_code=${dto.p_code}&p_name=${dto.p_name}&p_color=${dto.p_color}&p_kind=${dto.p_kind}";
			}
		}
		if(index == 2){
			document.shoes.action="orderProductForm?strId=${strId}&p_code=${dto.p_code}&p_name=${dto.p_name}&p_color=${dto.p_color}&p_kind=${dto.p_kind}";
		}
		document.shoes.submit();
	}
</script>
<body onload="init();">
<form action="" method ="post" name="shoes">
<c:if test="${strId != null}">
<jsp:include page="../Aft_top_main.jsp" />
</c:if>

<c:if test="${strId == null}">
<jsp:include page="../top_main.jsp" />
</c:if>
<section>
	<br><br><br><br><br><br><br><br>
	
	<div id = big_image>
	<table>
		<tr>
			<td><img src = "${project}/pd_img/pd${dto.p_image}"></td>
		</tr>
	</table>
	</div>
	
	<div id = goods>
		<h1>${dto.p_name}</h1>
		<table>
			<tr>
				<th>판매가</th>
				<td>${dto.p_salePrice}</td>
			</tr>
			
			<tr>
				<th>상품 리뷰</th>
				<td>☆☆☆☆☆</td>
			</tr>
			
			<tr>
				<th>인기도</th>
				<td>조회수 | 판매+장바구니+관심상품</td>
			</tr>	
			
			<tr>
				<th>색상</th>
				<td>${dto.p_color}</td>
			</tr>
			
			<tr>
				<th>사이즈</th>
				<td>
				<select size = "1" id = "size" name = "size">
		          <optgroup label ="사이즈 선택">
		              <option value = "220">220</option>
		              <option value = "230">230</option>
		              <option value = "240">240</option>
		              <option value = "250">250</option>
		              <option value = "260">260</option>
		              <option value = "270">270</option>
		              <option value = "280">280</option>
		          </optgroup>
		        </select>
				</td>
			</tr>
			
			<tr>
				<th>수량<small>(최대수량 5개)</small></th>
				<td>
				<input type="hidden" name="sellprice" value="${dto.p_salePrice}">
				<input type="text" name="amount" value="1" size="3" onchange="change();">
				<input type="button" value=" + " onclick="add();">
				<input type="button" value=" - " onclick="del();">
				</td>	
			</tr>		
			<tr>
				<th>총 결제금액</th>
				<td><input type="text" name="sum" size="11" readonly></td>
			</tr>
			<tr>
				<td>
				<input type = "button" id = "cart" name ="cart" value="CART" onclick="mySubmit(1);">
				<input type = "button" id = "buy"  name = "buy" value="BUY" onclick="mySubmit(2);">
				</td>
				<td></td>
			</tr>
			
		</table>
	</div>
</section>
</form>
<aside>
	<hr>
	<div id = goodsImages>
		<table>
			<tr>
				<td><img src = "${project}pd_img/pd${dto.p_image1}"></td>
			</tr>
			<tr>	
				<td><img src = "${project}pd_img/pd${dto.p_image2}"></td>
			</tr>
			<tr>	
				<td><img src = "${project}pd_img/pd${dto.p_image3}"></td>
			</tr>
			<tr>	
				<td><img src = "${project}images/shoes/sho1-4.jpg"></td>
			</tr>
			<tr>	
				<td><img src = "${project}images/shoes/sho1-5.jpg"></td>
			</tr>
			<tr>	
				<td><img src = "${project}images/shoes/sho1-6.jpg"></td>
			</tr>
			<tr>	
				<td><img src = "${project}images/shoes/sho1-7.jpg"></td>
			</tr>
		</table>
	</div>
	<div id = "goods_detail">
		<table>
			<tr>
				<th>상품명</th>
				<td>${dto.p_name}</td>
			</tr>												
			<tr>
				<th>상품코드</th>
				<td>${dto.p_code}</td>
			</tr>		

			<tr>
				<th>제품소재</th>
				<td>[UPPER] 겉감 : 합성가죽  안감 : 폴리에스터 [SOLE] 합성고무</td>
			</tr>

			<tr>
				<th>색상</th>
				<td>${dto.p_color}</td>
			</tr>

			<tr>
				<th>사이즈</th>
				<td>220,230,240,250,260,270,280</td>
			</tr>

			<tr>
				<th>제조국</th>
				<td>베트남</td>
			</tr>

			<tr>
				<th>제조년월</th>
				<td>2019.02</td>
			</tr>

			<tr>
				<th>제조사</th>
				<td>휠라코리아㈜</td>
			</tr>

			<tr>
				<th>세탁방법 및 취급시 주의사항</th>
				<td>상세 취급방법 제품라벨 참조</td>
			</tr>

			<tr>
				<th>품질보증기준</th>
				<td>관련법 및 소비자 분쟁해결기준에 따름</td>
			</tr>

			<tr>
				<th>A/S 책임자와 전화번호</th>
				<td>휠라코리아㈜ 온라인 고객센터 1577-3472</td>
			</tr>
		</table>
	</div>
</aside>
</body>
<jsp:include page="../Common_Bot.jsp" />
</html>