<%@page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html class="no-js" lang="ko">
<head>
	<meta charset="utf-8">
	<title>pet</title>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>	
	<style type="text/css">
		/* SECTION - BIRTH */
		.info#info__birth { display: flex; }
		
		.info#info__birth select { margin-left : 7px; } .info#info__birth
		select:first-child { margin-left : 0px; }
		.info#info__birth select::-webkit-scrollbar {
		  width: 10px;
		}
		
		.info#info__birth select::-webkit-scrollbar-thumb {
		  background-color: #b6b6b6;
		  border-radius: 3px;
		}
		
		.info#info__birth select::-webkit-scrollbar-track {
		  background-color: #ebe9e9;
		  border-radius: 6px;
		}	
	</style>
	<script>
		$(document).ready(function() {
			$("#submit").on("click", function(){
				weight = $("input[name=pet_weight]").val()
				petcode = $('input:radio[name=pet_code]:checked').val();
				if(petcode == 'DOG'){
					if(weight <= 7){
						$("#pet_size").prop("value", "S")
					}else if(7<weight && weight <= 15){
						$("#pet_size").prop("value", "M")
					}else{
						$("#pet_size").prop("value", "L")
					}
				}else{
					$("#pet_size").prop("value", "C")
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
					<h2 class="text-white">Pet's Page</h2>
					<div class="page-breadcrumb">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item" aria-current="page"><a href="/pet/">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page"><a href="#">Pet Register' Page</a></li>
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
<section class="contact-section pt-100 pb-100">
	<div class="container">
		<div class="row">
			<div class="col-xl-4">
				<div class="contact-item-wrapper">
					<div class="row">
						<!-- 동물 정보 시작 -->
						
						<c:forEach var="pet" items="${mypetlist}" varStatus="status">
							<div class="col-12 col-md-6 col-xl-12">
								<div class="contact-item">
									<div class="contact-icon">
										<img src="/pet/resources/pet/${pet.pet_photo }" style="width: 50px; height: 50px; border-radius: 50%; object-fit: cover;">
									</div>
									<div class="contact-content">
										<h4><a type="button"  href="/pet/mypet/read.do?pet_id=${pet.pet_id}&state=READ">${pet.pet_name}</a></h4>
										<p>${pet.pet_code}</p>
										<p>${pet.pet_kind}</p>
									</div>
								</div>
							</div>
						</c:forEach>
						<!-- 동물 정보 끝 -->
						<c:choose>
							<c:when test="${fn:length(mypetlist) != 3}">
								<div class="col-12 col-md-6 col-xl-12">
									<div class="contact-item">
										<div class="contact-icon">
											<img src="">
										</div>
									</div>
								</div>
							</c:when>
						</c:choose>
						<!-- 동물 정보 끝 -->
					</div>
				</div>
			</div>
			<div class="col-xl-8">
				<div class="contact-form-wrapper">
					<div class="row">
						<div class="col-xl-10 col-lg-8 mx-auto">
							<div class="section-title text-center mb-50">
								<span class="wow fadeInDown" data-wow-delay=".2s">${user.name }님, 안녕하세요!</span>
								<h3 class="wow fadeInUp" data-wow-delay=".4s">반려동물은 세 마리까지<br/>등록 가능 해요!</h3>
							</div>
						</div>
					</div>
					<form method="post" class="contact-form" action="/pet/mypet/insert.do" enctype="multipart/form-data">
						<div class="container pb-50">
							<div class="col-md-12">
								 <div class="thumbnail">
								 	 <div style="display: flex; position: relative;">
										<img src="/pet/resources/pet/${pet.pet_photo}" id="userImage" width="220" height="150" style="width: 100px; height: 100px; border-radius: 50%; object-fit: cover;">
									 </div>
									 <div class="col-4 pt-30">
									 	<input type="file" name="pet_img" id="myfile" placeholder="사진을 등록해주세요" onchange="document.getElementById('userImage').src = window.URL.createObjectURL(this.files[0])" accept="image/*">
									 </div>
								 </div>
						  	</div>


						<div>
							<fieldset>
								<legend>반려동물 종류</legend>
								<div class="row">
									<div class="col-1">
										<div>
											<input type="radio" id="code_d" name="pet_code" value="DOG" checked> 
											<input type="radio" id="code_c" name="pet_code" value="CAT" >
										</div>
									</div>
									<div class="col-11" style="margin-left: -20px;">
										<div>
											<label for="code_d" style="display: inline-block">강아지</label>
										</div>
										<div class="col-11" style="margin-left: -2px;">
											<div style="padding-top: 15px;">
												<label for="code_c" style="display: inline-block">고양이</label>
											</div>
										</div>
									</div>
								</div>
							</fieldset>
						</div>
						
						<div class="row">
							<div class="col-md-6">
								<legend>반려동물 이름</legend>
								<input type="text" name="pet_name" id="name" placeholder="ex) 탄이" required="required">
							</div>

							<div>
								<fieldset>
									<legend>성별</legend>
									<div class="row">
										<div class="col-1">
											<div>
												<p></p>
												<input type="radio" id="gender_m" name="pet_gender" value="M" required> 
												<input type="radio" id="gender_w" name="pet_gender" value="F" checked required>
											</div>
										</div>
										<div class="col-11" style="margin-left: -20px;">
											<div>
												<label for="gender_m" style="display: inline-block">남자아이</label>
											</div>
											<div class="col-11" style="margin-left: -2px;">
												<div style="padding-top: 17px;">
													<label for="gender_w" style="display: inline-block">여자아이</label>
												</div>
											</div>
										</div>
									</div>
								</fieldset>
							</div>
							
							<div class="row">
								<div class="col-md-6">
									<legend>생일</legend>
										<input type="text" name="pet_birthdate" id="birth" placeholder="ex) 2013-10-25" required>
									<legend>품종</legend>
										<input type="text" name="pet_kind" id="kind" placeholder="ex) 토이푸들" required>
									<legend>몸무게 (kg)</legend>
										<input type="text" name="pet_weight" id="weight" placeholder="ex) 1.5 (단위는 생략해주세요)" required>

										<input type="hidden" name="pet_size" id="pet_size" value="">
									
								</div>

								<div>
									<fieldset>
										<legend>중성화</legend>
										<div class="row">
											<div class="col-1">
												<div>
													<input type="radio" id="neutral_y" name="neuter" value="Y" required="required" checked="checked"> 
													<input type="radio" id="neutral_n" name="neuter" value="N" required="required">
												</div>
											</div>
											<div class="col-11" style="margin-left: -20px;">
												<div>
													<label for="neutral_y" style="display: inline-block">중성화 했어요</label>
												</div>
												<div class="col-11" style="margin-left: -2px;">
													<div style="padding-top: 17px;">
														<label for="neutral_n" style="display: inline-block">아직 안했어요</label>
													</div>
												</div>
											</div>
										</div>
									</fieldset>
								</div>

								<div class="row">
									<div class="col-12">
										<h4>기타 참고사항</h4>
										<textarea name="pet_note" id="message" placeholder="ex) 처음 보는 사람을 무서워해요." rows="3" required></textarea>
									</div>
								</div>
							</div>
							
						<!-- hidden start -->
							<input type="hidden" name="pet_id" value="${user.member_id}_pet_${fn:length(mypetlist)+1}">							
							<input type="hidden" name="member_id" value="${user.member_id}">
							<input type="hidden" name="pet_number" value="${fn:length(mypetlist)+1}">
							<input type="hidden" name="pet_photo" value="${pet.pet_photo}">
						<!-- hidden end -->

							<div class="row">
								<div class="col-12">
									<div class="button text-center">
										<button type="submit" id="submit" class="theme-btn">등록</button>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>
</section>
</body>
</html>
