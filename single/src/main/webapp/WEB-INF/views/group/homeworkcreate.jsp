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
			onSelect: function(dateText) {
//		console.log("Selected date: " + dateText + "; input's current value: " + this.value);
		    }
	}).on("change", function() {
		//달력 눌를때 이벤트 콜백 위치
	});
	
	$('#enddate').datepicker({
	    uiLibrary: 'bootstrap4',
			onSelect: function(dateText) {
//		console.log("Selected date: " + dateText + "; input's current value: " + this.value);
		    }
	}).on("change", function() {
		//달력 눌를때 이벤트 콜백 위치
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
	<section class="groupsection group-info">
		<label class="group-info-label col-sm-2">과제 이름</label>
		<div class="group-info-content col-sm-10">
			<input type="text" class="form-control" placeholder="과제 이름을 입력해주세요">
		</div>
	</section>
	<section class="groupsection group-info">
		<label class="group-info-label col-sm-2">과제 시작일</label>
		<div class="group-info-content col-sm-10">
			<input class="datepicker" id="startdate" name ="calendarDate" width="276" readonly="readonly"
							value=""/ placeholder="과제 시작기간을 입력해주세요">
		</div>
	</section>
	<section class="groupsection group-info">
		<label class="group-info-label col-sm-2">과제 종료일</label>
		<div class="group-info-content col-sm-10">
			<input class="datepicker" id="enddate" name ="calendarDate" width="276" readonly="readonly"
							value=""/ placeholder="과제 종료기간을 입력해주세요">
		</div>
	</section>
	<section class="groupsection group-info">
		<label class="group-info-label col-sm-2">과제 내용</label>
		<div class="group-info-content col-sm-10">
			<textarea rows="10" cols="100" class="form-control" id="message"
				placeholder="내용을 입력해주세요" style="resize: none"></textarea>
		</div>
	</section>
</div>
</c:if>