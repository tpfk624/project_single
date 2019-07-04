<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/template/modern_business_top.jsp"%>
<link rel="stylesheet" href="${root}/resources/css/group/group.css" >
<%@ include file="/WEB-INF/views/commons/movetop.jsp"%>
<% 
HttpSession httpSession = request.getSession();
UserDto userInfo = new UserDto();
userInfo.setUserId("calubang");
httpSession.setAttribute("userInfo", userInfo);
%>
<script>
$(function() {
	$(".groupcard").click(groupcardClick);
});

function makeParameterJson(userId, groupNum, key, word){
	var param = {};
	if(userId != null && userId != ''){
		param.userId = userId;
	}
	if(groupNum != null && groupNum != ''){
		param.groupNum = groupNum;
	}
	if(key != null && key != ''){
		param.key = key;
	}
	if(word != null && word != ''){
		param.word = word;
	}
	return JSON.stringify(param);
}

function groupcardClick(){
	var groupNum = $(this).attr("data-num");
	$.ajax({
		url : "${root}/group/groupdetail"
		, method : "get"
		, dataType : "json"
		, data : {
			"groupNum" : groupNum
		}
		, success : function(result) {
			//console.log(result);
			groupDetailModalSetting(result);
			$("#groupDetailModal").modal("show");
		}
	});
	
}


</script>

<%@ include file="groupdetailmodal.jsp"%>
<%@ include file="groupheader.jsp"%>
<%@ include file="groupsearch.jsp" %>

<!-- 여기서부터 실제 데이터 영역 -->
<section class="contents">
	<div class="container">
		<div class="row">
			<h1 class="col-lg-6 col-md-6 col-sm-4 my-4">${requestScope.size} 개의 모임</h1>
			<div class="col-lg-2 col-md-2 col-sm-3 my-4 category">
				<button type="button" class="btn btn-info">추천 받기</button>
			</div>
			<div class="col-lg-2 col-md-2 col-sm-3 my-4 category">
				<button type="button" class="btn btn-primary">모임 만들기</button>
			</div>
			<div class="dropdown col-lg-2 col-md-2 col-sm-3 my-4 category">
				<button type="button" class="btn btn-primary dropdown-toggle"
					data-toggle="dropdown">카테고리</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">스터디</a> 
					<a class="dropdown-item" href="#">취미</a> 
					<a class="dropdown-item" href="#">친목도모</a>
					<a class="dropdown-item" href="#">맛집탐방</a>
				</div>
			</div>
		</div>
		<!-- Marketing Icons Section -->
		<div class="row">
			
			<!-- 모임 출력 시작 -->
			<c:forEach items="${requestScope.groupList}" var="group">
			<!-- 카드 사진 위버전 -->
			<div class="col-lg-4 col-sm-6 portfolio-item groupcard" data-num="${group.groupNum}">
				<div class="card h-100">
					<img class="card-img-top"
						src="${group.groupImgSrc}"
						alt="">
					<h4 class="card-title">${group.groupName}</h4>
					<div class="card-body">
						<p class="card-text"><c:choose>
							<c:when test="${fn:length(group.groupDescription) > 100}">${fn:substring(group.groupDescription, 0, 100)}...</c:when>
							<c:otherwise>${group.groupDescription}</c:otherwise>
						</c:choose>
						</p>
						<p class="card-text">인원 : ${group.groupMemberCount}/${group.groupMemberLimit}</p>
						<p class="card-text">장소 : ${group.groupMainPlace}</p>
					</div>

					<div class="overlay">
						<div class="text">상세보기</div>
					</div>
				</div>
			</div>
			</c:forEach>
			<!-- 모임 출력 종료 -->
			
		</div>
	</div>
</section>

<!-- /.container -->

<%@ include file="/WEB-INF/views/commons/template/modern_business_bottom.jsp"%>
