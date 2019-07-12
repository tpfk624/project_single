<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:if test="${empty sessionScope.userInfo}">99</c:if>
<c:if test="${!empty sessionScope.userInfo}">
<div class="groupmain" id="groupmain">	
<!-- 모임 이름 뿌져지는 곳 -->
<section class="groupsection groupheader">
	<div class="row center">
			<span class="center">${group.groupCategoryName}</span>
		</div>
	<div class="row">
		<div class="groupname center">${group.groupName}</div>
	</div>
</section>

<!-- 모임 정보 -->
<section class="groupsection group-info">
	<label class="group-info-label col-sm-2">모임정보</label>
	<div class="group-info-content col-sm-10">
		<div class="groupdesc"><c:forEach var="hashtag" items="${group.hashtagList}">
		<tag>${hashtag}</tag></c:forEach></div>
		<div class="groupdesc">인원 : ${group.groupMemberCount} / ${group.groupMemberLimit}</div>
		<div class="groupdesc">모임주요장소 : ${group.groupMainPlace}</div>
	</div>
</section>

<!-- 모임 설명 -->
<section class="groupsection group-info">
	<label class="group-info-label col-sm-2">모임설명</label>
	<div class="group-info-content col-sm-10">
	${group.groupDescription}
	</div>
</section>

<!-- 달력 -->
<section class="groupsection group-calendar">
	<label class="group-info-label col-sm-2">모임일정</label>
	<div class="group-info-content col-sm-10">
	<%@ include file="calendar.jsp"%>
	</div>
</section>
</div>
</c:if>