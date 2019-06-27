<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${root}/resources/css/group/calendar.css">
<script src="${root}/resources/js/group/calendar.js"></script>
<script type="text/javascript">
$(document).ready(function() { // 아예 시작할 때

	drawCalendar();
	initDate(); // 날짜 초기화할것
	drawDays();

	var a = $("#attr").html();

	$("#movePrevMonth").on("click", function() {
		movePrevMonth();
	});
	$("#moveNextMonth").on("click", function() {
		moveNextMonth();
	});
	
	$(".day").click(function() {
		$("#makeCalendarModal").modal("show");
	});

});
</script>
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