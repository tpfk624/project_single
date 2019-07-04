<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/modern_business_top.jsp" %>

<!-- 네이버로그인 -->
<c:set var= "callbackUrl" value="http://localhost/single/user/callback.jsp"/>
<%@ include file= "login.jsp"%> 

<button class= "naverlogin-button" > 로그인버튼 </button>




<%@ include file = "/WEB-INF/views/commons/template/modern_business_bottom.jsp" %>