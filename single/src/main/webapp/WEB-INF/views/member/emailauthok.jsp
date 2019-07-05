<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/modern_business_top.jsp" %>


 이메일 인증완료 !! 환영합니다.
 <button id="mvmain">메인화면으로 가기 </button>
 
<script>
$(document).ready({
$('#mvmain').click(function() {
		window.location.href = "${root}/index.jsp";
	})
});
	
</script> 
<%@ include file = "/WEB-INF/views/commons/template/modern_business_bottom.jsp" %>