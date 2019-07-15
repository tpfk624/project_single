<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/template/modern_business_top.jsp"%>
<%@ include file="/WEB-INF/views/commons/alert_danger.jsp"%>
<%@ include file="/WEB-INF/views/commons/alert_success.jsp"%>
<c:set var="groupMember" value="${requestScope.groupMember}"></c:set>
<c:set var="group" value="${requestScope.group}"></c:set>
<link rel="stylesheet" href="${root}/resources/css/group/group.css">
<script src="${root}/resources/js/group/group.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<script src="https://kit.fontawesome.com/5ed7132c4a.js"></script>
<!-- 카카오 맵 관련 -->
<link rel="stylesheet" href="${root}/resources/css/group/kakaomap.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dd79caa5868b0543c6672702825597f8&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="${root}/resources/js/group/kakaomap.js"></script>
<!-- 데이트 피커 -->
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
<style>
/* 페이지에 유지할 부분*/
</style>
<script>
$(function() {
	//그룹 nav 관련 
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
	
	$("#navbar .group-navbar-item").click(function() {
		
	});
	
	$("#navbar .grouppage").click(function() {	
		$(this).addClass("active");
		$(this).siblings().removeClass("active");
		
		var data = {
			groupNum : "${group.groupNum}"
			, type : $(this).attr("data-page")
		};
		var url = "${root}/group/grouppage";
		var viewChange = function(result){
			$("#groupmain").remove();
			$("div[role=calendar]").remove();
			$("#contents>.container").append(result);
			//$("#groupmain").html(result);
		}
		
		ajaxPage(data, url, viewChange);
		
		return false;
	
	});
	//그룹 nav 관련 끝 
});


</script>

<header class="group-header">
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<!-- Slide One - Set the background image for this slide in the line below -->
			<div class="carousel-item active"
				style="background-image: url('${group.groupImgSrc}')">
				<%-- <div class="carousel-caption d-none d-md-block">
					<h3>${group.groupName}</h3>
					<p>${group.groupCategoryName}</p>
				</div> --%>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">이전</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">다음</span>
		</a>
	</div>
</header>

<section class="contents" id="contents">
	<div class="container col-lg-9 col-md-9 col-sm-9 whitespace">
	
	<div id="navbar" class="group-navbar">
	  	<a class="group-navbar-item active grouppage" data-page="main">모임메인</a>
	  	<a class="group-navbar-item grouppage" data-page="homework">모임과제</a>
	  	<c:if test="${groupMember.groupMemberStatecode == 'L'}">
	  	<a class="group-navbar-item grouppage" data-page="modify">모임설정변경</a>
	  	<a class="group-navbar-item grouppage" data-page="member">모임원관리</a>
	  	</c:if>
	</div>
	<div class="groupmain" id="groupmain">		
		<!-- 모임 이름 뿌져지는 곳 -->
		<section class="groupsection groupheader">
			<div class="row center">
					<span class="center">${group.groupCategoryName}</span>
				</div>
			<div class="row">
				<div class="groupname center">${group.groupName}</div>
			</div>
		</section>
		
		<!-- 모임 정보 -->
		<section class="groupsection group-info">
			<label class="group-info-label col-sm-2">모임정보</label>
			<div class="group-info-content col-sm-10">
				<div class="groupdesc"><c:forEach var="hashtag" items="${group.hashtagList}">
				<tag>${hashtag}</tag></c:forEach></div>
				<div class="groupdesc">인원 : ${group.groupMemberCount} / ${group.groupMemberLimit}</div>
				<div class="groupdesc">모임주요장소 : ${group.groupMainPlace}</div>
			</div>
		</section>
		
		<!-- 모임 설명 -->
		<section class="groupsection group-info">
			<label class="group-info-label col-sm-2">모임설명</label>
			<div class="group-info-content col-sm-10">
			${group.groupDescription}
			</div>
		</section>
		
		<!-- 달력 -->
		<section class="groupsection group-calendar">
			<label class="group-info-label col-sm-2">모임일정</label>
			<div class="group-info-content col-sm-10">
			<%@ include file="calendar/calendar.jsp"%>
			</div>
		</section>
	</div>
	</div>
</section>
<!-- /.container -->
<!-- 채팅부분 -->
<%@ include file="chat.jsp"%>

<%@ include file="/WEB-INF/views/commons/template/modern_business_bottom.jsp"%>
