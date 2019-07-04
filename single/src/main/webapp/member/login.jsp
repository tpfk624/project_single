<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- 이미지 참고 사이트 :  https://www.w3schools.com/howto/tryit.asp?filename=tryhow_css_login_form_modal -->
<!-- 네아로 사용 -->
<!-- naver login script -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

<script>
$(document).ready(function(){
	//회원가입 이동 
	$('.register').click(function() {
		$(location).attr("href", "${root}/member/register");
		return false;
	});
	
});
</script>
 <style>

 
/* Full-width input fields */
#loginmodal input[type=text],
#loginmodal input[type=password],
#loginmodal input[type=email]
 {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
#loginmodal button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

#loginmodal button:hover {
  opacity: 0.8;
}

/* Extra styles for the cancel button */
#loginmodal .cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

/* Center the image and position the close button */
#loginmodal .imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}

#loginmodal img.avatar {
  width: 40%;
  border-radius: 50%;
}

#loginmodal .container {
  padding: 16px;
}

#loginmodal span.other {
  float: right;
  padding-top: 16px;
}

/* The Modal (background) */
#loginmodal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}

/* Modal Content/Box */
#loginmodal .modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 50%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
#loginmodal .close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

#loginmodal .close:hover,#loginmodal .close:focus {
  color: red;
  cursor: pointer;
}

/* Add Zoom Animation */
#loginmodal .animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  #loginmodal span.other {
     display: block;
     float: none;
  }
  #loginmodal .cancelbtn {
     width: 100%;
  }
}
</style>
<!-- <button class = "naverlogin-button" onclick="document.getElementById('loginmodal').style.display='block'" style="width:auto;">Login</button> -->
  <div id="loginmodal" class="modal">  
  <form class="modal-content animate" action="/action_page.php">
    <div class="imgcontainer">
      <span onclick="document.getElementById('loginmodal').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>

    <div class="container">
<!--       <label for="uemail"><b>이메일입력</b></label> -->
<!--       <input type="email" placeholder="이메일 입력해주세요" name="uemail" required> -->
      
      <label for="uname"><b>Username</b></label>
      <input type="text" placeholder="아이디를 입력해주세요" name="uname" required>

      <label for="psw" ><b>Password</b></label>
      <input  type="password" placeholder="비밀번호를 입력해주세요" name="psw" required style="font-family:돋움">
        
      <button type="submit">Login</button>
      <div id="naver_id_login"></div>
      <label>
        <input type="checkbox" checked="checked" name="remember"> Remember me
      </label>
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('loginmodal').style.display='none'" class="cancelbtn">Cancel</button>
      <span class="other"> <a href="#" class = "register">회원가입</a>  <a href="#" >비밀번호변경</a> <a href="#">비밀번호 찾기</a></span>
    </div>
  </form>
</div>

<script>
// Get the modal
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
  

