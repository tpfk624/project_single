<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:if test="${empty sessionScope.userInfo}">99</c:if>
<c:if test="${!empty sessionScope.userInfo}">
<script>
$(function() {
	$("button.grouppage").click(function() {
		var data = {
			groupNum : "${groupNum}"
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
	
	//1페이지 호출
	getHomeworkList(1);
});

function getHomeworkList(page){
	var url = "${root}/homework";
	var data = {
		groupNum : "${groupNum}"
		, page : page
	}
	var success = function(result) {
		$("#groupmain .homework-group").empty();
		$("#groupmain .homework-group").append(result);
		progressBarMove();
		clickFunctionSetting(getHomeworkList);
	}
	
	ajaxPage(data, url, success);
}

</script>
		
<div class="groupmain" id="groupmain">
	<!-- 모임 이름 뿌져지는 곳 -->
	<section class="groupsection groupheader">
		<div class="row">
			<div class="groupname center">모임 과제 관리</div>
		</div>
		<c:if test="${groupMember.groupMemberStatecode == 'L'}">
		<button type="button" 
			class="btn btn-primary col-sm-4 col-lg-3 col-md-3 right grouppage" data-page="homeworkcreate">과제생성</button></c:if>
	</section>
	
	<div class="homework-group">
	</div>
</div>
</c:if>
