<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:if test="${empty sessionScope.userInfo}">99</c:if>
<c:if test="${!empty sessionScope.userInfo}">
<c:set value="${pagination.list}" var="homeworkList"></c:set>
<!-- 과제 시작 -->
<c:forEach items="${homeworkList}" var="homework">
<c:if test="${homework.status == '진행중'}">
<section class="groupsection homework" data-num="${homework.homeworkNum}" >
</c:if>
<c:if test="${homework.status == '종료' }">
<section class="groupsection homework homework-end" data-num="${homework.homeworkNum}">
</c:if>
	<div class="homework-item">
		<div class="homework-body col-sm-8">
			<h4 class="homework-title">${homework.homeworkSubject}</h4>
			<div class="homework-content">${homework.homeworkStartdate} ~ ${homework.homeworkEnddate}</div>
			<div class="homework-content"><c:choose>
				<c:when test="${fn:length(homework.homeworkContent) > 30}">${fn:substring(homework.homeworkContent, 0 , 30)}...</c:when>
				<c:otherwise>${homework.homeworkContent}</c:otherwise></c:choose></div>
			<div class="homework-footer progress ing" data-prog="${homework.progressBar}">
				  <div class="progress-bar" data-prog="1"></div>
			</div>
		</div>
		<c:if test="${homework.status == '종료'}">
		<c:choose>
			<c:when test="${homework.progressBar < 40}">
			<div class="col-sm-3 homework-status" style="background-image: url('${root}/resources/img/group/checked_red.png');">${homework.status}</div>
			</c:when>
			<c:when test="${homework.progressBar < 70}">
			<div class="col-sm-3 homework-status" style="background-image: url('${root}/resources/img/group/checked_yellow.png');">${homework.status}</div>
			</c:when>	
			<c:otherwise>
			<div class="col-sm-3 homework-status" style="background-image: url('${root}/resources/img/group/checked_green.png');">${homework.status}</div>
			</c:otherwise>			
		</c:choose>
		</c:if>
		<c:if test="${homework.status == '진행중'}">
			<div class="col-sm-3 homework-status">${homework.status}</div>
		</c:if>
	</div>
</section>	
</c:forEach>
<%@ include file="/WEB-INF/views/commons/pagination.jsp"%>	
</c:if>
