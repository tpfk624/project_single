<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/modern_business_top.jsp" %>

<!-- 네이버 로그인 속성자 id로 loginmodal를 사용  -->
<%@ include file = "login.jsp"%> 

<button  class = "naverlogin-button" > 로그인버튼 </button>
<script>
//버튼이벤트

$('.naverlogin-button').click(function() {
	//로그인 버튼 띄우기
	$('#loginmodal').css("display","block").attr("width","auto");
});
</script>
<!--// 네이버 로그인  -->


<%@ include file = "/WEB-INF/views/commons/template/modern_business_bottom.jsp" %>