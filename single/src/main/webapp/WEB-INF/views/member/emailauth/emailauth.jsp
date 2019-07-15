<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/modern_business_top.jsp" %>


<c:if test="${sessionScope.userInfo != null }">
	<script>
		location.href = "/single/home";
	// 	history.back();
	</script>
</c:if>    


<style>
html{
    min-height: 100% ;
    height: 100%;
}
body{
    height: 95%;
}

.footer{
  height: 5%;
  margin-top: 5%;
  padding-top: 0.rem!important;
}
.container{
min-height: 95%;
}


</style>

<form id ="userInfo" display ="none">
	<input type="hidden" name = "authKey" class ="authKey" >
	<input type="hidden" name = "userId" class ="userId">
</form>


<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />

<script>
$(document).ready(function(){	
	
	//이메일인증버튼
	$('#emailSendBtn').click(function() {
		emailsend();
	});
	
	$('#emailAuthBtn').click(function(){
		if($('#registerForm .authKey').val().trim() == $('#userInfo .authKey').val().trim()){
			console.log('인증키가 동일합니다.');
		}else{
			console.log('인증키가 다릅니다.');
		}
	});
	
	//엔터키
	$("#sendEamilForm").keydown(function(key) {
		if (key.keyCode == 13) {
			emailsend();
		}
		return false;
	});

	function emailsend(){
		var requestParam = JSON.stringify({"userId": $('#sendEamilForm #userId').val()});
		//이메일 인증완료msgTO
	 	$.ajax({
	 		method:"POST",
			url: "${root}/member/sendemail",
			data: requestParam,
			dataType: "json",
		    contentType: "application/json; charset=utf-8;",
			success:function(data){
				var email = data.userDto.userId;
				console.log(data);
				if(data.msgcode ==3){
					$('#status').html(email + "로 메일이 전송되었습니다. <br>메일을 확인해주세요.");
				}
// 				else if (data.msgcode ==2){
// 					$('#status').html(email + "의 메일은 이미 인증되었있습니다. <button type='button' class='btn btn-primary'> <a href ='${root}/member/register>회원가입하러가기 </a></button>");
// 				}
				else if(data.msgcode ==1){
					$('#status').html(email + "의 메일은 회원가입이 되어있습니다.<br>"
							+"<button type='button' class='btn btn-primary'> <a href='${root}/member/login'>로그인 하러가기</a></button>");
				}
// 				console.log('결과');
// 				console.log(data.authKey);
// 				console.log(data.userId);
// 				$('#userInfo .authKey').attr("value",data.authKey);
// 				$('#userInfo .userId').attr("value",data.userId);
				
			},beforeSend: function () {
// 				$('#sendLoding').css("display","block");
				$('#status').html("이메일 전송중입니다");
			},error: function(){
				$('#status').html("이메일 전송에 실패하였습니다.");
			}
		});
	}
});
</script>






<!-- <div id="center"> -->
<div class="container">
<h1 class ="mt-4 mb-3" style="min-height: 100%;">이메일인증</h1>
<form id="sendEamilForm" method="post" action="">
		<div class="form-group">
		    <input type="email" class="form-control"  id="userId" name="userId"  placeholder="이메일 입력해주세요" required="required" 
		    style="display:inline-block; width: 20rem;">
		  	<button type="button" id="emailSendBtn" class="btn btn-primary" >이메일 인증하기</button>
		</div>
</form>
<!-- <form id="registerForm" method="post" action=""> -->
<!-- 		<div class="form-group" id="from-mvRegister"> -->
<!-- 			<input type="text" placeholder="인증번호를 입력해주세요" name="authKey" class="authKey"> -->
<!-- 			<button id="emailAuthBtn" type="button">확인</button> -->
<!-- 			<button id="emailAuthBtn" type="button">인증번호 재발송</button> -->
<!-- 		</div> -->
<!-- </form> -->
<p id="status"></p>
</div>

<%@ include file = "/WEB-INF/views/commons/template/modern_business_bottom.jsp" %>