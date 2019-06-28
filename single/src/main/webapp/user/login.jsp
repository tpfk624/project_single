<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/modern_business_top.jsp" %>

<!-- 이미지 참고 사이트 :  https://www.w3schools.com/howto/tryit.asp?filename=tryhow_css_login_form_modal -->
<!-- 네아로 사용 -->

<!-- naver login script -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
 <style>

/* Full-width input fields */
.loginmodal-input {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
.loginmodal-btn {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

.loginmodal-btn:hover {
  opacity: 0.8;
}

/* Extra styles for the cancel button */
.loginmodal-cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

/* Center the image and position the close button */
.loginmodal-imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}

.loginmodal-container {
  padding: 16px;
}

span.loginmodal-psw {
  float: right;
  padding-top: 16px;
}

/* The Modal (background) */
.loginmodal {
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
.loginmodal-form {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 50%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

/* Add Zoom Animation */
.animate {
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
  span.psw {
     display: block;
     float: none;
  }
  .loginmodal-cancelbtn {
     width: 100%;
  }
}
</style>
  
  
<!--    모달에서 ok 신호를 받으면 요 페이지가 main으로  -->
  	

  <br>
  <br>
  <br>
  <br>
  <br>
<button onclick="document.getElementById('loginmodal').style.display='block'" style="width:auto;">Login</button>

<div id="loginmodal" class="loginmodal">
  <form class="loginmodal-form animate" action="/action_page.php">
    <div class="loginmodal-imgcontainer">
      <span onclick="document.getElementById('loginmodal').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>

    <div class="loginmodal-container">
      <label for="uname"><b>아이디</b></label>
      <input  class= "loginmodal-input" type="text" placeholder="Enter UserId" name="uname" required>

      <label for="psw"><b>패스워드</b></label>
      <input class= "loginmodal-input" type="password" placeholder="Enter Password" name="psw" required>
        
      <button class ="loginmodal-btn" type="submit">로그인</button>
      <label>
        <input type="checkbox" checked="checked" name="remember"> 로그인 상태 유지
      </label>
      <div id="naver_id_login"></div>
    </div>

    <div class="loginmodal-container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('loginmodal').style.display='none'" class="loginmodal-cancelbtn">Cancel</button>
      <span class="loginmodal-psw">Forgot <a href="#">아이디찾기</a> <a href="#">비밀번호찾기</a> <a href="#">회원가입</a></span>
    </div>
  </form>
</div>
  	<div id="naver_id_login"></div>




<!-- loginmodal 창 닫기 -->
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

<!-- 로그인 자바스크립트   -->
  <script type="text/javascript">
  	var naver_id_login = new naver_id_login("3FGMY2V_UXaBQxS0sx0g", "http://localhost/single/user/callback.jsp");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("http://localhost/single/user/login.jsp");
  	naver_id_login.setState(state);
//   	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  </script>
  

  <br>
  <br>
  <br>
  <br>
  <br>
<%@ include file = "/WEB-INF/views/commons/template/modern_business_bottom.jsp" %>
