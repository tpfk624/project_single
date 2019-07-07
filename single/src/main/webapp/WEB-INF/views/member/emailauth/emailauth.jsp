<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/modern_business_top.jsp" %>

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
		var requestParam = JSON.stringify({"userId": $('#sendEamilForm .userId').val()});
		//이메일 인증완료msgTO
	 	$.ajax({
	 		method:"POST",
			url: "${root}/member/sendemail",
			data: requestParam,
			dataType: "json",
		    contentType: "application/json; charset=utf-8;",
			success:function(data){
				console.log(data);
				$('#status').html(data.userId + "로 메일이 전송되었습니다. <br>메일을 확인해주세요.");
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
	});
	
	$('#emailAuthBtn').click(function(){
		if($('#registerForm .authKey').val().trim() == $('#userInfo .authKey').val().trim()){
			console.log('인증키가 동일합니다.');
		}else{
			console.log('인증키가 다릅니다.');
		}
	});

});
</script>

<style>
#center{
	margin: auto;
	width: 70%;
}
</style>



<div id="center">
<form id="sendEamilForm" method="post" action="">
 	<h1>이메일인증</h1>
		<div class="form-group">
		    <input type="email" placeholder="이메일 입력해주세요" name="userId" class="userId" required="required">
		  	<button id="emailSendBtn" type="button">이메일 인증하기</button>
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