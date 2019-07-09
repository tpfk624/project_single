<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
<style>
.map{
	width: 100%;
	height: 20rem;
}
</style>
<div id="calendarModal" class="modal fade" role="dialog">
	<div class="modal-dialog modal-dialog-scrollable modal-lg">
		<div class="modal-content">
			<div class="modal-header text-center" style="border-bottom: 0px; padding-bottom: 0px;">
				<label style="margin-left: auto; margin-bottom:auto; margin-top:auto; font-size: 1.5rem"></label>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">X</span>
				</button>
			</div>
			<div class="modal-body text-center">
				<form class="calendarForm">
				<input type="hidden" value="" name="type">
				<input type="hidden" value="${group.groupNum}" name="groupNum">
				<input type="hidden" value="" name="calendarNum">
				<section class="groupsection group-info">
					<label class="group-info-label col-sm-2">일정이름(*)</label>
					<div class="group-info-content col-sm-10">
						<input type="text" class="form-control" name="calendarSubject" placeholder="일정 이름을 입력해주세요" 
						value="">
					</div>
				</section>
				<section class="groupsection group-info">
					<label class="group-info-label col-sm-2">일정날짜(*)</label>
					<div class="group-info-content col-sm-10">
						<input class="datepicker" name ="calendarDate" width="276" readonly="readonly" disabled="disabled"
							value=""/>
					</div>
				</section>
				<section class="groupsection group-info">
					<label class="group-info-label col-sm-2">내용</label>
					<div class="group-info-content col-sm-10">
						<textarea name="calendarContent" rows="5" cols="100" class="form-control" id="message"
							placeholder="" style="resize: none"></textarea>
					</div>
				</section>
				<section class="groupsection group-info">
					<label class="group-info-label col-sm-2">일정장소</label>
					<div class="group-info-content col-sm-10">
						<input type="hidden" name="calendarXLoc" value="">
						<input type="hidden" name="calendarYLoc" value="">
						<label id="kakaomapSearchLabel" class="group-info-label" style="height: calc(1.5em + .75rem + 2px); padding-top: 0.5rem; margin-right: 0.5rem;">주소검색창 : </label>
						<input type="text" id="kakaomapSearch" class="form-control col-sm-7" name="" placeholder="검색할 주소를 입력해주세요" 
								value="" style="margin-bottom: 0.5rem;">
						<div class="group-info-content col-sm-10">
							
						</div>
						<div class="map" id="map">
							
						</div>
					</div>
				</section>
				</form>
			</div>
			
			<!-- Modal footer -->
	        <div class="modal-footer" style="display: block;">
	        	<c:if test="${groupMember.groupMemberStatecode == 'L'}">
	        	<button type="button" class="btn btn-danger deletebtn" style="float: left;">삭제</button>
	        	<button type="button" class="btn btn-secondary right" data-dismiss="modal">닫기</button>
	        	<button type="button" class="btn btn-primary okbtn right"></button>        	       	
	        	</c:if>
	        	<c:if test="${groupMember.groupMemberStatecode == 'M'}">
	        	<button type="button" class="btn btn-secondary right" data-dismiss="modal">닫기</button>
	        	</c:if>
	          	
	        </div>
		</div>
	</div>
</div>
<script>
$("#kakaomapSearch").on("keyup", function(e){
	if(e.keyCode == 13){
		// 주소로 좌표를 검색합니다
		var text = $(this).val();
		addressToMapMarker(text);
	}
});

$("#calendarModal").on("hidden.bs.modal", function() {
	$(this).find("textarea[name=calendarContent]").text("");
	$(this).find("textarea[name=calendarContent]").val("");
	$(this).find("input[name=calendarDate]").val("");
	$(this).find("input[name=calendarXLoc]").val("");
	$(this).find("input[name=calendarYLoc]").val("");
	$(this).find("input[name=calendarSubject]").val("");
	
	$(this).find("#map").empty();
});

//달력
$('.datepicker').datepicker({
    uiLibrary: 'bootstrap4',
		onSelect: function(dateText) {
//	console.log("Selected date: " + dateText + "; input's current value: " + this.value);
	    }
}).on("change", function() {
	//달력 눌를때 이벤트 콜백 위치
});

$("#alertSuccess button[name=alertOK]").click(function() {
	$("#alertSuccess").modal("hide");
});

$(".deletebtn").click(function() {
	
});

$(".okbtn").click(function() {
	var url = "${root}/calendar";
	var form = $(".calendarForm");
	var data = new FormData(form[0]);
	ajaxFunc(data, url, "post",  success);
	
	return false;
});

$(".deletebtn").click(function() {
	var url = "${root}/calendar";
	var form = $(".calendarForm");
	var data = {
		calendarNum : $("#calendarModal input[name=calendarNum]").val()
	};
	if(dataValidate() == 1){
		ajaxFunc(JSON.stringify(data), url, "delete",  success);
	}
	
	return false;
});

var success = function(result) {
	console.log(result)
	if(result.resultCode == 1){
		showSuccessAlertModal("일정등록 성공", "일정이 등록되었습니다.");
		drawSchedule(result.resultData);
	}else if(result.resultCode == 2){
		showSuccessAlertModal("일정수정 성공", "일정이 수정되었습니다.");
		modifySchedule(result.resultData);
	}else if(result.resultCode == 3){
		showSuccessAlertModal("일정수정 삭제", "일정이 삭제되었습니다.");
		deleteSchedule(result.resultData);
	}else{
		showAlertModal("일정등록 실패", "등록 실패하였습니다. 관리자에게 문의하세요");
	}
	
	$("#alertSuccess").on("hidden.bs.modal", function() {
		 $("#calendarModal").modal("hide");
	});
}

var dataValidate = function (){
	//console.log($("input[name=calendarSubject]"));
	var calendarSubject = $("input[name=calendarSubject]").val();
 	var calendarContent = $("input[name=calendarContent]").val();
 	var calendarDate = $("input[name=calendarDate]").val();
 	var calendarXLoc = $("input[name=calendarXLoc]").val();
 	var calendarYLoc = $("input[name=calendarYLoc]").val();
 	
 	if(calendarSubject == null || calendarSubject == '' ){
 		showAlertModal("필수값 확인", "일정이름을 확인해주세요");
 		return 0;
 	}
 	if(calendarDate == null || calendarDate == '' ){
 		showAlertModal("필수값 확인", "일정날짜를 확인해주세요");
 		return 0;
 	}
 	if(calendarXLoc == null || calendarXLoc == ''){
 		$("input[name=calendarXLoc]").val(0);
 	}
 	if(calendarYLoc == null || calendarYLoc == ''){
 		$("input[name=calendarYLoc]").val(0);
 	}
 	//console.log(calendarXLoc);
 	//console.log(calendarYLoc);
 	return 1;
}

function showCalendarModal(type, json, day) {
		
	var calendarModal = $("#calendarModal");
	
	var url = "${root}/group/memberstate";
	var data = {
		groupNum : $("#calendarModal input[name=groupNum]").val()
	};
	var success = function(result) {
		if(result.resultCode == 1){
			if(result.resultData == "L"){
				$("#calendarModal").on("shown.bs.modal", function() {
					
					var container = $(this).find("#map")[0];
					createKakaoMap(container);
				});
				
				
				if(type == 'create'){
					calendarModal.find(".modal-header>label").text("그룹 일정 등록");
					calendarModal.find("input[name=type]").val("create");
					calendarModal.find("input[name=calendarDate]").removeAttr("disabled");
					calendarModal.find("input[name=calendarNum]").val(0);
					calendarModal.find("input[name=calendarXLoc]").val(0);
					calendarModal.find("input[name=calendarYLoc]").val(0);
					calendarModal.find(".deletebtn").css("display", "none");
					calendarModal.find(".okbtn").text("등록");
					
					day = parseInt(day);
					var date = month + "/" + (day < 10 ? '0' + day : day) + "/" + year;
					$("#calendarModal input[name=calendarDate]").val(date);
					
					calendarModal.modal("show");
				}else{
					calendarModal.find(".modal-header>label").text("그룹 일정 보기");
					calendarModal.find("input[name=calendarNum]").val(json.calendarNum);
					calendarModal.find("input[name=groupNum]").val(json.groupNum);
					calendarModal.find("input[name=type]").val("modify");
					calendarModal.find("input[name=calendarSubject]").val(json.calendarSubject);
					calendarModal.find("input[name=calendarDate]").css("disabled", "disabled").val(json.calendarDate);
					calendarModal.find("textarea[name=calendarContent]").text(json.calendarContent);
					calendarModal.find("textarea[name=calendarContent]").val(json.calendarContent);
					calendarModal.find("input[name=calendarXLoc]").val(json.calendarXLoc);
					calendarModal.find("input[name=calendarYLoc]").val(json.calendarYLoc);
					
					calendarModal.find(".deletebtn").css("display", "inline-block");
					calendarModal.find(".okbtn").text("수정");
					calendarModal.modal("show");
				}
			}else if(result.resultData == "M"){
				
				$("#calendarModal").on("shown.bs.modal", function() {
					
					var container = $(this).find("#map")[0];
					viewKakaoMap(container);
				});
				
				if(type == 'create'){
					return false;	
				}else{
					calendarModal.find(".modal-header>label").text("그룹 일정 보기");
					calendarModal.find("input[name=calendarNum]").val(json.calendarNum);
					calendarModal.find("input[name=groupNum]").val(json.groupNum);
					calendarModal.find("input[name=type]").val("view");
					calendarModal.find("input[name=calendarSubject]").val(json.calendarSubject);
					calendarModal.find("input[name=calendarDate]").css("disabled", "disabled").val(json.calendarDate);
					calendarModal.find("textarea[name=calendarContent]").text(json.calendarContent);
					calendarModal.find("textarea[name=calendarContent]").val(json.calendarContent);
					calendarModal.find("input[name=calendarXLoc]").val(json.calendarXLoc);
					calendarModal.find("input[name=calendarYLoc]").val(json.calendarYLoc);
					
					calendarModal.find(".deletebtn").css("display", "inline-block");
					calendarModal.find(".okbtn").text("수정");
					calendarModal.modal("show");
					
				}
			}else{
				return false;
			}
		}else{
			return false;
		}
		
	}
	ajaxFunc(data, url, "get", success);
	return false;
}
</script>