/**
 * 2019.06.27 abo 달력 js 부분 분리
 */
var today = null;
var year = null;
var month = null;
var firstDay = null;
var lastDay = null;
var $tdDay = null;
var $tdSche = null;
var cellText = null;
var cell = null;

//calendar 그리기
function drawCalendar() {

	var setTableHTML = "";

	//var a = $("#attr").html();
	//console.log('drawCalendar()에서 받아옴 : '+ a);
	//var insert = '<div>'+ a +'</div>'
	//console.log(insert);
	//console.log(cellText);

	setTableHTML += '<table class="calendar" id = "calendar">';
	setTableHTML += '<tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>';
	for (var i = 0; i < 6; i++) {
		setTableHTML += '<tr height="100">';
		for (var j = 0; j < 7; j++) {
			setTableHTML += '<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap">';
			setTableHTML += '    <div class="cal-day"></div>'; // day 써있는곳에 놓기
			setTableHTML += '    <div class="cal-schedule"></div>';
			setTableHTML += '</td>';
		}
		setTableHTML += '</tr>';
	}
	setTableHTML += '</table>';
	$("#cal_tab").html(setTableHTML);
}

//날짜 초기화
function initDate() {
	$tdDay = $("td div.cal-day")
	$tdSche = $("td div.cal-schedule")
	dayCount = 0;
	today = new Date();
	year = today.getFullYear();
	month = today.getMonth() + 1;
	firstDay = new Date(year, month - 1, 1);
	lastDay = new Date(year, month, 0);

	if (month < 10) {
		month = String("0" + month);
	}

}

//calendar 날짜표시
function drawDays() {
	$("#cal_top_year").text(year);
	$("#cal_top_month").text(month);
	for (var i = firstDay.getDay(); i < firstDay.getDay()
			+ lastDay.getDate(); i++) {
		$tdDay.eq(i).text(++dayCount);
		$tdDay.eq(i).parent().addClass("day");
		$tdDay.eq(i).parent().addClass("day-"+dayCount);
	}
	for (var i = 0; i < 42; i += 7) {
		$tdDay.eq(i).css("color", "red");
		//$tdDay.eq(i).css("background","red");
	}
	for (var i = 6; i < 42; i += 7) {
		$tdDay.eq(i).css("color", "blue");
	}
	
	$(".day").on("click", function() {
		showCalendarModal("create", null, $(this).find(".cal-day").text());

		return false;
	});
}

//calendar 월 이동
function movePrevMonth() {
	month--;
	if (month <= 0) {
		month = 12;
		year--;
	}

	if (month < 10) {
		month = String("0" + month);
	}

	getNewInfo();
	$("#movePrevMonth").css("color", "#4680ff");
	return false;
}

function moveNextMonth() {
	month++;
	if (month > 12) {
		month = 1;
		year++;
	}

	if (month < 10) {
		month = String("0" + month);
	}

	getNewInfo();
	$("#moveNextMonth").css("color", "#4680ff");
	return false;
}

function getNewInfo() {
	$(".day").off("click");
	
	for (var i = 0; i < 42; i++) {
		$tdDay.eq(i).text("");
		$tdDay.parent().removeClass("day");
		$tdDay.parent().removeClass("day-" + i);
	}
	
	
	dayCount = 0;
	firstDay = new Date(year, month - 1, 1);
	lastDay = new Date(year, month, 0);
	drawDays();
}