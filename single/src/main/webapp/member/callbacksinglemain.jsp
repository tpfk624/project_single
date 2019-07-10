<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="redirectUrl" value= "${root}/navermember/callback"/>


<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>


<form id="naverProfileForm"  >
	<input type ="hidden" name ="email" id="email" >
	<input type ="hidden" name ="accessToken" id="accessToken" >
	<input type ="hidden" name ="id" id="id" >
	<input type ="hidden" name ="nickname" id="nickname" >
	<input type ="hidden" name ="age" id="age" >
	<input type ="hidden" name ="gender" id="gender" >
	<input type ="hidden" name ="birthday" id="birthday" >
	<input type ="hidden" name ="profile_image" id="profile_image" >
</form>


</body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("${clientId}", "${callbackUrl}");
  // 접근 토큰 값 출력
  var accessToken =naver_id_login.oauthParams.access_token;
  
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    var email = naver_id_login.getProfileData('email');
   
    $('#email').val(email);
	$('#accessToken').val(accessToken);
	
	console.log('email'+ email);
	console.log('accessToken'+ accessToken);
	$("#naverProfileForm").attr("method", "POST").attr("action", "${redirectUrl}").submit();

//     var id = naver_id_login.getProfileData('id');
//     var nickname = naver_id_login.getProfileData('nickname');
//     var age= naver_id_login.getProfileData('age');
//     var gender= naver_id_login.getProfileData('gender');
//     var birthday= naver_id_login.getProfileData('birthday');
//     var profile_image= naver_id_login.getProfileData('profile_image');
    
	
// 	$('#id').val(accessToken);
// 	$('#nickname').val(nickname);
// 	$('#age').val(age);
// 	$('#gender').val(gender);
// 	$('#birthday').val(birthday);
// 	$('#profile_image').val(profile_image);
	
	

  }
</script>
</html>

