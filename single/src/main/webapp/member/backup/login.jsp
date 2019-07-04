<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script>
// https://nid.naver.com/oauth2.0/authorize?client_id={클라이언트 아이디}&
// 		response_type=code&redirect_uri={개발자 센터에 등록한 콜백 URL(URL 인코딩)}&state={상태 토큰}\
$(document).ready(function(){
	$('#naverLogin').click(function() {
		var clientId='3FGMY2V_UXaBQxS0sx0g';
		var redirect_uri='http://127.0.0.1:80/single/user/callback';
		var state = ${state};
		var url = 'https://nid.naver.com/oauth2.0/authorize?client_id'+clientId+
				'response_type=code'+
				'redirect_uri='+redirect_uri+
				'state'+state;
		console.log(''+url);
		$(location).attr('href', '${url}');
	});
});

</script>

<div style="text-align:center"><a id="naverLogin">NaverIdLogin</a></div>

</body>
</html>