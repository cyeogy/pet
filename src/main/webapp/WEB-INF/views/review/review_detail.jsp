<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="ko">
<head>
<style type="text/css">
	.star-ratings {
	  color: #aaa9a9; 
	  position: relative;
	  unicode-bidi: bidi-override;
	  width: max-content;
	  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
	  -webkit-text-stroke-width: 1.3px;
	  -webkit-text-stroke-color: #2b2a29;
	}
	 
	.star-ratings-fill {
	  color: #fff58c;
	  padding: 0;
	  position: absolute;
	  z-index: 1;
	  display: flex;
	  top: 0;
	  left: 0;
	  overflow: hidden;
	  -webkit-text-fill-color: gold;
	}
	 
	.star-ratings-base {
	  z-index: 0;
	  padding: 0;
	}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>Review Detail</title>
	<script type="text/javascript">
	$(document).ready(function() { 
		no = "${review.review_no}"
		$("#review_no_prev").on("click", function() {
			var querydata = {"review_no" : no}
			$.ajax({
				url : "/pet/menu/review/ajax_detail_prev",
				type : "get",
				data : querydata,
				dataType : "json",
				success : function(data) {
					$("#reviewtext").text(data.review)
					$("#reviewrate").text(data.review_rate)
					$("#reviewdate").text(data.write_date_rv)
					$("#reviewaddr").text(data.member_addr1)
					$("#reviewphoto").html("<img src='/pet/resources/review/" + data.review_img + "' style='width: 500px; height: 300px;'>")
					$("#reviewpetimg").html("<img src='/pet/resources/pet/" + data.pet_photo + "' style='width:50px;height:50px;border-radius:50%;object-fit:cover;'>")
					no = data.review_no
				},
				error : error_run
			})
		})
		
		$("#review_no_next").on("click", function() {
			var querydata = {"review_no" : no}
			$.ajax({
				url : "/pet/menu/review/ajax_detail_next",
				type : "get",
				data : querydata,
				dataType : "json",
				success : function(data) {
					$("#reviewtext").text(data.review)
					$("#reviewrate").text(data.review_rate)
					$("#reviewdate").text(data.write_date_rv)
					$("#reviewaddr").html(data.member_addr1)
					$("#reviewphoto").html("<img src='/pet/resources/review/" + data.review_img + "' style='width: 500px; height: 300px;'>")
					$("#reviewpetimg").html("<img src='/pet/resources/pet/" + data.pet_photo + "' style='width:50px;height:50px;border-radius:50%;object-fit:cover;'>")
					no = data.review_no
				},
				error : error_run
			})
		})
	})
	
	function error_run() {
	}
	</script>
</head>

<body>
<!-- ========================= page-banner-section start ========================= -->
<section class="page-banner-section pt-200 pb-200 img-bg" style="background-image: url('/pet/resources/assets/images/dog.jpg')"></section>
<!-- ========================= page-banner-section end ========================= -->

<!-- ========================= feature-section start ========================= -->
<section class="feature-section pt-100">
	<div class="container">
		<div class="row">
			<div class="col-xl-6 col-lg-7 col-md-9 mx-auto">
				<div class="section-title text-center mb-55">
					<h2 class="wow fadeInUp" data-wow-delay=".4s">후기를 자세히 살펴보세요!</h2>
				</div>
			</div>
		</div>

		<div class="row" style="display: flex; align-items: center">
			<!-- 왼쪽 -->
			<div class="col-lg-2 col-md-6" id="review_no_prev">
				<a type="button" style="float: right;"><img src="/pet/resources/assets/images/direction_left.png" style="width: 50px; height: 50px"><input type="hidden" name="review_no" value="${review.review_no}"/></a>
			</div>
				
				<!-- 본문 -->
				<div class="col-lg-8 col-md-6">
					<div class="feature-box box-style">

						<div style="display: flex; position: relative;">

							<div class="col-lg-10 row">
								<div id="reviewpetimg" class="col-lg-1">
									<img alt="pet" src="/pet/resources/pet/${review.pet_photo}" style="width: 50px; height: 50px; border-radius: 50%; object-fit: cover;">
								</div>
								<div class="col-lg-9" style="padding-top: 10px; padding-left: 30px;">
									<h4><span id="reviewaddr">${review.member_addr1}</span></h4>
								</div>
							</div>


					  <c:choose>
						<c:when test="${user.member_id == review.member_id}">
							<div class="col-lg-1">
								<p style="font-weight: 600; color: #6A92FE; font-size: 12px; line-height: 40px">
									<a href="/pet/review/delete.do?review_no=${review.review_no}" style="margin: auto; width: 80px; height: 40px; border: 1px solid #6A92FE; border-radius: 30px; display: flex; flex-direction: row; justify-content: center; align-items: center">삭제</a>
								</p>
							</div>

							<div class="col-lg-2" style="font-weight: 600; color: #6A92FE; font-size: 12px; line-height: 40px">
								<a href="/pet/review/update_read.do?review_no=${review.review_no}&state=UPDATE" style="margin: auto; width: 80px; height: 40px; border: 1px solid #6A92FE; border-radius: 30px; display: flex; flex-direction: row; justify-content: center; align-items: center">수정</a>
							</div>
					 	</c:when>
					</c:choose> 



						</div>
						<div class="display: flex; flex-direction: column;">
							<div class="row">
								<div class="col-2">
									<p style="font-size: 12px; font-weight: 400; color: rgb(158, 164, 179); line-height: 20px;">${review.write_date_rv}</p>
								</div>
								<div class="col-3">
									<div class="star-ratings">
										<div class="star-ratings-fill space-x-2 text-lg" style="width:${review.review_rate}*20%;">
											<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
										</div>
										<div class="star-ratings-base space-x-2 text-lg">
											<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
										</div>
									</div>
								</div>
							</div>
							<div alt= "review" id="reviewphoto" class="pb-30">
								<img src="/pet/resources/review/${review.review_img}" style="width: 500px; height: 300px;">
							</div>
							<div>
								<p><span id="reviewtext">${review.review}</span></p>
							</div>
						</div>
					</div>
					
					<div class="pb-100">
						<a href="/pet/menu/review.do" style="margin: auto; width: 304px; height: 59px; border: 1px solid #6A92FE; border-radius: 30px; display: flex; flex-direction: row; justify-content: center; align-items: center">
							<span style="font-size: 26px; margin-bottom: 2px; color: #6A92FE; margin-right: 6px">+</span>
							<p style="font-weight: 600; color: #6A92FE; font-size: 18px; line-height: 40px">전체 후기 보기</p>
						</a>
					</div>

				</div>
				
				<!-- 오른쪽 -->
				<div class="col-lg-2 col-md-6" id="review_no_next">
					<a type="button" style="float: left;"><img src="/pet/resources/assets/images/direction_left.png" style="width: 50px; height: 50px; transform: rotateY(180deg)"></a>
				</div>
				
			</div>
		</div>
	</section>
</body>
</html>