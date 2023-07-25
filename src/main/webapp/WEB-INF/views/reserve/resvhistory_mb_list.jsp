<%@page import="multi.com.pet.resv.ResvDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html class="no-js" lang="ko">
    <head>
        <meta charset="utf-8">
        <title>resvhistory mb list</title>
        <style>
            .form_radio_btn {
			 width: 200px; 
            display: inline-block;
			height : 70px;
    		border: 1px solid #EAE7E7;
    		border-radius: 30px;
            margin:auto;
            margin-bottom: 20px;
            
            
		}
		.form_radio_btn input[type=radio] {
			display: none;
		}
		.form_radio_btn label {
			display: block;
    		border-radius: 30px;
   			margin: 0 auto;
    		text-align: center;
    		height: -webkit-fill-available;
    		line-height: 70px;
            font-weight: bold;
            font-size: large;
		}
		 
		/* Checked */
		.form_radio_btn input[type=radio]:checked + label {
			background: #3763ec;
			color: #fff;
		}
		 
		/* Hover */
		.form_radio_btn label:hover {
			color: #666;
		}
		 
		/* Disabled */
		.form_radio_btn input[type=radio] + label {
			background: #F9FAFC;
			color: #666;
		}

        .service-box{
            width:1200px;
        }
        

  
        </style>    
       <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
    	</script>  
        <script>
        	<%
        		//가져온 model에서 revlist 리스트 객체를 꺼낸다.
        		List<ResvDTO> resvlist = (List<ResvDTO>) request.getAttribute("resvlist");
        		List<String> reviewlist = (List<String>) request.getAttribute("reviewlist");

				%>
					
			$(document).ready(function(){
				checked = $("input[name='reserved']:checked").val()

				  if(checked === "nowresv"){
					$(".nowresv").show();
					$(".pastresv").hide();
				}else{
					$(".nowresv").hide();
					$(".pastresv").show();
				} 
				
				$("input[name='reserved']").on("change", function(){
					changechecked = $("input[name='reserved']:checked").val()
					if(changechecked === "nowresv"){
						$(".nowresv").show();
						$(".pastresv").hide();
					}else{
						$(".nowresv").hide();
						$(".pastresv").show();
					} 
				})
				
			})	
        </script>
        
        
    </head>
    <body>
        <!-- ========================= page-banner-section start ========================= -->
        <section class="page-banner-section pt-75 pb-75 img-bg" style="background-image: url('/pet/resources/assets/img/bg/common-bg.svg')">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="banner-content">
                            <h2 class="text-white">예약 및 결제내역</h2>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item" aria-current="page"><a href="/pet/">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">예약 및 결제내역</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ========================= page-banner-section end ========================= -->

        <!-- ========================= service-section start ========================= -->
        <section id="service" class="service-section pt-130 pb-100">
            <!-- 컨테이너 시작 -->
            <div class="container">
                <!-- 진행예약/지난예약 버튼 -->
                <div class="row">
                    <div class="col-md-4">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="resv_history" >
                                    <div class="form_radio_btn radio_gender">
                                        <input id="radio-20" type="radio" name="reserved" value = "nowresv" checked id="nowresv">
                                        <label for="radio-20" style="cursor: pointer;" checked>진행예약</label>
                                    </div>
                                </div> 
                            </div>
                            <div class="col-md-6">
                                <div class="resv_history" >
                                    <div class="form_radio_btn radio_gender">
                                        <input id="radio-21" type="radio" name="reserved"  value="pastresv" id="pastresv">
                                        <label for="radio-21" style="cursor: pointer;">지난예약</label>
                                    </div>
                                </div>                                         
                            </div>
                        </div>
                    </div>    
                </div>
                <!-- 진행예약/지난예약 버튼 끝 -->

                <!-- 돌봄 예정 서비스 정보 -->
                <!-- 돌봄예정 서비스 row -->
                <%for(ResvDTO resvdto: resvlist){//예약내역리스트에서 예약내역 객체를 하나씩 가져온다. 
                	//예약내역의 방문날짜를 Date객체에 담는다
                	Date date = resvdto.getVisit_date();
            		//System.out.println(date);
            		//년월일 사이의 하이픈(-)을 빼준다
    				SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
            		//년월일에 서비스시작시간을 붙인다.
            		String startdate = "";
            		String enddate = "";
            		if(resvdto.getService_starttime()>=10){
    					startdate = sf.format(date) + resvdto.getService_starttime()+"00";
            		}else{
    					startdate = sf.format(date) + "0" + resvdto.getService_starttime()+"00";
            		}
    				//년월일에 서비스종료시간을 붙인다.
    				if(resvdto.getService_endtime()>=10){
            			enddate = sf.format(date) + resvdto.getService_endtime()+"00";
    				}else{
                		enddate = sf.format(date) + "0" + resvdto.getService_endtime()+"00";    					
    				}
    				//현재 날짜와 시간을 가져와서 다 붙여있는 식으로 뽑아낸다.
            		Date nowdate = new Date();
            		SimpleDateFormat sf2 = new SimpleDateFormat("yyyyMMddHHmm");
            		//문자열로 바꾼다.
            		String sysdate = sf2.format(nowdate);
            		
            		//두 날짜 스트링 변수를 정수로 바꾼다
            		long start = Long.valueOf(startdate);
            		
            		long now = Long.valueOf(sysdate);
            		long end = Long.valueOf(enddate);
            		SimpleDateFormat sf3 = new SimpleDateFormat("yyyy년 MM월 dd일");
					String hangeuldate = sf3.format(date);
               		
                	System.out.println("예약번호list:"+resvdto.getResv_no());
					
					
                if(start>now){ %>
                <div class="row nowresv">
                    <!-- 돌봄예정 서비스 칸 -->
                    <div class="col-lg-12 col-md-6">
                        <!-- 돌봄예정 서비스 service box -->
                        <div class="service-box box-style">
                            <!-- 돌봄예정 서비스 box content -->
                            <div class="box-content-style service-content">
                                <!-- 돌봄 예정 ㅇㅇㅇㅇ년 ㅇㅇ월 ㅇㅇ일 -->
                                <div class="row">
                                    <div class="col-2">
                                    	<% if(start<now&&now<=end){
                                    			if(resvdto.getResv_status()==1){%>
                                        			<span style="margin-right:50px; "><h4>돌봄 중</h4></span>
                                        	<%}else{ %>
                                        			<span style='margin-right:50px;' ><h4 style='color:red;'>예약 취소</h4></span>
                                        	<%} %>
                                        	
                                        	
                                        <%}else{ 
	                                       		 if(resvdto.getResv_status()==0 && !resvdto.getMatch_method().equals("auto_match")){%>
	                                      			<span style="margin-right:50px;"><h4 style="text-align: center;">매칭 승인 <br> 대기중</h4></span>
	                                      	<%}else if(resvdto.getResv_status()==1){ %>
	                                      			<span style="margin-right:50px"><h4  style="color: #4361eb;">돌봄 예정</h4></span>
	                                      	<%}else if(resvdto.getResv_status()==0 && resvdto.getMatch_method().equals("auto_match")){%>
                                  					<span style="margin-right:50px; padding : center;"><h4>자동 매칭<br>승인 대기</h4></span>
                                  			<%}else{%>
                                        			<span style='margin-right:50px;' ><h4 style='color:red;'>예약 취소</h4></span>
	                                  		<%}%>	 
	                                  		
	                                     <%} %>	  
                                    </div>
                                    <div class="col-10" >
                                        <span><h5>방문날짜: </h5></span>
                                        <span><h5><%= hangeuldate %></h5></span>
                                        <div style="float: right;">
                                        	<div class="row" >
		                                        <div>
				                                       <span><h5>예약날짜:</h5></span>
				                                        <span><h5><%= resvdto.getResv_date() %> </h5></span>
				                                        <br>
				                                </div>        
			                                </div>
			                                <%if(resvdto.getResv_status()!=0 && resvdto.getResv_status()!=1){ %>
			                                <div class="row" >
				                                <div>
				                                		<span><h5 style="color: red;">예약취소날짜: </h5></span>
				                                        <span><h5  style="color: red;"><%= resvdto.getResv_change_date() %></h5></span>
		                                    	</div>
		                                    </div>
		                                    <%} %>
	                                    </div>	
                                </div>
                                <!-- 돌봄 예정 ㅇㅇㅇㅇ년 ㅇㅇ월 ㅇㅇ일 끝-->

                                <!-- 반려동물 사진 / 서비스정보 -->
                                <div class="row" style="display: flex; align-items: center;  flex: 110%;">
                                    <!-- <div class="col-2">
                                        <img src="https://www.dailysecu.com/news/photo/202104/123449_145665_1147.png"
                                            alt="해당 서비스 이용 반려동물" style="width: 100px; height: 100px; border-radius: 100px;  pointer-events: none;">
                                    </div> -->
                                    <div class="col-2"></div>
                                    <div class="col-8 ">
                                        <div >
                                            <div style="font-size: 20px; ">
                                                <span>반려동물 이름:</span>
                                                <span><%=resvdto.getPet_namelist() %></span>
                                                <span style="margin-left:50px">돌봄 서비스 종류: </span>
                                                <span>돌봄(기본)<%if(resvdto.getWalk_service() == 'Y')  {%>
                                                   							+ 산책
                                                   	<%}%>	
                                                   	<%if(resvdto.getBath_service() == 'Y')  {%>
                                                   							+ 목욕
                                                   	<%}%>	
                                                   	<%if(resvdto.getBeauty_service() == 'Y')  {%>
                                                   							+ 미용
                                                   	<%}%></span>
                                            </div>

                                            <div style="font-size: 20px; margin-top: 20px ;">
                                                <span>돌봄 서비스 가격:</span>
                                                <span><%=resvdto.getTotal_price() %>원</span>
                                                <span style="margin-left:25px">시작시간 ~ 종료시간:</span>
                                                	<% if(resvdto.getService_starttime() < 12) { %>
                                                   	 	<span style="font-size:20px">오전 <%= resvdto.getService_starttime()%>시</span>
                                                    <%}else if(resvdto.getService_starttime() == 12){%>
                                                    	<span style="font-size:20px">오후 <%= resvdto.getService_starttime()%>시</span>
                                                    <%}else {%>
                                                   	 	<span style="font-size:20px">오후 <%= resvdto.getService_starttime() - 12 %>시</span>
                                                   <% } %> ~<% if(resvdto.getService_endtime() < 12) { %>
                                                   	 	<span style="font-size:20px">오전 <%=resvdto.getService_endtime() %>시</span>
                                                    <%}else if(resvdto.getService_endtime() == 12){%>
                                                    	<span style="font-size:20px">오후 <%=resvdto.getService_endtime() %>시</span>
                                                    <% }else {%>
                                                   	 	<span style="font-size:20px">오후 <%= resvdto.getService_endtime() - 12 %>시</span>
                                                   <% } %> 
                                            </div>    
                                        </div>
                                    </div>
                                   
                    				
                                    <!-- 더보기 -->
                                    <div class="col-2"  >        
                                        <div class="button text-center detailread" >
                                            <button type="submit" style="display: inline-block;" onclick="location.href='/pet/reserve/read.do?resv_no=<%=resvdto.getResv_no()%>'"  class="theme-btn">더보기</button>
                                        </div>
                                    <!-- 더보기 끝 -->
                                </div>    
                                <!-- 반려동물 사진 / 서비스정보 끝-->       
                            </div>
                            <!-- 돌봄예정 서비스 box content 끝 -->    
                        </div>
                        <!-- 돌봄예정 서비스 service box 끝-->
                    </div>
                    <!-- 돌봄예정 서비스 칸 끝-->
                </div>
                <!-- 돌봄예정 서비스 row 끝-->
                </div>
                </div>
				<%}else{ %>
                 <div class="row pastresv">
                    <!-- 돌봄예정 서비스 칸 -->
                    <div class="col-lg-12 col-md-6">
                        <!-- 돌봄예정 서비스 service box -->
                        <div class="service-box box-style">
                            <!-- 돌봄예정 서비스 box content -->
                            <div class="box-content-style service-content">
                                <!-- 돌봄 예정 ㅇㅇㅇㅇ년 ㅇㅇ월 ㅇㅇ일 -->
                                <div class="row">
                                    <div class="col-2">
                                    	
                                    		<%if(resvdto.getResv_status()==5){%>
                                        			<span style="margin-right:50px;"><h4 style="color: #4361eb;">돌봄 완료</h4></span>
                                        	<%}else{ %>
                                        			<span style='margin-right:50px;' ><h4 style='color:red;'>예약 취소</h4></span>
                                        	<%} %>
                                        	
                                        	
                                          
                                    </div>
                                     <div class="col-10" >
                                        <span><h5>방문날짜: </h5></span>
                                        <span><h5><%= hangeuldate %></h5></span>
                                        <div style="float: right;">
                                        	<div class="row" >
		                                        <div>
				                                       <span><h5>예약날짜:</h5></span>
				                                        <span><h5><%= resvdto.getResv_date() %> </h5></span>
				                                        <br>
				                                </div>        
			                                </div>
			                                <%if(resvdto.getResv_status()!=0 && resvdto.getResv_status()!=1 && resvdto.getResv_status()!=5){ %>
			                                <div class="row" >
				                                <div>
				                                		<span><h5 style="color: red;">예약취소날짜: </h5></span>
				                                        <span><h5  style="color: red;"><%= resvdto.getResv_change_date() %></h5></span>
		                                    	</div>
		                                    </div>
		                                    <%} %>
	                                    </div>	
                                </div>
                                <!-- 돌봄 예정 ㅇㅇㅇㅇ년 ㅇㅇ월 ㅇㅇ일 끝-->

                                <!-- 반려동물 사진 / 서비스정보 -->
                                <div class="row" style="display: flex; align-items: center;  flex: 110%;">
                                    <!-- <div class="col-2">
                                        <img src="https://www.dailysecu.com/news/photo/202104/123449_145665_1147.png"
                                            alt="해당 서비스 이용 반려동물" style="width: 100px; height: 100px; border-radius: 100px;  pointer-events: none;">
                                    </div> -->
                                    <div class="col-2"></div>
                                    <div class="col-8 ">
                                        <div >
                                            <div style="font-size: 20px; ">
                                                <span>반려동물 이름:</span>
                                                <span><%=resvdto.getPet_namelist() %></span>
                                                <span style="margin-left:50px">돌봄 서비스 종류: </span>
                                                <span>돌봄(기본)<%if(resvdto.getWalk_service() == 'Y')  {%>
                                                   							+ 산책
                                                   	<%}%>	
                                                   	<%if(resvdto.getBath_service() == 'Y')  {%>
                                                   							+ 목욕
                                                   	<%}%>	
                                                   	<%if(resvdto.getBeauty_service() == 'Y')  {%>
                                                   							+ 미용
                                                   	<%}%></span>
                                            </div>

                                            <div style="font-size: 20px; margin-top: 20px ;">
                                                <span>돌봄 서비스 가격:</span>
                                                <span><%=resvdto.getTotal_price() %>원</span>
                                                <span style="margin-left:25px">시작시간 ~ 종료시간:</span>
                                                	 <% if(resvdto.getService_starttime() < 12) { %>
                                                   	 	<span style="font-size:20px">오전 <%= resvdto.getService_starttime()%>시</span>
                                                    <%}else if(resvdto.getService_starttime() == 12){%>
                                                    	<span style="font-size:20px">오후 <%= resvdto.getService_starttime()%>시</span>
                                                    <%}else {%>
                                                   	 	<span style="font-size:20px">오후 <%= resvdto.getService_starttime() - 12 %>시</span>
                                                   <% } %> ~<% if(resvdto.getService_endtime() < 12) { %>
                                                   	 	<span style="font-size:20px">오전 <%=resvdto.getService_endtime() %>시</span>
                                                    <%}else if(resvdto.getService_endtime() == 12){%>
                                                    	<span style="font-size:20px">오후 <%=resvdto.getService_endtime() %>시</span>
                                                    <% }else {%>
                                                   	 	<span style="font-size:20px">오후 <%= resvdto.getService_endtime() - 12 %>시</span>
                                                   <% } %> 
                                            </div>    
                                        </div>
                                    </div>
                                   
                    				
                                    <!-- 더보기 -->
                                    <div class="col-2">        
                                        <div class="button text-center detailread" >
                                            <button type="submit" style="display: inline-block;" onclick="location.href='/pet/reserve/read.do?resv_no=<%=resvdto.getResv_no()%>'"  class="theme-btn">더보기</button>
                                        </div>
                                        <%if(resvdto.getResv_status() == 5) {%>
                                        	<%if(reviewlist != null){ %>
	                                        	<%if(reviewlist.contains(resvdto.getResv_no())) {%>
		                                        	<div class="button text-center" style="margin-top: 15px;">
			                                            <a type="button" href="/pet/menu/review/detail.do?review_no=<%=resvdto.getResv_no()%>" class="theme-btn" >후기 보기</a>
			                                        </div>
		                                        <%}else{ %>
			                                        <div class="button text-center" style="margin-top: 15px;">
			                                            <a type="button" href="/pet/menu/review/write.do?resv_no=<%=resvdto.getResv_no()%>" class="theme-btn" >후기 쓰기</a>
			                                        </div>
		                                        <%} %>
		                                     <%} %>   
	                                    <%} %>    
                                    	</div>
                                    <!-- 더보기 끝 -->
                                </div>    
                                <!-- 반려동물 사진 / 서비스정보 끝-->       
                            </div>
                            <!-- 돌봄예정 서비스 box content 끝 -->    
                        </div>
                        <!-- 돌봄예정 서비스 service box 끝-->
                    </div>
                    <!-- 돌봄예정 서비스 칸 끝-->
                </div>
                <!-- 돌봄예정 서비스 row 끝-->
               <%} %>
                <%} %>

            </div>
            <!-- 컨테이너 끝 -->
        </section>            
    </body>
</html>
