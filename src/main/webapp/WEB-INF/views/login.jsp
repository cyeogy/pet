<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>login</title>
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
        
        <div class="tab-content" id="pills-tabContent">
            <div class="tab-pane fade show active" id="pills-1" role="tabpanel" aria-labelledby="pills-home-tab">
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12">
                        <div class="single-pricing active mb-50">
                            <div class="contact-form-wrapper">
				                 <div class="row">
				                     <div class="col-xl-10 col-lg-8 mx-auto">
				                         <div class="section-title text-center mb-50">
				                             <span class="wow fadeInDown" data-wow-delay=".2s">일반사용자</span>
				                             <h2 class="wow fadeInUp" data-wow-delay=".4s">로그인</h2>
				                             <p class="wow fadeInUp" data-wow-delay=".6s">login for client</p>
				                         </div>
				                     </div>
				                </div>
				                <form action="/pet/erp/user/login.do" class="contact-form" method="post">
				                      <div class="row" style="margin-left: 100px;">
				                          <div class="col-md-10">
				                              <input type="text" name="member_id" id="member_id" placeholder="아이디" required>
				                          </div>
				                      </div>
				                      <div class="row"  style="margin-left: 100px;">
				                          <div class="col-md-10">
				                              <input type="password" name="member_pass" id="member_pass" placeholder="패스워드" required>
				                          </div>
				                      </div>
				                      <div class="pt-50">
			                             <button type="submit" class="theme-btn">로그인</button>
<!-- 			                             <a type="button" class="theme-btn" href="javascript:kakaoLogin();" style="margin-bottom:0px">카카오로 로그인</a> -->
		                              </div>
			                 	</form>
			                 </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="pills-2" role="tabpanel" aria-labelledby="pills-2-tab">
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12">
                        <div class="single-pricing active mb-50">
                            <div class="contact-form-wrapper">
				                 <div class="row">
				                     <div class="col-xl-10 col-lg-8 mx-auto">
				                         <div class="section-title text-center mb-50">
				                             <span class="wow fadeInDown" data-wow-delay=".2s">펫시터</span>
				                             <h2 class="wow fadeInUp" data-wow-delay=".4s">로그인</h2>
				                             <p class="wow fadeInUp" data-wow-delay=".6s">login for sitter</p>
				                         </div>
				                     </div>
				                </div>
				                
				                <form action="/pet/erp/sitter/login.do" class="contact-form" method="post">
				                      <div class="row" style="margin-left: 100px;">
				                          <div class="col-md-10" >
				                              <input type="text" name="sitter_id" id="sitter_id" placeholder="아이디" required>
				                          </div>
				                      </div>
				                      <div class="row" style="margin-left: 100px;">
				                          <div class="col-md-10">
				                              <input type="password" name="sitter_pass" id="sitter_pass" placeholder="패스워드" required>
				                          </div>
				                      </div>
						              <div class="pt-50">
				                          <button type="submit" class="theme-btn">로그인</button>

<!-- 			                              <a type="button" class="theme-btn" href="javascript:kakaoLogin()" style="margin-bottom:0px">카카오 로그인</a> -->
			                          </div>
                            	</form>
                  				</div>
                		</div>
              			</div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- hidden start -->
<form id="myform" name="myform" action="/pet/erp/user/register.do" method="post">
	<input name="member_email" id="email" type="hidden" value=""> 
	<input name="member_gender" id="gender" type="hidden" value="">
	<input name="member_name" id="name" type="hidden" value="">
	<input name="member_birthdate" id="birthday" type="hidden" value="">
	<button type="submit" style="display:none;">제출</button>
</form>

<!-- <a href="javascript:kakaoLogout();">로그 아웃</a> -->
<!-- <a href="javascript:kakaoDisconnect();">로그 아웃</a> -->
<!-- hidden end -->

<!-- ========================= pricing-section end ========================= -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
	var jsondata={};
	window.Kakao.init("176a754969c2e6ccc0c8ada366726398");
	function kakaoLogin() {
		window.Kakao.Auth.login({
			scope:'profile_nickname, account_email, gender, age_range, birthday',
			success: function(authObj) {
				console.log(authObj);
				window.Kakao.API.request({
					url:'/v2/user/me',
					success: res => {
						const kakao_account = res.kakao_account;
						console.log(kakao_account)
						myform.email.value = kakao_account.email; 
						myform.gender.value = kakao_account.gender;
						myform.name.value = kakao_account.profile.nickname; 
						myform.birthday.value = kakao_account.birthday; 
						myform.submit();
// 						jsondata.email = kakao_account.email; 
// 						jsondata.gender = kakao_account.gender;
// 						location.href="/pet/erp/user/register.do?data="+encodeURI(JSON.stringify(jsondata));
						
// 						$.ajax({
// 							url:"/pet/erp/user/register.do",
//  							//data:JSON.stringify(kakao_account), 
//  							//data:JSON.stringify(jsondata),
// 							data:kakao_account,
// 							type:"POST",
// 							dataType:"json",
// 							contentType:"application/json;charset=utf-8",
// 							success:function(data){
// 								console.log("test");
// 								location.href="/pet/erp/user/register.do"
// 							}
// 						})
						
						 
					}
				});
			}
		});
	}
	
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
</body>


</html>
















