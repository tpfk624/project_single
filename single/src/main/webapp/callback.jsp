<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>

<form id="naverProfileForm"  >
	<input type ="hidden" name ="email" id="email" >
	<input type ="hidden" name ="accessToken" id="accessToken" >
</form>

<script type="text/javascript">
//   var naver_id_login = new naver_id_login("3FGMY2V_UXaBQxS0sx0g", "${callbackURL}");
  var naver_id_login = new naver_id_login("3FGMY2V_UXaBQxS0sx0g", "http://localhost/single/callback.jsp");
  // 접근 토큰 값 출력
  var accessToken =naver_id_login.oauthParams.access_token;
  console.log(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    var email = naver_id_login.getProfileData('email');
    var nickname = naver_id_login.getProfileData('nickname');
    var age= naver_id_login.getProfileData('age');
	$('#email').val(email);
	$('#accessToken').val(accessToken);
	$("#naverProfileForm").attr("method", "POST").attr("action", "${root}/naverlogin/callback").submit();
  }
</script>
</body>
</html>

