<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="ko">
<head>
<meta charset="utf-8">
<title>resv1_mb</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
select {
	border-radius: 25px;
	border: 1px solid #F4EEFB;
	transition: all 0.3s ease-out 0s;
	width: 300px;
	height: 60px;
	padding: .8em .5em;
	margin-bottom: 25px;
	margin-top: 15px;
	/* border: 1px solid #999; */
	font-family: inherit;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	padding: 0.6em 1.4em 0.5em 0.8em;
}

.homepass {
	font-size: 13px;
}

#parking {
	border: 1px solid #F4EEFB;
	border-radius: 25px;
	padding: .8em .5em;
	width: 350px;
}

.message {
	border: 1px solid #F4EEFB;
	border-radius: 25px;
	padding: .8em .5em;
	width: 350px;
	margin-bottom: 60px;
}

.theme-btn {
	margin-left: 180px;
	margin-top: 60px;
}

#clean {
	margin-bottom: 20px;
}

#emergency {
	margin-bottom: 15px;
}

#feed {
	margin-bottom: 95px;
}

.form_check_btn {
	width: 80%;
	display: inline-block;
	height: 45px;
	border: 1px solid #EAE7E7;
	border-radius: 30px;
	margin: auto;
	margin-bottom: 20px;
}

.form_check_btn input[type=checkbox] {
	display: none;
}

.form_check_btn label {
	display: block;
	border-radius: 30px;
	margin: 0 auto;
	text-align: center;
	height: -webkit-fill-available;
	line-height: 45px;
}

/* Checked */
.form_check_btn input[type=checkbox]:checked+label {
	background: #3763ec;
	color: #fff;
}

/* Hover */
.form_check_btn label:hover {
	color: #666;
}

/* Disabled */
.form_check_btn input[type=checkbox]+label {
	background: #F9FAFC;
	color: #666;
}

input[type="checkbox"]:checked+label {
	background: #3763ec;
}

.form_radio_btn {
	width: 80%;
	display: inline-block;
	height: 45px;
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
	line-height: 45px;
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

input[type="radio"]:checked+label {
	background: #3763ec;
}

#date {
	border: 1px solid #F4EEFB;
	border-radius: 25px;
	padding: .8em .5em;
	width: 350px;
	margin-top: 10px;
	margin-bottom: 30px;
}

input[type=label]
</style>

<script>
	$(document).ready(function() {
						//한 반려동물의 이름, 종, id를 같은 클래스로 묶음
						//한 반려동물의 이름 체크박스의 체크여부에 변화가 일어나면
						$("input:checkbox[name='pet_namelist']").on("change", function() {
									//해당 이름체크박스의 체크 여부를 가져온다.
									val = $(this).is(":checked")
									//해당 이름체크박스의 클래스 이름을 가져온다
									classname = $(this).attr("class")
									//해당 클래스의 이름, 종, id 체크박스의 체크 여부를 위의 체크여부(val)로 바꾼다
									$("." + classname).prop("checked", val);
								})
						$("#date").on("change", function() {
											//선택한 날짜를 가져온다.
											date = $("#date").prop("value");
											//오늘 날짜와 시간을 가져온다
											var now = new Date();

											var year = now.getFullYear();
											//선택한 월과 일이 두자리수면 그대로 가져오고 한자리 수면 앞에 0을 붙인다
											var mon = (now.getMonth() + 1) > 9 ? '' + (now.getMonth() + 1) : '0' + (now.getMonth() + 1);
											var day = now.getDate() > 9 ? ''+ now.getDate() : '0' + now.getDate();
											//위의 셋팅된 년,월,일을 하이픈으로 이어준다
											var todaydate = year + '-' + mon + '-' + day;
											//시, 분이 두자리수면 그대로 가져오고 한자리수면 앞에 0을 붙인다.
											var hours = ('0' + now.getHours()).slice(-2);
											var minutes = ('0' + now.getMinutes()).slice(-2);
											var todaydatetime = hours + ''+ minutes;
											
											//시+분을 숫자로 바꾼다
											todaytime = Number(todaydatetime)

											sel = $("select[name='service_starttime'] option")

											//전에 disabled되어있던 시간option에 disalbed를 다 해제시킨다
											$("select[name='service_starttime'] option").prop("disabled", false)
											//만약에 오늘날짜와 예약날짜가 같다면
											if (date === todaydate) {
												//모든 시간선택 option들에 대해서 반복문을 돌린다.
												for (i = 0; i < sel.length; i++) {
													//i번째 시간 option의 값을 불러온다.
													starttime = $("select[name='service_starttime'] option:eq("+ i + ")").attr("value")
													//현재시간에 2시간을 더한 시간보다 i번째 시간 option이 작으면 disabled처리 시킨다.
													if ((todaytime + 300) > starttime * 100) {
														val = $("select[name='service_starttime'] option:eq("+ i + ")")
														val.prop("disabled", true)
													}
												}
											}
										})

						$("#service_starttime").on("change", function() {
							//오후 8시(20시)를 선택한 경우 서비스이용시간에서 3시간은 선택못하도록 한다.
											val = $("#service_starttime option:selected").val();
											if (val == 20) {
												$("#threehours").hide();
											}
										})
										
						
							//고양이를 선택할 때는 목욕, 산책이 선택 불가되도록
						$("input:checkbox[name='pet_namelist']").on("change", function(){
							//기존의 선택사항을 초기화시킨다
							$("#bathselect").show()
					    	$("#walkselect").show()
							$("#beautyselect").show()
							var select_obj = '';
						    // 체크한 항목만 취득
						    var codelist = $("input[name='pet_codelist']:checked");
						    
						    $(codelist).each(function() {
						    	select_obj += $(this).val()
						    });
						    //서비스대상에 고양이가 포함되어있으면 목욕과 산책 서비스는 선택불가능하도록 한다
						    if(select_obj.includes("CAT")){
						    	$("#bathselect").hide()
						    	$("#walkselect").hide()
						    	$("#beautyselect").hide()
						    }
						    
						    
							
								
						})				
					})
</script>

</head>
<body>
	<!-- ========================= page-banner-section start ========================= -->
	<section class="page-banner-section pt-75 pb-75 img-bg"
		style="background-image: url('/pet/resources/assets/img/bg/common-bg.svg')">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="banner-content">
						<h2 class="text-white">예약하기</h2>
						<div class="page-breadcrumb">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item" aria-current="page"><a
										href="/pet/">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">예약하기</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ========================= page-banner-section end ========================= -->

	<!-- ========================= contact-section start ========================= -->
	<!-- 전체 section -->
	<section class="contact-section pt-130">
		<!-- 전체 container -->
		<div class="container">
			<!-- 전체 form -->
			<form action="/pet/reserve/resv1_mb.do" method="post"
				class="contact-form" onsubmit="return doAction();" id="form1">

				<!-- 전체 row -->
				<div class="row">

					<!-- 1번째 칸 -->
					<div class="col-md-6">
						<!-- 1번째 칸 row -->
						<div class="row">
							<!-- 1번째 칸 wrapper -->
							<div class="contact-form-wrapper">

								<!-- 1번째 칸 반려동물 등록 제목 -->
								<div class="row">
									<div class="col-xl-10 col-lg-8 mx-auto">
										<div class="section-title text-center mb-20">
											<span class="wow fadeInDown" data-wow-delay=".2s">반려동물
												등록</span>
										</div>
									</div>
									<span class="wow fadeInDown" data-wow-delay=".2s"
										style="margin-bottom: 30px; font-weight: bold;">반려동물은 세
										마리까지 서비스 가능합니다.<br> 두 마리(+10,000원), 세 마리(+20,000)
									</span>
								</div>
								<!-- 펫dto를 리스트객체로 한것을 불러아서 반복문으로 화면에 뿌리기 -->
								<div class="row">
									<div class="col-12"
										style="margin-bottom: 15px; font-size: 20px;">
										<div class="row">
											<c:forEach var="pet" items="${mypetlist }" varStatus="status">
												<div class="col-md-4">
													<fieldset>
														<label for="petnamelist${status.count }"  style="cursor: pointer;"> <input type="checkbox" style="cursor: pointer;"
															id="petnamelist${status.count }" value="${pet.pet_name }"
															class="selectpet${status.count }" name="pet_namelist">${pet.pet_name }</label>
															<input type="checkbox" id="petcodelist${status.count }"
															value="${pet.pet_code }"
															class="selectpet${status.count }" name="pet_codelist"
															style="display: none;"> <input type="checkbox"
															id="petidlist${status.count }" value="${pet.pet_id }"
															class="selectpet${status.count }" name="pet_idlist"
															style="display: none;"><input type="checkbox"
															id="petidlist${status.count }" value="${pet.pet_size }"
															class="selectpet${status.count }" name="pet_sizelist"
															style="display: none;">
													</fieldset>
													
												</div>
											</c:forEach>
										</div>
									</div>
								</div>

								<!-- 1번째 칸 돌봄/산책 선택 제목 -->
								<div class="row">
									<div class="col-xl-10 col-lg-8 mx-auto">
										<div class="section-title text-center mb-20">
											<span class="wow fadeInDown" data-wow-delay=".2s"
												style="margin-top: 20px;">서비스 선택</span>
										</div>
									</div>
								</div>
								<!-- 1번째 칸 돌봄/산책 선택 입력 -->
								<div class="row">
									<div class="mb-3">
										<div
											class="form_toggle row-vh d-flex flex-row justify-content-between">
											<div class="form_check_btn radio_male" style="cursor: pointer;">
												<input id="check-1" value="default_service" type="checkbox"
													name="servicecode" checked onClick="return false;">
												<label for="check-1" style="cursor: pointer;">[기본]돌봄(25,000원)</label>
											</div>
										</div>
										<div
											class="form_toggle row-vh d-flex flex-row justify-content-between" >
											<div class="form_check_btn" id="bathselect">
												<input id="check-2" value="bath_service" type="checkbox"
													name="servicecode"> <label for="check-2"
													style="cursor: pointer;">[추가]목욕(+5,000원)</label>
											</div>
										</div>
										<div
											class="form_toggle row-vh d-flex flex-row justify-content-between" >
											<div class="form_check_btn" id="walkselect">
												<input id="check-3" value="walk_service" type="checkbox"
													name="servicecode"> <label for="check-3"
													style="cursor: pointer;">[추가]산책(+3,000원)</label>
											</div>
										</div>
										<div
											class="form_toggle row-vh d-flex flex-row justify-content-between">
											<div class="form_check_btn" id="beautyselect">
												<input id="check-4" value="beauty_service" type="checkbox"
													class="servicecode"> <label for="check-4"
													style="cursor: pointer;">[추가]미용(+5,000원)</label>
											</div>
										</div>
											<p style="color: red; font-weight: bold;">※고양이는 안전 상의 이유로 목욕, 산책, 미용서비스를 이용하실 수 없습니다.</p>
									</div>
								</div>
								<div class="row">
									<div class="col-xl-10 col-lg-8 mx-auto">
										<div class="section-title text-center mb-20"
											style="margin-top: 20px">
											<span class="wow fadeInDown" data-wow-delay=".2s">돌봄
												시 요청 및 주의사항</span>
										</div>
									</div>
								</div>

								<!-- 3번째 칸 돌봄시 요청 및 주의사항 입력 -->
								<div class="row">
									<div class="col-12">
										<textarea class="message" name="service_note" id="emergency"
											placeholder="주의 사항을 입력 해주세요." rows="10" style="width: 500px;"
											required></textarea>
									</div>
								</div>
							</div>
							<!-- 1번째 칸 wrapper 끝 -->
						</div>
						<!-- 1번째 칸 row 끝 -->
					</div>
					<!-- 1번째 칸 끝-->

					<!-- 2번째 칸  ============ -->
					<div class="col-md-6">
						<!-- 2번째 칸 row -->
						<div class="row">
							<!-- 2번째 칸 wrapper -->
							<div class="contact-form-wrapper">
								<!-- 2번째 칸 방문날짜 제목 -->
								<div class="row">
									<div class="col-xl-10 col-lg-8 mx-auto">
										<div class="section-title text-center mb-20">
											<span class="wow fadeInDown" data-wow-delay=".2s">방문날짜</span>
										</div>
									</div>
								</div>
								<!-- 2번째 칸 방문날짜 입력 -->
								<div class="row">
									<div class="col-12">
										<label for="date">날짜를 선택해주세요<br /> <input type="date"
											id="date" name="visit_date" required>
										</label>
									</div>
								</div>

								<!-- 2번째 칸 방문시간 제목 -->
								<div class="row">
									<div class="col-xl-10 col-lg-8 mx-auto">
										<div class="section-title text-center mb-20">
											<span class="wow fadeInDown" data-wow-delay=".2s">방문시간</span>
										</div>
									</div>
								</div>
								<!-- 2번째 칸 방문시간 입력=============== -->
								<div class="row">
									<div class="col-12">
										방문시간을 선택해주세요<br /> <select id="service_starttime"
											name="service_starttime" style="cursor: pointer;" required>
											<option value="">선택</option>
											<option value="8">오전 8:00</option>
											<option value="9">오전 9:00</option>
											<option value="10">오전 10:00</option>
											<option value="11">오전 11:00</option>
											<option value="12">오후 12:00</option>
											<option value="13">오후 1:00</option>
											<option value="14">오후 2:00</option>
											<option value="15">오후 3:00</option>
											<option value="16">오후 4:00</option>
											<option value="17">오후 5:00</option>
											<option value="18">오후 6:00</option>
											<option value="19">오후 7:00</option>
											<option value="20">오후 8:00</option>
										</select>
									</div>
								</div>
								<!-- 2번째 칸 이용시간 제목=============== -->
								<div class="row">
									<div class="col-xl-10 col-lg-8 mx-auto">
										<div class="section-title text-center mb-20">
											<span class="wow fadeInDown" data-wow-delay=".2s">이용시간</span>
										</div>
									</div>
								</div>
								<!-- 2번째 칸 이용시간 입력=============== -->
								<div class="row">
									<div class="col-12">
										<div id="timeexplain">
											<p>이용시간을 선택해주세요</p>
											<p style="color: red; font-weight: bold;">※서비스 이용종료시간은 밤
												10까지입니다.</p>
										</div>
										<div class="row" style="margin-top: 15px;" id="servicehour">
											<div class="mb-3">
												<div
													class="form_toggle row-vh d-flex flex-row justify-content-between">
													<div class="form_radio_btn radio_hour">
														<input id="radio-8" type="radio" class="service_time"
															name="service_time" value="1" required> <label
															for="radio-8" style="cursor: pointer;">1시간</label>
													</div>
												</div>
												<div
													class="form_toggle row-vh d-flex flex-row justify-content-between">
													<div class="form_radio_btn radio_hour">
														<input id="radio-9" type="radio" class="service_time"
															name="service_time" value="2"> <label
															for="radio-9" style="cursor: pointer;">2시간</label>
													</div>
												</div>
												<div
													class="form_toggle row-vh d-flex flex-row justify-content-between">
													<div class="form_radio_btn radio_hour" id="threehours">
														<input id="radio-10" type="radio" class="service_time"
															name="service_time" value="3"> <label
															for="radio-10" style="cursor: pointer;">3시간</label>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- </form> -->
							</div>
							<!-- 2번째 칸 wrapper -->
						</div>
						<!-- 2번째 칸 row -->
					</div>
					<!-- 2번째 칸 -->

					<!-- 다음버튼 -->
					<div class="col-12" style="margin-top: -5%;">
						<div class="button text-center pb-50">
							<button id="nextbtn" type="submit"
								onclick="return CheckTest(); return CheckTime();"
								class="theme-btn" style="margin-left: 1150px;">다음</button>

						</div>
					</div>
				</div>
			</form>
			<!-- 전체 form 끝 -->
		</div>
		<!-- 전체 container 끝 -->
	</section>
	<script type="text/javascript">
		var today = new Date();
		//console.log(document.getElementById("date"));
		var dd = today.getDate();
		var mm = today.getMonth() + 1; //January is 0!
		var yyyy = today.getFullYear();

		if (dd < 10) {
			dd = '0' + dd;
		}

		if (mm < 10) {
			mm = '0' + mm;
		}

		today = yyyy + '-' + mm + '-' + dd;
		document.getElementById("date").setAttribute("min", today);
		/* 반려동물 체크박스 필수로 만들기 */
		function CheckTest() {
			var arrSelect = document.getElementsByName("pet_namelist");
			for (var i = 0; i < arrSelect.length; i++) {
				if (arrSelect[i].checked) {
					return true;
				}
			}
			alert("반려동물을 선택해주세요");
			return false;
		}

		function CheckTime() {
			var timeSelect = document.getElementById("service_starttime").value
			if (timeSelect == "선택") {
				alert("날짜를 선택해주세요")
				return false
			}
			return true;
		}
	</script>
</body>
</html>
