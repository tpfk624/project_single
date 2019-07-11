<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- 과제 시작 -->
<c:forEach items="${homeworkList}" var="homework">
<c:if test="">
<section class="groupsection homework" data-num="${homework.homeworkNum}" style="background-color: #e6e6e6">
	<div class="homework-item">
		<div class="homework-body col-sm-8">
			<h4 class="homework-title">${homework.homeworkSubject}</h4>
			<div class="homework-content">${homework.homeworkContent}</div>
			<div class="homework-footer progress ing" data-prog="${homework.progressBar}">
				  <div class="progress-bar" data-prog="1"></div>
			</div>
		</div>
		<c:if test="${homework.status == '종료'}">
		<div class="col-sm-2 homework-status" style="background-image: ;">${homework.status}</div>
		</c:if>
		<c:if test="${homework.status == '진행중'}">
		<div class="col-sm-2 homework-status">${homework.status}</div>
		</c:if>
	</div>
</section>	
</c:if>
</c:forEach>