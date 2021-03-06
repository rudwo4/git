<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible">
<meta name="viewport"
   content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="${project}images/favicon.ico">

    <title>EZ Stock - Members Profile</title>

<script src="/stock/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">


function send(){
      var pwd = $("#pwd").val();//입력한 키워드 가져옴
      
      if(pwd.length == 0) { //글자수가 0인경우
         $("#result").css("visibility", "hidden"); //숨김
      } else {
         $("#inputPwd").css("visibility", "hidden"); 
         $("#result").css("visibility", "visible");//보임

         $.ajax({
            url:"${pageContext.request.contextPath}/user/modify", //{컨트롤러}/이동페이지
            type: "get",
            data: "pwd=" + pwd,
            success: function(e) {
               console.log(e);
               $("#result").html(e);
            },
            error: function(request, status, error) {
                alert("비밀번호가 일치하지 않습니다.");
            }
         });
      }
   };
   
   
   
</script>
</head>
<body class="hold-transition skin-black sidebar-mini">


<!-- Site wrapper -->
<div class="wrapper">
  <header class="main-header">
    <%@ include file="../include/main_header.jsp" %>
  </header>
  
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <%@ include file="../stock/side_menu.jsp" %>
  </aside>
  <!-- ================== main content ============================= -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
           My Page - 마이페이지
      </h1>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="breadcrumb-item"><a href="#">Members</a></li>
        <li class="breadcrumb-item active">Members Profile</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

   <div class="box box-inverse box-dark bg-hexagons-white">
        <div class="box-body">
         <div class="row">
            <div class="col-md-3 col-12">
                <div class="text-center">
                        <h1 class="text-bold count">325</h1>
                        <hr class="w-50 my-5 b-3 border-yellow">
                        <h5 class="mt-10">24시간 이내 최근 거래내역</h5>
                    </div>
            </div>
            <div class="col-md-3 col-12">
                <div class="text-center">
                        <h1 class="text-bold count">40</h1>
                        <hr class="w-50 my-5 b-3 border-yellow">
                        <h5 class="mt-10">시간당 거래수</h5>
                    </div>
            </div>
            <div class="col-md-3 col-12">
                <div class="text-center">
                        <h1 class="text-bold count">150</h1>
                        <hr class="w-50 my-5 b-3 border-yellow">
                        <h5 class="mt-10">가장 최근거래들</h5>
                    </div>
            </div>
            <div class="col-md-3 col-12">
                <div class="text-center">
                        <h1 class="text-bold count">8</h1>
                        <hr class="w-50 my-5 b-3 border-yellow">
                        <h5 class="mt-10">년 활동수</h5>
                    </div>
            </div>
         </div>
        </div>
        <!-- /.box-body -->
      </div>


   <!-- 회원정보칸 -->
      <div class="row">
        <div class="col-xl-4 col-lg-5">

          <!-- Profile Image -->
          <div class="box bg-yellow bg-deathstar-dark" style="color:black;">
            <div class="box-body box-profile" style="color:black;">

              <h2 class="profile-username text-center mb-0"> ${pageContext.request.userPrincipal.name} 님! </h2>
            
              <div class="row">
            <div class="col-12">
               <div class="media-list media-list-hover media-list-divided w-p100 mt-30">
                  <h4 class="media media-single p-15">
                    <span class="title">내 계좌 000-1111-22222 </span>
                  </h4>
                  <h4 class="media media-single p-15">
                    <i class="fa fa-arrow-circle-o-right mr-10"></i><span class="title">계좌정보확인</span>
                  </h4>

                  <h4 class="media media-single p-15">
                  <a href="interestedItems" style="text-decoration:none; color:black;">
                    <i class="fa fa-arrow-circle-o-right mr-10"></i><span class="title"> 관심종목</span>
                  </a>
                  </h4>

                  
                  <h4 class="media media-single p-15">
                    <i class="fa fa-arrow-circle-o-right mr-10"></i><span class="title">성과분석</span>
                  </h4>
                  
               </div>
            </div>
            
            <h2 class="title w-p100 mt-10 mb-0 p-20">미체결 내역</h2>
            <div class="col-12" style="height:400px; overflow:auto;">
            
            
        	    <div class="media-list media-list-hover w-p100 mt-0">
            
            	<c:forEach var="dto" items="${stockall}">

            			<!-- 매수  buy -->
            			<c:if test="${dto.bs_sort eq '0'.charAt(0)}"> 
            			
            			<h5 class="media media-single py-10 px-0 w-p100 justify-content-between">
	                       <p>
		                       <i class="fa fa-circle text-red pr-10 font-size-12"></i>${dto.stockcode} ${dto.stockname}
		                       <span class="subtitle pl-20 mt-10 text-red">${dto.bs_date}</span>                    
	                       </p>
	                       <p class="text-right pull-right"><span class="badge badge-sm badge-danger mb-10">buy</span><br>${dto.price}</p>
                 	 	</h5>
                 	 	
            			</c:if>
            			
            			<!-- 매도 sell -->
            			<c:if test="${dto.bs_sort eq '1'.charAt(0)}"> <!-- char 형은 ""스트링을 char형으로 바꾸어야 한다.  -->
            			
          			    <h5 class="media media-single py-10 px-0 w-p100 justify-content-between">
	                       <p>
		                       <i class="fa fa-circle text-success pr-10 font-size-12"></i>${dto.stockcode} ${dto.stockname}
		                       <span class="subtitle pl-20 mt-10 text-success">${dto.bs_date}</span>                    
	                       </p>
	                       <p class="text-right pull-right"><span class="badge badge-sm badge-success mb-10">sell</span><br>${dto.price}</p>
                 	 	</h5>
            			
            			 </c:if> 
            		
            	</c:forEach>
            
              		 </div>
              		 
           		 </div>  <!-- col- 12 -->
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        
        
       <!--  <div class="col-xl-8 col-lg-7"> -->
       <div class="col-lg-8 col-12">
          <div class="box box-solid bg-black">
         
         
         <!-- 시작  -->
         
         <!-- <div class="col-lg-9 col-12"> -->
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              
              <li><a href="#timeline" data-toggle="tab" class="active show">보유주식현황(등락률 그래프 등)</a></li>
              <li><a href="#activity" data-toggle="tab" class="">거래내용 종합</a></li>
              <li><a href="#settings" data-toggle="tab" class="">회원정보 수정</a></li>
            </ul>
                        
            <div class="tab-content">
             
             <div class="tab-pane active show" id="timeline">
             
                <!-- 보유주식현황 표  -->
                   <div class="box-body">
               <div class="table-responsive">
                  <table class="table no-margin table-hover">
                    <thead>               
                     <tr class="bg-dark">
                       <th class="text-yellow">Transaction Hash</th>
                       <th class="text-yellow">BTC</th>
                       <th class="text-yellow">Time</th>
                       <th class="text-yellow">Miner Preference</th>
                       <th class="text-yellow">Status</th>
                     </tr>
                    </thead>
                    <tbody>
                     <tr>
                       <td>
                        <a href="#" class="text-yellow hover-warning">
                          7d2c7b06afa0
                        </a>
                        ...
                       </td>
                       <td>1.0126281 BTC</td>
                       <td>
                        <time class="timeago" datetime="2018-02-01T13:38:01Z" title="2018-02-01 13:38 GMT">2 minutes ago</time>
                       </td>
                       <td>medium</td>
                       <td><span class="label label-success">Confirmed</span></td>
                     </tr>
                     <tr>
                       <td>
                        <a href="#" class="text-yellow hover-warning">
                          5de67405bfc6
                        </a>
                        ...
                       </td>
                       <td>0.10522881 BTC</td>
                       <td>
                        <time class="timeago" datetime="2018-02-01T13:38:01Z" title="2018-02-01 13:38 GMT">2 minutes ago</time>
                       </td>
                       <td>high</td>
                       <td><span class="label label-warning">Unconfirmed</span></td>
                     </tr>
                     <tr>
                       <td>
                        <a href="#" class="text-yellow hover-warning">
                          583de1b0cec
                        </a>
                        ...
                       </td>
                       <td>0.40622033 BTC</td>
                       <td>
                        <time class="timeago" datetime="2018-02-01T13:38:01Z" title="2018-02-01 13:38 GMT">2 minutes ago</time>
                       </td>
                       <td>high</td>
                       <td><span class="label label-success">Confirmed</span></td>
                     </tr>
                     <tr>
                       <td>
                        <a href="#" class="text-yellow hover-warning">
                          5493bcfa5f7f
                        </a>
                        ...
                       </td>
                       <td>4.43670578 BTC</td>
                       <td>
                        <time class="timeago" datetime="2018-02-01T13:38:00Z" title="2018-02-01 13:38 GMT">2 minutes ago</time>
                       </td>
                       <td>high</td>
                       <td><span class="label label-danger">Canceled</span></td>
                     </tr>
                     <tr>
                       <td>
                        <a href="#" class="text-yellow hover-warning">
                          4d66087926b5
                        </a>
                        ...
                       </td>
                       <td>22.01099978 BTC</td>
                       <td>
                        <time class="timeago" datetime="2018-02-01T13:38:00Z" title="2018-02-01 13:38 GMT">2 minutes ago</time>
                       </td>
                       <td>high</td>
                       <td><span class="label label-danger">Canceled</span></td>
                     </tr>
                     <tr>
                       <td>
                        <a href="#" class="text-yellow hover-warning">
                          60935e53c894
                        </a>
                        ...
                       </td>
                       <td>0.0024534 BTC</td>
                       <td>
                        <time class="timeago" datetime="2018-02-01T13:38:00Z" title="2018-02-01 13:38 GMT">2 minutes ago</time>
                       </td>
                       <td>high</td>
                       <td><span class="label label-warning">Unconfirmed</span></td>
                     </tr>
                     <tr>
                       <td>
                        <a href="#" class="text-yellow hover-warning">
                          b1236b76cf5e
                        </a>
                        ...
                       </td>
                       <td>0.00518486 BTC</td>
                       <td>
                        <time class="timeago" datetime="2018-02-01T13:37:59Z" title="2018-02-01 13:37 GMT">2 minutes ago</time>
                       </td>
                       <td>medium</td>
                       <td><span class="label label-success">Confirmed</span></td>
                     </tr>
                     <tr>
                       <td>
                        <a href="#" class="text-yellow hover-warning">
                          d0125cb78c078
                        </a>
                        ...
                       </td>
                       <td>0.08039395 BTC</td>

                       <td>
                        <time class="timeago" datetime="2018-02-01T13:37:59Z" title="2018-02-01 13:37 GMT">2 minutes ago</time>
                       </td>
                       <td>high</td>
                       <td><span class="label label-success">Confirmed</span></td>
                     </tr>
                     <tr>
                       <td>
                        <a href="#" class="text-yellow hover-warning">
                          b6b591254835c
                        </a>
                        ...
                       </td>
                       <td>55.99698306 BTC</td>
                       <td>
                        <time class="timeago" datetime="2018-02-01T13:37:58Z" title="2018-02-01 13:37 GMT">2 minutes ago</time>
                       </td>
                       <td>high</td>
                       <td><span class="label label-success">Confirmed</span></td>
                     </tr>
                     <tr>
                       <td>
                        <a href="#" class="text-yellow hover-warning">
                          d261fb1d717d
                        </a>
                        ...
                       </td>
                       <td>0.0281818 BTC</td>
                       <td>
                        <time class="timeago" datetime="2018-02-01T13:37:58Z" title="2018-02-01 13:37 GMT">2 minutes ago</time>
                       </td>
                       <td>high</td>
                       <td><span class="label label-danger">Canceled</span></td>
                     </tr>
                    </tbody>
                  </table>
               </div>
            </div>
                <!-- 거래 표 끝  -->
             
                 <!-- 그래프  -->
                 <div class="box-body chart-responsive">
              <div class="chart" id="revenue-chart" style="height: 300px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
              <svg height="300" version="1.1" width="766" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="overflow: hidden; position: relative; top: -0.5px;"><desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.2.0</desc><defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs><text x="32.734375" y="259" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">0</tspan></text><path fill="none" stroke="#aaaaaa" d="M45.234375,259H741.5" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="32.734375" y="200.5" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">50</tspan></text><path fill="none" stroke="#aaaaaa" d="M45.234375,200.5H741.5" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="32.734375" y="142" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">100</tspan></text><path fill="none" stroke="#aaaaaa" d="M45.234375,142H741.5" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="32.734375" y="83.5" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">150</tspan></text><path fill="none" stroke="#aaaaaa" d="M45.234375,83.5H741.5" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="32.734375" y="25" text-anchor="end" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">200</tspan></text><path fill="none" stroke="#aaaaaa" d="M45.234375,25H741.5" stroke-width="0.5" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><text x="741.5" y="271.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2012</tspan></text><text x="625.5086932336833" y="271.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2011</tspan></text><text x="509.51738646736646" y="271.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2010</tspan></text><text x="393.52607970104975" y="271.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2009</tspan></text><text x="277.21698853263354" y="271.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2008</tspan></text><text x="161.22568176631677" y="271.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2007</tspan></text><text x="45.234375" y="271.5" text-anchor="middle" font-family="sans-serif" font-size="12px" stroke="none" fill="#888888" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;" font-weight="normal" transform="matrix(1,0,0,1,0,8)"><tspan dy="4" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2006</tspan></text><path fill="#f3bdd0" stroke="none" d="M45.234375,36.70000000000002C74.23220169157919,51.32500000000002,132.2278550747376,80.57500000000002,161.22568176631677,95.20000000000002C190.22350845789595,109.82500000000002,248.21916184105436,153.7,277.21698853263354,153.7C306.2942613247376,153.7,364.4488069089457,95.20000000000002,393.52607970104975,95.20000000000002C422.52390639262893,95.20000000000002,480.5195597757873,153.7,509.51738646736646,153.7C538.5152131589457,153.7,596.510866542104,109.82500000000002,625.5086932336833,95.20000000000002C654.5065199252624,80.57500000000003,712.5021733084209,51.32500000000002,741.5,36.70000000000002L741.5,259L45.234375,259Z" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></path><path fill="none" stroke="#f96197" d="M45.234375,36.70000000000002C74.23220169157919,51.32500000000002,132.2278550747376,80.57500000000002,161.22568176631677,95.20000000000002C190.22350845789595,109.82500000000002,248.21916184105436,153.7,277.21698853263354,153.7C306.2942613247376,153.7,364.4488069089457,95.20000000000002,393.52607970104975,95.20000000000002C422.52390639262893,95.20000000000002,480.5195597757873,153.7,509.51738646736646,153.7C538.5152131589457,153.7,596.510866542104,109.82500000000002,625.5086932336833,95.20000000000002C654.5065199252624,80.57500000000003,712.5021733084209,51.32500000000002,741.5,36.70000000000002" stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><circle cx="45.234375" cy="36.70000000000002" r="4" fill="#f96197" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="161.22568176631677" cy="95.20000000000002" r="4" fill="#f96197" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="277.21698853263354" cy="153.7" r="4" fill="#f96197" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="393.52607970104975" cy="95.20000000000002" r="4" fill="#f96197" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="509.51738646736646" cy="153.7" r="4" fill="#f96197" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="625.5086932336833" cy="95.20000000000002" r="4" fill="#f96197" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="741.5" cy="36.70000000000002" r="4" fill="#f96197" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><path fill="#50b6e4" stroke="none" d="M45.234375,142C74.23220169157919,149.3125,132.2278550747376,163.9375,161.22568176631677,171.25C190.22350845789595,178.5625,248.21916184105436,200.5,277.21698853263354,200.5C306.2942613247376,200.5,364.4488069089457,171.25,393.52607970104975,171.25C422.52390639262893,171.25,480.5195597757873,200.5,509.51738646736646,200.5C538.5152131589457,200.5,596.510866542104,178.5625,625.5086932336833,171.25C654.5065199252624,163.9375,712.5021733084209,149.3125,741.5,142L741.5,259L45.234375,259Z" fill-opacity="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></path><path fill="none" stroke="#03a9f3" d="M45.234375,142C74.23220169157919,149.3125,132.2278550747376,163.9375,161.22568176631677,171.25C190.22350845789595,178.5625,248.21916184105436,200.5,277.21698853263354,200.5C306.2942613247376,200.5,364.4488069089457,171.25,393.52607970104975,171.25C422.52390639262893,171.25,480.5195597757873,200.5,509.51738646736646,200.5C538.5152131589457,200.5,596.510866542104,178.5625,625.5086932336833,171.25C654.5065199252624,163.9375,712.5021733084209,149.3125,741.5,142" stroke-width="3" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><circle cx="45.234375" cy="142" r="4" fill="#03a9f3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="161.22568176631677" cy="171.25" r="4" fill="#03a9f3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="277.21698853263354" cy="200.5" r="4" fill="#03a9f3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="393.52607970104975" cy="171.25" r="4" fill="#03a9f3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="509.51738646736646" cy="200.5" r="4" fill="#03a9f3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="625.5086932336833" cy="171.25" r="4" fill="#03a9f3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle><circle cx="741.5" cy="142" r="4" fill="#03a9f3" stroke="#ffffff" stroke-width="1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle></svg><div class="morris-hover morris-default-style" style="left: 0px; top: 53px; display: none;"><div class="morris-hover-row-label">2006</div><div class="morris-hover-point" style="color: #03a9f3">
           Individual Score:
           100
         </div><div class="morris-hover-point" style="color: #f96197">
           Team Score:
           90
         </div></div></div>
            </div>
              
            
                <!-- 그래프 끝  -->
                
                
              </div>    
              <!-- /.tab-pane -->
              
              <div class="tab-pane" id="activity">
                <!-- 거래 종합   -->
                
                <div class="box-body">
               <div class="table-responsive">
                  <table class="table no-margin no-border b-1 border-gray bg-dark">
                    <thead>
                     <tr class="bg-yellow">
                       <th>거래 카테고리</th>
                       <th>수량</th>
                       <th>종목코드</th>
                       <th>1주 금액</th>
                       <th>총 금액 </th>
                       <th>일자</th>
                     </tr>
                    </thead>
                    <tbody>
                     
                    <c:if test="${completedCnt > 0}">
                    
                     <c:forEach var="dto2" items="${stockCompleted}">
	                     <tr>
	                       <td>
	                       	<c:if test="${dto2.c_category eq '1'.charAt(0)}">
		                        <a href="#" class="text-yellow">BUY</a>
	                       	</c:if>
                     		<c:if test="${dto2.c_category eq '0'.charAt(0)}">
		                        <a href="#" class="text-yellow">SELL</a>
	                       	</c:if>
	                       </td>
	                       <td>${dto2.c_num}주</td>
	                       <td>${dto2.stockcode}</td>
	                       <td><fmt:formatNumber value="${dto2.c_price}" pattern="#,###" />원</td>
	                       <td><fmt:formatNumber value="${dto2.c_total}" pattern="#,###" />원</td>
	                       <td><fmt:formatDate value="${dto2.c_date}" pattern="YYYY-MM-dd HH:SS"/></td>
	                     </tr>
                     </c:forEach>
                    
                    </c:if> 
                     
                    <c:if test="${completedCnt <= 0}">
                    	
                    	<td colspan="6"> 완료된 거래내역이 없습니다. </td>
                    	
                    </c:if> 

                      
                    </tbody>
                  </table>
               </div>
            </div>
          
                <!-- 최근거래 끝  -->
               
              </div>
              <!-- /.tab-pane -->
              
              
              
              <!-- 회원 정보 변경  -->
               <div class="tab-pane" id="settings">
              
                    
                    <!-- 회원정보출력 -->
                    <div id="result">

   
                    <div id="inputPwd">
                     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                      <div class="form-group row">
                            <label for="inputName" class="col-sm-2 control-label">비밀번호 입력</label>
   
                            <div class="col-sm-10">
                              <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호 입력"  autofocus>
                            </div>
                     </div>
                       <div class="ml-auto col-sm-10">
                           <input type="button" class="btn btn-success" id="submit" onclick="send();" value="확인">
                         </div>
                      </div>   
                      
                  </div>
                  
               </div> <!-- /.tab-pane : 회원정보 변경  -->
               
               
              
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
         
         
		</div>
        <!-- /.row -->
         
         <!-- 끝  -->

        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
 
   
	<footer class="main-footer">
		<%@ include file="../include/main_footer.jsp" %>
	</footer>
  <!-- /.control-sidebar -->
  
  <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->


   <!-- jQuery 3 -->
   <script src="${project}assets/vendor_components/jquery/dist/jquery.min.js"></script>
   
   <!-- popper -->
   <script src="${project}assets/vendor_components/popper/dist/popper.min.js"></script>
   
   <!-- Bootstrap 4.0-->
   <script src="${project}assets/vendor_components/bootstrap/dist/js/bootstrap.min.js"></script>
   
   <!-- SlimScroll -->
   <script src="${project}assets/vendor_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
   
   <!-- FastClick -->
   <script src="${project}assets/vendor_components/fastclick/lib/fastclick.js"></script>
   
   
   <!-- Crypto_Admin App -->
   <script src="${project}js/template.js"></script>
   
   <!-- Crypto_Admin for demo purposes -->
   <script src="${project}js/demo.js"></script>
   
   <!-- Chartist  -->
   <script src="${project}assets/vendor_components/chartist-js-develop/chartist.min.js"></script>
   <script src="${project}js/pages/widget-chartist.js"></script>
   

</body>

</html>