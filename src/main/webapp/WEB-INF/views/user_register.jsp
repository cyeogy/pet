<%@page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html class="no-js" lang="ko">
<head>
	<meta charset="utf-8">
	<title>register</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<style type="text/css">
		#member_id_result {
			color: red;
		}
	</style>
</head>
<body>
	<!-- ========================= pricing-section start ========================= -->
	<section id="pricing" class="pricing-section pt-140 pb-100">
	    <div class="container">
	        <div class="row">
	            <div class="col-xl-12">
	                <div class="pricing-btn text-center wow fadeInUp" data-wow-delay=".3s">
	                    <ul class="nav justify-content-center mb-90" id="pills-tab" role="tablist">
	                        <li class="nav-item">
	                            <a class="nav-link active" id="pills-1-tab" data-bs-toggle="pill" href="#pills-1" role="tab" aria-controls="pills-1" aria-selected="true">Client</a>
	                        </li>
	                        <li class="nav-item">
	                            <a class="nav-link" id="pills-2-tab" data-bs-toggle="pill" href="#pills-2" role="tab" aria-controls="pills-2" aria-selected="false">Sitter</a>
	                        </li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	        
	        <!-- client start -->
	        <div class="tab-content" id="pills-tabContent">
	            <div class="tab-pane fade show active" id="pills-1" role="tabpanel" aria-labelledby="pills-home-tab">
	                <div class="row">
	                    <div class="col-xl-12 col-lg-12 col-md-12">
                   	  	 	<!-- 일반 사용자 -->
	                        <div class="single-pricing active mt-50 mb-50">
	                            <div class="contact-form-wrapper">
	                            	 <!-- 일반 사용자 --> 
					                 <div class="row">
					                     <div class="col-xl-10 col-lg-8 mx-auto">
					                         <div class="section-title text-center mb-50">
					                             <span class="wow fadeInDown" data-wow-delay=".2s">일반사용자</span>
					                             <h2 class="wow fadeInUp" data-wow-delay=".4s">회원가입</h2>
					                         </div>
					                     </div>
					                </div>
					                
					                <!-- form start -->
					                <div class="container row col-12">
					                <div class="container row col-3"></div>
					                <div class="container row col-8">
					                <form action="/pet/erp/user/insert.do" class="contact-form" method="post">
					                	  <!-- member_id start -->
					                      <div class="row align-items-center">
					                      	  <div class="col-md-auto"><h4>아이디</h4></div>
					                          <div class="col-md-auto">
					                              <input type="text" name="member_id" id="member_id" placeholder="아이디" required="required" value="">
					                          </div>
					                          <div class="col-md-auto" id="member_id_result"></div>
					                      </div>
					                	  <!-- member_pass start -->
					                      <div class="row align-items-center">
					                      	  <div class="col-md-auto"><h4>비밀번호</h4></div>
					                          <div class="col-md-4">
					                              <input type="password" name="member_pass" id="member_pass" placeholder="비밀번호" required="required" value="">
					                          </div>
					                      </div>
					                	  <!-- member_name start -->
					                       <div class="row align-items-center">
					                      	  <div class="col-md-auto"><h4>성함</h4></div>
					                          <div class="col-md-4">
					                              <input type="text" name="member_name" id="member_name" placeholder="ex) 오승영" required value="">
					                          </div>
					                      </div>
					                	  <!-- member_email start -->
					                       <div class="row align-items-center">
					                      	  <div class="col-md-auto"><h4>이메일</h4></div>
					                          <div class="col-md-auto">
					                              <input type="email" name="member_email" id="member_email" placeholder="ex) ohsy94@gmail.com" required value="">
					                          </div>
					                      </div>
					                	  <!-- member_birthday start -->
					                      <div class="row align-items-center">
					                      	  <div class="col-md-auto"><h4>생일</h4></div>
					                          <div class="col-md-4">
					                              <input type="date" name="member_birthdate" id="member_birthdate" placeholder="ex) 2020-10-25" required value="">
					                          </div>
					                      </div>
					                	  <!-- member_gender start -->
					                      <div class="row align-items-center">
					                      	  <div class="col-md-auto"><h4>성별</h4></div>
					                          <div class="col-md-auto">
					                            <div class="form-check form-check-inline" style="display: inline-flex;align-items:center;padding-left: 20px; // Override base .form-check  margin-right: $form-check-inline-margin-x;">
													<input class="form-check-input" type="radio" name="member_gender" id="member_genderM" value="M" checked style="{width:50px; position: static;margin-top: 0;margin-right: $form-check-inline-input-margin-x;margin-left: 0;}">
													<label class="form-check-label" for="member_genderM" style="width: 50px">남자</label>
												</div>
					                            <div class="form-check form-check-inline" style="display: inline-flex;align-items:center;padding-left: 20px; // Override base .form-check  margin-right: $form-check-inline-margin-x;">
													<input class="form-check-input" type="radio" name="member_gender" id="member_genderW" value="F" style="{width:50px; position: static;margin-top: 0;margin-right: $form-check-inline-input-margin-x;margin-left: 0;}">
													<label class="form-check-label" for="member_genderW" style="width: 50px">여자</label>
												</div>
					                          </div>
					                      </div>
					                	  <!-- member_phone start -->
					                      <div class="row align-items-center">
					                      	  <div class="col-md-auto"><h4>연락처</h4></div>
					                          <div class="col-md-4">
					                          	  <input type="tel" name="member_phone" oninput="autoHyphen(this)" maxlength="13" placeholder="숫자만 입력해주세요" autofocus>
					                          </div>
					                      </div>
					                	  <!-- member_addr start -->
					                      <div class="row align-items-center">
					                      	  <div class="col-md-auto"><h4>주소</h4></div>
					                          <div class="col-md-auto">
					                              <input type="text" name="member_addr1" id="addr1" placeholder="경기도 파주시 책향기로 371" required>
					                          </div>
					                          <div class="col-md-3">
					                              <input type="text" name="member_addr2" id="addr2" placeholder="611동 204호" required>
					                          </div>
					                      </div>
					                      <!-- member_addr start -->
					                      <div class="row align-items-center">
					                   		  <div class="col-md-auto"><h4>주로 다니는 병원의 이름과 주소</h4></div>
											  <div class="col-md-auto">
												  <input type="text" name="hospital_name" id="hospital_name" placeholder="동물병원 이름" value="" required>
												  <input type="text" name="hospital_addr" id="hospital_addr" placeholder="동물병원 주소" value="" required>
											  </div>
										  </div>
					                      
					                      <!-- hidden start -->
				                      	  <input name="user_type" id="user_type" type="hidden" value="M">
				                      	  <input name="member_status" id="member_status" type="hidden" value="Y">
										  <!-- hidden end -->
										  
										  <!-- 비밀번호 없는데 로그인 어떻게 하지? -->
					                      
					                      <!-- button -->
					                      <div class="pt-50">
				                             <button type="submit" class="theme-btn">확인</button>
			                              </div>
			                              <!-- button -->
				                 	</form>
        						    <!-- form end -->
				                 </div>
	                        </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            </div>
	            <!-- client end -->
	            
	            <!-- sitter start -->
	            <div class="tab-pane fade" id="pills-2" role="tabpanel" aria-labelledby="pills-2-tab">
	                <div class="row">
	                    <div class="col-xl-12 col-lg-12 col-md-12">
                    	  	<!-- 펫시터 -->
	                        <div class="single-pricing active mt-50 mb-50">
	                            <div class="contact-form-wrapper">
					                 <div class="row">
					                     <div class="col-xl-10 col-lg-8 mx-auto">
					                         <div class="section-title text-center mb-50">
					                             <span class="wow fadeInDown" data-wow-delay=".2s">펫시터</span>
					                             <h2 class="wow fadeInUp" data-wow-delay=".4s">회원가입</h2>
					                         </div>
					                     </div>
					                </div>
					                
					                
					                <!-- form start -->
					                <div class="container row col-12">
					                <div class="container row col-3"></div>
					                <div class="container row col-8">
					                <form action="/pet/erp/sitter/insert.do" class="contact-form" method="post" enctype="multipart/form-data">
					                	  <!-- id start -->
					                      <div class="row align-items-center">
					                      	  <div class="col-md-auto"><h4>아이디</h4></div>
					                          <div class="col-md-4">
					                              <input type="text" name="sitter_id" id="sitter_id" placeholder="아이디" required="required" value="">
					                          </div>
					                          <div class="col-md-auto" id="sitter_id_result"></div>
					                      </div>
					                	  <!-- pass start -->
					                      <div class="row align-items-center">
					                      	  <div class="col-md-auto"><h4>비밀번호</h4></div>
					                          <div class="col-md-4">
					                              <input type="password" name="sitter_pass" id="sitter_pass" placeholder="비밀번호" required="required" value="">
					                          </div>
					                      </div>
					                	  <!-- sitter_gender start -->
					                       <div class="row align-items-center">
					                      	  <div class="col-md-auto"><h4>성함</h4></div>
					                          <div class="col-md-4">
					                              <input type="text" name="sitter_name" id="sitter_name" placeholder="ex) 오승영" required value="">
					                          </div>
					                      </div>
					                	  <!-- sitter_email start -->
					                       <div class="row align-items-center">
					                      	  <div class="col-md-auto"><h4>이메일</h4></div>
					                          <div class="col-md-auto">
					                              <input type="email" name="sitter_email" id="sitter_email" placeholder="ex) ohsy94@gmail.com" required value="">
					                          </div>
					                      </div>
					                	  <!-- sitter_birthday start -->
					                      <div class="row align-items-center">
					                      	  <div class="col-md-auto"><h4>생일</h4></div>
					                          <div class="col-md-4">
					                              <input type="date" name="sitter_birthdate" id="sitter_birthdate" required value="">
					                          </div>
					                      </div>
					                	  <!-- sitter_gender start -->
					                      <div class="row align-items-center">
					                      	  <div class="col-md-auto"><h4>성별</h4></div>
					                          <div class="col-md-auto">
					                            <div class="form-check form-check-inline" style="display: inline-flex;align-items:center;padding-left: 20px; // Override base .form-check  margin-right: $form-check-inline-margin-x;">
													<input class="form-check-input" type="radio" name="sitter_gender" id="sitter_genderM" value="M" checked style="{width:50px; position: static;margin-top: 0;margin-right: $form-check-inline-input-margin-x;margin-left: 0;}">
													<label class="form-check-label" for="sitter_genderM" style="width: 50px">남자</label>
												</div>
					                            <div class="form-check form-check-inline" style="display: inline-flex;align-items:center;padding-left: 20px; // Override base .form-check  margin-right: $form-check-inline-margin-x;">
													<input class="form-check-input" type="radio" name="sitter_gender" id="sitter_genderW" value="W" style="{width:50px; position: static;margin-top: 0;margin-right: $form-check-inline-input-margin-x;margin-left: 0;}">
													<label class="form-check-label" for="sitter_genderW" style="width: 50px">여자</label>
												</div>
					                          </div>
					                      </div>
					                      <!-- sitter_code start -->
					                      <div class="row align-items-center">
					                      	  <div class="col-md-auto"><h4>종류</h4></div>
					                          <div class="col-md-auto">
					                            <div class="form-check form-check-inline" style="display: inline-flex;align-items:center;padding-left: 20px; // Override base .form-check  margin-right: $form-check-inline-margin-x;">
													<input class="form-check-input" type="radio" name="sitter_code" id="sitter_codeD" value="D" checked style="{width:50px; position: static;margin-top: 0;margin-right: $form-check-inline-input-margin-x;margin-left: 0;}">
													<label class="form-check-label" for="sitter_codeD" style="width: 100px">강아지</label>
												</div>
					                            <div class="form-check form-check-inline" style="display: inline-flex;align-items:center;padding-left: 20px; // Override base .form-check  margin-right: $form-check-inline-margin-x;">
													<input class="form-check-input" type="radio" name="sitter_code" id="sitter_codeC" value="C" style="{width:50px; position: static;margin-top: 0;margin-right: $form-check-inline-input-margin-x;margin-left: 0;}">
													<label class="form-check-label" for="sitter_codeC" style="width: 100px">고양이</label>
												</div>
					                            <div class="form-check form-check-inline" style="display: inline-flex;align-items:center;padding-left: 20px; // Override base .form-check  margin-right: $form-check-inline-margin-x;">
													<input class="form-check-input" type="radio" name="sitter_code" id="sitter_codeA" value="A" style="{width:50px; position: static;margin-top: 0;margin-right: $form-check-inline-input-margin-x;margin-left: 0;}">
													<label class="form-check-label" for="sitter_codeA" style="width: 50px">모두</label>
												</div>
					                          </div>
					                      </div>
					                	  <!-- sitter_phone start -->
					                      <div class="row align-items-center">
					                      	  <div class="col-md-auto"><h4>연락처</h4></div>
					                          <div class="col-md-4">
					                       		  <input type="tel" name="sitter_phone" oninput="autoHyphen(this)" maxlength="13" placeholder="숫자만 입력해주세요" autofocus>
					                          </div>
					                      </div>
					                	  <!-- sitter_addr start -->
					                      <div class="row align-items-center">
					                      	  <div class="col-md-auto"><h4>주소</h4></div>
					                          <div class="col-md-auto">
					                              <input type="text" name="sitter_addr1" id="siaddr1" placeholder="경기도 파주시 책향기로 371" value="" required>
					                          </div>
					                          <div class="col-md-3">
					                              <input type="text" name="sitter_addr2" id="siaddr2" placeholder="000동 000호" value="" required>
					                          </div>
					                      </div>
				                          <!-- service area start -->
					                      <div class="row align-items-center">
	                                          <div class="col-md-auto"><h4>서비스 가능 지역</h4></div>
	                                          <div class="col-md-auto"><button class=" btn btn-outline-primary wide seoul" type="button" id="seoul">서울</button></div>
			                                	
	                                          <div class="col-12 pb-50 row">
				                                <div class="area seoul" style="margin-top: 30px; margin-left: 20px;">
				                                	<div class="narrow">
											    		<input type="checkbox" id="default1" value="서울 강남구" name="service_area" style="width: 12px;">
				                           				<label for="default1" style="margin-left: 0.1px;">강남구</label>
				                           				<input type="checkbox" id="default2" value="서울 강북구" name="service_area" style="width: 12px">
				                           				<label for="default2" style="margin-left: 0.1px;">강북구</label>
				                           				<input type="checkbox" id="default3" value="서울 강서구" name="service_area" style="width: 12px">
				                           				<label for="default3" style="margin-left: 0.1px;">강서구</label>	
				                           				<input type="checkbox" id="default4" value="서울 강동구" name="service_area" style="width: 12px">
				                           				<label for="default4" style="margin-left: 0.1px;">강동구</label>
				                           				<input type="checkbox" id="default5" value="서울 관악구" name="service_area" style="width: 12px">
				                           				<label for="default5" style="margin-left: 0.1px;">관악구</label>
				                           				<input type="checkbox" id="default6" value="서울 광진구" name="service_area" style="width: 12px">
				                           				<label for="default6" style="margin-left: 0.1px;">광진구</label>
				                           				<input type="checkbox" id="default7" value="서울 구로구" name="service_area" style="width: 12px">
				                           				<label for="default7" style="margin-left: 0.1px;">구로구</label>
				                           				<input type="checkbox" id="default27" value="서울 중랑구" name="service_area" style="width: 12px">
				                           				<label for="default27" style="margin-left: 0.1px;">중랑구</label>
			                           				</div>
			                           				<div class="narrow">
				                           				<input type="checkbox" id="default8" value="서울 금천구" name="service_area" style="width: 12px">
				                           				<label for="default8" style="margin-left: 0.1px;">금천구</label>
				                           				<input type="checkbox" id="default9" value="서울 노원구" name="service_area" style="width: 12px">
				                           				<label for="default9" style="margin-left: 0.1px;">노원구</label>
				                           				<input type="checkbox" id="default10" value="서울 도봉구" name="service_area" style="width: 12px">
				                           				<label for="default10" style="margin-left: 0.1px;">도봉구</label>
				                           				<input type="checkbox" id="default11" value="서울 강동구" name="service_area" style="width: 12px">
				                           				<label for="default11" style="margin-left: 0.1px;">강동구</label>
				                           				<input type="checkbox" id="default14" value="서울 마포구" name="service_area" style="width: 12px">
				                           				<label for="default14" style="margin-left: 0.1px;">마포구</label>
				                           				<input type="checkbox" id="default16" value="서울 서대문구" name="service_area" style="width: 12px">
				                           				<label for="default16" style="margin-left: 0.1px;">서대문구</label>
				                           				<input type="checkbox" id="default17" value="서울 서초구" name="service_area" style="width: 12px">
				                           				<label for="default17" style="margin-left: 0.1px;">서초구</label>
				                           				<input type="checkbox" id="default26" value="서울 중구" name="service_area" style="width: 12px">
				                           				<label for="default26" style="margin-left: 0.1px;">중구</label>
			                           				</div>
			                           				<div class="narrow">
				                           				<input type="checkbox" id="default18" value="서울 성동구" name="service_area" style="width: 12px">
				                           				<label for="default18" style="margin-left: 0.1px;">성동구</label>
				                           				<input type="checkbox" id="default19" value="서울 성북구" name="service_area" style="width: 12px">
				                           				<label for="default19" style="margin-left: 0.1px;">성북구</label>
				                           				<input type="checkbox" id="default20" value="서울 송파구" name="service_area" style="width: 12px">
				                           				<label for="default20" style="margin-left: 0.1px;">송파구</label>
				                           				<input type="checkbox" id="default21" value="서울 양천구" name="service_area" style="width: 12px">
				                           				<label for="default21" style="margin-left: 0.1px;">양천구</label>
				                           				<input type="checkbox" id="default22" value="서울 영등포구" name="service_area" style="width: 12px">
				                           				<label for="default22" style="margin-left: 0.1px;">영등포구</label>
				                           				<input type="checkbox" id="default23" value="서울 용산구" name="service_area" style="width: 12px">
				                           				<label for="default23" style="margin-left: 0.1px;">용산구</label>
				                           				<input type="checkbox" id="default24" value="서울 은평구" name="service_area" style="width: 12px">
				                           				<label for="default24" style="margin-left: 0.1px;">은평구</label>
				                           				<input type="checkbox" id="default25" value="서울 종로구" name="service_area" style="width: 12px">
				                           				<label for="default25" style="margin-left: 0.1px;">종로구</label>
				                           			</div>	
			                                    </div>
		                                      </div>
	                                      </div>
					                      <!-- sitter_intro start -->
					                      <div class="row align-items-center">
					                      	  <div class="col-md-auto"><h4>자기 소개</h4></div>
					                          <div class="col-md-12">
					                              <input type="text" name="sitter_info" id="sitter_info" placeholder="다른 사람들에게 보여질 자기 소개를 적어주세요!" required value="">
					                          </div>
					                      </div>
					                      <!-- sitter_photo start -->
					                      <div class="row align-items-center pb-50">
					                      	  <div class="col-md-auto"><h4>프로필 사진</h4></div>
					                      	  <div class="col-md-auto">
					                      	  	<input type="file" name="sitter_img" id="myfile" placeholder="사진을 등록해주세요" onchange="document.getElementById('userImage').src = window.URL.createObjectURL(this.files[0])" accept="image/*">
					                      	  </div>
				                              <div class="col-md-auto">
												  <div class="thumbnail">
													  <img src="/erp/images/myphoto.jpg" id="userImage" width="220" height="150">
												  </div>
											  </div>
					                      </div>
					                    
					                      <!-- hidden start -->
				                      	  <input name="user_type" id="user_type_s" type="hidden" value="S">
				                      	  <input name="sitter_status" id="sitter_status" type="hidden" value="Y">
				                      	  <input name="valid" id="valid" type="hidden" value="N">
										  <!-- hidden end -->
										  
					                      <!-- button -->
					                      <div class="pt-50">
				                             <button type="submit" class="theme-btn">확인</button>
			                              </div>
			                              <!-- button -->
				                 	</form>
				                 	</div>
        						    <!-- form end -->
                   				</div>
	                		</div>
               			</div>
	                </div>
	            </div>
	            <!-- sitter end -->
	            
	        </div>
	    </div>
	    </div>
	</section>

</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	document.getElementById("addr1").addEventListener("click", function() {
		new daum.Postcode({
			oncomplete: function(data) {
	        document.getElementById("addr1").value = data.address;
	        document.querySelector("input[id=addr2]").focus();
	        }
	    }).open();
	});
	
	document.getElementById("siaddr1").addEventListener("click", function() {
		new daum.Postcode({
			oncomplete: function(data) {
	        document.getElementById("siaddr1").value = data.address;
	        document.querySelector("input[id=siaddr2]").focus();
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
	
	$(document).ready(function() {
		$("#member_id").on("keyup", function() {
			var member_id = {"id":$("#member_id").val()};
			$.ajax({
				url: "/pet/erp/member/idCheck.do",
				type: "get",
				data: member_id,
				success: success_run,
				error: error_run
			})
		})
	})
	
	$(document).ready(function() {
		$("#sitter_id").on("keyup", function() {
			var member_id = {"id":$("#sitter_id").val()};
			$.ajax({
				url: "/pet/erp/member/idCheck.do",
				type: "get",
				data: member_id,
				success: success_run2,
				error: error_run
			})
		})
	})
	function success_run(msg){
		$("#member_id_result").html("<p>" + msg + "</p>")
	}
	function success_run2(msg){
		$("#sitter_id_result").html("<p>" + msg + "</p>")
	}
	
	function error_run(obj, msg, statusMsg) {
		alert("오류발생 → " + obj + ", " + msg + ", " + statusMsg)
	}
	
	$(document).ready(function() {
		$("#upload").click(function() {
			var myfile = $("#myfile")[0];
			
		})
		
		$(".area").hide();
		
		$("#seoul").on("click", function(){
			$(".area").hide()
			$(".seoul").show()
		})
		$("#suwon").on("click", function(){
			$(".area").hide()
			$(".suwon").show()
		})
		
		$(".narrow").on("click", function(){
			val = $(this).attr("value")
		})	
		
		$("input[type='checkbox']").on("click", function(){
			let count = $("input:checked[type='checkbox']").length;
			if(count>3){
				$(this).prop("checked", false);
				alert("3개까지만 선택 할 수 있습니다.")
			}
		});
	});
	
	const add = () => {
	    const box = document.getElementById("sitter_certificate");
	    const newP = document.createElement('p');
	    newP.innerHTML = "<input type='text' name='sitter_certificate' placeholder='ex) 훈련사 자격증 3급 보유'> <input type='button' class='btn-close' style='width:10px;' onclick='remove(this)'>";
	    box.appendChild(newP);
	}
	const remove = (obj) => {
	    document.getElementById("sitter_certificate").removeChild(obj.parentNode);
	}
	const autoHyphen = (target) => {
		target.value = target.value
	   .replace(/[^0-9]/g, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}
</script>
</html>
