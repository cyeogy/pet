<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="ko">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>404 | Space</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

		<link rel="shortcut icon" type="image/x-icon" href="/pet/resources/assets/img/favicon.png">
        <!-- Place favicon.ico in the root directory -->

		<!-- ========================= CSS here ========================= -->
		<link rel="stylesheet" href="/pet/resources/assets/css/bootstrap-5.0.0-beta1.min.css">
        <link rel="stylesheet" href="/pet/resources/assets/css/LineIcons.2.0.css">
		<link rel="stylesheet" href="/pet/resources/assets/css/animate.css">
		<link rel="stylesheet" href="/pet/resources/assets/css/tiny-slider.css">
		<link rel="stylesheet" href="/pet/resources/assets/css/glightbox.min.css">
		<link rel="stylesheet" href="/pet/resources/assets/css/main.css">
    </head>
    <body>
        <!-- ========================= preloader start ========================= -->
            <div class="preloader">
                <div class="loader">
                    <div class="ytp-spinner">
                        <div class="ytp-spinner-container">
                            <div class="ytp-spinner-rotator">
                                <div class="ytp-spinner-left">
                                    <div class="ytp-spinner-circle"></div>
                                </div>
                                <div class="ytp-spinner-right">
                                    <div class="ytp-spinner-circle"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <!-- preloader end -->

        <!-- ========================= header start ========================= -->
        <header class="header bg-white navbar-area">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-12">
					<nav class="navbar navbar-expand-lg">
						<a class="navbar-brand" href="/pet"> <img style="width:100px " src="/pet/resources/assets/img/logo/logo.png" alt="Logo"></a>
						<button class="navbar-toggler" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="toggler-icon"></span> <span class="toggler-icon"></span>
							<span class="toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent">
							<ul id="nav" class="navbar-nav ms-auto">
								<c:choose>
									<c:when test="${user!=null}">
										<li class="nav-item"><a class="page-scroll">안녕하세요. ${user.name}님</a></li>
										<li class="nav-item"><a class="page-scroll"></a></li>
										<li class="nav-item"><a class="page-scroll"></a></li>
									</c:when>
								</c:choose>
								
								<c:choose>
									<c:when test="${user == null}">
										<li class="nav-item"><a class="page-scroll" href="/pet/erp/user/register.do">회원가입</a></li>
									</c:when>
								</c:choose>
								
								<c:choose>
									<c:when test="${user == null}">
										<li class="nav-item"><a class="page-scroll active" href="/pet/menu/login.do">로그인</a></li>
									</c:when>
									<c:otherwise>
										<li class="nav-item"><a class="page-scroll active" href="/pet/erp/logout.do" onclick="">로그아웃</a></li>
										<!-- href="javascript:kakaoDisconnect()" -->
									</c:otherwise>
								</c:choose>
								
								
								<li class="nav-item"><a
									class="page-scroll dd-menu collapsed" href="javascript:void(0)"
									data-bs-toggle="collapse" data-bs-target="#submenu-1-1"
									aria-controls="navbarSupportedContent" aria-expanded="false"
									aria-label="Toggle navigation">돌봄 서비스</a>
									
									<ul class="sub-menu collapse" id="submenu-1-1">
										<li class="nav-item"><a href="/pet/menu/service/care.do">방문 돌봄</a></li>
										<li class="nav-item"><a href="/pet/menu/service/walk.do">방문 산책</a></li>
										<li class="nav-item"><a href="/pet/menu/service/beauty.do">방문 목욕과 미용</a></li>
									</ul>
								</li>
								
								
								
								<li class="nav-item"><a class="page-scroll" href="/pet/menu/review.do">이용 후기</a></li>
								
								<c:choose>
									<c:when test="${user == null}">
										<li class="nav-item"><a class="page-scroll" href="/pet/menu/login.do">예약하기</a></li>
									</c:when>
									
									<c:when test="${user.user_type == 'M'}">
										<li class="nav-item"><a class="page-scroll dd-menu collapsed" href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#submenu-1-1" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">예약</a>
									
									<ul class="sub-menu collapse" id="submenu-1-1">
										<li class="nav-item"><a class="page-scroll" href="/pet/menu/reserve/resv1_mb.do">예약하기</a></li>
										<li class="nav-item"><a class="page-scroll" href="/pet/reserve/list.do">예약확인</a>
									</ul>
									</c:when>
									
									<c:when test="${user.user_type == 'S' }">
										<li class="nav-item"><a class="page-scroll" href="/pet/reserve/list.do">예약확인</a>
											<c:if test="${size != 0}">
												<span class="position-absolute top-1 start-100 translate-middle badge rounded-pill bg-danger">
												new!<span class="visually-hidden"></span></span>
											</c:if>
   										</li>
									</c:when>
								</c:choose>
								
								<c:choose>
									<c:when test="${user == null}">
										<li class="nav-item"><a class="page-scroll" href="/pet/menu/login.do">마이페이지</a></li>
									</c:when>
									<c:when test="${user.user_type == 'A'}">
										<li class="nav-item"><a class="page-scroll" href="/pet/erp/admin.do">마이페이지</a></li>
									</c:when>
									<c:when test="${user.user_type == 'M'}">
										<li class="nav-item"><a class="page-scroll" href="/pet/erp/member/read.do?member_id=${user.member_id }&state=READ">마이페이지</a></li>
									</c:when>
									<c:otherwise>
										<li class="nav-item"><a class="page-scroll" href="/pet/erp/sitter/read.do?sitter_id=${user.sitter_id}&state=READ">마이페이지</a></li>
									</c:otherwise>
								</c:choose>
								
								<c:choose>
									<c:when test="${user.valid == '0'}">
										<li class="nav-item"><a class="page-scroll" href="https://docs.google.com/forms/d/1Gxm7aSqZRTbJ8SvTCeD2HRxpetM5g_0lqyLEmYeYfX4/edit">펫시터 지원</a></li>
									</c:when>
								</c:choose>
								
							</ul>
						</div>
						<!-- navbar collapse -->
					</nav>
					<!-- navbar -->
				</div>
			</div>
			<!-- row -->
		</div>
		<!-- container -->
        
        </header>
        <!-- ========================= header end ========================= -->

        <!-- ========================= page-banner-section start ========================= -->
        <section class="page-banner-section pt-75 pb-75 img-bg" style="background-image: url('/pet/resources/assets/img/bg/common-bg.svg')">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="banner-content">
                            <h2 class="text-white">404 Page</h2>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item" aria-current="page"><a href="javascript:void(0)">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">404</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ========================= page-banner-section end ========================= -->

        <!-- ========================= page-404-section end ========================= -->
        <section class="page-404-section pt-130 pb-130">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="page-404-content text-center">
                            <h2 class="mb-30">404 ERROR</h2>
                            <p class="mb-20">죄송합니다. 페이지를 찾을 수 없습니다.</p>
                            <p class="mb-20">존재하지 않는 주소를 입력하셨거나</p>
                            <p class="mb-40">요청하신 페이지의 주소가 변경, 삭제되어 찾을 수 없습니다.</p>
                            <a href="/pet" class="theme-btn">홈으로</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ========================= page-404-section end ========================= -->


        <!-- ========================= footer start ========================= -->
        <footer class="footer pt-100">
	    <div class="container">
	        <div class="row">
	            <div class="col-xl-3 col-lg-4 col-md-6">
	                <div class="footer-widget mb-60 wow fadeInLeft" data-wow-delay=".2s">
	                    <a href="#" class="logo mb-30"><img src="/pet/resources/assets/img/logo/logo4.png" style="width: 100px;" alt="logo"></a>
	                    <p class="mb-30 footer-desc">
	                    나는 한때 내가<br/>
	                    이 세상에 사라지길 바랬어<br/>
						온 세상이 너무나 캄캄해<br/>
						매일 밤을 울던 날<br/>
	                    </p>
	                </div>
	            </div>
	            <div class="col-xl-3 col-lg-4 col-md-6">
	                <div class="footer-widget mb-60 wow fadeInUp" data-wow-delay=".6s">
	                    <h4>Service</h4>
	                    <ul class="footer-links">
	                        <li>
	                            <a href="javascript:void(0)">안전보상제도</a>
	                        </li>
	                        <li>
	                            <a href="javascript:void(0)">질문과 답변</a>
	                        </li>
	                        <li>
	                            <a href="javascript:void(0)">이용 약관</a>
	                        </li>
	                        <li>
	                            <a href="javascript:void(0)">개인정보 취급</a>
	                        </li> 
	                        <li>
	                            <a href="javascript:void(0)">비즈니스 제휴</a>
	                        </li> 
	                    </ul>
	                </div>
	            </div>
	            <div class="col-xl-6 col-lg-6 col-md-6">
	                <div class="footer-widget mb-60 wow fadeInRight" data-wow-delay=".8s">
	                    <h4>Contact</h4>
	                    <ul class="footer-contact">
	                        <li>
	                            <p>고객센터 문의 : 070 4756 2224</p>
	                        </li>
	                        <li>
	                            <p>hello@gayopet.com</p>
	                        </li>
	                        <li>
	                            <p>사업자 등록번호 : 347-87-00837   |   통신판매업 신고번호 : 제 2017-서울강남-03319</p>
	                        </li>
	                        <li>
	                            <p>(주)펫피플 주소 : 서울시 강남구 논현동 20-2 세정빌딩 3층 (주식회사 펫피플)</p>
	                        </li>
	                        <li>
	                            <p>대표 : 김형하   |   개인정보책임자 : 최여경</p>
	                        </li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	
	        <div class="copyright-area">
	            <div class="row align-items-center">
	                <div class="col-md-6">
	                     <div class="footer-social-links">
	                        <ul class="d-flex">
	                            <li><a href="javascript:void(0)"><i class="lni lni-facebook-filled"></i></a></li>
	                            <li><a href="javascript:void(0)"><i class="lni lni-twitter-filled"></i></a></li>
	                            <li><a href="javascript:void(0)"><i class="lni lni-linkedin-original"></i></a></li>
	                            <li><a href="javascript:void(0)"><i class="lni lni-instagram-filled"></i></a></li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="col-md-6">
	                    <p class="wow fadeInUp" data-wow-delay=".3s"><a>Template Designed by GrayGrids</a></p>
	                </div>
	            </div>
	        </div>
	    </div>
	</footer>
        <!-- ========================= footer end ========================= -->


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
    </body>
</html>
