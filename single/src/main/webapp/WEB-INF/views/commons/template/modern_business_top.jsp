<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">


  	<title>우리 혼자 산다</title>

	<!-- Bootstrap core JavaScript -->
	<script src="${root}/resources/template/modern/vendor/jquery/jquery.min.js"></script>
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
	<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="${root}/resources/template/modern/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<!-- Bootstrap core CSS -->
	<!-- Modern Business - Start Bootstrap Template -->
  	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->
  	<link rel="stylesheet" href="${root}/resources/template/modern/vendor/bootstrap/css/bootstrap.min.css" >
	<link rel="stylesheet" href="${root}/resources/template/modern/css/modern-business.css" >
	
	<!-- font -->
	<link href="${root}/resources/template/font/font.css" rel="stylesheet" type="text/css">
	
<!-- style 지정 -->	
<style type="text/css">

/* 폰트 변경 */
body {
	font-family: BMDOHYEON !important;
	box-sizing: border-box;
}

.background-blue {
    background-color: #004085!important;
}
/* 버튼 hover 시 음영주기 */
.btn:hover, .btn:active{
	box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)
}

/* btn-primary 변경 */
.btn-primary{
	background-color: #004085;
	border-color: #004085;
}
.btn-primary:hover{
	background-color: #004085cc;
	border-color: #004085cc;
}
.btn-primary:not(:disabled):not(.disabled).active, .btn-primary:not(:disabled):not(.disabled):active, .show>.btn-primary.dropdown-toggle{
	background-color: #004085cc;
	border-color: #004085cc;
}

.btn-primary:active{
	background-color: #004085cc;
	border-color: #004085cc;
}

.dropdown-item.active, .dropdown-item:active{
	background-color: #004085;
	border-color: #004085;
}


</style>
</head>
<body>
  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark background-blue fixed-top">
    <div class="container">
      <a class="navbar-brand" href="index.html">우리 혼자 산다</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="about.html">나의 정보</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="services.html">혼자 놀아요</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="contact.html">같이 놀아요</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              	마이페이지
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="${root}/user_mypage/myPage.jsp">내 프로필</a>
              <a class="dropdown-item" href="${root}/user_mypage/myPageGroup.jsp">나의 모임관리</a>
              <a class="dropdown-item" href="${root}/user_mypage/myPageGroupZzim.jsp">찜한 모임</a>
              <a class="dropdown-item" href="${root}/user_mypage/myPageWrite.jsp">게시물 관리</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              	같이놀아요
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <a class="dropdown-item" href="${root}/group/grouplist.jsp">그룹 목록보기</a>
              <a class="dropdown-item" href="${root}/group/groupcreate.jsp">그룹 만들기</a>
              <a class="dropdown-item" href="${root}/group/groupmain.jsp">그룹 안으로 들어가기</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             	혼자놀아요
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <a class="dropdown-item" href="${root}/board/singlemain.jsp">혼자 놀아요 메인</a>
              <a class="dropdown-item" href="${root}/board/index_modern_business_alone.jsp">혼자 놀아요 메인</a>
              <a class="dropdown-item" href="${root}/board/index_modern_business_cook.jsp">요리게시판</a>
              <a class="dropdown-item" href="${root}/board/index_modern_business_writing.jsp">글쓰기 페이지</a>
              <a class="dropdown-item" href="${root}/board/index_modern_business_writeboard.jsp">유저 클릭시 페이지</a>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </nav>
