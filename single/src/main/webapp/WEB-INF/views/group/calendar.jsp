<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${root}/resources/css/group/calendar.css">
<script src="${root}/resources/js/group/calendar.js"></script>
<%@ include file="calendarmodal.jsp"%>
<section id="calendarsection">
	<div class="cal_top">
		<div id="boss" class="center">
			<a class="moveMonth" id="movePrevMonth" >
				<span id="prevMonth" class="cal_tit">&lt;</span>
			</a> 
			<span id="cal_top_year"></span> 
			<span id="cal_top_month"></span> 
			<a class="moveMonth" id="moveNextMonth"> 
				<span id="nextMonth" class="cal_tit">&gt;</span>
			</a>
		</div>
		<div id="cal_tab" class="cal"></div>
	</div>
</section>	
<script type="text/javascript">
drawCalendar();
initDate(); // 날짜 초기화할것
drawDays();
getScheduleList(year + "/" + month);

$("#movePrevMonth").on("click", function() {
	movePrevMonth();
	getScheduleList(year + "/" + month);
});
$("#moveNextMonth").on("click", function() {
	moveNextMonth();
	getScheduleList(year + "/" + month);
});	

function getScheduleList(date) {
	var data = {
			groupNum : "${group.groupNum}"
			, date : date
			, type : "month"
		};
	
	var success = function(result) {
		if(result.resultCode == 1){
			$(".schedule").remove();
			var resultData = result.resultData;
			for(var i=0 ; i<resultData.length ; i++){
				drawSchedule(resultData[i]);
			}
			
			$(".schedule").on("click", function() {
				//console.log($(this));
				var data = {
					groupNum : "${group.groupNum}"
					, calendarNum : $(this).attr("data-num")
					, type : "detail"
				};
				//console.log(data);
				function detailResult(result) {
					//console.log(result);
					if(result.resultCode == 1){
						showCalendarModal("view", result.resultData);
					}
				};
				
				ajaxFunc(data, "${root}/calendar", "get",  detailResult);

				return false;
			});
		}
	};
	
	ajaxFunc(data, "${root}/calendar", "get", success);
	return false;
}
</script>