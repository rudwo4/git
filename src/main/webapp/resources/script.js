/**
 * validation check
 */
	function submit_check() {
		var reg1 =/^[가-힣]{2,5}$/;
		var reg2 =/^(010|017|018|070)\d{3,4}\d{4}$/
		
		var name= document.guest.userName;
		var phone= document.guest.userPhone;
		
		var result1 = reg1.test(name.value);
		var result2 = reg2.test(phone.value);
		
		if(document.guest.passwd.value != document.guest.userrePwd.value){
			alert("비밀번호가 맞지 않습니다");
			document.guest.userrePwd.value ="";
			document.guest.userrePwd.focus();
			return false;
		}
		else if(!result1) {
			alert("이름 입력이 잘못되었습니다. 확인하세요!");
			name.value="";
			name.focus();
			return false;
		}
		else if(!result2) {
			alert("핸드폰 입력이 잘못되엇습니다. 확인하세요!");
			phone.value="";
			phone.focus();
			return false;
		}
		else if(!document.guest.gender.value){
			alert("성별을 선택 해주세요!");
			return false;
			
		}else if(document.guest.hiddenId.value==0){
			alert("아이디를 중복 확인 하세요!");
			document.guest.dupChk.focus();
			return false;
			
		}else if(document.guest.hiddenEmail.value==0){
			alert("이메일을 인증 확인 하세요!");
			document.guest.Email.focus();
			return false;
		}	
	}
	//아이디 존재 여부 확인 후 중복확인
	function confirm() {
		if(!document.guest.userid.value){
			alert("아이디를 입력해주세요");
			document.guest.userid.focus();
			return false;
		}
		var url = "confirmId?ID="+document.guest.userid.value;
		window.open(url,"confirm","menubar=no,width=500,height=200");
	}
	
	//새창에서 중복 확인
	function confirmIdCheck(){
		if(!document.confirm.userid.value){
			alert("아이디를 입력해주세요!");
			document.confirm.userid.focus();
			return false;
		}
	}
	//중복 확인 체크 창
	function setId(strId){
		opener.document.guest.userid.value=strId;
		opener.document.guest.hiddenId.value="1";
		self.close();
	}
	
	//이메일 인증 번호
	function sendEmailChk(){
		var url = "emailchk?userEmail="+document.guest.userEmail.value;
		window.open(url,"emailchk","menubar=no,width=500,height=200");
	}
	//정보 수정 창 체크
	function infoCheck(){
		if(document.guest.userPwd.value != document.guest.userrePwd.value){
			alert("비밀번호가 맞지 않습니다!");
			document.guest.userPwd.value = "";
			document.guest.userPWd.focus();
			return false;
		}
	}
	//상품 수량 변경 시 토탈 금액 책정
	var sellprice;
	var amount;

	function init () {
		sellprice = document.shoes.sellprice.value;
		amount = document.shoes.amount.value;
		document.shoes.sum.value = sellprice;
		change();
	}

	function add () {
		hm = document.shoes.amount;
		sum = document.shoes.sum;
		if(hm.value<5){
		hm.value ++ ;

		sum.value = parseInt(hm.value) * sellprice;
		}
	}

	function del () {
		hm = document.shoes.amount;
		sum = document.shoes.sum;
			if (hm.value > 1) {
				hm.value -- ;
				sum.value = parseInt(hm.value) * sellprice;
			}
	}

	function change () {
		hm = document.shoes.amount;
		sum = document.shoes.sum;

			if (hm.value < 0) {
				hm.value = 0;
			}
		sum.value = parseInt(hm.value) * sellprice;
	}
	
	function addressSearch() {
		new daum.Postcode({
			oncomplete : function(data){
				
				var fullAddr = '';
				var extraAddr = '';
				
				if(data.userSelectedType === 'R'){
					fullAddr = data.roadAddress;
				}else {
					fullAddr = data.jibunAddress;
				}
				
				if(data.userSelectedType === 'R'){
					
					if(data.bname !== ''){
						extraAddr += data.bname;
					}
					if(data.buildingName !== ''){
						extraAddr += (extraAddr !== '' ? ', ' +data.buildingName : data.buildingName);
					}
					fullAddr += (extraAddr !== '' ? ' ('+ extraAddr + ')' : '');
				}
				
				document.getElementById('sample6_postcode').value = data.zonecode;
				document.getElementById('sample6_address').value = fullAddr;
				
				document.getElementById('sample6_address2').focus();
			}
		}).open();
	}
	
	function message(){
		alert("로그인 후 이용 가능합니다");
		window.location="login";
	}
	
	//정보 수정 창 체크
	function infoCheck(){
		if(document.order.orderNum.value != document.guest.userrePwd.value){
			alert("비밀번호가 맞지 않습니다!");
			document.guest.userPwd.value = "";
			document.guest.userPWd.focus();
			return false;
		}
	}