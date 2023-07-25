<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<h2 class="text-white">Pet's Page</h2>
						<div class="page-breadcrumb">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item" aria-current="page"><a href="/">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page"><a href="/pet/">${pet.pet_name }'s Page</a></li>
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
											<h4>
												<a type="button" href="/pet/mypet/read.do?pet_id=${pet.pet_id}&state=READ">${pet.pet_name}</a>
											</h4>
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
											<div class="contact-content">
												<h4>
													반려동물은 3마리 까지<br /> 등록 할 수 있어요!
												</h4>
												<p>
													<a type="button" href="/pet/menu/mypage/pet_register.do"
														class="theme-btn">+ 추가 등록</a>
												</p>
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
									<span class="wow fadeInDown" data-wow-delay=".2s">${user.name }님,
										안녕하세요!</span>
									<h2 class="wow fadeInUp" data-wow-delay=".4s">
										반려동물의 정보를<br />확인 해주세요!
									</h2>
								</div>
							</div>
						</div>
						<div class="contact-form">
							<div style="display: flex; position: relative;">
								<img src="/pet/resources/pet/${pet.pet_photo}" style="width: 100px; height: 100px; border-radius: 50%; object-fit: cover;">
							</div>
							<div>
								<fieldset>
										<legend>반려동물종 </legend>
										<c:choose>
											<c:when test="${pet.pet_code eq 'DOG'}">
												<div class="row">
													<div class="col-6">
														<div>
															<input type="text" id="DOG" placeholder="이름"
																value="강아지" disabled>
															<!-- <input type="radio" id="DOG" name="pet_code" value="DOG" required checked="checked"> 
															<input type="radio" id="CAT" name="pet_code" value="CAT" required> -->
														</div>
													</div>
													<!-- <div class="col-11" style="margin-left: -20px;">
														 <div>
															<label for="DOG" style="display: inline-block">강아지</label>
														</div> -
														<div class="col-11" style="margin-left: -2px;">
															<div style="padding-top: 17px;">
																<label for="CAT" style="display: inline-block">고양이</label>
															</div> 
														</div>
													</div> -->
												</div>
											</c:when>
											<c:otherwise>
												<div class="row">
													<div class="col-6">
														<div>
															<!-- <input type="radio" id="DOG" name="pet_code" value="DOG" required disabled> 
															<input type="radio" id="CAT" name="pet_code" value="CAT" required checked="checked" disabled> -->
															<input type="text" id="CAT" placeholder="이름"
																value="고양이" disabled>
														</div>
													</div>
													<!-- <div class="col-11" style="margin-left: -20px;">
														<div>
															<label for="DOG" style="display: inline-block">강아지</label>
														</div>
														<div class="col-11" style="margin-left: -2px;">
															<div style="padding-top: 17px;">
																<label for="CAT" style="display: inline-block">고양이</label>
															</div>
														</div>
													</div> -->
												</div>
											</c:otherwise>
										</c:choose>
									</fieldset>
							</div>

							<div class="row">
								<div class="col-md-6">
									<legend>이름</legend>
									<input type="text" name="pet_name" id="name" placeholder="이름"
										value="${pet.pet_name }" disabled>
								</div>

								<div>
									<fieldset>
										<legend>성별</legend>
										<c:choose>
											<c:when test="${pet.pet_gender=='M'}">
												<div class="row">
													<div class="col-6">
														<div>
															<!-- <input type="radio" id="gender_m" name="pet_gender"
																value="M" required checked="checked"> <input
																type="radio" id="gender_w" name="pet_gender" value="F"
																required> -->
															<input type="text" id="gender_m" placeholder="성별"
																value="남자아이" disabled>	
														</div>
													</div>
													<!-- <div class="col-11" style="margin-left: -20px;">
														<div>
															<label for="gender_m" style="display: inline-block">남자아이</label>
														</div>
														<div class="col-11" style="margin-left: -2px;">
															<div style="padding-top: 17px;">
																<label for="gender_w" style="display: inline-block">여자아이</label>
															</div>
														</div>
													</div> -->
												</div>
											</c:when>
											<c:otherwise>
												<div class="row">
													<div class="col-6">
														<div>
															<!-- <input type="radio" id="gender_m" name="pet_gender"
																value="M" required> <input type="radio"
																id="gender_w" name="pet_gender" value="F" required
																checked="checked"> -->
															<input type="text" id="gender_f" placeholder="성별"
																value="여자아이" disabled>		
														</div>
													</div>
													<!-- <div class="col-11" style="margin-left: -20px;">
														<div>
															<label for="gender_m" style="display: inline-block">남자아이</label>
														</div>
														<div class="col-11" style="margin-left: -2px;">
															<div style="padding-top: 17px;">
																<label for="gender_w" style="display: inline-block">여자아이</label>
															</div>
														</div>
													</div> -->
												</div>
											</c:otherwise>
										</c:choose>
									</fieldset>
								</div>

								<div class="row">
									<div class="col-md-6">
										<legend>생일</legend>
										<input type="text" name="birth" id="birth" placeholder="생일"
											value="${pet.pet_birthdate }" disabled="disabled">
										<legend>품종</legend>
										<input type="text" name="kind" id="kind" placeholder="품종"
											value="${pet.pet_kind }" disabled>
										<legend>몸무게(kg)</legend>

											<input type="text" name="weight" id="weight" placeholder="몸무게" value="${pet.pet_weight }" disabled>
										
										<c:if test="${pet.pet_size eq 'S' }">
											<legend>크기</legend>
											<input type="text"  value="소형견" disabled>
										</c:if>	
										<c:if test="${pet.pet_size eq 'M' }">
											<legend>크기</legend>
											<input type="text" value="중형견" disabled>
										</c:if>
										<c:if test="${pet.pet_size eq 'L' }">
											<legend>크기</legend>
											<input type="text" value="대형견" disabled>
										</c:if>
											<input type="hidden" name="pet_size" id="size" value="${pet.pet_size }" >
				

									</div>

									<div>
										<fieldset>
											<legend>중성화</legend>
											<c:choose>
												<c:when test="${pet.neuter=='Y'}">
													<div class="row">
														<div class="col-1">
															<div>
																<input type="radio" id="neutral_y" name="neuter"
																	value="Y" disabled="disabled" checked="checked">
																<input type="radio" id="neutral_n" name="neuter"
																	value="N" disabled="disabled">
															</div>
														</div>
														<div class="col-11">
															<label for="neutral_y"
																style="display: inline-block; padding-bottom: 15px">중성화
																했어요</label><br /> <label for="neutral_n"
																style="display: inline-block">아직 안했어요</label>
														</div>
													</div>
												</c:when>
												<c:otherwise>
													<div class="row">
														<div class="col-1">
															<div>
																<input type="radio" id="neutral_y" name="neuter"
																	value="Y" disabled="disabled"> <input
																	type="radio" id="neutral_n" name="neuter" value="N"
																	disabled="disabled" checked="checked">
															</div>
														</div>
														<div class="col-11">
															<label for="neutral_y"
																style="display: inline-block; padding-bottom: 15px">중성화
																했어요</label><br /> <label for="neutral_n"
																style="display: inline-block">아직 안했어요</label>
														</div>
													</div>
												</c:otherwise>
											</c:choose>
										</fieldset>
									</div>

									<div class="row">
										<div class="col-12">
											<h4>기타 참고사항</h4>
											<textarea name="pet_note" id="message" placeholder="기타 참고사항"
												rows="5" disabled>${pet.pet_note}</textarea>
										</div>
									</div>
								</div>
								

								<div class="row">
									<div class="col-12">
										<div class="button text-center">
											<a type="button" class="theme-btn"
												href="/pet/mypet/read.do?pet_id=${pet.pet_id}&state=UPDATE">수정</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>

