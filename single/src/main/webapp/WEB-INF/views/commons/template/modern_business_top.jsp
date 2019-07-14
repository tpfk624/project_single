<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kitri.single.user.model.UserDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>



<c:set var="root" value="${pageContext.request.contextPath}"/>
<%-- <c:set var="userInfo" value="${sessionScope.userInfo }" scope="request"/> --%>
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
	<script src="${root}/resources/template/modern/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	
	
	<!-- Bootstrap core CSS -->
	<!-- Modern Business - Start Bootstrap Template -->
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  	<!-- <link rel="stylesheet" href="${root}/resources/template/modern/vendor/bootstrap/css/bootstrap.min.css" >-->
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

.dropdown-item{
	cursor: pointer;
}

.dropdown-item.active, .dropdown-item:active, .dropdown-item.active:hover{
	background-color: #004085;
	border-color: #004085;
	color: white!important;
}
tag{
	background-color: #f0f0f0;
	color : #43853d;
	padding: .2em;
	border-radius: 10%;
	font-size: large;
	cursor: pointer;
	margin-right: 0.5rem;
}
tag:active, tag:hover{
	background-color: #43853d;
	color: white;
}
tag>input[type=button]{
	border: none;
	background: none;
}
tag>input[type=button]:hover{
	font-weight: bold;
}
.taglist{
	display: inline-block;
}
.input-tag{
	display: inline-block;
	width: auto;
}
.table-hover tr{
	cursor: pointer;
}

</style>

<!-- 로그인 -->
<!-- 사용법:파일 안의 로그인 로그아웃 버튼 선택자: loginModalBtn 등록해주세요. -->
<%-- <%@ include file = "/WEB-INF/views/member/login/loginmodal.jsp"%>  --%>
<!--end 로그인  -->	

<script>
var GROUP_RESOURCES_IMG = "/single/resources/img/group/";
var GROUP_RESOURCES_CSS = "/single/resources/css/group/";
var GROUP_RESOURCES_JS = "/single/resources/js/group/";

$(document).ready(function(){
	//모달버튼으로 만들면 안됨 (하나의 페이지에서 네아로 버튼을 중복으로 생성 불가(id로 버튼을 만들기 때문에))
	$('#mvlogin').click(function(){
		location.href = "${root}/member/login";
	});
	//로그아웃기능 추가
	$('#logoutBtn').click(function(){
		$.ajax({
			url:"${root}/member/logout",
			method: "GET",
			success: function(data){
				console.log(data);
				location.reload();
			},
			error: function (data){
			}
		});
		return false;
	});	
});

</script>
</head>
<body>


  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark background-blue fixed-top">
    <div class="container">
      <a class="navbar-brand" href="${root}/home">우리 혼자 산다</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <c:if test="${empty sessionScope.userInfo}" >
          <li class="nav-item">
            <a class="nav-link" id="mvlogin"  href="#">로그인</a>
<%--             <a class="nav-link" href="${root}/member/loginmodal">로그인</a> --%>
          </li>
          </c:if>
          <c:if test="${!empty sessionScope.userInfo}">
          
	          <li class="nav-item">
	          	<a class="nav-link"href="#">${sessionScope.userInfo.userNickname} 님 환영합니다.</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link" id="logoutBtn"  href="#">로그아웃</a>
	          </li>
	          <li class="nav-item dropdown">
	            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	              	마이페이지
	            </a>   
	            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
	              <a class="dropdown-item" href="${root}/mypage/mypage">내 프로필</a>
	              <a class="dropdown-item" href="${root}/mypage/groupall">나의 모임관리</a>
	              <a class="dropdown-item" href="${root}/mypage/stampgroup">찜한 모임</a>
	              <a class="dropdown-item" href="${root}/mypage/writelist">게시물 관리</a>
	            </div>
	          </li>
          </c:if>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              	같이놀아요
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <a class="dropdown-item" href="${root}/group/calubang.jsp">calubang로그인</a>
              <a class="dropdown-item" href="${root}/group/calubang2.jsp">calubang2로그인</a>
              <a class="dropdown-item" href="${root}/group">모임 목록보기</a>
              <a class="dropdown-item" href="${root}/group/create">모임 만들기</a>
              <a class="dropdown-item" href="${root}/group/grouphomework.jsp">모임 과제 목록보기</a>
              <a class="dropdown-item" href="${root}/group/grouphprogress.jsp">모임 과제 진행률 보기</a>
              <a class="dropdown-item" href="${root}/group2/">모임 목록 추천</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
             	혼자놀아요
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <a class="dropdown-item" href="${root}/board/singlemain">혼자 놀아요 메인</a>
              <a class="dropdown-item" href="${root}/board/singlelifeboard">자취생활 게시판</a>
              <a class="dropdown-item" href="${root}/board/singlecookboard">요리게시판</a>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </nav>
