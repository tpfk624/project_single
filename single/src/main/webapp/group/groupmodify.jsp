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
	defaultSetting("", "non-label");
});
</script>


<%@ include file="groupheader.jsp"%>

<section class="contents">
	<div class="container col-lg-9 col-md-9 col-sm-9 whitespace">
	<div id="navbar" class="group-navbar">
	  	<a class="group-navbar-item active">모임메인</a>
	  	<a class="group-navbar-item">모임설정</a>
	  	<a class="group-navbar-item">모임과제</a>
	  	<a class="group-navbar-item">모임원 중심점 찾기</a>
	</div>
	
	<div class="groupmain">				
		<!-- 모임 이름 뿌져지는 곳 -->
		<section class="groupsection groupheader">
			<div class="row">
				<div class="groupname center">모임 이름 뿌려지는 곳</div>
			</div>
		</section>
		<form id="groupmodifyForm" method="post" enctype="multipart/form-data">
		<!-- 모임 이름 -->
		<section class="groupsection group-info">
			<label class="group-info-label col-sm-2">모임이름(*)</label>
			<div class="group-info-content col-sm-10">
				<input type="text" class="form-control"
					id="name" placeholder="모임 이름을 입력해주세요" name="groupName">
			</div>
		</section>
		
		<!-- 모임 분류 -->
		<section class="groupsection group-info">
			<label class="group-info-label col-sm-2">모임분류(*)</label>
			<div class="group-info-content col-sm-10">
				<div class="dropdown col-lg-4 col-md-4 col-sm-4">
					<input type="hidden" name="groupCategoryNum" value="" >
					<button type="button" class="btn btn-primary dropdown-toggle"
						data-toggle="dropdown">모임분류</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="" role="1">스터디</a> 
						<a class="dropdown-item" href="" role="2">취미</a> 
						<a class="dropdown-item" href="" role="3">친목도모</a>
						<a class="dropdown-item" href="" role="4">맛집탐방</a>
					</div>
				</div>
			</div>
		</section>
		
		<!-- 대표 이미지 -->
		<section class="groupsection group-info">
			<label class="group-info-label col-sm-2">모임이미지</label>
			<div class="group-info-content col-sm-10">
				<%@ include file="/WEB-INF/views/commons/fileupload.jsp"%>
			</div>
		</section>
		
		<!-- 대표  태그-->
		<section class="groupsection group-info">
			<label class="group-info-label col-sm-2">모임태그</label>
			<div class="group-info-content col-sm-10">
				<input type="text" name="groupHashtag" class="form-control" 
						id="text" placeholder="모임을 표현할 수 있는 태그를 입력해주세요">
			</div>
		</section>
		
		<!-- 대표  장소-->
		<section class="groupsection group-info">
			<label class="group-info-label col-sm-2">모임장소</label>
			<div class="group-info-content col-sm-10">
				<input type="text" name="groupMainPlace"
							class="form-control" id="phone" placeholder="주요 모임 장소를 입력해주세요(빈칸도 가능합니다.)">
			</div>
		</section>
		
		<!-- 모임 설명-->
		<section class="groupsection group-info">
			<label class="group-info-label col-sm-2">모임장소</label>
			<div class="group-info-content col-sm-10">
				<textarea rows="10" cols="100" class="form-control" id="message"
						placeholder="모임을 설명해주세요" style="resize: none" name="groupDescription"></textarea>
			</div>
		</section>
		<section class="groupsection group-info">
			<div class="group-info-content col-sm-10 right">
			<!-- For success/fail messages -->
			<button type="button" class="btn btn-primary okbtn" id="">모임 수정하기</button>
			<button type="reset" class="btn btn-danger" id="">취소</button>
			</div>
		</section>
		</form>
	</div>
	
	</div>
</section>
<!-- /.container -->

<%@ include file="/WEB-INF/views/commons/template/modern_business_bottom.jsp"%>
