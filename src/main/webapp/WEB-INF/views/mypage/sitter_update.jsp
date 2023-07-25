<%@page import="mutli.com.pet.erp.SitterDTO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="ko">
<link rel="stylesheet" href="/pet/resources/assets/css/awesome-bootstrap-checkbox.css">
    <head>
        <meta charset="utf-8">
        <title>sitter</title>
        <style>
        	input[type=checkbox] {
        		margin-left: -50%;
        		margin-right: 10px;
        		cursor: pointer;
        		width: 12px;
        	}
        	label {
        		margin-left: -50%; 
        		margin-right: 15px;
        		cursor: pointer;
        	}
        	.narrow {
        		float: left;
        	}
        </style>
    </head>
    <body>
        <!-- ========================= page-banner-section start ========================= -->
        <section class="page-banner-section pt-75 pb-75 img-bg" style="background-image: url('/pet/resources/assets/img/bg/common-bg.svg')">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="banner-content">
                            <h2 class="text-white">Pet Sitter's Page </h2>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item" aria-current="page"><a href="/pet">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">page</li>
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
                                <!-- 자격증 시작 -->
                                <div class="col-12 col-md-6 col-xl-12">
<!--                                     <div class="contact-item"> -->
<!--                                         <div class="contact-icon"> -->
<!--                                             <i class="lni lni-alarm-clock"></i> -->
<!--                                         </div> -->
<!--                                         <div class="contact-content"> -->
<!--                                             <h4>자격증</h4> -->
<%-- 	                                            <% --%>
<!-- // 										    		SitterDTO sitter = (SitterDTO) session.getAttribute("sitter"); -->
<!-- // 		                                   	   		if(sitter.getSitter_certificate() != null){ -->
<!-- // 		                                   	   		String[] certificate = sitter.getSitter_certificate().split(","); -->
<!-- // 		                                   	   		int size = certificate.length; -->
<%-- 		                                   	   		for(int i = 0; i < size; i++){%> --%>
<%-- 		                                   	   		<input name = "sitter_certificate" value="<%=certificate[i] %>"> --%>
<%-- 	                                   	   		<%}}%> --%>
<!-- 	                                            <form action="/pet/erp/sitter/certi_update.do" class="contact-form" method="post"> -->
<!-- 	                                            <div class="pb-30" id="sitter_certificate"> -->
<!-- 		                                            <input type="text" name="sitter_certificate" placeholder="자격증 등록" value="" > -->
<%-- 		                                            <input type="hidden" name="sitter_id" value="${sitter.sitter_id}"> --%>
<!-- 	                                            </div> -->
<!-- 	                                            <div> -->
<!-- 		                                            <button id="certi" type="button" class=" btn btn-outline-primary wide seoul" onclick="add()">추가 등록</button> -->
<!-- 		                                            <button id="certi_update" type="submit" class=" btn btn-outline-primary wide seoul">확인</button> -->
<!-- 		                                            <button type="button" class=" btn btn-outline-primary wide seoul" onclick="window.open('http://www.kkc.or.kr/service/service_05.html')">자격증 따기</button> -->
<!-- 	                                            </div> -->
	                                            
<!--                                             </form> -->
<!--                                         </div> -->
<!--                                     </div> -->
                                </div>
                                <!-- 자격증 끝 -->
                            </div>
                        </div>
                    </div>
                    
                    <!-- 시터 정보 시작 -->
                    <div class="col-xl-8">
                        <div class="contact-form-wrapper">
                        	<!-- 시터 인사 시작 -->
                            <div class="row">
                                <div class="col-xl-10 col-lg-8 mx-auto">
                                    <div class="section-title text-center mb-50">
                                        <span class="wow fadeInDown" data-wow-delay=".2s">${sitter.sitter_name}님, 안녕하세요!</span>
                                        <h2 class="wow fadeInUp" data-wow-delay=".4s">시터님의 정보를 입력하고 <br>수정해주세요</h2>
                                    </div>
                                </div>
                            </div>
                            <!-- 시터 인사 끝 -->
                            
                            <!-- 시터 정보 시작 -->
	                            <form action="/pet/erp/sitter/update.do" class="contact-form" method="post" enctype="multipart/form-data">
                               	 	<div class="row align-middle">
                                    	 <div class="col-md-auto"><h4>프로필 사진</h4></div>
				                      	 <div class="col-md-12">
											 <div class="thumbnail">
												 <img src="/pet/resources/sitter/${sitter.sitter_photo}" id="userImage" width="220" height="150">
												 <div class="col-4 pt-30">
												 	<input type="hidden" name="sitter_photo" value="${sitter.sitter_photo}">
												 	<input type="file" name="sitter_img" id="myfile" placeholder="사진을 등록해주세요" onchange="document.getElementById('userImage').src = window.URL.createObjectURL(this.files[0])" accept="image/*">
												 </div>
											 </div>
									  	 </div>
                                    </div>
                                    
                               	 	<div class="row align-items-center">
                                    	<div class="col-md-auto"><h4>이름</h4></div>
                                    	<div class="col-md-auto">
                                        	<input type="text" name="sitter_name" id="name" placeholder="이름" value="${sitter.sitter_name}" disabled="disabled">
                                        </div>
                                    </div>
                                    
                               	 	<div class="row align-items-center">
                                    	<div class="col-md-auto"><h4>성별</h4></div>
                                    	<c:choose>
				                        	<c:when test="${sitter.sitter_gender == 'F'}">
				                        		<div class="col-md-auto">
						                        	<div class="form-check form-check-inline">
				                                        <input class="form-check-input" type="radio" name="sitter_gender" value="M" disabled="disabled" style="width: 50px;">남자
			                                        </div>
		                                        </div>
	                                          	<div class="col-md-auto">
			                                        <div class="form-check form-check-inline">
				                                        <input class="form-check-input" type="radio" name="sitter_gender" value="F" checked="checked" disabled="disabled" style="width: 50px;">여자
			                                        </div>
	                                            </div>
				                        	</c:when>
				                        	
				                        	<c:otherwise>
					                        	<div class="col-md-auto">
						                        	<div class="form-check form-check-inline">
				                                        <input class="form-check-input" type="radio" name="sitter_gender" value="M" checked="checked" disabled="disabled" style="width: 50px;">남자
			                                        </div>
		                                        </div>
	                                          	<div class="col-md-auto">
			                                        <div class="form-check form-check-inline">
				                                        <input class="form-check-input" type="radio" name="sitter_gender" value="F" disabled="disabled" style="width: 50px;">여자
			                                        </div>
	                                            </div>
				                        	</c:otherwise>
			                        	</c:choose>
                                   	</div>
                               
									
                                    
                                    <div class="row align-items-center">
                                    	<div class="col-md-auto"><h4>이메일</h4></div>
                                        <div class="col-md-auto">
                                        	<input type="email" name="sitter_email" id="email" placeholder="Email" value="${sitter.sitter_email}" required>
                                        </div>
                                    </div>
                                    
                                    <div class="row align-items-center">
                                    	<div class="col-md-auto"><h4>생일</h4></div>
                                        <div class="col-md-auto">
                                        	<input type="date" name="sitter_birthdate" id="birthday" placeholder="생일" value="${sitter.sitter_birthdate}" required>
                                       	</div>
                                    </div>
                                    
                                    <div class="row align-items-center">
                                    	<div class="col-md-auto"><h4>연락처</h4></div>
                                        <div class="col-md-auto">
                                        	<input type="tel" name="sitter_phone" oninput="autoHyphen(this)" maxlength="13" placeholder="숫자만 입력해주세요" value="${sitter.sitter_phone}" autofocus>
                                        </div>
                                    </div>
                                    
                                    <div class="row align-items-center">
                                    	<div class="col-md-auto"><h4>주소</h4></div>
                                    	<div class="col-md-6">
                                        	<input type="text" name="sitter_addr1" id="addr1" placeholder="주소" value="${sitter.sitter_addr1}" required>
                                        </div>
                                        <div class="col-md-4">
                                        	<input type="text" name="sitter_addr2" id="addr2" placeholder="상세 주소" value="${sitter.sitter_addr2}" required>
                                        </div>
                                    </div>
                                    
                                    <div class="row align-items-center">
                                    	<div class="col-md-auto"><h4>펫시터 종류</h4></div>
                                    	<div class="col-md-auto">
                                        	<input type="text" name="sitter_code" id="sitter" placeholder="펫시터 종류" value="${sitter.sitter_code}" required>
                                        </div>
                                    </div>
                                    
                                    <div class="row align-items-center">
                                        <div class="col-md-auto"><h4>자기 소개</h4></div>
                                        <textarea name="sitter_info" id="자기소개" placeholder="남들에게 보여질 자기소개를 입력해주세요" rows="5">${sitter.sitter_info}</textarea>
                                    </div>
                                    
                                    <div class="row align-items-center">
                                        <div class="col-md-auto"><h4>서비스 가능 지역</h4></div>
                                        <div class="col-12">
	                                        <div class="col-md-auto pt-20">
		                                        <button class="btn btn-outline-primary wide seoul" type="button" id="seoul">서울</button>
			                                </div>
			                                    <div class="area seoul" style="margin-top: 30px; margin-left: 20px;">
			                                    	<div class="narrow">
											    		<input type="checkbox" id="default1" value="서울 강남구" name="service_area" style="width: 12px;">
				                           				<label for="default1" style="margin-left: 0.1px;">강남구</label>
				                           			</div>
				                           			<div class="narrow">
				                           				<input type="checkbox" id="default2" value="서울 강북구" name="service_area" style="width: 12px">
				                           				<label for="default2" style="margin-left: 0.1px;">강북구</label>
				                           			</div>
				                           			<div class="narrow">
				                           				<input type="checkbox" id="default3" value="서울 강서구" name="service_area" style="width: 12px">
				                           				<label for="default3" style="margin-left: 0.1px;">강서구</label>	
				                           			</div>
				                           			<div class="narrow">
				                           				<input type="checkbox" id="default4" value="서울 강동구" name="service_area" style="width: 12px">
				                           				<label for="default4" style="margin-left: 0.1px;">강동구</label>
				                           			</div>
				                           			<div class="narrow">
				                           				<input type="checkbox" id="default5" value="서울 관악구" name="service_area" style="width: 12px">
				                           				<label for="default5" style="margin-left: 0.1px;">관악구</label>
				                           			</div>
				                           			<div class="narrow">
				                           				<input type="checkbox" id="default6" value="서울 광진구" name="service_area" style="width: 12px">
				                           				<label for="default6" style="margin-left: 0.1px;">광진구</label>
				                           			</div>
				                           			<div class="narrow">
				                           				<input type="checkbox" id="default7" value="서울 구로구" name="service_area" style="width: 12px">
				                           				<label for="default7" style="margin-left: 0.1px;">구로구</label>
				                           			</div>
				                           			<div class="narrow">
				                           				<input type="checkbox" id="default8" value="서울 금천구" name="service_area" style="width: 12px">
				                           				<label for="default8" style="margin-left: 0.1px;">금천구</label>
				                           			</div>
				                           			<div class="narrow">
				                           				<input type="checkbox" id="default9" value="서울 노원구" name="service_area" style="width: 12px">
				                           				<label for="default9" style="margin-left: 0.1px;">노원구</label>
				                           			</div>
				                           			<div class="narrow">
				                           				<input type="checkbox" id="default10" value="서울 도봉구" name="service_area" style="width: 12px">
				                           				<label for="default10" style="margin-left: 0.1px;">도봉구</label>
				                           			</div>
				                           			<div class="narrow">
				                           				<input type="checkbox" id="default11" value="서울 강동구" name="service_area" style="width: 12px">
				                           				<label for="default11" style="margin-left: 0.1px;">강동구</label>
				                           			</div>
				                           			<div class="narrow">
				                           				<input type="checkbox" id="default14" value="서울 마포구" name="service_area" style="width: 12px">
				                           				<label for="default14" style="margin-left: 0.1px;">마포구</label>
				                           			</div>
				                           			<div class="narrow">
				                           				<input type="checkbox" id="default16" value="서울 서대문구" name="service_area" style="width: 12px">
				                           				<label for="default16" style="margin-left: 0.1px;">서대문구</label>
				                           			</div>
				                           			<div class="narrow">
				                           				<input type="checkbox" id="default17" value="서울 서초구" name="service_area" style="width: 12px">
				                           				<label for="default17" style="margin-left: 0.1px;">서초구</label>
				                           			</div>	
				                           			<div class="narrow">
				                           				<input type="checkbox" id="default18" value="서울 성동구" name="service_area" style="width: 12px">
				                           				<label for="default18" style="margin-left: 0.1px;">성동구</label>
				                           			</div>	
				                           			<div class="narrow">
				                           				<input type="checkbox" id="default19" value="서울 성북구" name="service_area" style="width: 12px">
				                           				<label for="default19" style="margin-left: 0.1px;">성북구</label>
				                           			</div>	
				                           			<div class="narrow">
				                           				<input type="checkbox" id="default20" value="서울 송파구" name="service_area" style="width: 12px">
				                           				<label for="default20" style="margin-left: 0.1px;">송파구</label>
				                           			</div>	
				                           			<div class="narrow">
				                           				<input type="checkbox" id="default21" value="서울 양천구" name="service_area" style="width: 12px">
				                           				<label for="default21" style="margin-left: 0.1px;">양천구</label>
				                           			</div>	
				                           			<div class="narrow">
				                           				<input type="checkbox" id="default22" value="서울 영등포구" name="service_area" style="width: 12px">
				                           				<label for="default22" style="margin-left: 0.1px;">영등포구</label>
				                           			</div>	
				                           			<div class="narrow">
				                           				<input type="checkbox" id="default23" value="서울 용산구" name="service_area" style="width: 12px">
				                           				<label for="default23" style="margin-left: 0.1px;">용산구</label>
				                           			</div>	
				                           			<div class="narrow">
				                           				<input type="checkbox" id="default24" value="서울 은평구" name="service_area" style="width: 12px">
				                           				<label for="default24" style="margin-left: 0.1px;">은평구</label>
				                           			</div>	
				                           			<div class="narrow">
				                           				<input type="checkbox" id="default25" value="서울 종로구" name="service_area" style="width: 12px">
				                           				<label for="default25" style="margin-left: 0.1px;">종로구</label>
				                           			</div>	
				                           			<div class="narrow">
				                           				<input type="checkbox" id="default26" value="서울 중구" name="service_area" style="width: 12px">
				                           				<label for="default26" style="margin-left: 0.1px;">중구</label>
				                           			</div>	
				                           			<div class="narrow">
				                           				<input type="checkbox" id="default27" value="서울 중랑구" name="service_area" style="width: 12px">
				                           				<label for="default27" style="margin-left: 0.1px;">중랑구</label>
				                           			</div>		
			                                    </div>
	                                    </div>
	                                </div>
	                                <!-- 추가 by 여경 -->
	                                <c:if test="${user.user_type ne 'S' }">
	                                	<div class="row align-items-center" style="margin-top: 20px;">
                                        <div class="col-md-auto"><h4>자격증</h4></div>
                                        <textarea name="sitter_certificate" id="자격증" placeholder="자격증 기입란" rows="5">${sitter.sitter_certificate}</textarea>
                                    </div>
	                                </c:if>
	                                
	                                <!-- hidden start -->
	                                <input type="hidden" name="sitter_id" value="${sitter.sitter_id}">
	                                <!-- hidden end -->
	                                
	                                <!-- button 시작 -->
	                                <div class="row pt-30">
	                                    <div class="col-12">
	                                        <div class="button text-center">
	                                            <button type="submit" class="theme-btn">확인</button>
	                                            <a type="button" class="theme-btn" href="/pet/erp/sitter/read.do?sitter_id=${sitter.sitter_id}&state=READ">취소</a>
	                                        </div>
	                                    </div>
	                                </div>
	                                <!-- button 끝 -->
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	const add = () => {
	    const box = document.getElementById("sitter_certificate");
	    const newP = document.createElement('p');
	    newP.innerHTML = "<input type='text' name='sitter_certificate' placeholder='자격증 등록'> <input type='button' class='btn-close' style='width:10px;' onclick='remove(this)'>";
	    box.appendChild(newP);
	}
	const remove = (obj) => {
	    document.getElementById("sitter_certificate").removeChild(obj.parentNode);
	}

	document.getElementById("addr1").addEventListener("click", function() {
		new daum.Postcode({
			oncomplete: function(data) {
	        document.getElementById("addr1").value = data.address;
	        document.querySelector("input[id=addr2]").focus();
	        }
	    }).open();
	});
	
	$(document).ready(function() {
		var service_area = "${sitter.service_area}"
		console.log(service_area);
		$("#default1").attr("checked", "checked");
		});
	
	$(document).ready(function() {
		$(".area").hide();
		
		$("#seoul").on("click", function(){
			$(".area").hide()
			$(".seoul").show()
		})
		$("#suwon").on("click", function(){
			$(".area").hide()
			$(".suwon").show()
		})

		$("input[type='checkbox']").on("click", function(){
			let count = $("input:checked[type='checkbox']").length;
			if(count>3){
				$(this).prop("checked", false);
				alert("3개까지만 선택 할 수 있습니다.")
			}
		});
	});
	
	const autoHyphen = (target) => {
		target.value = target.value
	   .replace(/[^0-9]/g, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}
</script>
</html>
