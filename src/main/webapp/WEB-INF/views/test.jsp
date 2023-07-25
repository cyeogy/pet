<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>Test Page</title>
	</head>
<body>
<!-- ========================= pricing-section start ========================= -->
<section id="pricing" class="pricing-section pt-200 pb-100">
    <div class="container">
        <div class="tab-content" id="pills-tabContent">
            <div class="tab-pane fade show active" id="pills-1" role="tabpanel" aria-labelledby="pills-home-tab">
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12">
                        <div class="single-pricing active mb-50">
                            <div class="contact-form-wrapper">
				                 <div class="row">
				                     <div class="col-xl-10 col-lg-8 mx-auto">
				                         <div class="section-title text-center mb-50">
				                             <span class="wow fadeInDown" data-wow-delay=".2s">카카오 지도</span>
				                             <h2 class="wow fadeInUp" data-wow-delay=".4s">카카오 지도</h2>
				                             <p class="wow fadeInUp" data-wow-delay=".6s">카카오 지도</p>
				                         </div>
				                         <div>
				                         	<div id="map" style="width:500px;height:400px;"></div>
				                         </div>
				                     </div>
				                </div>
			                 </div>
                        </div>
                    </div>
                </div>
            </div>
		</div>
	</div>
</section>
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=176a754969c2e6ccc0c8ada366726398&libraries=services,clusterer,drawing"></script>
<script>
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3
	};
	var map = new kakao.maps.Map(container, options);
</script>
</html>