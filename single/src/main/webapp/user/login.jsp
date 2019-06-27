<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/modern_business_top.jsp" %>



<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  
    <br>
  <br>
  <br>
  <br>
  <br>
  <!-- 네이버아이디로로그인 버튼 노출 영역 -->
  
  <div id="naver_id_login"></div>
<!--    모달에서 ok 신호를 받으면 요 페이지가 main으로  -->
  <!-- //네이버아이디로로그인 버튼 노출 영역 -->

  
  <script type="text/javascript">
  	var naver_id_login = new naver_id_login("3FGMY2V_UXaBQxS0sx0g", "http://localhost/single/user/callback.jsp");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("http://localhost/single/user/login.jsp");
  	naver_id_login.setState(state);
//   	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  </script>
  
  <button>사용자</button>
  <br>
  <br>
  <br>
  <br>
  <br>
  
<%@ include file = "/WEB-INF/views/commons/template/modern_business_bottom.jsp" %>
