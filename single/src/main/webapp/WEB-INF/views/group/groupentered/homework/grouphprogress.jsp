<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:if test="${empty sessionScope.userInfo}">99</c:if>
<c:if test="${!empty sessionScope.userInfo}">
<div class="groupmain" id="groupmain">
<script>
$(function() {
	progressBarMove();
	
	$(".writeBtn").click(function() {
		$("#hprogressCreateModal").modal("show");
	});
	
	$(".hprogress-table tbody tr").click(function() {
		var url = "${root}/homework/hprogress"
		var data = {
			homeworkNum : "${homework.homeworkNum}"
			, userId : $(this).attr("data-id")
		}
		var success = function(result) {
			if(result.resultCode == 1){
				var modal = $("#hprogressModal");
				modal.find("input[name=userNickname]").val(result.resultData.userNickname);
				modal.find("input[name=hprogressSubject]").val(result.resultData.hprogressSubject);
				
				if(result.resultData.hprogressSuccess == 'S'){
					modal.find("input[name=hprogressSuccess]").val(result.resultData.hprogressSuccess).siblings("button").text("완료");
				}else{
					modal.find("input[name=hprogressSuccess]").val(result.resultData.hprogressSuccess).siblings("button").text("진행중");
				}
				modal.find("textarea[name=hprogressContent]").val(result.resultData.hprogressContent);
				modal.find("input[name=hprogressFileOrigin]").val(result.resultData.hprogressFileOrigin);
				modal.find("input[name=fileurl]").val(result.resultData.hprogressFile);
				if(result.resultData.hprogressFile == null || result.resultData.hprogressFile == ''){
					modal.find("#fileurl").removeAttr("href").removeAttr("download");
				}else{
					modal.find("#fileurl").attr("href", result.resultData.hprogressFile).attr("download", result.resultData.hprogressFileOrigin);
				}
				
				
				//	console.log($(this).attr("data-id"));
				//console.log("${sessionScope.userInfo.userId}");
				if("${sessionScope.userInfo.userId}" == result.resultData.userId){
					showModifyModal();
				}else{
					showViewModal();
				}
				
			}else{
				showAlertModal("잘못된 요청", result.resultData);
			}
			return false
		}
		
		ajaxFunc(data, url, "get", success);
	});
	
	$("#myInput").keyup(function(e) {
		if(e.keyCode == 27){
			$(this).val("");
		}
		
		var text = $(this).val();
		var names = $(".userNickname");
		
		for(var i=0 ; i<names.length ; i++){
			var name = $(names[i]);
			if(name.text().indexOf(text) == -1){
				name.parent().hide();
			}else{
				name.parent().show();
			}
		}
		return false;
			
			
	});
	
});
function showModifyModal(){
	if("${homework.status}" != "진행중"){
		showViewModal();
		return false;
	}	

	$("#hprogressModal .modal-footer .btn-danger, #hprogressModal .modal-footer .btn-primary").show();
	$("#hprogressModal .file-cancel").show();
	$("#hprogressModal").modal("show");
	
	//disabled 풀기
	$("#hprogressModal input[name=hprogressSubject]").removeAttr("disabled");
	$("#hprogressModal .dropdown button").removeAttr("disabled");
	$("#hprogressModal textarea[name=hprogressContent]").removeAttr("disabled");
	$("#hprogressModal #ex_file_input").removeAttr("disabled");
}

function showViewModal(){
	$("#hprogressModal .modal-footer .btn-danger, #hprogressModal .modal-footer .btn-primary").hide();
	$("#hprogressModal .file-cancel").hide();
	$("#hprogressModal").modal("show");
	//수정못하게 처리
	$("#hprogressModal input[name=hprogressSubject]").attr("disabled", "disabled");
	$("#hprogressModal .dropdown button").attr("disabled", "disabled");
	$("#hprogressModal textarea[name=hprogressContent]").attr("disabled", "disabled");
	$("#hprogressModal #ex_file_input").attr("disabled", "disabled");
}

</script>

	<%@ include file="hprogresscreatemodal.jsp"%>
	<%@ include file="hprogressmodal.jsp"%>
	<!-- 모임 이름 뿌져지는 곳 -->
	<section class="groupsection groupheader">
		<div class="row">
			<div class="groupname center">${homework.homeworkSubject}</div>
		</div>
	</section>
	<section class="groupsection group-info">
		<label class="group-info-label col-sm-2">과제 설명</label>
		<div class="group-info-content col-sm-10">
		${homework.homeworkContent}
		</div>
	</section>
	<section class="groupsection group-info">
		<label class="group-info-label col-sm-2">과제달성률</label>
		<div class="group-info-content col-sm-10">
			<div class="progress ing" style="height: 2rem;" data-prog="${homework.homeworkSuccessCount/homework.groupMemberCount * 100}">
				<div class="progress-bar" data-prog="1">${homework.homeworkSuccessCount}/${homework.groupMemberCount}</div>
			</div>
		</div>
	</section>

	<section class="groupsection group-info">
		<div>
			<input class="col-sm-9 form-control search-input"  type="text" id="myInput" onkeyup="" placeholder="이름을 검색해주세요" title="Type in a name">
			<c:if test="${homework.status == '진행중'}">
			<c:if test="${empty alreadyHPCreate}">
			<button type="button" class="btn btn-primary col-sm-2 right writeBtn">글작성</button></c:if>
			</c:if>
		</div>
		<table class="table table-hover hprogress-table">
			<thead>
				<tr>
				<th style="width: 15%;">이름</th>
				<th>제목</th>
				<th style="width: 20%;">올린날짜</th>
				<th style="width: 15%;">달성여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="hprogress" items="${homework.hProgressList}">
				<c:if test="${!empty hprogress.userId}">
				<tr data-id="${hprogress.userId}">
					<td class="userNickname">${hprogress.userNickname}</td>
					<td>${hprogress.hprogressSubject}<c:if test="${!empty hprogress.hprogressFile}"><i class="far fa-file file-icon"></i></c:if></td>
					<td>
					<c:if test="${empty hprogress.hprogressUpdatedate}">${hprogress.hprogressCreatedate}</c:if>
					<c:if test="${!empty hprogress.hprogressUpdatedate}">${hprogress.hprogressUpdatedate}</c:if>
					</td>
					<td><c:if test="${hprogress.hprogressSuccess == 'S'}">달성</c:if>
					<c:if test="${hprogress.hprogressSuccess == 'P'}">진행중</c:if>
				</tr>
				</c:if>
				</c:forEach>
				<!-- <tr>
					<td>안병욱</td>
					<td>과제물 공유합니다<i class="far fa-file file-icon"></i></td>
					<td>2019/04/07</td>
					<td>달성</td>
				</tr> -->
			</tbody>
		</table>
	</section>
</div>
</c:if>