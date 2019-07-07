<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/template/modern_business_top.jsp"%>
<link rel="stylesheet" href="${root}/resources/css/group/group.css" >
<%@ include file="/WEB-INF/views/commons/movetop.jsp"%>
<%@ include file="/WEB-INF/views/commons/alert_danger.jsp"%>
<%@ include file="/WEB-INF/views/commons/alert_success.jsp"%>
<c:set var="parameter" value="${requestScope.parameter}"></c:set>
<% 
HttpSession httpSession = request.getSession();
UserDto userInfo = new UserDto();
userInfo.setUserId("calubang@naver.com");
httpSession.setAttribute("userInfo", userInfo);
%>
<script>
$(function() {
	//$(".groupcard").on("click", groupcardClick);
	
	var page = "${parameter.page}";
	var key = "${parameter.key}";
	var word = "${parameter.word}";
	var isMyGroup = "${parameter.isMyGroup}";
	var groupCategoryNum = "${parameter.groupCategoryNum}";
	getGroupList(page, key, word, isMyGroup, groupCategoryNum);
	
});

function getGroupList(page, key, word, isMyGroup, groupCategoryNum){
	if(page == null || (typeof page) == "undefined" || page == ""){
		page = "1";
	}
	if(key == null || (typeof key) == "undefined" || key.length == 0){
		key = "";
	}
	if(isMyGroup == null || (typeof isMyGroup) == "undefined"){
		isMyGroup = "";
	}
	if(groupCategoryNum == null || (typeof groupCategoryNum) == "undefined"){
		groupCategoryNum = "";
	}
	
	$.ajax({
		url : "${root}/group/grouplist"
		, method : "get"
		, data : {
			"page" : page
			, "key" : key
			, "word" : word
			, "isMyGroup" : isMyGroup
			, "groupCategoryNum" : groupCategoryNum
		}
		, success : function(result) {
			//console.log(result);
			$(".group-list").html(result);
			$(".groupcard").click(groupcardClick);
		}
		
	});
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
			<h1 class="col-lg-4 col-md-4 col-sm-3 my-4">${requestScope.size} 개의 모임</h1>
			<div class="col-lg-2 col-md-2 col-sm-3 my-4 category">
				<button type="button" class="btn btn-success">내 모임 보기</button>
			</div>
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
		<div class="row group-list">
			
			<!-- 모임 출력 시작 -->
			
			<!-- 모임 출력 종료 -->
			
		</div>
	</div>
</section>

<!-- /.container -->

<%@ include file="/WEB-INF/views/commons/template/modern_business_bottom.jsp"%>
