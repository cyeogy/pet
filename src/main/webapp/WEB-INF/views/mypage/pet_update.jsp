<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>

<html class="no-js" lang="ko">
<head>
	<meta charset="utf-8">
	<title>pet</title>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>	
	<style type="text/css">
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

			$("#edit").on("click", function(){
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
									<li class="breadcrumb-item" aria-current="page"><a href="/">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page"><a href="/pet/"></a>${pet.pet_name}'s Update Page</li>
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
				<div class="col-xl-2">
					<div class="contact-item-wrapper">
						<div class="row">
							<!-- 동물 정보 시작 -->
<%-- 							<c:choose> --%>
<%-- 								<c:when test="${fn:length(mypetlist)}=0 "> --%>
<!-- 									<div class="col-12 col-md-6 col-xl-12"> -->
<!-- 									<div class="contact-item"> -->
<!-- 										<div class="contact-icon"> -->
<%-- 											<img src="/pet/resources/pet/${pet.pet_photo }" style="width: 50px; height: 50px; border-radius: 50%; object-fit: cover;"> --%>
<!-- 										</div> -->
<!-- 										<div class="contact-content"> -->
<!-- 											<h4> -->
<%-- 												<a type="button" href="/pet/pet/read.do?pet_id=${pet.pet_id}&state=READ">${pet.pet_name} --%>
<%-- 												${user.name} 님의 귀여운 아이를 등록 해주세요!</a> --%>
<!-- 											</h4> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<%-- 								</c:when> --%>
<%-- 								<c:otherwise> --%>
<%-- 									<c:forEach var="pet" items="${mypetlist}" varStatus="status"> --%>
<!-- 										<div class="col-12 col-md-6 col-xl-12"> -->
<!-- 											<div class="contact-item"> -->
<!-- 												<div class="contact-icon"> -->
<%-- 													<img src="/pet/resources/pet/${pet.pet_img}" style="width: 50px; height: 50px; border-radius: 50%; object-fit: cover;"> --%>
<!-- 												</div> -->
<!-- 												<div class="contact-content"> -->
<%-- 													<h4><a type="button" href="/pet/mypet/read.do?pet_id=${pet.pet_id}&state=READ">${pet.pet_name}</a></h4> --%>
<%-- 													<p>${pet.pet_code}</p> --%>
<%-- 													<p>${pet.pet_kind}</p> --%>
<%-- 													<p><a type="button" href="/pet/mypet/delete.do?pet_id=${pet.pet_id}&member_id=${user.member_id}">삭제</a></p> --%>
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<%-- 									</c:forEach> --%>
<%-- 								</c:otherwise> --%>
<%-- 							</c:choose> --%>
							<!-- 동물 정보 끝 -->
						</div>
					</div>
				</div>
				
				<div class="col-xl-8">
					<div class="contact-form-wrapper">
						<div class="row">
							<div class="col-xl-10 col-lg-8 mx-auto">
								<div class="section-title text-center mb-50">
									<span class="wow fadeInDown" data-wow-delay=".2s">반려동물의 정보를<br>확	인하고 수정해주세요</span>
									<h2 class="wow fadeInUp" data-wow-delay=".4s">${user.name}님, 안녕하세요!</h2>
								</div>
							</div>
						</div>
						<form action="/pet/mypet/update.do?member_id=${user.member_id}" method="post" class="contact-form" enctype="multipart/form-data">
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
								<!-- <label for="prod1">반려동물 종류</label>
								<select name=pet_code id="prod1">
									<option value="DOG" selected>강아지</option>
									<option value="CAT">고양이</option>
								</select> -->
								<fieldset>
										<legend>반려동물종 </legend>
										<c:choose>
											<c:when test="${pet.pet_code eq 'DOG'}">
												<div class="row">
													<div class="col-1">
														<div  style="cursor: pointer;">
															<input type="radio" id="DOG" name="pet_code" value="DOG" required checked="checked"> 
															<input type="radio" id="CAT" name="pet_code" value="CAT" required>
														</div>
													</div>
													<div class="col-11" style="margin-left: -20px;">
														<div>
															<label for="DOG" style="display: inline-block;  cursor: pointer;">강아지</label>
														</div>
														<div class="col-11" style="margin-left: -2px;">
															<div style="padding-top: 17px;">
																<label for="CAT" style="display: inline-block; cursor: pointer;">고양이</label>
															</div>
														</div>
													</div>
												</div>
											</c:when>
											<c:otherwise>
												<div class="row">
													<div class="col-1">
														<div>
															<input type="radio" id="DOG" name="pet_code" value="DOG" required> 
															<input type="radio" id="CAT" name="pet_code" value="CAT" required checked="checked">
														</div>
													</div>
													<div class="col-11" style="margin-left: -20px;">
														<div>
															<label for="DOG" style="display: inline-block; cursor: pointer;">강아지</label>
														</div>
														<div class="col-11" style="margin-left: -2px;">
															<div style="padding-top: 17px;">
																<label for="CAT" style="display: inline-block; cursor: pointer;">고양이</label>
															</div>
														</div>
													</div>
												</div>
											</c:otherwise>
										</c:choose>
									</fieldset>
							</div>
							
							<div class="row">
								<div class="col-md-6">
									<legend>이름</legend>
									<input type="text" name="pet_name" id="name" placeholder="이름" value="${pet.pet_name}" required>
								</div>

								<div>
									<fieldset>
										<legend>성별 </legend>
										<c:choose>
											<c:when test="${pet.pet_gender == 'M'}">
												<div class="row">
													<div class="col-1">
														<div>
															<input type="radio" id="gender_m" name="pet_gender" value="M" required checked="checked"> 
															<input type="radio" id="gender_w" name="pet_gender" value="F" required>
														</div>
													</div>
													<div class="col-11" style="margin-left: -20px;">
														<div>
															<label for="gender_m" style="display: inline-block; cursor: pointer;">남자아이</label>
														</div>
														<div class="col-11" style="margin-left: -2px;">
															<div style="padding-top: 17px;">
																<label for="gender_w" style="display: inline-block; cursor: pointer;">여자아이</label>
															</div>
														</div>
													</div>
												</div>
											</c:when>
											<c:otherwise>
												<div class="row">
													<div class="col-1">
														<div>
															<input type="radio" id="gender_m" name="pet_gender" value="M" required> 
															<input type="radio" id="gender_w" name="pet_gender" value="F" required checked="checked">
														</div>
													</div>
													<div class="col-11" style="margin-left: -20px;">
														<div>
															<label for="gender_m" style="display: inline-block; cursor: pointer;">남자아이</label>
														</div>
														<div class="col-11" style="margin-left: -2px;">
															<div style="padding-top: 17px;">
																<label for="gender_w" style="display: inline-block; cursor: pointer;">여자아이</label>
															</div>
														</div>
													</div>
												</div>
											</c:otherwise>
										</c:choose>
									</fieldset>
								</div>
								
								<!-- 남자아이 -->
								<div class="row">
									<div class="col-md-6">
										<legend>생일</legend>
										<input type="text" name="pet_birthdate" id="birth" placeholder="생일" value="${pet.pet_birthdate}" required>
										<legend>품종</legend>
										<input type="text" name="pet_kind" id="kind" placeholder="품종" value="${pet.pet_kind}" required>
										<legend>몸무게(kg)</legend>
										<input type="text" name="pet_weight" id="weight" placeholder="몸무게" value="${pet.pet_weight}" required>
										<legend>크기</legend>
										<c:if test="${pet.pet_size eq 'S' }">
											<input type="text" value="소형견">
										</c:if>	
										<c:if test="${pet.pet_size eq 'M' }">
											<input type="text" value="중형견">
										</c:if>
										<c:if test="${pet.pet_size eq 'L' }">
											<input type="text" value="대형견">
										</c:if>
										
											<input type="hidden" name="pet_size" id="pet_size" value="${pet.pet_size }" >
										
										
									</div>

									<div>
										<fieldset>
											<legend>중성화</legend>
											<c:choose>
												<c:when test="${pet.neuter=='Y'}">
													<div class="row">
														<div class="col-1">
															<div>
																<input type="radio" id="neutral_y" name="neuter" value="Y" required checked="checked" style="cursor: pointer;">  
																<input type="radio" id="neutral_n" name="neuter" value="N" required style="cursor: pointer;">
															</div>
														</div>
														<div class="col-11">
															<label for="neutral_y" style="display: inline-block; padding-bottom: 15px; cursor: pointer;">중성화 했어요</label><br/>
															<label for="neutral_n" style="display: inline-block; cursor: pointer;">아직 안했어요</label>
														</div>
													</div>
												</c:when>
												<c:otherwise>
													<div class="row">
														<div class="col-1">
															<div>
																<input type="radio" id="neutral_y" name="neuter" value="Y" required style="cursor: pointer;"> 
																<input type="radio" id="neutral_n" name="neuter" value="N" required checked="checked" style="cursor: pointer;">
															</div>
														</div>
														<div class="col-11">
															<label for="neutral_y" style="display: inline-block; padding-bottom: 15px; cursor: pointer;">중성화 했어요</label><br/>
															<label for="neutral_n" style="display: inline-block; cursor: pointer;">아직 안했어요</label>
														</div>
													</div>
												</c:otherwise>
											</c:choose>
										</fieldset>
									</div>

									<div class="row">
										<div class="col-12">
											<h4>기타 참고사항</h4>
											<textarea name="pet_note" id="message" placeholder="기타 참고사항" rows="5">${pet.pet_note }</textarea>
										</div>
									</div>
								</div>
								
							<!-- hidden start -->
								<input type="hidden" name="pet_id"  value="${pet.pet_id}">
								<input type="hidden" name="pet_number" value="${pet.pet_number}">
								<input type="hidden" name="pet_photo" value="${pet.pet_photo}">
							<!-- hidden end -->
								
								<div class="row">
									<div class="col-12">
										<div class="button text-center">
											<button id="edit" type="submit" class="theme-btn">확인</button>
											<a type="button" class="theme-btn" href="/pet/mypet/read.do?pet_id=${pet.pet_id}&state=READ">취소</a>
											<a type="button" class="theme-btn" href="/pet/mypet/delete.do?pet_id=${pet.pet_id}&member_id=${user.member_id}">삭제</a>
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
