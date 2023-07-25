<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html class="no-js" lang="ko">
<head>
	<meta charset="utf-8">
	<title>user</title>
</head>
<body>
<!-- ========================= page-banner-section start ========================= -->
<section class="page-banner-section pt-75 pb-75 img-bg" style="background-image: url('/pet/resources/assets/img/bg/common-bg.svg')">
    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <div class="banner-content">
                    <h2 class="text-white">Client's Page</h2>
                    <div class="page-breadcrumb">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item" aria-current="page"><a href="/pet">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">${member.member_id}님</li>
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
<section class="contact-section pt-130">
	<div class="container">
	<div class="row">
		<div class="col-xl-3">
			<div class="contact-item-wrapper">
				<div class="row">
					<!-- 동물 정보 시작 -->
					
					
					<c:forEach var="pet" items="${mypetlist}" varStatus="status">
						<div class="col-12 col-md-6 col-xl-12">
							
							<div class="contact-item">
								<div class="contact-icon">
									<img src="/pet/resources/pet/${pet.pet_photo}" style="width: 50px; height: 50px; border-radius: 50%; object-fit: cover;">
								</div>
								<div class="contact-content">
									<h4><a type="button" href="/pet/mypet/read.do?pet_id=${pet.pet_id}&member_id=${member.member_id}&state=READ">${pet.pet_name}</a></h4>
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
									<div class="contact-content">
										<h4>우리 귀여운 반려동물을<br/> 등록 해주세요!</h4>
										<p><a type="button" href="/pet/menu/mypage/pet_register.do" class="theme-btn">+ 추가 등록</a></p>
									</div>
								</div>
							</div>
						</c:when>
					</c:choose>
					
					<!-- 예약 정보 시작 -->
					<c:choose>
						<c:when test="${fn:length(resvlist) == 0}">
							<div class="col-12 col-md-6 col-xl-12">
								<div class="contact-item">
									<div class="contact-icon">
										<i class="lni lni-alarm-clock"></i>
									</div>
									<div class="contact-content">
										<h4><a href="/pet/menu/reserve/resv1_mb.do">예약 시작하기!</a></h4>
										<p><a href="/pet/menu/reserve/resv1_mb.do">+ 추가 등록</a></p>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="col-12 col-md-6 col-xl-12">
								<div class="contact-item">
									<div class="contact-icon">
										<i class="lni lni-alarm-clock"></i>
									</div>
									<div class="contact-content">
										<h4><a href="/pet/reserve/list.do">예약 확인하기!</a></h4>
										<%-- <c:forEach var="resv" items="${resvlist}" varStatus="status">
											<p><a href="/pet/reserve/list.do">${resv.sitter_id}</a></p>
										</c:forEach> --%>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
					<!-- 예약 정보 끝 -->
				</div>
			</div>
		</div>
		         
	         <div class="col-xl-9 pb-150">
	             <div class="contact-form-wrapper">
	                 <div class="row">
	                     <div class="col-xl-10 col-lg-8 mx-auto">
	                         <div class="section-title text-center mb-50">
	                            <span class="wow fadeInDown" data-wow-delay=".2s">계묘년 새해 복 많이 받으세요!</span>
	                            <h2 class="wow fadeInUp" data-wow-delay=".4s">${member.member_name}님, 안녕하세요!</h2>
	                        </div>
	                    </div>
	                </div>
		                
	                <div class="contact-form">
	                    <div class="row">
	                        <div class="col-lg-8">
	                        	이름 : <input type="text" name="name" id="name" placeholder="이름" value="${member.member_name}" disabled>
	                        </div>
	                        
	                        <div class="col-lg-8">
	                        	성별 : 
	                        	<c:choose>
		                        	<c:when test="${member.member_gender == 'F'}">
		                        		<div class="form-check form-check-inline">
										  <input class="form-check-input" type="radio" name="gender" id="genderm" value="M" disabled="disabled">
										  <label class="form-check-label" for="inlineRadio1">남자</label>
										</div>
										<div class="form-check form-check-inline">
										  <input class="form-check-input" type="radio" name="gender" id="genderw" value="F" checked="checked" disabled="disabled">
										  <label class="form-check-label" for="inlineRadio2">여자</label>
										</div>
		                        	</c:when>
		                        	<c:otherwise>
		                        		<div class="form-check form-check-inline">
										  <input class="form-check-input" type="radio" name="gender" id="genderm" value="M" checked="checked" disabled="disabled">
										  <label class="form-check-label" for="inlineRadio1">남자</label>
										</div>
										<div class="form-check form-check-inline">
										  <input class="form-check-input" type="radio" name="gender" id="genderw" value="F" disabled="disabled">
										  <label class="form-check-label" for="inlineRadio2">여자</label>
										</div>
		                        	</c:otherwise>
	                        	</c:choose>
	                        </div>
	                        
	                        <div class="col-lg-8">
	                        	이메일 : <input class="col-lg-2" type="email" name="email" id="email" placeholder="Email" value="${member.member_email}" disabled>
	                        </div>
	                        <div class="col-lg-8">
	                        	연락처 : <input type="tel" name="phone" id="phone" placeholder="연락처" value="${member.member_phone}" disabled>
	                        </div>
                            <div class="col-lg-8">
                              	생일: <input type="date" name="member_birthdate" id="birthdate" placeholder="생일" value="${member.member_birthdate}" disabled> 
                            </div>
	                        <div class="col-lg-8">
	                        	주소: <input type="text" name="addr1" id="addr1" placeholder="주소" value="${member.member_addr1}" disabled> 
	                        </div>
	                        <div class="col-lg-8">
	                        	상세 주소: <input type="text" name="addr2" id="addr2" placeholder="상세 주소" value="${member.member_addr2}" disabled> 
	                        </div>
	                        	
							<div class="col-lg-12 row">
								<h4>주로 다니는 병원의 이름과 주소</h4>
								<div class="col-lg-5">
									<input type="text" name="hospital_name" id="hospital_name" placeholder="동물병원 이름" value="${member.hospital_name}" disabled>
								</div>
								<div class="col-lg-7">
									<input type="text" name="hospital_addr" id="hospital_addr" placeholder="동물병원 주소" value="${member.hospital_addr}" disabled>
								</div>
							</div>
	                        
	                        <div class="col-12">
	                            <div class="button text-center">
	                                <a type="button" class="theme-btn" href="/pet/erp/member/read.do?member_id=${member.member_id}&state=UPDATE">수정</a>
	                            </div>
	                        </div>
	                        
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</section>
<!-- ========================= contact-section end ========================= -->
</body>
</html>
