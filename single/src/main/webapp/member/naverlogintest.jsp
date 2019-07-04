<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/modern_business_top.jsp" %>


<script>
$(document).ready(function(){
	//로그인 버튼
	$('.loginBtn').click(function() {
		//로그인 버튼 띄우기
		$('#loginmodal').css("display","block").attr("width","auto");
	});
	
	$('.logoutBtn').click(function() {
		$(location).attr("href","member/logout");
	});
});
</script>

<!-- 네이버로그인 모달 기능-->
<c:set var= "callbackUrl" value="http://localhost/single/member/callback.jsp"/>
<%@ include file= "login.jsp"%> 

<!-- 버튼 -->
<c:if test="${userInfo ==null }">
	<button class= "loginBtn" > 로그인버튼 </button>
</c:if>
<c:if test="${userInfo !=null }">
	${userInfo.userName }님 환영합니다.
	<button class= "logoutBtn" > 로그아웃하기 </button>
</c:if>






<%@ include file = "/WEB-INF/views/commons/template/modern_business_bottom.jsp" %>