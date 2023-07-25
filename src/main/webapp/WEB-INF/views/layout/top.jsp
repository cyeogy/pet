<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
	<title>Top</title>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" type="image/x-icon" href="/pet/resources/assets/img/favicon.png">
	<link rel="icon" href="/pet/resources/assets/img/favicon.png">
	
	<!-- ========================= CSS here ========================= -->
	<link rel="stylesheet" href="/pet/resources/assets/css/bootstrap-5.0.0-beta1.min.css">
	<link rel="stylesheet" href="/pet/resources/assets/css/LineIcons.2.0.css">
	<link rel="stylesheet" href="/pet/resources/assets/css/animate.css">
	<link rel="stylesheet" href="/pet/resources/assets/css/tiny-slider.css">
	<link rel="stylesheet" href="/pet/resources/assets/css/glightbox.min.css">
	<link rel="stylesheet" href="/pet/resources/assets/css/main.css">
</head>

<body>
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
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">
		window.Kakao.init("176a754969c2e6ccc0c8ada366726398");

		function kakaoLogout() {
			Kakao.Auth.logout()
			  .then(function(response) {
			    console.log(Kakao.Auth.getAccessToken()); // null
			  })
			  .catch(function(error) {
			    console.log('Not logged in.');
			  });
		}
		
		function kakaoDisconnect(){
			Kakao.API.request({
				  url: '/v1/user/unlink',
				})
				  .then(function(response) {
				    console.log(response);
				  })
				  .catch(function(error) {
				    console.log(error);
				  });
		}
	</script>
</header>
</body>
</html>