<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../common/setting.jsp" %>    
<html>
<style>
	input,select {
	 border-left-width:0; 
	　border-right-width:0; 
	　border-top-width:0; 
	　border-bottom-width:1px; 
	
	  height : 40px;
	  width : 250px;
	  
	  font-size : 20px;	 	
	}
	th, td{
	width : 400px
    }
 	
    table tr{
    height : 50px;
    }
    
    table{
    border: 1px solid #f7e3e3;
    }
</style>
<body>
<form action="adminProAddPro" method = "post" enctype="multipart/form-data">
	<div align="center">
	<h1>제품 추가</h1>
	
	<table>
		<tr>
			<th>제품 이미지</th>
			<td><input type = "file" name ="p_img" id="p_img"></td>
		</tr>
		<tr>	
			<th>상품 이름</th>
			<td><input type = "text" name ="p_name" id="p_name"></td>
		</tr>
		<tr>	
			<th>사이즈</th>
			<td>
				<select size = "1" name = "p_size" id = "p_size">
					<optgroup label ="사이즈">
					  <option value = "220">220</option> 	
		              <option value = "230">230</option>
		              <option value = "240">240</option>
		              <option value = "250">250</option>
		              <option value = "260">260</option>
		              <option value = "270">270</option>
		              <option value = "280">280</option>
		              <option value = "290">290</option>
         			 </optgroup>
				</select>
			</td>
		</tr>	
		<tr>
			<th>색상</th>
			<td>
				<select size = "1" name = "p_color" id = "p_color">
					<optgroup label ="사이즈">
					  <option value = "white">white</option> 	
		              <option value = "black">black</option>
		              <option value = "red">red</option>
		              <option value = "green">green</option>
		              <option value = "blue">blue</option>
		              <option value = "yellow">yellow</option>
		              <option value = "violate">violate</option>
		              <option value = "기타">기타</option>
         			 </optgroup>
				</select>
			</td>
		</tr>
		<tr>	
			<th>현재 수량</th>
			<td><input type = "text" name ="p_count" id="p_count"></td>
		</tr>
		<tr>	
			<th>분류</th>
			<td>
				<select size = "1" name = "p_kind" id = "p_kind">
					<optgroup label ="분류">
		              <option value = "운동화">운동화</option>
		              <option value = "스포츠,레저">스포츠,레저</option>
		              <option value = "구두">구두</option>
		              <option value = "샌들">샌들</option>
		              <option value = "부츠">부츠</option>
		              <option value = "용품">용품</option>
         			 </optgroup>
				</select>
			</td>
		</tr>
		<tr>	
			<th>판매가</th>
			<td><input type = "text" name ="p_salePrice" id="p_salePrice"></td>
		</tr>
		<tr>	
			<th>입고가</th>
			<td><input type = "text" name ="p_purchaseCost" id="p_purchaseCost"></td>
		</tr>
		<tr>
			<th>제품 상세 이미지 1</th>
			<td><input type = "file" name ="p_img1" id="p_img1"></td>
		</tr>
		<tr>
			<th>제품 상세 이미지 2</th>
			<td><input type = "file" name ="p_img2" id="p_img2"></td>
		</tr>
		<tr>
			<th>제품 상세 이미지 3</th>
			<td><input type = "file" name ="p_img3" id="p_img3"></td>
		</tr>	
		<tr>
			<td colspan ="2" align = "center" id ="button">
				<input type = "submit" value="등록">
				<input type = "reset" value="취소">
			</td>
		</tr>
	</table>
	</div>
</form>
</body>
</html>