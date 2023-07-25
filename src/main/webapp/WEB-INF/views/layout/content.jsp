<%@page import="mutli.com.pet.erp.SitterDTO"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Main Content</title>
</head>
<body>
<!-- ========================= hero-section start ========================= -->
<section id="home" class="hero-section">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-xl-5 col-lg-6">
                <div class="hero-content-wrapper">
                    <h2 class="mb-25 wow fadeInDown" data-wow-delay=".2s">Coming</h2>
                    <h1 class="mb-25 wow fadeInDown" data-wow-delay=".2s">펫시터가<br/>집으로 와요</h1>
                    <p class="mb-35 wow fadeInLeft" data-wow-delay=".4s">펫시터 방문 돌봄 및 산책 서비스</p>
                    
                    <c:choose>
	                    <c:when test="${user.user_type == 'M' || user == null}">
	                    	<a href="/pet/menu/login.do" class="theme-btn">예약하기</a>
	                    </c:when>
	                    <c:otherwise>
		                    <a href="/pet/menu/reserve/resv1_mb.do" class="theme-btn">예약 확인</a>
	                    </c:otherwise>
                    </c:choose>
                    
                </div>
            </div>
            
            <div class="col-xl-7 col-lg-6">
                <div class="hero-img">
                    <div class="d-inline-block hero-img-right">
                        <!-- <img src="/pet/resources/assets/images/dogwalk.gif" alt="" class="image wow fadeInRight" data-wow-delay=".5s" style="animation-duration: 5s;"> -->
                        <video loop muted autoplay playsinline webkit-playsinline="true" style="display:flex;object-fit:cover;width:100%;height:500px;z-index:10"><source type="video/mp4" src="/pet/resources/assets/images/dog_walk.mp4"></video>
<!--                         <img src="/pet/resources/assets/img/hero/dots.shape.svg" alt="" class="dot-shape">
 -->                        <!-- <div class="video-btn">
                            <a href="https://www.youtube.com/watch?v=wDfqXR_5yyQ" target="_blank" class="glightbox"><i class="lni lni-play"></i></a>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ========================= hero-section end ========================= -->
<!-- ========================= feature-section start ========================= -->
<section class="feature-section pt-130">
    <div class="container">
        <div class="row">
       		<!-- <div class="col-lg-6 text-center">
                <h5 class="wow fadeInUp" data-wow-delay=".6s">지금까지 
                <span id="secondo" class="countup count color-1" cup-end="186" cup-append=",">10</span>
                <span id="secondo" class="countup count color-1" cup-end="429" cup-append="마리">10</span>
                <br/>의 아이들이 펫시터와<br/>함께 시간을 보냈어요!</h5>
            </div>
               
       		<div class="col-lg-6 text-center">
                <h5 class="wow fadeInUp" data-wow-delay=".6s">펫시터와 함께한 누적 시간</h5>
                <h2 class="wow fadeInUp" data-wow-delay=".4s">
                <span id="secondo" class="countup count color-1" cup-end="7" cup-append=",">10</span>
                <span id="secondo" class="countup count color-1" cup-end="248" cup-append=",">10</span>
                <span id="secondo" class="countup count color-1" cup-end="902" cup-append="분">10</span>
                </h2>
            </div> -->
        	
            <div class="col-lg-12 mx-auto">
                <div class="section-title text-center mb-20">
                    <span class="wow fadeInDown" data-wow-delay=".2s">Who?</span>
                    <br/>
                    <h1 class="wow fadeInUp" data-wow-delay=".4s">펫시터가<br/>누구인가요?</h1>
                    <br/>
                    <p class="wow fadeInUp" data-wow-delay=".6s">반려동물을 사랑하고, 관련 자격증과 전문 지식을 <br/>갖춘 분들이 전문 펫시터로 활동 합니다.</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ========================= feature-section end ========================= -->
<!-- ========================= petsitter-section start ========================= -->
<section class="client-logo-section pt-100">
    <div class="container">
        <div class="client-logo-wrapper">
            <div class="client-logo-carousel d-flex align-items-center justify-content-between" id="ajax" >
            	<c:forEach var="sitter" items="${sitterlist}" varStatus="status">
	                <div class="client-logo">
	                    <img src="/pet/resources/sitter/${sitter.sitter_photo}" alt="이미지" style="padding-bottom: 20px; height: 170px ">
	                    <div class="box-content-style feature-content">
	                        <h4>${sitter.sitter_name} 펫시터</h4>
	                        <p>후기 ${sitter.sitter_resvNum}개 | 평점 ${sitter.sitter_rate}점</p><br/>
	                        <ul>
	                        	<p>[보유자격증]</p>
	                        	<c:forTokens items="${sitter.sitter_certificate}" delims="," var="certificate">
	                        		<li>${certificate}</li>
	                        	</c:forTokens>
	                        </ul>	                        
	                    </div>
	                </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>
<!-- ========================= petsitter-logo-section end ========================= -->

<!--========================= about-section start========================= -->
<section id="about" class="pt-100">
    <div class="about-section">
        <div class="container">
            <div class="row">
                <div class="col-xl-6 col-lg-6">
                    <div class="about-img-wrapper">
                        <div class="about-img position-relative d-inline-block wow fadeInLeft" data-wow-delay=".3s">
                            <img src="/pet/resources/assets/images/main_serviceintro2.jpg" alt="">
                            <div class="about-experience" style="margin-right: -100%; margin-bottom: 60%;">
                                <h3>언제든지 펫시터를<br/>부르세요</h3>
                                <p>요청하신 날짜와 시간에 방문이 가능한 펫시터가 고객님의 예약을 수락하면 예약이 확정됩니다.</p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-xl-6 col-lg-6">
                    <div class="about-content-wrapper">
                        <div class="section-title">
                            <h2 class="mb-40 wow fadeInRight" data-wow-delay=".4s">방문 서비스를<br/>살펴보세요</h2>
                            <span class="wow fadeInUp" data-wow-delay=".2s"></span>
                        </div>
                        <div class="about-content" style="padding: 20px;">
                            <p class="mb-45 wow fadeInUp" data-wow-delay=".6s">산책, 돌봄에는 1시간부터 3시간까지<br/>시간별 맞춤 플랜이 준비되어 있어요</p>
                        </div>
                    </div>
                </div>
                
                <div class="tab-content" id="pills-tabContent">
                   <div class="tab-pane fade show active" id="pills-1" role="tabpanel" aria-labelledby="pills-home-tab">
                       <div class="row">
                           <div class="col-xl-7 col-lg-7 col-md-6"></div>
                           <div class="col-xl-22 col-lg-2 col-md-6 text-center">
                               <div class="single-pricing mb-50">
                                   <h5>방문 돌봄</h5><br/>
                                   <h4>25,000원 ~</h4><br/>
                                   <ul>
                                       <li>맞춤 배식</li>
                                       <li>신나는 놀이</li>
                                       <li>배변/환경 정리</li>
                                       	<p>60분 이상 예약시 가능</p>
                                       </li>
                                   </ul><br/><br/>
                                   <a href="/pet/menu/service/care.do" class="theme-btn">자세히 보기</a>
                               </div>
                           </div>
                           <div class="col-xl-3 col-lg-3 col-md-6 text-center">
                               <div class="single-pricing mb-50">
                                   <h5>방문 산책</h5><br/>
                                   <h4>30,000원 ~</h4><br/> 
                                   <ul>
                                       <li>산책 및 매너 교육</li>
                                       <li>간단한 발 닦기</li>
                                       <li>배변 정리</li>
                                       <li>맞춤 배식</li>
                                   </ul><br/><br/>
                                   <a href="/pet/menu/service/walk.do" class="theme-btn">자세히 보기</a>
                               </div>
                           </div>
                           
                           
                       </div>
                   </div>
               </div>
            </div>
        </div>
    </div>
</section>

<!--========================= about-section end========================= -->

<!-- ========================= service-section start ========================= -->
<section id="service" class="service-section pt-130 pb-80">
    <div class="container">
        <div class="row">
            <div class="col-xl-6 col-lg-7 col-md-9 mx-auto">
                <div class="section-title text-center mb-55">
                    <span class="wow fadeInDown" data-wow-delay=".2s">Services</span>
                    <h2 class="wow fadeInUp" data-wow-delay=".4s">믿을 수 있고<br/>안심할 수 있어요</h2>
                    <p class="wow fadeInUp" data-wow-delay=".6s">까다로운 펫시터 선발 관리 체계와 안전 시스템을 구축했습니다.</p>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-6 col-md-5" style="padding-right: 30px;">
                <div class="service-box box-style row justify-content-center">
                    <div class="service-icon box-icon-style">
                        <i class="lni lni-capsule"></i>
                    </div>
                    <div class="box-content-style service-content row justify-content-center">
                        <div class="col-lg-auto">
                        	<h4>철저한 신원 및 능력 검증</h4>
                        </div>
                        <p>신분증 사본 제출, 등초본 인증, 반려동물 관련 자격증, 펫시터 계약서 등으로 신원을 검증합니다.</p>
                    </div>
                </div>
            </div>
            <!-- <div class="col-lg-6 col-md-5" style="padding-left: 30px;">
                <div class="service-box box-style row justify-content-center">
                    <div class="service-icon box-icon-style">
                        <i class="lni lni-bootstrap"></i>
                    </div>
                    <div class="box-content-style service-content row justify-content-center">
                    	<div class="col-lg-auto">
                        	<h4>모든 돌봄 과정 촬영</h4>
                        </div>
                        <p>펫시터의 카메라 착용을 의무화하고 있으며 모든 과정이 촬영되어 실시간으로 중계됩니다.</p>
                    </div> 
                </div>
            </div> -->
            <!-- <div class="col-lg-6 col-md-5" style="padding-right: 30px;">
                <div class="service-box box-style row justify-content-center">
                    <div class="service-icon box-icon-style">
                        <i class="lni lni-dashboard"></i>
                    </div>
                    <div class="box-content-style service-content row justify-content-center">
                        <div class="col-lg-auto">
                        	<h4>안전 보상 프로그램</h4>
                        </div>
                        <p>서비스 이용중 예상치 못한 사건/사고 발생시 체계적인 안전 보상 프로그램이 적용됩니다.</p>
                    </div>
                </div>
            </div> -->
            <div class="col-lg-6 col-md-5" style="padding-left: 30px;">
                <div class="service-box box-style row justify-content-center">
                    <div class="service-icon box-icon-style">
                        <i class="lni lni-layers"></i>
                    </div>
                    <div class="box-content-style service-content row justify-content-center">
                        <div class="col-lg-auto">
                        	<h4>최고 전문진과 교육 협업</h4>
                        </div>
                        <p>유명한 반려동물 전문가들과 펫시터 이론 및 실습 교육을 협업하고 있습니다.</p>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</section>
<!-- ========================= service-section end ========================= -->

<!-- ========================= contact-section start ========================= -->
<section id="contact" class="contact-section cta-bg img-bg pt-110 pb-100" style="background-image: url('/pet/resources/assets/images/main_serviceintro1.jpg');">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-xl-5 col-lg-7">
                <div class="section-title mb-60">
                    <span class="text-white wow fadeInDown" data-wow-delay=".2s" style="padding: 20px;">Contact us</span>
                    <h1 class="text-white wow fadeInUp" data-wow-delay=".4s" style="padding: 20px;">파트너 펫시터로<br/>함께해요!</h1>
                    <p class="text-white wow fadeInUp" data-wow-delay=".6s" style="padding: 20px;">반려가족에게 행복한 시간을 선물할 수 있도록<br/> 와요와 함께 성장할 파트너를 찾습니다.</p>
                </div>
            </div>
            <div class="col-xl-7 col-lg-5">
                <div class="contact-btn text-start text-lg-end">
                    <a href="https://docs.google.com/forms/d/1Gxm7aSqZRTbJ8SvTCeD2HRxpetM5g_0lqyLEmYeYfX4/viewform?edit_requested=true" class="theme-btn">펫시터 지원        →</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ========================= contact-section end ========================= -->

<!-- ========================= scroll-top ========================= -->
<a href="#" class="scroll-top">
    <i class="lni lni-arrow-up"></i>
</a>

<!-- ========================= JS here ========================= -->
<script src="/pet/resources/assets/js/bootstrap.bundle-5.0.0-beta1.min.js"></script>
<script src="/pet/resources/assets/js/contact-form.js"></script>
<script src="/pet/resources/assets/js/count-up.min.js"></script>
<script src="/pet/resources/assets/js/tiny-slider.js"></script>
<script src="/pet/resources/assets/js/isotope.min.js"></script>
<script src="/pet/resources/assets/js/glightbox.min.js"></script>
<script src="/pet/resources/assets/js/wow.min.js"></script>
<script src="/pet/resources/assets/js/imagesloaded.min.js"></script>
<script src="/pet/resources/assets/js/main.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js" ></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
// 	window.onload = function(){
//  		var data = 1;
// 		$.ajax({
// 		url: "/pet/erp/sitterlist.do",
// 		type: "get",
//  		data: data,
//  		dataType: "json",
// 		success:function(result){
// 			console.log(result);
// 			$("#ajaxtest").html(result);
//  			$("#ajaxtest").html(data[0].user_type);
//  			var sitterlist = data;
// 		},
// 		error:error_run
// 	});
// 	}
// 	function success_run(data) {
// 		alert(data);
// 	}
// 	function error_run(obj, msg, statusMsg) {
// 		alert("오류발생 → " + obj + ", " + msg + ", " + statusMsg);
// 	}
</script>
</body>
</html>





















