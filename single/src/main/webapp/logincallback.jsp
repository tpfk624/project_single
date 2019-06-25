<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>네이버로그인</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  
</head>
<body>
<script type="text/javascript">

  var naver_id_login = new naver_id_login("3FGMY2V_UXaBQxS0sx0g", "http://localhost/single/logincallback.jsp");
  
  
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    console.log(naver_id_login.getProfileData('email'));
    console.log(naver_id_login.getProfileData('nickname'));
    console.log(naver_id_login.getProfileData('age'));
  }
	//접근 토큰 값 
  var state =naver_id_login.oauthParams.access_token;
  var url= "http://localhost/single/logincallback.jsp(UTF-8)";

  
  $(window).on("load", function() {
	  $(window).location("https://nid.naver.com/oauth2.0/authorize?client_id={3FGMY2V_UXaBQxS0sx0g}&response_type=code&redirect_uri={"+url+"}&state={"+state+"}");
  })

</script>

  

</body>
</html>