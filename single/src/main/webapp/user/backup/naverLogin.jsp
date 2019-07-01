<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  

<html>
<head>
<title>NaverLoginTest</title>
</head>
<body>
<br>
<%  
SecureRandom random = new SecureRandom();
 new BigInteger(130, random).toString(32);//상태 토큰
%>
<script type="text/javascript">
var url ="https://nid.naver.com/oauth2.0/authorize"
var response_type=code;
var client_id = "3FGMY2V_UXaBQxS0sx0g";
var redirect_uri ="login.jsp" url encoding 적용;
var state = "???";//상태토큰 세션저장


</script>
<div style="text-align:center"><a href="${url}">NaverIdLogin</a></div>
</body>
</html>