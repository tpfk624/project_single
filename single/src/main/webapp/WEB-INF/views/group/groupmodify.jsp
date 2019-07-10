<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="groupmain" id="groupmain">		
	<!-- 모임 이름 뿌져지는 곳 -->
	<section class="groupsection groupheader">
		<div class="row">
			<div class="groupname center">${group.groupName}</div>
		</div>
	</section>
	<form id="groupModifyForm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="groupNum" value="${group.groupNum}">
		<!-- 모임 이름 -->
		<section class="groupsection group-info">
			<label class="group-info-label col-sm-2">모임이름(*)</label>
			<div class="group-info-content col-sm-10">
				<input type="text" class="form-control"
					id="name" placeholder="모임 이름을 입력해주세요" name="groupName" value="${group.groupName}">
			</div>
		</section>
		
		<!-- 모임 분류 -->
		<section class="groupsection group-info">
			<label class="group-info-label col-sm-2">모임분류(*)</label>
			<div class="group-info-content col-sm-10">
				<div class="dropdown col-lg-4 col-md-4 col-sm-4">
					<input type="hidden" name="groupCategoryNum" value="${group.groupCategoryNum}" >
					<button type="button" class="btn btn-primary dropdown-toggle"
						data-toggle="dropdown">${group.groupCategoryName}</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" role="1">스터디</a> 
						<a class="dropdown-item" role="2">취미</a> 
						<a class="dropdown-item" role="3">친목도모</a>
						<a class="dropdown-item" role="4">맛집탐방</a>
					</div>
				</div>
			</div>
		</section>
		
		<!-- 모임 인원수 제한 -->
		<section class="groupsection group-info">
			<label class="group-info-label col-sm-2">모임인원</label>
			<div class="group-info-content col-sm-10">
				<div class="dropdown col-lg-4 col-md-4 col-sm-4">
					<input type="hidden" name="groupMemberLimit" value="${group.groupMemberLimit}" >
					<button type="button" class="btn btn-primary dropdown-toggle"
						data-toggle="dropdown">${group.groupMemberLimit}</button>
					<div class="dropdown-menu">
						<a class="dropdown-item active" data-toggle="dropdown">5</a> 
						<a class="dropdown-item" >10</a> 
						<a class="dropdown-item" >15</a> 
						<a class="dropdown-item" >20</a>
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
				<%@ include file="/WEB-INF/views/commons/taginput.jsp"%>
			</div>
		</section>
		
		<!-- 대표  장소-->
		<section class="groupsection group-info">
			<label class="group-info-label col-sm-2">모임장소</label>
			<div class="group-info-content col-sm-10">
				<input type="text" name="groupMainPlace" value="${group.groupMainPlace}"
							class="form-control" id="phone" placeholder="주요 모임 장소를 입력해주세요(빈칸도 가능합니다.)">
			</div>
		</section>
		<!-- 모임 설명-->
		<section class="groupsection group-info">
			<label class="group-info-label col-sm-2">모임설명</label>
			<div class="group-info-content col-sm-10">
				<textarea rows="10" cols="100" class="form-control" id="message"
						placeholder="모임을 설명해주세요" style="resize: none" name="groupDescription">${group.groupDescription}</textarea>
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
<script>
$(function() {
	defaultSetting("${group.groupImgSrc}", "non-label");
	$("#groupModifyForm .okbtn").on("click", function(){
		makeTagList();
		var data = new FormData($("#groupModifyForm")[0]);
		var url = "${root}/group/groupmodify";
		var success = function (result) {
			if(result.resultCode == 1){
				showSuccessAlertModal("모임정보 수정", "성공적으로 수정되었습니다");
				$("#alertSuccess").on("hidden.bs.modal", function(){
					$("#navbar a[data-page=main]").trigger("click");
				});
			}else{
				showAlertModal("모임정보 수정", "수정 실패하였습니다.");
			}
		}
		//ajaxFunc(data, url, "file", success);
		$.ajax({
			url : url
			, method : "post"
			, processData : false
			, contentType : false
			, data : data
			, dataType : "json"
			, success : success
		});	
	});
	//dropbox 관련
	$("#groupModifyForm .dropdown").on("show.bs.dropdown", function(){
		var height = $(this).css("height").substr(0, $(this).css("height").length-2);
		$(this).parent().parent().css("height", height * ($(this).find(".dropdown-item").length+2));
	});
	$("#groupModifyForm .dropdown").on("hide.bs.dropdown", function(){
		$(this).parent().parent().css("height", "");
	});
	$("#groupModifyForm .dropdown-item").click(dropdownItemClick);
});

function dataValidate(){
	var groupName = $("#groupModifyForm input[name=groupName]").val();
	var groupCategoryNum = $("#groupModifyForm input[name=groupCategoryNum]").val();
	
	if(groupName == null || groupName == ''){
		showAlertModal("필수값이 누락", "모임명을 입력해주세요");

		$("#alert").on('hidden.bs.modal', function () {
			$("#groupCreateForm input[name=groupName]").focus().get(0).scrollIntoView(true);;
		  });
		return;
	}
	
	if(groupCategoryNum == null || groupCategoryNum == ''){
		showAlertModal("필수값이 누락", "모임 종류를 결정해주세요");
		
		$("#alert").on('hidden.bs.modal', function () {
			$("#groupCreateForm input[name=groupCategoryNum]").next().focus().get(0).scrollIntoView(true);;
		  });

		return;
	}
}
</script>
</div>
