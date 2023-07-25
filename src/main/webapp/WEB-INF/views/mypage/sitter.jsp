<%@page import="mutli.com.pet.erp.SitterDTO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html class="no-js" lang="ko">
    <head>
        <meta charset="utf-8">
        <title>sitter</title>
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
                    <div class="col-xl-4">
                        <div class="contact-item-wrapper">
                            <div class="row">
                            
                            	<c:choose>
	                            	<c:when test="${fn:length(resvlist_status) != 0}">
										<div class="col-12 col-md-6 col-xl-12">
											<div class="contact-item">
												<div class="contact-icon">
													<i class="lni lni-alarm-clock"></i>
												</div>
												<div class="contact-content">
													<h4><a href="/pet/reserve/list.do">예약 확인하기!</a></h4>
													<c:forEach var="resv" items="${resvlist_status}" varStatus="status">
														<p><a href="/pet/reserve/list.do">${resv.resv_no}</a></p>
													</c:forEach>
												</div>
											</div>
										</div>
									</c:when>
								</c:choose>
                                
                                <div class="col-12 col-md-6 col-xl-12">
                                    <div class="contact-item">
                                        <div class="contact-icon">
                                            <i class="lni lni-map-marker"></i>
                                        </div>
                                        <div class="contact-content">
                                            <h4><a href="/pet/reserve/list.do">나의 돌봄</a></h4>
                                            <c:choose>
	                                            <c:when test="${fn:length(resvlist) == 0}">
	                                            	<p>돌봄경험이 없어요!</p>
	                                            </c:when>
	                                            <c:when test="${review_no == null}">
	                                            	<p>아직 등록된 후기가 없어요!</p>
	                                            </c:when>
	                                            <c:otherwise>
	                                        		<div class="star-ratings">
														<div class="star-ratings-fill space-x-2 text-lg" style="width:${sitter.sitter_rate}*20%;">
															<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
														</div>
														<div class="star-ratings-base space-x-2 text-lg">
															<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
														</div>
													</div>
                                            		<p><a href="/pet/menu/review/detail.do?review_no=${review_no.review_no}">가장 최근 후기</a></p>    
	                                            </c:otherwise>
                                            </c:choose>
                                            
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-12 col-md-6 col-xl-12">
                                    <div class="contact-item">
                                        <div class="contact-icon">
                                            <i class="lni lni-alarm-clock"></i>
                                        </div>
                                        <div class="contact-content">
                                            <h4>자격증</h4>
                                            <%
								    		SitterDTO sitter = (SitterDTO) session.getAttribute("sitter");
                                            
                                   	   		if(sitter.getSitter_certificate() != null){
                                   	   		String[] certificate = sitter.getSitter_certificate().split(",");
                                   	   		int size = certificate.length;
                                   	   		for(int i = 0; i < size; i++){%>
                                   	   		<p><%=certificate[i] %></p>
                                   	   		<%}}%>
                                            <div class="pt-30"></div>
                                            <button type="button" class=" btn btn-outline-primary wide seoul" onclick="window.open('http://www.kkc.or.kr/service/service_05.html')">자격증 취득정보</button>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8">
                        <div class="contact-form-wrapper">
                            <div class="row">
                                <div class="col-xl-10 col-lg-8 mx-auto">
                                    <div class="section-title text-center mb-50">
                                        <span class="wow fadeInDown" data-wow-delay=".2s">${sitter.sitter_name }님, 안녕하세요!</span>
                                        <h2 class="wow fadeInUp" data-wow-delay=".4s">시터님의 정보를 확인하세요!</h2>
                                        
                                    </div>
                                </div>
                            </div>
                                <div class="contact-form">
                                    <div class="row align-items-center">
                                    	<div class="col-md-auto"><h4>프로필 사진</h4></div>
                                       	<div class="col-md-12 pb-50">
                                       		<div>
                                       			<img src="/pet/resources/sitter/${sitter.sitter_photo}" width="220" height="160"></img>
                                       		</div>
                                        </div>
                                    </div>
                                    
                                    <div class="row align-items-center">
                                    	<div class="col-md-auto"><h4>이름</h4></div>
                                       	<div class="col-md-4">
                                       		<input type="text" name="name" id="name" placeholder="이름" value="${sitter.sitter_name}" disabled>
                                        </div>
                                    </div>
                                    
                                    <div class="row align-items-center">
                                    	<div class="col-md-auto"><h4>이메일</h4></div>
                                    	<div class="col-md-auto">
                                        	<input type="email" name="email" id="email" placeholder="Email" value="${sitter.sitter_email}" disabled>
                                        </div>
                                    </div>
                                    
                                    <div class="row align-items-center">
                                    	<div class="col-md-auto"><h4>생일</h4></div>
                                    	<div class="col-md-auto">
                                        	<input type="date" name="sitter_birthdate" id="birthday" placeholder="생일" value="${sitter.sitter_birthdate}" disabled="disabled">
                                        </div>
                                    </div>
                                    
                                    <div class="row align-items-center">
                                    	<div class="col-md-auto"><h4>성별</h4></div>
                                    	<div class="col-md-auto">
                                    	<c:choose>
				                        	<c:when test="${sitter.sitter_gender == 'F'}">
				                        		<div class="form-check form-check-inline">
			                                        <input class="form-check-input" type="radio" name="sitter_gender" id="genderM" value="M" disabled="disabled">
			                                        <label class="form-check-label" for="genderM">남자</label>
		                                        </div>
		                                        <div class="form-check form-check-inline">
			                                        <input class="form-check-input" type="radio" name="sitter_gender" id="genderW" value="F" checked="checked" disabled="disabled">
			                                        <label class="form-check-label" for="genderW">여자</label>
		                                        </div>
				                        	</c:when>
				                        	<c:otherwise>
				                        		<div class="form-check form-check-inline">
			                                        <input class="form-check-input" type="radio" name="sitter_gender" id="genderM" value="M" checked="checked" disabled="disabled">
			                                        <label class="form-check-label" for="genderM">남자</label>
		                                        </div>
		                                        <div class="form-check form-check-inline">
			                                        <input class="form-check-input" type="radio" name="sitter_gender" id="genderW" value="F" disabled="disabled">
			                                        <label class="form-check-label" for="genderW">여자</label>
		                                        </div>
				                        	</c:otherwise>
			                        	</c:choose>
			                        	</div>
                                    </div>
                                    
                                    <div class="row align-items-center">
                                    	<div class="col-md-auto"><h4>연락처</h4></div>
                                    	<div class="col-md-auto">
                                        	<input type="tel" name="phone" id="phone" placeholder="전화번호" value="${sitter.sitter_phone}" disabled>
                                        </div>                                        
                                    </div>
                                    
                                    <div class="row align-items-center">
                                    	<div class="col-md-auto"><h4>주소</h4></div>
                                    	<div class="col-md-6">
	                                        <input type="text" name="sitter_addr" id="addr1" placeholder="주소" value="${sitter.sitter_addr1}" disabled>
                                        </div>
                                        <div class="col-md-4">
	                                        <input type="text" name="sitter_addr2" id="addr2" placeholder="상세 주소" value="${sitter.sitter_addr2}" disabled>
                                        </div>
                                    </div>
                                    
                                    <div class="row align-items-center">
                                    	<div class="col-md-auto"><h4>펫시터 종류</h4></div>
                                        <div class="col-md-auto">
                                        	<input type="text" name="sitter" id="sitter" placeholder="펫시터 종류" value="${sitter.sitter_code}" disabled>
                                        </div>
                                    </div>
                                    
                                    <div class="row align-items-center">
                                        <div class="col-md-auto"><h4>자기 소개</h4></div>
                                        <textarea name="sitter_info" id="자기소개" placeholder="남들에게 보여질 자기소개를 입력해주세요" rows="5" disabled>${sitter.sitter_info}</textarea>
                                    </div>
                                    
                                    <div class="row align-items-center">
                                        <h4>서비스 가능 지역</h4>
                                        <div class="pt-20">
                                   	   		<%
                                   	   		if(sitter.getService_area() != null){
                                   	   		String[] area = sitter.getService_area().split(",");
                                   	   		int size = area.length;
                                   	   		for(int i = 0; i < size; i++){%>
                                   	   		<button class="btn btn-outline-primary" type="button"><%=area[i] %></button>
                                   	   		<%}}%>
		                                </div>
	                                </div>
	                                
	                                <!-- 추가 by 여경 -->
	                                	<div class="row align-items-center" style="margin-top: 20px;">
                                        	<div class="col-md-auto"><h4>자격증</h4><p>*관리자만 수정 가능</p></div>
                                       		 <textarea name="sitter_certificate" id="자격증" placeholder="자격증 기입란" rows="5" disabled>${sitter.sitter_certificate}</textarea>
                                    	</div>
                                    	
                                    	<div class="row align-items-center" style="margin-top: 20px;">
                                        	<div class="col-md-auto"><h6>소형견 돌봄횟수</h6></div>
                                       		 <textarea name="small_career" id="소형견" placeholder="돌봄횟수" rows="1" disabled>${sitter.small_career}</textarea>
                                    	</div>
                                    	
                                    	<div class="row align-items-center" style="margin-top: 20px;">
                                        	<div class="col-md-auto"><h6>중형견 돌봄횟수</h6></div>
                                       		 <textarea name="medium_career" id="중형견" placeholder="돌봄횟수 " rows="1" disabled>${sitter.medium_career}</textarea>
                                    	</div>
                                    	
                                    	<div class="row align-items-center" style="margin-top: 20px;">
                                        	<div class="col-md-auto"><h6>대형견 돌봄횟수</h6></div>
                                       		 <textarea name="large_career" id="대형견" placeholder="돌봄횟수 " rows="1" disabled>${sitter.large_career}</textarea>
                                    	</div>
                                    	
                                    	<div class="row align-items-center" style="margin-top: 20px;">
                                        	<div class="col-md-auto"><h6>고양이 돌봄횟수</h6></div>
                                       		 <textarea name="cat_career" id="고양이" placeholder="돌봄횟수 " rows="1" disabled>${sitter.cat_career}</textarea>
                                    	</div>
	                                
	                                <!-- 평점 -->
	                                <div class="row align-items-center">
                                        <div class="col-md-auto"><h4>평점</h4></div>
                                        <textarea name="sitter_rate" id="자기소개" placeholder=" " rows="1" disabled>${sitter.sitter_rate}</textarea>
                                    </div>
	                                
            						<c:choose>
	                                        <c:when test="${user.valid == '1'}">
	                                        	<p>*돌봄이 허가 된 시터 입니다.</p>
	                                        </c:when>
	                                        <c:otherwise>
	                                        	<p style="color: red;">*관리자가 확인 중인 시터 입니다.</p>
	                                        </c:otherwise>
                                        </c:choose>
                                <div class="row pt-30">
                                    <div class="col-12">
                                        <div class="button text-center">
                                            <a type="button" class="theme-btn" href="/pet/erp/sitter/read.do?sitter_id=${sitter.sitter_id}&state=UPDATE">수정</a>
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
</html>
