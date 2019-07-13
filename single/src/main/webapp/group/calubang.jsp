<%@page import="com.kitri.single.user.model.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/template/modern_business_top.jsp"%>
<% 
HttpSession httpSession = request.getSession();
UserDto userInfo = new UserDto();
userInfo.setUserId("calubang@naver.com");
userInfo.setUserNickname("카루뱅");
userInfo.setUserName("안병욱");
httpSession.setAttribute("userInfo", userInfo);
%>
<script>
$(location).attr("href", "/single/group");
</script>
