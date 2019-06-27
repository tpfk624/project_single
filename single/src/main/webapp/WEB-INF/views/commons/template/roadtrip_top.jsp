<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kitri.single.user.model.UserDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% UserDto userDto = new UserDto();
userDto.setUserId("qjawns0617@naver.com");
userDto.setUserName("권범준");
userDto.setUserNickname("뿡뿡뿡뿡");
session.setAttribute("userInfo", userDto); %>

<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">


  	<title>트레이스</title>

	<!-- Bootstrap core CSS -->	
	<!-- templated-roadtrip -->
	<link rel="stylesheet" href="${root}/resources/template/roadtrip/assets/css/main.css" />
	
	
</head>
<body>
