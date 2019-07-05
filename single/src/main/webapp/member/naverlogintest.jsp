<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/modern_business_top.jsp" %>

<!-- 네이버로그인 로그인 오픈 API서비스 환경-->
<c:set var= "callbackUrl" value="http://192.168.14.22/single/member/callback.jsp"/>
<c:set var="serviceUrl" value= "http://192.168.14.22/single"/>


<script>
$(document).ready(function(){
	//로그인 버튼
	$('.loginBtn').click(function() {
		//로그인 모달 띄우기 !!! loginmodal id를 통해서 사용됨
		$('#loginmodal').css("display","block").attr("width","auto");
	});
	
	//로그아웃 버튼
	$('.logoutBtn').click(function() {
		$(location).attr("href","${root}/member/logout");
	});
	
	//이메일인증버튼
	$('.emailAuthBtn').click(function() {
		$('.emailAuthForm').attr("action", "${root}/member/joinpost").submit();
	});
});
</script>
<%@ include file= "login.jsp"%> 
<%-- ${userInfo} --%>
<!-- 로그인 버튼 -->
<c:if test="${userInfo == null }">
	<button type = "button" class= "loginBtn" > 로그인버튼 </button>
</c:if>
<!-- 로그아웃 버튼 -->
<c:if test="${userInfo !=null }">
	${userInfo.userName }님 환영합니다.
	<button type = "button" class= "logoutBtn" > 로그아웃하기 </button>
</c:if>


<form class="emailAuthForm" method="post" >
	<input type="email" placeholder="이메일 입력해주세요" name="email" required>
	<button class="emailAuthBtn" type="button">이메일 인증하기</button>
</form>





<%@ include file = "/WEB-INF/views/commons/template/modern_business_bottom.jsp" %>