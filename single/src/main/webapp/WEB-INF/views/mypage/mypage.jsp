<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/template/modern_business_top.jsp"%>
<link rel="stylesheet" href="${root}/resources/css/group/group.css">
<link rel="stylesheet" href="${root}/resources/css/user/user.css">

<style>
.modal-body{
	 font-family : '돋움'
}

label {
    display: inline-block;
    margin-bottom: .5rem;
    float: left;
    margin-right: 115px;
    font-size: 14px;
}

.h6, h6 {
    font-size: 0.8rem;
}


.btn_submit {
    color: white !important;
}

.old_pw, .new_pw, .pw_vali {
    width: 421px;
    font-family: '돋움';
}
</style>
	

<script>

$(function(){
	
	// input type = file 의 파일값 읽어서, 프로필 사진 이미지 부분에 적용 (미리보기)
	function readURL(input) {
		if(input.files && input.files[0]) {
			var reader = new FileReader();
			
			reader.onload = function (e) {
				$("#profileImg").attr("src", e.target.result);
			}
			
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	//파일 변경 이벤트 (프로필 사진 썸네일 미리보기)
	$("#profileBtn").change(function(){
		readURL(this);
	});
	
	
	var curpassright = 1;
	// 현재 비번 일치 여부 체크
	$("#userPassword").keyup(function(){
		var curpass = $(this).attr("data-num");
		var inputpass = $(this).val();
		if(curpass != inputpass) {
			curpassright = 1;
			$("#passrightcheck").css('color', 'tomato');
			$("#passrightcheck").text('*비밀번호가 일치하지 않습니다.');
		}else {			
			curpassright = 0;
			$("#passrightcheck").css('color', 'steelblue');
			$("#passrightcheck").text('*비밀번호가 일치합니다.');
		}
	});
	
	// 새 비번 적합 여부 체크
	// password 형식 - 정규표현식
	// 숫자, 특수문자, 영문자 포함한 8~15자리 이내의 비밀번호만 허용
	var passtypecnt = 1;
	var passwordRule = /(?=.*\d{1,})(?=.*[~`!@#$%\^&*()-+=]{1,})(?=.*[a-zA-Z]{1,}).{8,14}$/;
	
	// 새 비번 형식 체크
	$("#newpass").keyup(function(){
		var newpass = $(this).val();
		
		if(newpass.trim().length == 0){			
			$("#passtypecheck").css('color', 'gray');
			$("#passtypecheck").text('*비밀번호 변경을 원할 경우, 입력해주세요.');
		} else if(!passwordRule.test(newpass)){
			passtypecnt = 1;
			$("#passtypecheck").css('color', 'tomato');
			$("#passtypecheck").html('*비밀번호는 특수문자+영문+숫자를 포함한 8~15자리입니다.');
		} else{
			passtypecnt = 0;
			$("#passtypecheck").css('color', 'steelblue');
			$("#passtypecheck").html('*사용 가능한 비밀번호 입니다.');
		}
	});
	
	var passsamecnt = 1;
	var istherenewpass = 0;
	
	// 새 비번 확인 일치 여부
	$("#newpassck").keyup(function(){
		var newpass = $("#newpass").val();
		var passck = $(this).val();
		
		if(newpass.trim().length == 0){		
			$("#passsamecheck").css('color', 'tomato');
			$("#passsamecheck").text('*새 비밀번호를 입력해주세요.');
		}else if(newpass != passck){
			passsamecnt = 1;
			$("#passsamecheck").css('color', 'tomato');
			$("#passsamecheck").text('*비밀번호가 일치하지 않습니다. 다시 확인해주세요.');
		} else {
			passsamecnt = 0;
			istherenewpass = 1;
			$("#passsamecheck").css('color', 'steelblue');
			$("#passsamecheck").html('*비밀번호가 일치합니다.');			
		}
	});
	
	
	// 수정 요청
	$(".userinfoBtn").click(function(){
		if($("#userPassword").val().trim().length == 0){
			alert("현재 비밀번호를 입력해주세요.");
		} else if(curpassright != 0){
			alert("현재 비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
		} else if($("#userNickname").val().trim().length == 0){
			alert("닉네임을 입력해주세요.");
		} else if($("#userPhone").val().trim().length == 0){
			alert("핸드폰 번호를 입력해주세요.");
		} else if(passtypecnt != 0 && istherenewpass != 0) {
			alert("사용할 수 없는 새 비밀번호입니다. 다시 확인해주세요.");
		}else if(passsamecnt != 0 && istherenewpass != 0) {
			alert("새 비밀번호 확인란이 일치하지 않습니다. 다시 확인해주세요.");
		}else {
		
// 			$(".modifyForm").attr("action", "${root}/mypage/modify").submit();
		}
	}); 
	
	 /* 변경사항 저장 버튼 클릭 시  */
	 $(".userinfoBtn").click(function() {
		 console.log("버튼클릭됨");
		$.ajax({
			url: "${root}/mypage/modify",
			type: "POST",
			processData: false,  //사진업로드때문에 함
			contentType: false,  //사진업로드때문에 함
			data: new FormData($("#userinfoform")[0]), //사진업로드때문에 함
			dataType: "json", //응답
			success: function(result) {
				alert(result.result);
				if (result.code == 99) {
					location.href = "${root}/member/login";
					return false;
				}else if (result.code == 1) {
					location.reload();
				}
				return false;
				
			}
		});	
		return false;
	});
	 	 
	 
	/* 회원 탈퇴 */
	 $("#DeletePressBtn").click(function(){
	 	alert("탈퇴 버튼 클릭됨");
	 	
	 	var pass = $(this).attr("data-num");
	 	alert(pass);
	 	
	 	var pw_input = $("#pw_input").val();
	 	alert(pw_input);
	 	
	 	if( pw_input != pass){
	 		alert("비밀번호가 일치하지 않습니다.");
	 	} else{
	 		var result = confirm('정말 탈퇴하시겠습니까?');
	 		
	 		if(result){
	 			alert("탈퇴가 완료되었습니다.");		
	 			location.href="${root}/mypage/userdelete";
	 		}
	 	}
	 });
});


</script>


<div id="my-page-wrap">
	<div id="my-page-header">
		<div id="header-content" class="my-page-content">
		
			<!-- 프로필사진 -->
			<div class="user-photo" style="display: inline-block;">
				<c:if test="${userInfo.userProfile != null}">
	            	<img src="${userInfo.userProfile}" class="rounded-circle" width="90" height="90">             			
				</c:if>
				<c:if test="${userInfo.userProfile == null}">
            		<img id = "userpic" src='${root}/resources/img/seonimg/kakaopic.png'  class="rounded-circle" width="90" height="90">  			
				</c:if>
			</div>
			<!-- 프로필사진 -->
			<div id="tabs">
				<div id="user-name">${userInfos.userName} (${userInfos.userNickname})</div>
				<div id="tab-box">
					<a class="tab selected" href="${root}/mypage/mypage">내 프로필</a> 
					<a class="tab" href="${root }/mypage/groupall">나의 모임관리</a> 
					<a class="tab" href="${root}/mypage/stampgroup">찜한 모임</a> 
					<a class="tab" href="${root}/mypage/writelist">게시물관리</a>
				</div>
			</div>
		</div>
	</div>

	
	<!-- 여기서부터 탈퇴 모달  -->
	<div class="modal" id="deleteModal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">회원탈퇴</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<form action="/ko/member/change_pw" method="post" id="delete_form">
					<div class="modal-body">
						<div>
						<h6>사용하고 계신 계정을 탈퇴할 경우 복구가 불가능합니다. 
						탈퇴후 회원 정보 및 서비스 이용기록은 모두 삭제되오니 신중하게 선택하여 주시기 바랍니다.
						<br><br>
						회원탈퇴를 위해 비밀번호를 입력해 주세요.
						</h6>

						</div>
						<input type="password" id="pw_input" placeholder="현재 비밀번호"class="pw_input delete_pw userInput" name="delete_pw"> 
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" id="DeletePressBtn" class="btn btn-primary deletebtn" data-num="${userInfo.userPassword}">탈퇴</button>
	          			<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 여기서부터 비밀번호 모달 끝 -->
	
	
	<div class="wrap">
	<form id="userinfoform" method="post" action="" enctype="multipart/form-data" >
	<!-- 사진 방식을 보낼때 지킬것  -->
		<div class="config_area">
			<div class="config_title">
				<!--계정설정-->
				계정설정
			</div>
			<form>
				<table class="config_table" width="100%">
					<colgroup>
						<col width="250">
						<col width="*">
					</colgroup>
					<tbody>
						<!-- 테이블 한 줄  -->
						<tr>
							<th>
								<!--이메일 주소-->아이디 :
							</th>
							<td>
								<input type="text" name="userId" id="userId" class="t_input" value="${userInfos.userId}" readonly/>
							</td>
						</tr>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						<!-- 테이블 한 줄  -->
						
						<!-- 테이블 한 줄  -->
						<tr>
							<th>
								<!--이메일 주소-->이   름 :
							</th>
							<td>
								<input type="text" name="userName" id="userName" class="t_input" value="${userInfos.userName}" readonly/>
							</td>
						</tr>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						<!-- 테이블 한 줄  -->
						
						<!-- 테이블 한 줄  -->
						<tr>
							<th>
								<!--이름-->닉네임 :
							</th>
							<td><input type="text" name="userNickname" id="userNickname" class="t_input" value="${userInfos.userNickname}"></td>
						</tr>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						<!-- 테이블 한 줄  -->
						
						<!-- 테이블 한 줄  -->
						<tr>
							<th>
								<!--이름-->현재 비밀번호 :
							</th>
							<td rowspan = 2>
								<input data-num="${userInfos.userPassword}" type="password" name="userPassword" id="userPassword" class="pw_input old_pw"  value=""  placeholder="현재 비밀번호를 입력해주세요.">
								<!-- ******* 비밀번호 부합 여부 확인 메세지 ******* -->
	                			<div style="margin-bottom:0px; color:tomato; font-size:12px" id="passrightcheck">*현재 비밀번호를 입력해주세요.</div>
							</td>
						</tr>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						<!-- 테이블 한 줄  -->
						
						<!-- 테이블 한 줄  -->
						<tr>
							<th>
								<!--이름-->신규 비밀번호 :
							</th>
							<td rowspan = 2>
								<input type="password" name="newpass" id="newpass" class="pw_input new_pw" value=""  placeholder="특수문자+영문+숫자를 포함한 8~15자리">
								 <!-- ******* 새 비밀번호 정규표현식 확인 메세지******* -->
	                			<div style="margin-bottom:0px; font-size:12px" id="passtypecheck">&nbsp;</div>
							</td>
						</tr>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						<!-- 테이블 한 줄  -->
						
						<!-- 테이블 한 줄  -->
						<tr>
							<th>
								<!--이름-->비밀번호 확인 :
							</th>
							<td rowspan = 2>
								<input type="password" name="newpassck" id="newpassck" class="pw_input pw_vali" value=""  placeholder="새 비밀번호를 다시 입력해주세요.">
								 <!-- ******* 새 비밀번호 일치 여부 확인 메세지******* -->
	               				 <div style="margin-bottom:0px; font-size:12px" id="passsamecheck">&nbsp;</div>
							</td>
						</tr>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						<!-- 테이블 한 줄  -->
						
						
						<!-- 테이블 한 줄  -->
						<tr>
							<th>
								<!--이름-->핸드폰 :
							</th>
							<td>
							<input type="tel" name="userPhone" id="userPhone" class="t_input" value="${userInfos.userPhone}">
							</td>
						</tr>
						<tr>
							<td class="space">&nbsp;</td>
						</tr>
						<!-- 테이블 한 줄  -->
						
						
						<%@ include file="/WEB-INF/views/commons/fileupload.jsp"%>
	
	
					</tbody>
				</table>
			</form>

			<div class="config_foot">
				<a href="#" class="leavelink" data-toggle="modal" data-target="#deleteModal">회원탈퇴</a> 
				<!-- <button type="button" class="btn btn-primary">변경사항 저장</button> -->
				<a class="btn_submit userinfoBtn" > 변경사항 저장</a>
				<div class="clear"></div>
			</div>
		</div>
		</form>
	</div>
</div>
<%@ include
	file="/WEB-INF/views/commons/template/modern_business_bottom.jsp"%>