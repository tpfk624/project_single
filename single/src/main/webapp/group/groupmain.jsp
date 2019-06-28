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

/*옮겨도 되는 부분*/
.groupname{
	font-size: 2rem;
}
.groupdesc{
	margin-right: 10px;
	margin-bottom: 10px;
}
.whitespace{
	background-color: white;
}
.groupheader{
	
}
.groupsection{
	border-top: 1px solid #e6e6e6;
	padding-top: 3%;
	overflow: hidden;
	padding-bottom: 3%;
}

.group-info{
		
}
.group-info-label{
	float: left;
	margin-left: 10px;
	font-weight: bold;
}

.group-info-content{
	float: right;
	width: 80%;
}
</style>

<%@ include file="groupheader.jsp"%>

<section class="contents">
	<div class="container col-lg-9 col-md-9 col-sm-9 whitespace">		
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
				<div class="groupdesc">#스터디 #개망함 #프로젝트 #조짐</div>
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
</section>
<!-- /.container -->
<!-- 채팅부분 -->
<%@ include file="chat.jsp"%>

<%@ include file="/WEB-INF/views/commons/template/modern_business_bottom.jsp"%>
