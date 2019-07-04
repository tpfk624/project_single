<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/template/modern_business_top.jsp"%>
<%@ include file="/WEB-INF/views/commons/alert_danger.jsp"%>
<%@ include file="/WEB-INF/views/commons/alert_success.jsp"%>
<link rel="stylesheet" href="${root}/resources/css/group/group.css">

<style>
/* 페이지에 유지할 부분*/
.carousel-item{
	height : 30vh;
}
</style>
<script>
$(function() {
	var navbar = $("#navbar");
	var sticky = navbar.offset().top;
	$(window).scroll(function() {
		//console.log($(window).scrollTop() + "//" + sticky);
		if($(window).scrollTop() >= sticky){
			navbar.addClass("sticky");
		}else{
			navbar.removeClass("sticky");
		}
	});
	
	$(".group-navbar a").click(function() {
		$(this).addClass("active");
		$(this).siblings().removeClass("active");
	});
});
</script>


<%@ include file="groupheader.jsp"%>

<section class="contents">
	<div class="container col-lg-9 col-md-9 col-sm-9 whitespace">
	
	
	<div class="groupmain">
		<div id="navbar" class="group-navbar">
		  	<a class="group-navbar-item active">모임메인</a>
		  	<a class="group-navbar-item">모임설정</a>
		  	<a class="group-navbar-item">모임과제</a>
		  	<a class="group-navbar-item">모임원 중심점 찾기</a>
		</div>
					
		<!-- 모임 이름 뿌져지는 곳 -->
		<section class="groupsection groupheader">
			<div class="row center">
					<span class="center">카테고리뿌리는곳</span>
				</div>
			<div class="row">
				<div class="groupname center">모임 이름 뿌려지는 곳</div>
			</div>
		</section>
		
		<!-- 모임 정보 -->
		<section class="groupsection group-info">
			<label class="group-info-label col-sm-2">모임정보</label>
			<div class="group-info-content col-sm-10">
				<div class="groupdesc"><tag>#스터디</tag> <tag>#개망함</tag> <tag>#프로젝트</tag> <tag>#조짐</tag></div>
				<div class="groupdesc">인원 : 5 / 10</div>
				<div class="groupdesc">모임주요장소 : 구로디지털 단지</div>
			</div>
		</section>
		
		<!-- 모임 설명 -->
		<section class="groupsection group-info">
			<label class="group-info-label col-sm-2">모임설명</label>
			<div class="group-info-content col-sm-10">
			[고세라] [오후 9:33] ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
			[고세라] [오후 9:33] 탈주각 막기
			[안병욱] [오후 9:33] ㅋㅋㅋㅋㅋ
			[고세라] [오후 9:34] 시작인가여
			[형태희] [오후 9:34] ㅋㅋㅋㅋㅋㅋㅋㅋ
			[준이] [오후 9:34] ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
			[고세라] [오후 9:34] ㅇㅈㅇㅈ
			[고세라] [오후 9:34] 플젝
			[안병욱] [오후 9:34] 개웃기네 ㅋㅋㅋㅋㅋ
			[형태희] [오후 9:34] 자연스러웠다
			[준이] [오후 9:34] 아 놩 레알 현웃터짐ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
			[고세라] [오후 9:34] 끝나고 넣으라고 하심
			[고세라] [오후 9:34] ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
			[준이] [오후 9:34] 들킴욬ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
			[황선혜] [오후 9:34] ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
			</div>
		</section>
		
		<!-- 달력 -->
		<section class="groupsection group-calendar">
			<label class="group-info-label col-sm-2">모임일정</label>
			<div class="group-info-content col-sm-10">
			<%@ include file="calendar.jsp"%>
			</div>
		</section>
	</div>
	</div>
</section>
<!-- /.container -->
<!-- 채팅부분 -->
<%@ include file="chat.jsp"%>

<%@ include file="/WEB-INF/views/commons/template/modern_business_bottom.jsp"%>
