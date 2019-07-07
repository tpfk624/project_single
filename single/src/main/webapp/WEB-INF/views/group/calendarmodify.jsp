<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
<style>
.map{
	width: 300px;
	height: 300px;
}
</style>
<script>
$(function() {
	$("#alertSuccess button[name=alertOK]").click(function() {
		$("#alertSuccess").modal("hide");
	});
	//달력
	$('.datepicker').datepicker({
	    uiLibrary: 'bootstrap4',
   		onSelect: function(dateText) {
//    	console.log("Selected date: " + dateText + "; input's current value: " + this.value);
   	    }
	}).on("change", function() {
		//달력 눌를때 이벤트 콜백 위치
	});
});



var success = function(result) {
	//console.log(result)
	if(result.resultCode == 1){
		showSuccessAlertModal("일정등록 성공", "일정이 등록되었습니다.");
		$("#alertSuccess").on("hidden.bs.modal",  drawSchedule(result.resultData));
	}else{
		showAlertModal("일정등록 실패", "등록 실패하였습니다. 관리자에게 문의하세요");
	}
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

</script>
<div id="modifyCalendarModal" class="modal fade" role="dialog">
	<div class="modal-dialog modal-dialog-scrollable modal-lg">
		<div class="modal-content">
			<div class="modal-header text-center">
				<label style="margin-left: auto; margin-bottom:auto; margin-top:auto; font-size: 1.5rem">그룹 일정 등록</label>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">X</span>
				</button>
			</div>
			<div class="modal-body text-center">
				<form class="calendarForm">
				<input type="hidden" value="${group.groupNum}" name="groupNum">
				<section class="groupsection group-info">
					<label class="group-info-label col-sm-2">일정이름(*)</label>
					<div class="group-info-content col-sm-10">
						<input type="text" class="form-control" name="calendarSubject" placeholder="일정 이름을 입력해주세요" 
						value="일정 이름입니다">
					</div>
				</section>
				<section class="groupsection group-info">
					<label class="group-info-label col-sm-2">일정날짜(*)</label>
					<div class="group-info-content col-sm-10">
						<input class="datepicker" name ="calendarDate" width="276" readonly="readonly" 
							value="07/03/2019"/>
					</div>
				</section>
				<section class="groupsection group-info">
					<label class="group-info-label col-sm-2">내용</label>
					<div class="group-info-content col-sm-10">
						<textarea name="calendarContent" rows="10" cols="100" class="form-control" id="message"
							placeholder="내용을 입력해주세요" style="resize: none">그룹내용입니다.</textarea>
					</div>
				</section>
				<section class="groupsection group-info">
					<label class="group-info-label col-sm-2">일정장소</label>
					<div class="group-info-content col-sm-10">
						<input type="hidden" name="calendarXLoc">
						<input type="hidden" name="calendarYLoc">
						<div class="map" id="map">
						
						</div>
					</div>
				</section>
				</form>
			</div>
			
			<!-- Modal footer -->
	        <div class="modal-footer">
	        	<button type="button" class="btn btn-primary okbtn">일정등록</button>
	          	<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
	        </div>
		</div>
	</div>
</div>