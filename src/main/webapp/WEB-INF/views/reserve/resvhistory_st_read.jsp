<%@page import="mutli.com.pet.mypet.PetDTO"%>
<%@page import="mutli.com.pet.erp.MemberDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="multi.com.pet.resv.ResvDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="ko">
<head>
<meta charset="utf-8">
<title>resvhistory_mb_read</title>
<style>
.form_radio_btn {
	width: 200px;
	display: inline-block;
	height: 70px;
	border: 1px solid #EAE7E7;
	border-radius: 30px;
	margin: auto;
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
.form_radio_btn input[type=radio]:checked+label {
	background: #3763ec;
	color: #fff;
}

/* Hover */
.form_radio_btn label:hover {
	color: #666;
}

/* Disabled */
.form_radio_btn input[type=radio]+label {
	background: #F9FAFC;
	color: #666;
}

.service-box {
	width: 1200px;
}
</style>
<script>
	
<%ArrayList<String> namelist = (ArrayList<String>) request.getAttribute("namelist");
ArrayList<String> codelist = (ArrayList<String>) request.getAttribute("codelist");
ResvDTO resvdto = (ResvDTO) request.getAttribute("resvdto");
ArrayList<PetDTO> petlist = (ArrayList<PetDTO>)request.getAttribute("petlist");


//예약내역의 방문날짜를 Date객체에 담는다
Date date = resvdto.getVisit_date();
//System.out.println(date);
//년월일 사이의 하이픈(-)을 빼준다
SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
//년월일에 서비스시작시간을 붙인다.
String startdate = "";
String enddate = "";
if (resvdto.getService_starttime() >= 10) {
	startdate = sf.format(date) + resvdto.getService_starttime() + "00";
} else {
	startdate = sf.format(date) + "0" + resvdto.getService_starttime() + "00";
}
//년월일에 서비스종료시간을 붙인다.
if (resvdto.getService_endtime() >= 10) {
	enddate = sf.format(date) + resvdto.getService_endtime() + "00";
} else {
	enddate = sf.format(date) + "0" + resvdto.getService_endtime() + "00";
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

MemberDTO member = (MemberDTO) request.getAttribute("member");
System.out.println(member);%>
	
</script>

</head>
<body>
	<input type="hidden" id="hospitalname" value="${member.hospital_name }">
	<input type="hidden" id="hospitaladdr" value="${member.hospital_addr }">
	<input type="hidden" id="addr1" value="${member.member_addr1 }">
	<!-- ========================= page-banner-section start ========================= -->
	<section class="page-banner-section pt-75 pb-75 img-bg"
		style="background-image: url('/pet/resources/assets/img/bg/common-bg.svg')">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="banner-content">
						<h2 class="text-white">예약 및 결제내역</h2>
						<div class="page-breadcrumb">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item" aria-current="page"><a
										href="/pet/">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">예약
										및 결제내역</li>
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
			<div class="row" style="margin-top: -7%;">
				<div class="col-md-4">
					<div class="row">
						<div class="col-md-6">
							<div class="resv_history">
								<div class="form_radio_btn radio_gender">
									<input id="radio-20" type="radio" name="reserved" checked>
									<label for="radio-20" style="cursor: pointer;">예약상세정보확인</label>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
			<!-- 진행예약/지난예약 버튼 끝 -->

			<!-- 예약/결제 내역  정보 -->
			<!-- 예약/결제 내역 row -->
			<div class="row">
				<!-- 예약/결제 내역 칸 -->
				<div class="col-lg-12 col-md-6">
					<!-- 전체 row -->
					<div class="row">
						<!-- 예약정보 컬럼  -->
						<div class="col-6">
							<!-- 예약정보  row-1 -->
							<div class="row">
								<!-- 예약정보 칸 wrapper -->
								<div class="contact-form-wrapper">
									<!-- 예약정보 row-2 -->
									<div class="row">
										<!-- 예약정보 제목 -->
										<div class="col-xl-10 col-lg-8 mx-auto">
											<div class="section-title text-center mb-20">
												<span class="wow fadeInDown" data-wow-delay=".2s">예약정보</span>
											</div>
										</div>
										<!-- 반려동물정보 제목 -->
										<div>
											<span style="margin: 10px"><h3>반려동물정보</h3></span>
										</div>
										<!-- 반려동물사진 & 반려동물이름 & 고양이/강아지-->
										<div>
											<%for(int i=0; i<petlist.size(); i++){ %>
                                                	<img src="/pet/resources/pet/<%=petlist.get(i).getPet_photo() %>"
                                                    alt="해당 서비스 이용 반려동물" style="width: 100px; height: 100px; border-radius: 100px;  pointer-events: none; float:left;">
                                                <h5 style="float:left; margin-left: 50px; margin-top: 35px;" ></h5>
                                                <%} %>
										</div>

										<!-- 예약상세정보 -->
										<div style="margin-top: 20px;">
											<div>
												<h5 style="line-height: 200%; display: inline;">반려동물이름:</h5>
												<%
												for (int i = 0; i < namelist.size(); i++) {
													if (codelist.get(i).equals("DOG")) {
												%>
												<span style="font-size: 20px"><%=namelist.get(i)%>
													(강아지)</span>
												<%
												} else {
												%>
												<span style="font-size: 20px"><%=namelist.get(i)%>
													(고양이)</span>
												<%
												}
												%>
												<%
												}
												%>
											</div>
											<div>
												<h5 style="line-height: 200%; display: inline;">반려동물특이사항:</h5>
												<%for(int i=0; i<petlist.size(); i++){ %>
                                                	<span style="font-size: 20px"><%=petlist.get(i).getPet_name()%>: <%=petlist.get(i).getPet_note() %></span>                                                	
                                                <%} %>
											</div>
											<div>
												<h5 style="line-height: 200%; display: inline;">예약날짜:</h5>
												<span style="font-size: 20px">${resvdto.resv_date }</span>
											</div>
											<div>
												<h5 style="line-height: 200%; display: inline;">취소여부:</h5>
												<c:choose>
													<c:when test="${resvdto.resv_status == 0 and resvdto.match_method eq 'auto_match' }">
														<span
															style="font-size: 20px; font-weight: bold; color: #4361eb;">자동매칭요청중</span>
													</c:when>
													<c:when test="${resvdto.resv_status == 0 and resvdto.match_method ne 'auto_match'}">
														<span
															style="font-size: 20px; font-weight: bold; color: #4361eb;">매칭요청중</span>
													</c:when>
													<c:when test="${resvdto.resv_status == 1 }">
														<span
															style="font-size: 20px; font-weight: bold; color: #4361eb;">매칭완료</span>
													</c:when>
													<c:when test="${resvdto.resv_status == 5 }">
														<span
															style="font-size: 20px; font-weight: bold; color: #4361eb;">돌봄완료</span>
													</c:when>
													<c:otherwise>
														<span
															style="font-size: 20px; color: red; font-weight: bold;">취소됨</span>
													</c:otherwise>
												</c:choose>
											</div>
											<c:if
												test="${resvdto.resv_status != 0 and resvdto.resv_status !=1 }">
												<div>
													<h5 style="line-height: 200%; display: inline;">취소상세:</h5>
													<c:if test="${resvdto.resv_status == 2 }">
														<span
															style="font-size: 20px; color: red; font-weight: bold;">매칭승인요청기간초과</span>
													</c:if>
													<c:if test="${resvdto.resv_status == 3 }">
														<span
															style="font-size: 20px; color: red; font-weight: bold;">이용자가
															취소함</span>
													</c:if>
													<c:if test="${resvdto.resv_status == 4 }">
														<span
															style="font-size: 20px; color: red; font-weight: bold;">펫시터가
															취소함</span>
													</c:if>
												</div>
											</c:if>

											<div>
												<h5 style="line-height: 200%; display: inline;">서비스 종류:</h5>
												<span style="font-size: 20px">돌봄(기본) <%
													if (resvdto.getWalk_service() == 'Y') {
													%>
														+ 산책 <%
													}
													%> <%
													if (resvdto.getBath_service() == 'Y') {%> 
													+ 목욕 <%}%>
													<%
													if (resvdto.getBeauty_service() == 'Y') {%> 
													+ 미용 <%
													}
													%></span>
											</div>
											<div>
												<h5 style="line-height: 200%; display: inline;">서비스 금액:</h5>
												<span style="font-size: 20px">${resvdto.total_price }원</span>
											</div>
											<div>
												<h5 style="line-height: 200%; display: inline;">서비스 장소:</h5>
												<%
												if (resvdto.getResv_status() == 1) {
												%>
												<span style="font-size: 20px">${resvdto.visit_place }</span>
												<%
												} else {
												%>
												<span style="font-size: 20px">${addr1 }</span>
												<%
												}
												%>
											</div>
											<div>
												<h5 style="line-height: 200%; display: inline;">서비스 이용
													날짜:</h5>
												<span style="font-size: 20px">${resvdto.visit_date }</span>
											</div>
											<div>
												<h5 style="line-height: 200%; display: inline;">서비스 이용
													시작시간:</h5>

												<%
												if (resvdto.getService_starttime() < 12) {
												%>
												<span style="font-size: 20px">오전
													${resvdto.service_starttime }시</span>
												<%
												} else if (resvdto.getService_starttime() == 12) {
												%>
												<span style="font-size: 20px">오후
													${resvdto.service_starttime }시</span>
												<%
												} else {
												%>
												<span style="font-size: 20px">오후 <%=resvdto.getService_starttime() - 12%>시
												</span>
												<%
												}
												%>
											</div>
											<div>
												<h5 style="line-height: 200%; display: inline;">서비스 이용
													종료시간:</h5>
												<%
												if (resvdto.getService_endtime() < 12) {
												%>
												<span style="font-size: 20px">오전
													${resvdto.service_endtime }시</span>
												<%
												} else if (resvdto.getService_endtime() == 12) {
												%>
												<span style="font-size: 20px">오후
													${resvdto.service_endtime }시</span>
												<%
												} else {
												%>
												<span style="font-size: 20px">오후 <%=resvdto.getService_endtime() - 12%>시
												</span>
												<%
												}
												%>
											</div>
											<div>
												<h5 style="line-height: 200%; display: inline;">총 서비스
													이용시간:</h5>
												<span style="font-size: 20px"><%=resvdto.getService_endtime() - resvdto.getService_starttime()%>시간</span>
											</div>

											<div>
												<h5 style="line-height: 200%; display: inline;">주의사항:</h5>
												<span style="font-size: 20px">${resvdto.service_note }</span>
											</div>
											<div>
												<h5 style="line-height: 200%; display: inline;">방문방법:</h5>
												<c:if test="${resvdto.visit_method == 'pass_visit' }">
													<span style="font-size: 20px">집 비밀번호 누르고 들어가기</span>
												</c:if>
												<c:if test="${resvdto.visit_method == 'direct_visit' }">
													<span style="font-size: 20px">밖에서 직접만남</span>
												</c:if>
											</div>
											<div>
												<%
												if (resvdto.getResv_status() == 1) {
												%>
												<%
												if (resvdto.getVisit_method().equals("pass_visit")) {
												%>
												<h5 style="line-height: 200%; display: inline;">공동현관비밀번호:</h5>
												<span style="font-size: 20px">${resvdto.common_pass }</span>
												<h5 style="line-height: 200%; display: inline;">집현관비밀번호:</h5>
												<span style="font-size: 20px">${resvdto.home_pass }</span>

												<%
												} else {
												%>
												<h5 style="line-height: 200%; display: inline;">직접만남
													특이사항:</h5>
												<span style="font-size: 20px">${resvdto.direct_meet }</span>

												<%
												}
												%>
												<%
												}
												%>
											</div>
											<div>
												<h5 style="line-height: 200%; display: inline;">주차여부</h5>
												<span style="font-size: 20px">${resvdto.parking }</span>
											</div>
											<div>
												<h5 style="line-height: 200%; display: inline;">용품장소:</h5>
												<span style="font-size: 20px">${resvdto.supplies_place }</span>
											</div>
											<div>
												<h5 style="line-height: 200%; display: inline;">배변 및
													쓰레기 버리는 방법 및 장소:</h5>
												<span style="font-size: 20px">${resvdto.cleaning_method }</span>
											</div>
											<div>
												<h5 style="line-height: 200%; display: inline;">비상긴급전화번호</h5>
												<span style="font-size: 20px">${resvdto.emergency_phone }</span>
											</div>
											<div>
												<h5 style="line-height: 200%; display: inline;">매칭방법:</h5>
												<c:if test="${resvdto.match_method eq 'direct_match' }">
													<span style="font-size: 20px">직접선택</span>
												</c:if>
												<c:if test="${resvdto.match_method eq 'auto_match' }">
													<span style="font-size: 20px">자동매칭</span>
												</c:if>
												<c:if test="${resvdto.match_method eq 'past_match' }">
													<span style="font-size: 20px">과거에 이용했던 펫시터</span>
												</c:if>
											</div>


										</div>
										<!-- 예약상세정보끝 -->
										<!-- 펫시터정보 제목 -->
										<div style="margin-top: 50px;">
											<span style="margin: 10px"><h3>이용자정보</h3></span>
										</div>
										<!-- 펫시터사진 & 펫시터이름 & 고양이/강아지/둘다 펫시터-->
										<div class="row">
											<div class="row">
												<h5 style="float: left; margin-left: 50px; margin-top: 5%">이용자
													: ${member.member_name }</h5>
												<c:if test="${member.member_gender eq 'M' }">
													<h5 style="float: left; margin-left: 50px; margin-top: 5%;">이용자
														성별 : 남성</h5>
												</c:if>
												<c:if test="${member.member_gender eq 'F' }">
													<h5 style="float: left; margin-left: 50px; margin-top: 5%;">이용자
														성별 : 여성</h5>
												</c:if>
												<h5 style="float: left; margin-left: 50px; margin-top: 5%;">이용자
													나이 : 만 ${member.member_age }세</h5>
											</div>
										</div>
									</div>
									<!-- 예약정보 row-2끝 -->
								</div>
								<!-- 예약정보 wrapper 끝 -->
							</div>
							<!-- 예약정보  row-1끝 -->
						</div>
						<!-- 예약정보 컬럼 끝  -->


						<!-- 결제정보 컬럼  -->
						<div class="col-6">
							<!-- 결제정보  row-1 -->
							<div class="row">
								<!-- 결제정보 칸 wrapper -->
								<!-- 결제정보 wrapper 끝 -->
								<c:if
									test="${resvdto.resv_status ==0 or resvdto.resv_status == 1}">
									<div class="contact-form-wrapper">
										<div class="row">
											<div class="col-xl-10 col-lg-8 mx-auto"
												style="margin-bottom: 50px;">
												<div class="section-title text-center mb-20">
													<span class="wow fadeInDown" data-wow-delay=".2s">돌봄
														장소 위치</span>
												</div>
											</div>

											<div id="map"
												style="width: 500px; height: 500px; margin: auto;"></div>

											<script type="text/javascript"
												src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c1bce72c0011761820b131bdbec94b47&libraries=services"></script>
											<script>
												var mapContainer = document
														.getElementById('map'), // 지도를 표시할 div 
												mapOption = {
													center : new kakao.maps.LatLng(
															33.450701,
															126.570667), // 지도의 중심좌표
													level : 5
												// 지도의 확대 레벨
												};

												// 지도를 생성합니다    
												var map = new kakao.maps.Map(
														mapContainer, mapOption);

												// 주소-좌표 변환 객체를 생성합니다
												var geocoder = new kakao.maps.services.Geocoder();
												
												var addr = document
														.getElementById("addr1").value;
												
												// 주소로 좌표를 검색합니다
												geocoder
														.addressSearch(
																addr,
																function(
																		result,
																		status) {

																	// 정상적으로 검색이 완료됐으면 
																	if (status === kakao.maps.services.Status.OK) {

																		var coords = new kakao.maps.LatLng(
																				result[0].y,
																				result[0].x);

																		// 결과값으로 받은 위치를 마커로 표시합니다
																		var marker = new kakao.maps.Marker(
																				{
																					map : map,
																					position : coords
																				});

																		// 인포윈도우로 장소에 대한 설명을 표시합니다
																		var infowindow = new kakao.maps.InfoWindow(
																				{
																					content : '<div style="width:150px;text-align:center;padding:6px 0;">돌봄장소</div>'
																				});
																		infowindow
																				.open(
																						map,
																						marker);

																		// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
																		map
																				.setCenter(coords);
																	}
																});
											</script>
										</div>
									</div>
									<!-- 동물병원위치 -->
									<div class="contact-form-wrapper">
										<div class="row">
											<div class="col-xl-10 col-lg-8 mx-auto"
												style="margin-bottom: 50px;">
												<div class="section-title text-center mb-20">
													<span class="wow fadeInDown" data-wow-delay=".2s">반려동물
														상태에 이상이 생길 시 <br> 즉시 동물병원으로 데려가주세요!
													</span>
												</div>
												<h5 style="line-height: 200%; display: inline;">동물병원이름:
													${member.hospital_name }</h5>

											</div>

											<div id="map2"
												style="width: 500px; height: 500px; margin: auto;"></div>

											
											<script>
												var mapContainer2 = document
														.getElementById('map2'), // 지도를 표시할 div 
												mapOption2 = {
													center : new kakao.maps.LatLng(
															33.450701,
															126.570667), // 지도의 중심좌표
													level : 5
												// 지도의 확대 레벨
												};

												// 지도를 생성합니다    
												var map2 = new kakao.maps.Map(
														mapContainer2, mapOption2);

												// 주소-좌표 변환 객체를 생성합니다
												var geocoder2 = new kakao.maps.services.Geocoder();

												var hospitaladdr = document
														.getElementById("hospitaladdr").value;

												// 주소로 좌표를 검색합니다
												geocoder.addressSearch(hospitaladdr, function(result, status) {

																	// 정상적으로 검색이 완료됐으면 
																	if (status === kakao.maps.services.Status.OK) {

																		var coords2 = new kakao.maps.LatLng(
																				result[0].y,
																				result[0].x);

																		// 결과값으로 받은 위치를 마커로 표시합니다
																		var marker2 = new kakao.maps.Marker(
																				{
																					map : map2,
																					position : coords2
																				});

																		// 인포윈도우로 장소에 대한 설명을 표시합니다
																		var infowindow2 = new kakao.maps.InfoWindow(
																				{
																					content : '<div style="width:150px;text-align:center;padding:6px 0;">동물병원주소</div>'
																				});
																		infowindow2
																				.open(
																						map2,
																						marker2);

																		// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
																		map2.setCenter(coords2);
																	}
																});
											</script>
										</div>
									</div>
								</c:if>
								<c:if
									test="${resvdto.resv_status == 0 or resvdto.resv_status == 1}">
									<div class="contact-form-wrapper">
										<!-- 결제정보 row-2 -->
										<div class="row">
											<!-- 결제정보 제목 -->
											<div class="col-xl-10 col-lg-8 mx-auto">
												<div class="section-title text-center mb-20">
													<span class="wow fadeInDown" data-wow-delay=".2s">매칭</span>
												</div>
											</div>
											<!-- 결제정보 제목 끝-->

											<!-- 결제상세정보 -->

											<!-- 결제상세정보끝 -->
											<!-- 결제상세정보끝 -->
											<c:if test="${resvdto.resv_status == 0 and resvdto.match_method ne 'auto_match'}">
												<div class=row style="margin-bottom: -10%;">
													<div class=col-6>
														<div class="button text-center pb-50">
															<button type="button" class="theme-btn"
																onclick="location.href='/pet/reserve/approve.do?resv_no=${resvdto.resv_no }'"
																style="display: inline-block; margin-left: 0px">매칭승인</button>
														</div>
													</div>
														<div class=col-6>
															<div class="button text-center pb-50">
																<button type="button" class="theme-btn"
																	onclick="location.href='/pet/reserve/cancel.do?resv_no=${resvdto.resv_no }'"
																	style="display: inline-block; margin-left: 0px">매칭취소</button>
															</div>
														</div>
												</div>
											</c:if>
											
											<c:if test="${resvdto.resv_status == 0 and resvdto.match_method eq 'auto_match'}">
												<div class=row style="margin-bottom: -10%;">
														<div class=col-12>
															<div class="button text-center pb-50">
																<button type="button" class="theme-btn"
																	onclick="location.href='/pet/reserve/approve.do?resv_no=${resvdto.resv_no }'"
																	style="display: inline-block; margin-left: 0px">매칭승인</button>
															</div>
														</div>
												</div>
											</c:if>
											
											<%
											if (resvdto.getResv_status() == 1 && (start <= (now + 600))) {
											%>
											<div style="margin: auto;">
												<h5
													style="line-height: 200%; color: #4361eb; text-align: center;">
													매칭이 이미 완료된 경우 서비스시작시간으로부터 <br> 6시간 이전에는 매칭취소가 불가능합니다.
												</h5>
											</div>
											<%
											} else if (resvdto.getResv_status() == 1 && (start > (now + 600))) {
											%>
											<div class=row style="margin-bottom: -10%; margin-top: 10%;">
												<div class="button text-center pb-50">
													<button type="button" class="theme-btn"
														onclick="location.href='/pet/reserve/cancel.do?resv_no=${resvdto.resv_no }'"
														style="display: inline-block; margin-left: 0px">매칭취소</button>
												</div>
											</div>
											<%
											}
											%>
										</div>
										<!-- 결제정보 row-2끝 -->
									</div>
								</c:if>
							</div>
							<!-- 결제정보  row-1끝 -->
						</div>
						<!-- 두번째 컬럼 끝  -->
					</div>
					<!-- 전체 row끝 -->
				</div>

				<!-- 이전버튼 -->
				<div class="button text-center pb-50" style="margin-top: 2%;">
					<button type="button" class="theme-btn"
						onclick="location.href='javascript:history.back()'"
						style="display: inline-block; margin-left: 1000px">이전</button>
				</div>

				<!-- 예약/결제 내역 칸 -->
			</div>
			<!-- 예약/결제 내역 row 끝 -->
		
		</div>
		<!-- 컨테이너 끝 -->
	</section>
	<!-- section끝 -->
	<!-- ========================= service-section end ========================= -->
</body>
</html>
