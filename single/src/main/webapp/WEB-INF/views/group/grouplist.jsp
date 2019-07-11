<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/template/modern_business_top.jsp"%>
<link rel="stylesheet" href="${root}/resources/css/group/group.css" >
<%@ include file="/WEB-INF/views/commons/movetop.jsp"%>
<%@ include file="/WEB-INF/views/commons/alert_danger.jsp"%>
<%@ include file="/WEB-INF/views/commons/alert_success.jsp"%>
<script src="${root}/resources/js/group/group.js"></script>
<c:set var="parameter" value="${requestScope.parameter}"></c:set>
<script>
$(function() {
	//$(".groupcard").on("click", groupcardClick);
	
	var page = "${parameter.page}";
	var key = "${parameter.key}";
	var word = "${parameter.word}";
	var isMyGroup = "${parameter.isMyGroup}";
	var groupCategoryNum = "${parameter.groupCategoryNum}";
	getGroupList(page, key, word, isMyGroup, groupCategoryNum);
	
	//페이지 이동류 버튼
	$(".pagebtn").on("click", function () {
		location.href = "${root}/group/" + $(this).attr("data-page");
	});
	
	//내 모임보기 버튼
	$("button.mygrouplist").on("click", function() {
		getGroupList("1", "", "", "yes", "");
	});
	
	//모두보기 버튼
	$("section.search .dropdown").on("hidden.bs.dropdown", function(){
		var role = $(this).find("input[type=hidden]").val();
		if(role == 'all'){
			getGroupList("1", "", "", "", "");
		}
	});
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
	
	var url = "${root}/group/grouplist";
	var data = {
		"page" : page
		, "key" : key
		, "word" : word
		, "isMyGroup" : isMyGroup
		, "groupCategoryNum" : groupCategoryNum
	};
	var success = function(result) {
		if(isMyGroup == 'yes'){
			//console.log(result);
			$(".group-list").html(result);
			$(".groupcard").click(groupenter);
		}else{
			//console.log(result);
			$(".group-list").html(result);
			$(".groupcard").click(groupcardClick);
		}
	}
	$.ajax({
		url : url
		, data : data
		, method : "get"
		, success : success
	});
}
function groupenter(e){
	var groupNum = $(this).attr("data-num");
	location.href = "${root}/group/" + groupNum;
}

function groupcardClick(){
	var groupNum = $(this).attr("data-num");
	var url = "${root}/group/groupdetail";
	var data = {
		"groupNum" : groupNum	
	};
	var success = function (result) {
		groupDetailModalSetting(result);
		$("#groupDetailModal").modal("show");
	}
	
	ajaxFunc(data, url, "get", success);
	
} 

</script>

<%@ include file="groupdetailmodal.jsp"%>
<%@ include file="groupheader.jsp"%>
<%@ include file="groupsearch.jsp" %>

<!-- 여기서부터 실제 데이터 영역 -->
<section class="contents">
	<div class="container">
		<div class="row">
			<h1 class="col-lg-4 col-md-4 col-sm-3 my-4">총 ${requestScope.size} 개의 모임</h1>
			<!-- <div class="btn-group col-lg-8 col-md-8 col-sm-9 right" style="padding: 0px;"> -->
				<c:if test="${!empty sessionScope.userInfo}">
				<div class="col-lg-2 col-md-2 col-sm-3 my-4 category">
					<button type="button" class="btn btn-success mygrouplist">내 모임 보기</button>
				</div>
				</c:if>
				<div class="col-lg-2 col-md-2 col-sm-3 my-4 category">
					<button type="button" class="btn btn-primary pagebtn" data-page="create">모임 만들기</button>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-3 my-4 category">
					<button type="button" class="btn btn-info">추천 받기</button>
				</div>
				<div class="dropdown col-lg-2 col-md-2 col-sm-3 my-4 category">
					<button type="button" class="btn btn-primary dropdown-toggle"
						data-toggle="dropdown">카테고리</button>
					<div class="dropdown-menu">
						<a class="dropdown-item">스터디</a> 
						<a class="dropdown-item">취미</a> 
						<a class="dropdown-item">친목도모</a>
						<a class="dropdown-item">맛집탐방</a>
					</div>
				</div>
			<!-- </div> -->
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
