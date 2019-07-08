/**
 * 2019.07.06 그룹에서 사용되는 function
 */

//dataValidateFunc : 데이터 확인용 func , 체크할게 없다면 null 을 보내면 댐
//data : 보낼 데이터 (post 라면 formData 이어야 하고.. 나머지는 json 형식 or serialize() 할것)
//url : controller 주소
//successFunc : 성공시 호출할 func
//ajax, post 방식
//일정을 그리는 method
//calendarData : json 형태의 calendarDto 
function drawSchedule(calendarData){
	//console.log(calendarData);
	var calendarNum = calendarData.calendarNum;
	var calendarSubject = calendarData.calendarSubject;
	var calendarDate = calendarData.calendarDate;
	
	var calendarMonth = calendarDate.split('/')[0];
	var calendarDay = calendarDate.split('/')[1];
	var calendarYear = calendarDate.split('/')[2];

	if(calendarSubject != null && calendarSubject.length > 6){
		calendarSubject = calendarSubject.substr(0, 6) + "...";
	}
	//var schedule = "<div class='schedule' data-num='" + calendarNum + "'>" + calendarSubject + "</div>";
	var schedule = $("<div class='schedule' data-num='" + calendarNum + "'>" + calendarSubject + "</div>");
	
	schedule.click(function () {
		//console.log($(this));
		var data = {
			groupNum : calendarData.groupNum
			, calendarNum : calendarNum
			, type : "detail"
		};
		//console.log(data);
		function detailResult(result) {
			//console.log(result);
			if(result.resultCode == 1){
				showCalendarModal("view", result.resultData);
			}
		};
		
		ajaxFunc(data, "/single/calendar", "get",  detailResult);

		return false;
	});
	
	var div = $(".day-" + parseInt(calendarDay)).find(".cal-schedule").append(schedule);
	
	
	
	return false;
}

//일정을 변경하는..
function modifySchedule(calendarData) {
	var schedules = $(".schedule");
	var schedule = null;
	schedules.each(function(index, item) {
		if($(item).attr("data-num") == calendarData.calendarNum){
			schedule = $(item);
			return;
		}
	});
	var calendarSubject = calendarData.calendarSubject;
	if(calendarSubject != null && calendarSubject.length > 6){
		calendarSubject = calendarSubject.substr(0, 6) + "...";
	}
	schedule.text(calendarSubject);
	return false;
}

function deleteSchedule(calendarData) {
	console.log(calendarData);
	var schedules = $(".schedule");
	var schedule = null;
	schedules.each(function(index, item) {
		if($(item).attr("data-num") == calendarData.calendarNum){
			schedule = $(item);
			return;
		}
	});
	
	schedule.remove();
	return false;
}
function groupMemberUpdate(e, groupNum, type){
	var url = "${root}/group/groupmember";
	var data = {
		groupNum : $(this).parent().attr("data-num")
		, type : apply
	}
	var success = function(result) {
		if(result.resultCode == 1){
			showSuccessAlertModal("가입신청", "모임에 가입신청 되었습니다. 모임장이 수락하면 가입이 수락됩니다.");
		}else{
			showAlertModal("가입신청", result.resultData);
		}
		
		return false;
	}
	ajaxFunc(data, url, "get", success);
}