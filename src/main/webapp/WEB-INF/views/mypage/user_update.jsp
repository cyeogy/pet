<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                        <li class="breadcrumb-item active" aria-current="page">${user.name}님</li>
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
                	<!-- 사이드 메뉴 -->
                    <div class="col-xl-3">
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
												<h4><a type="button" href="/pet/pet/read.do?pet_id=${pet.pet_id}&state=READ">${pet.pet_name}</a></h4>
												<p>${pet.pet_code}</p>
												<p>${pet.pet_kind}</p>
											</div>
										</div>
									</div>
								</c:forEach>
								<!-- 동물 정보 끝 -->
                            </div>
                        </div>
                    </div>
                    <!-- 사이드 메뉴 끝 -->
                    <!-- 유저 정보 -->
                    <div class="col-xl-9 pb-150">
                        <div class="contact-form-wrapper">
                            <div class="row">
                                <div class="col-xl-10 col-lg-8 mx-auto">
                                    <div class="section-title text-center mb-50">
                                        <span class="wow fadeInDown" data-wow-delay=".2s">${member.member_name} 님, 안녕하세요!</span>
                                        <h2 class="wow fadeInUp" data-wow-delay=".4s">이용자님의 정보를 입력하고<br> 수정해주세요</h2>
                                    </div>
                                </div>
                            </div>
                            <form action="/pet/erp/member/update.do" method="post" class="contact-form">
                                <div class="row">
                                    <div class="col-lg-8 mx-auto">
                                    	이름 : <input type="text" name="member_name" id="name" placeholder="이름" value="${member.member_name}" disabled="disabled">
                                    </div>
                                    <div class="col-lg-8 mx-auto">
			                        	성별 : 
			                        	<c:choose>
				                        	<c:when test="${member.member_gender == 'F'}">
				                        		<div class="form-check form-check-inline">
												  <input class="form-check-input" type="radio" name="member_gender" id="genderm" value="M" disabled="disabled">
												  <label class="form-check-label" for="inlineRadio1">남자</label>
												</div>
												<div class="form-check form-check-inline">
												  <input class="form-check-input" type="radio" name="member_gender" id="genderw" value="F" checked="checked" disabled="disabled">
												  <label class="form-check-label" for="inlineRadio2">여자</label>
												</div>
				                        	</c:when>
				                        	<c:otherwise>
				                        		<div class="form-check form-check-inline">
												  <input class="form-check-input" type="radio" name="member_gender" id="genderm" value="M" checked="checked" disabled="disabled">
												  <label class="form-check-label" for="inlineRadio1">남자</label>
												</div>
												<div class="form-check form-check-inline">
												  <input class="form-check-input" type="radio" name="member_gender" id="genderw" value="F" disabled="disabled">
												  <label class="form-check-label" for="inlineRadio2">여자</label>
												</div>
				                        	</c:otherwise>
			                        	</c:choose>
			                        </div>
                                    <div class="col-lg-8 mx-auto">
                                    	이메일 : <input class="col-lg-2" type="email" name="member_email" id="email" placeholder="Email" value="${member.member_email}" required>
                                    </div>
                                    <div class="col-lg-8 mx-auto">
                                    	연락처 : <input type="tel" name="member_phone" oninput="autoHyphen(this)" maxlength="13" placeholder="숫자만 입력해주세요" value="${member.member_phone}" autofocus>
                                    </div>
                                    
                                    <div class="col-lg-8 mx-auto">
                                    	생일: <input type="date" name="member_birthdate" id="birthdate" placeholder="생일" value="${member.member_birthdate}" required> 
                                    </div>
                                    <div class="col-lg-8 mx-auto">
                                    	주소: <input type="text" name="member_addr1" id="addr1" placeholder="주소" value="${member.member_addr1}" required> 
                                    </div>
                                    <div class="col-lg-8 mx-auto">
                                    	상세 주소: <input type="text" name="member_addr2" id="addr2" placeholder="상세 주소" value="${member.member_addr2}" required> 
                                    </div>

                                   	<div class="col-lg-8 mx-auto row">
										<h4>주로 다니는 병원의 이름과 주소</h4>
										<div class="col-lg-4">
											<input type="text" name="hospital_name" id="hospital_name" placeholder="동물병원 이름" value="${member.hospital_name}" required="required">
										</div>
										<div class="col-lg-8">
											<input type="text" name="hospital_addr" id="hospital_addr" placeholder="동물병원 주소" value="${member.hospital_addr}" required="required">
										</div>
									</div>

									<!-- hidden start -->
                                    <input type="hidden" name="member_id" value="${member.member_id}">
                                </div>
                                
                                <div class="row">
                                    <div class="button text-center">
                                        <button type="submit" class="theme-btn">확인</button>
                                        <a type="button" class="theme-btn" href="/pet/erp/member/read.do?member_id=${member.member_id}&state=READ">취소</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                     </div> 
                <!-- </div> -->
            </div>
            </div>
        </section>
        <!-- ========================= contact-section end ========================= -->
    </body>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		document.getElementById("addr1").addEventListener("click", function() {
			new daum.Postcode({
				oncomplete: function(data) {
		        document.getElementById("addr1").value = data.address;
		        document.querySelector("input[id=addr2]").focus();
		        }
		    }).open();
		});
		
		document.getElementById("hospital_addr").addEventListener("click", function() {
			new daum.Postcode({
				oncomplete: function(data) {
		        document.getElementById("hospital_addr").value = data.address;
		        }
		    }).open();
		});
		

		const autoHyphen = (target) => {
			target.value = target.value
		   .replace(/[^0-9]/g, '')
		   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
		}
	</script>
	