<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
----설명---- 
네이버 로그인 모달창 입니다.
현재 페이지를 import한 후 
id: loginmodal의 display를 block으로 변경해주세요.
-->

<!-- 네아로 설정값-->
<c:set var= "callbackUrl" value="http://localhost/single/member/callback.jsp"/>
<c:set var="serviceUrl" value= "http://localhost/single"/>
<c:set var="clientId" value= "3FGMY2V_UXaBQxS0sx0g"/>


<!-- 네아로 자바스크립트-->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<!-- 모달 css (이미지 참고 사이트 :  https://www.w3schools.com/howto/tryit.asp?filename=tryhow_css_login_form_modal -->
<link rel="stylesheet" href="${root}/resources/css/member/loginmodal.css" type="text/css">


<script>
$(document).ready(function(){
	var loginBtn =$('.loginBtn'); //로그인 버튼을 등록해주세요.  
	var logoutBtn=$('.logoutBtn'); //로그아웃 버튼을 등록해주세요.
	var registerBtn = $('.registerBtn');
	//로그인 버튼
	loginBtn.click(function() {
		//로그인 모달 띄우기 !!! loginmodal id를 통해서 사용됨
		$('#loginmodal').css("display","block").attr("width","auto");
	});
	
	//로그아웃 버튼
	logoutBtn.click(function() {
		$(location).attr("href","${root}/member/logout");
	});
	

	//회원가입 버튼
	registerBtn.click(function(){
		$(location).attr("href","${root}/member/emailauth");
	})
});


</script>



<!-- <button class = "naverlogin-button" onclick="document.getElementById('loginmodal').style.display='block'" style="width:auto;">Login</button> -->
  <div id="loginmodal" class="modal">  
  <form class="modal-content animate" action="/action_page.php">
    <div class="imgcontainer">
      <span onclick="document.getElementById('loginmodal').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>

    <div class="container">
    	<h3>우리 혼자 살아요</h3>
<!--       <label for="uemail"><b>이메일입력</b></label> -->
<!--       <input type="email" placeholder="이메일 입력해주세요" name="uemail" required> -->
      
      <label class="loginmodal-label" for="uname"><b>아이디</b></label>
      <input type="text" placeholder="아이디를 입력해주세요" name="uname" required>

      <label class="loginmodal-label" for="psw" ><b>비밀번호</b></label>
      <input  type="password" placeholder="비밀번호를 입력해주세요" name="psw" required style="font-family:돋움">
        
      <button type="submit">Login</button>
      <div id="naver_id_login"></div>
      <span class="other"> <a href="#" class = "registerBtn">회원가입</a>  <a href="#" >비밀번호변경</a> <a href="#">비밀번호 찾기</a></span>
      <input type="checkbox"  name="remember" id="remember"/> <label for="remember">아이디 기억하기</label>
      
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('loginmodal').style.display='none'" class="cancelbtn">Cancel</button>
      
    </div>
    
     
  </form>
  
</div>

<script>
var modal = document.getElementById('loginmodal');
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

<!-- 네이버 로그인 실행-->
<script type="text/javascript">http://localhost/single/naverlogintest.jsp
  	var naver_id_login = new naver_id_login("3FGMY2V_UXaBQxS0sx0g","${callbackUrl}");
//   	var naver_id_login = new naver_id_login("3FGMY2V_UXaBQxS0sx0g", "http://localhost/single/naverlogin/mvcallback");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("${serviceUrl}");
  	naver_id_login.setState(state);
//   	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
</script>
<!-- //네이버 로그인 실행-->
  

