<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>admin popup</title>
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <!-- ========================= CSS here ========================= -->
	<link rel="stylesheet" href="/pet/resources/assets/css/bootstrap-5.0.0-beta1.min.css">
	<link rel="stylesheet" href="/pet/resources/assets/css/LineIcons.2.0.css">
	<link rel="stylesheet" href="/pet/resources/assets/css/animate.css">
	<link rel="stylesheet" href="/pet/resources/assets/css/tiny-slider.css">
	<link rel="stylesheet" href="/pet/resources/assets/css/glightbox.min.css">
	<link rel="stylesheet" href="/pet/resources/assets/css/main.css">
	<script type="text/javascript">
		//페이지가 로딩될때
		id = "";
		$(document).ready(function() {
			id = opener.document.getElementById("selectid").innerHTML
			//alert(id);
			//$("#result").text(id)
		})
		function getOpenerValue() {
			document.popup.id.value = opener.document.myform.id.value;
		}
		function updateValid(valid) {
				//data = "${sitter_info.vaild}"
				//$("#valid").val(data).attr("selected","selected");
				/* if(valid==1){
					alert("승인")	
				}else{
					alert("미승인")
				} */
				this.close();
				opener.location.href="/pet/admin/valid/update.do?valid_data="+valid+"&sitter_id="+id
				//update를 하기 위해서 update할 값(승인 or 미승인)과 update하기 위한 조건(sitterid => )에 적용할 값 두 개가 있어야 한다.
				//1. boardlist_jstl.jsp를 참고해서 업데이트할 컨트롤러 메소드를 요청하기(파라미터로 valid, id)
				//2. 컨틀로러에 업데이트할 메소드를 추가하고 path정의
				//   => 1번에서 전송한 파라미터를 매개변수로 받도록 처리
				//   => sysout으로 파라미터 출력하기
				
			//alert(id)
		}

	</script>
</head>
<body onload="getOpenerValue()">
	<div id="result"></div>
    <div class="card">
        <div class="">
            <div class="">
                <img src="" width="70" class="rounded-circle mt-2">
            </div>
            <div class="">
                <div class="comment-box ml-2 text-center">
                    <h2>승인하시겠습니까?</h2>
                    <div class="comment-btns mt-2">
                       <div class="row">
                           <div class="col-12">
                               <div class="button text-center ">
                                   <a href="javascript:updateValid('1')" onclick="alert('승인하겠습니다')" role="button" type="submit" class="theme-btn">승인</button></a>
                                   <a href="javascript:updateValid('0')" onclick="alert('미승인처리하겠습니다')" role="button" type="submit" class="theme-btn">미승인</button></a>
                                   <!-- <a href="/pet/menu/mypage/admin.do" role="button" type="submit" class="theme-btn">취소</button></a> -->
                               </div>
                           </div>
                       </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>