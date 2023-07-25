
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="ko">
<head>
<title>Review Detail</title>
</head>

<body>
	<!-- ========================= page-banner-section start ========================= -->
	<section class="page-banner-section pt-200 pb-200 img-bg"
		style="background-image: url('/pet/resources/assets/images/dog.jpg')">
	</section>
	<!-- ========================= page-banner-section end ========================= -->

	<!-- ========================= feature-section start ========================= -->
	<section class="feature-section pt-80">
		<div class="container">
			<div class="row">
				<div class="col-xl-6 col-lg-7 col-md-9 mx-auto">
					<div class="section-title text-center mb-55">
						<h2 class="wow fadeInUp" data-wow-delay=".4s">후기를 수정해보세요!</h2>
					</div>
				</div>
			</div>

			<form class="contact-form" action="/pet/review/update.do" method="post" enctype="multipart/form-data">
				<div class="row" style="display: flex; align-items: center;">
					<div class="col-lg-2 col-md-6"></div>

					<div class="col-lg-8 col-md-6">
						<div class="feature-box box-style">
							<!-- review start -->
							<div class="col-lg-12 row pb-10">
								<div class="col-lg-11 row">
									<div class="col-lg-1">
										<img src="/pet/resources/pet/${review.pet_photo}" style="width: 50px; height: 50px; border-radius: 50%; object-fit: cover;">
									</div>
									<div class="col-lg-8" style="padding-top: 10px; padding-left: 10px;">
										<h3>${review.member_addr1}</h3>
									</div>
								</div>
							</div>

							<div class="col-lg-12">
								<div class="row">
									<div class="col-2">
										<p style="font-size: 12px; font-weight: 400; color: rgb(158, 164, 179); line-height: 20px;">${review.write_date_rv}</p>
									</div>
									<div class="col-2">
										<p style="font-size: 12px; font-weight: 400; color: rgb(158, 164, 179); line-height: 20px;">현재 평점:${review.review_rate}</p>
									</div>
								</div>
							</div>

							<div class="row align-items-center pt-10 pl-50" style="padding-left: 10px;">

								<div class="form-check col-1">
									<input id="review_rate" name="review_rate" type="radio"
										class="form-check-input" value="1" required> <label
										class="form-check-label" for="review_rate">1점</label>
								</div>
								<div class="form-check col-1">
									<input id="review_rate2" name="review_rate" type="radio"
										class="form-check-input" value="2" required> <label
										class="form-check-label" for="review_rate2">2점</label>
								</div>
								<div class="form-check col-1">
									<input id="review_rate3" name="review_rate" type="radio"
										class="form-check-input" value="3" required> <label
										class="form-check-label" for="review_rate3">3점</label>
								</div>
								<div class="form-check col-1">
									<input id="review_rate4" name="review_rate" type="radio"
										class="form-check-input" value="4" required> <label
										class="form-check-label" for="review_rate4">4점</label>
								</div>
								<div class="form-check col-1">
									<input id="review_rate5" name="review_rate" type="radio"
										class="form-check-input" value="5" checked required> <label
										class="form-check-label" for="review_rate5">5점</label>
								</div>
							</div>
							
							<div class="thumbnail pt-20 pb-30">
								 <img src="/pet/resources/review/${review.review_img}" id="userImage" width="500" height="300">
							 </div>
							 
							<div class="col-lg-12 pb-50">
								<textarea name="review" id="review" placeholder="내용을 작성해주세요." rows="12" cols="102" class="form-control">${review.review}</textarea>
							</div>
							
							<div class="col-lg-12 pb-50">
								<h4>첨부파일</h4>
								<div class="row align-items-center">
									<div class="col-md-8">
										<input type="file" class="form-control input-lg" name="review_file"	id="review_file" placeholder="파일 선택" onchange="document.getElementById('userImage').src = window.URL.createObjectURL(this.files[0])" accept="image/*">
									</div>
								</div>
							</div>

							<!-- review end -->

							<!-- hidden start -->
							<input type="hidden" name="review_no" value="${review.review_no}">
							<input type="hidden" name="memeber_id" value="${review.member_id}"> 
							<input type="hidden" name="resv_no" value="${review.resv_no}">
							<input type="hidden" name="sitter_id" value="${review.sitter_id}">
							<!-- hidden end -->

							<!-- btn start -->
							<div class="row pb-10">
								<div class="col-lg-3"></div>
								<div class="col-lg-3">
									<a href="/pet/menu/review/detail.do?review_no=${review.review_no}&state=READ" style="margin: auto; width: 100px; height: 55px; border: 1px solid #6A92FE; border-radius: 30px; display: flex; flex-direction: row; justify-content: center; align-items: center">
										<button type="submit" style="margin: auto; width: 100px; height: 55px; border: 1px solid #6A92FE; border-radius: 30px; display: flex; flex-direction: row; justify-content: center; align-items: center">
											<p style="font-weight: 600; color: #6A92FE; font-size: 18px; line-height: 40px">확인</p>
										</button>
									</a>
								</div>
								<div class="col-lg-3">
									<p style="font-weight: 600; color: #6A92FE; font-size: 18px; line-height: 40px">
										<a href="/pet/menu/review/detail.do?review_no=${review.review_no}&state=READ" style="margin: auto; width: 100px; height: 55px; border: 1px solid #6A92FE; border-radius: 30px; display: flex; flex-direction: row; justify-content: center; align-items: center">취소</a>
									</p>
								</div>
								
								<div class="col-lg-3"></div>
							</div>
							<!-- btn end -->
							
						</div>
					</div>
				</div>
			</form>
		</div>

	</section>

</body>
</html>