<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:if test="${empty sessionScope.userInfo}">99</c:if>
<c:if test="${!empty sessionScope.userInfo}">
<script>
$(function() {
	$('#startdate').datepicker({
	    uiLibrary: 'bootstrap4',
	    format: 'yyyy-mm-dd',
			onSelect: function(dateText) {
//		console.log("Selected date: " + dateText + "; input's current value: " + this.value);
		    }
	}).on("change", function() {
		var startdate = $(this).val();
		if(startdate == null || startdate == ''){
			$("#enddate").attr("disabled", "disabled");
			$("#enddate").attr("placeholder", "먼저 시작기간을 등록해주세요")
		}else{
			$("#enddate").removeAttr("disabled");
			$("#enddate").attr("placeholder", "과제 종료기간을 등록해주세요");
		}
	});
	
	$('#enddate').datepicker({
	    uiLibrary: 'bootstrap4',
	    format: 'yyyy-mm-dd', 
			onSelect: function(dateText) {
//		console.log("Selected date: " + dateText + "; input's current value: " + this.value);
		    }
	}).on("change", function() {
		var homeworkEnddate = $("#hwRegisterForm input[name=homeworkEnddate]");
		var homeworkStartdate = $("#hwRegisterForm input[name=homeworkStartdate]");
		
		if(homeworkEnddate.val() == null || homeworkEnddate.val() == ''){
			return false
		}
		
		if(homeworkEnddate.val() < homeworkStartdate.val()){
			homeworkEnddate.val("");
			showAlertModal("잘못된 값 입력", "종료일이 시작일보다 앞섭니다.");

			$("#alert").off("hidden.bs.modal").on('hidden.bs.modal', function () {
				homeworkEnddate.focus().get(0).scrollIntoView(true);
				return false
			});
			
			return false
		}
		
	});
	
	$("#hwRegister").click(function() {
		var homeworkSubject = $("#hwRegisterForm input[name=homeworkSubject]");
		var homeworkStartdate = $("#hwRegisterForm input[name=homeworkStartdate]");
		var homeworkEnddate = $("#hwRegisterForm input[name=homeworkEnddate]");
		var homeworkContent = $("#hwRegisterForm input[name=homeworkContent]");
		
		//제목 확인
		if(homeworkSubject.val() == null || homeworkSubject.val() == ''){
			showAlertModal("필수값이 누락", "과제명을 입력해주세요");

			$("#alert").off("hidden.bs.modal").on('hidden.bs.modal', function () {
				homeworkSubject.focus().get(0).scrollIntoView(true);
				return false
			  });
			return false;
		}
		
		//시작일 확인
		if(homeworkStartdate.val() == null || homeworkStartdate.val() == ''){
			showAlertModal("필수값이 누락", "시작일을 입력해주세요");

			$("#alert").off("hidden.bs.modal").on('hidden.bs.modal', function () {
				homeworkStartdate.focus().get(0).scrollIntoView(true);
				return false
			  });
			return false;
		}
		
		//종료일 확인
		if(homeworkEnddate.val() == null || homeworkEnddate.val() == ''){
			showAlertModal("필수값이 누락", "종료일을 입력해주세요");

			$("#alert").off("hidden.bs.modal").on('hidden.bs.modal', function () {
				homeworkEnddate.focus().get(0).scrollIntoView(true);
				return false
			});
			return false;
		}
		
		//내용은? 일단 패스
		var url = "${root}/homework";
		var data = new FormData($("#hwRegisterForm")[0]);
		var success = function(result) {
			if(result.resultCode == 1){
				showSuccessAlertModal("과제등록 성공", result.resultData);
				$("#alertSuccess").off("hidden.bs.modal").on('hidden.bs.modal', function () {
					$("#navbar a[data-page=homework]").trigger("click");
					return false
				});
			}else{
				showAlertModal("과제등록 실패", result.resultData);
			}
		}
		
		ajaxFunc(data, url, "post", success);
	});
})
</script>
		
<div class="groupmain" id="groupmain">
	<!-- 모임 이름 뿌져지는 곳 -->
	<section class="groupsection groupheader">
		<div class="row">
			<div class="groupname center" >모임 과제 등록</div>
		</div>
	</section>
	<form id="hwRegisterForm" method="post">
	<input type="hidden" name="groupNum" value="${groupNum}">
	<section class="groupsection group-info">
		<label class="group-info-label col-sm-2">과제 이름</label>
		<div class="group-info-content col-sm-10">
			<input name="homeworkSubject" type="text" class="form-control" placeholder="과제 이름을 입력해주세요">
		</div>
	</section>
	<section class="groupsection group-info">
		<label class="group-info-label col-sm-2">과제 시작일</label>
		<div class="group-info-content col-sm-10">
			<input class="datepicker" id="startdate" name ="homeworkStartdate" width="276" readonly="readonly"
							value=""/ placeholder="과제 시작기간을 입력해주세요">
		</div>
	</section>
	<section class="groupsection group-info">
		<label class="group-info-label col-sm-2">과제 종료일</label>
		<div class="group-info-content col-sm-10">
			<input class="datepicker" id="enddate" name ="homeworkEnddate" width="276" disabled="disabled" readonly="readonly"
							value=""/ placeholder="과제 시작기간을  먼저 입력해주세요">
		</div>
	</section>
	<section class="groupsection group-info">
		<label class="group-info-label col-sm-2">과제 내용</label>
		<div class="group-info-content col-sm-10">
			<textarea rows="10" cols="100" class="form-control" id="message" name="homeworkContent"
				placeholder="내용을 입력해주세요" style="resize: none"></textarea>
		</div>
	</section>
	</form>
	<section class="groupsection group-info">
		<div class="btngroup">
			<button type="reset" class="btn btn-danger right">취소</button>
			<button type="button" class="btn btn-primary right" id="hwRegister">과제등록</button>
		</div>
	</section>
</div>
</c:if>