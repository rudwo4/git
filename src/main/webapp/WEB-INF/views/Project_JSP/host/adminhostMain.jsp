<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>     
<html>
<style>
	    a {text-decoration:none}

        header {
            width:100%;
        }

        #content {
            width:1600px;
            margin:0 auto;
            margin-top:55px;
            overflow:hidden;
        }

        #content #main_nav {
            width:250px;
            float:left;
        }

        #content ul li {
            list-style:none;
            line-height:35px;
        }

        #content #main {
            width:1200px;
            height:800px;
            margin-left:5px;
            float:left;
        }


 	#main_nav ul li{
    	font-size : 18px;
        font-weight : bold;
    }
    
    a{
    color : gray;
    }
    
    #logout {
    	margin-right : 20px;
    }
    
   	footer {
	width: 1000px;
	height: 210px;
	margin: 20px auto 0;
	overflow: hidden;
	}
	
	footer div {
		float: left;
		height: 250px;
		border: 1px solid #cccccc;
		box-sizing: border-box;
	}
	
	footer div:first-child {
		width: 200px;
		height : 120px;
	}
	
	footer div:nth-child(2) {
		width: 800px;
		height : 120px;
	}
	.office_logo img {
		width : 190px;
		margin-top : 30px;
		margin-left : 5px;
	}
	
	footer div:last-child {
		width: 1000px;
		height: 50px;
		margin: 10px auto 0;
		background-color: #242424;
		color: black;
		text-align: center;
		line-height: 50px;
		clear: both;
		border: 0;
	}
</style>
<body>
<jsp:include page="./../common/host_top_main.jsp" />
<br><br><br><br><br><br><br><br>
    <div id="content">
        <div id="main_nav">
            <ul>
                <li>관리자 페이지</li>
                <li class = "host_page1">고객 관리
                	<ul class = "host_page2">
                		<li><a href = "adminnoticeMan" target = "host">공지사항 관리</a></li>
                		<li><a href = "adminQandAmanage" target = "host">Q&A관리</a></li>
                		<li><a href = "adminCust_inf" target = "host">회원정보</a></li>
                	</ul>
                </li>	
                <li class = "host_page1">재고관리
                	<ul class = "host_page2">
                		<li><a href = "adminproduct_view" target = "host">상품 조회 및 발주</a></li>
                		<li><a href = "adminuploadfile" target = "host">상품 추가</a></li>
                	</ul>
               	</li>
                <li class = "host_page1">주문관리
                  <ul class = "host_page2">
                    <li><a href = "adminorderChk" target = "host">결제 승인 및 취소</a></li>
                    <li><a href = "adminresult" target = "host">결산 내역</a></li>
                  </ul>
                </li>  
            </ul>
        </div>
        <div id="main">
            <div><iframe src = "adminQandAmanage" width= "100%" height ="100%" name ="host"></iframe></div>
        </div>
    </div>
<footer>
	<jsp:include page="../common/Common_Bot.jsp" />	
</footer>
</body>
</html>