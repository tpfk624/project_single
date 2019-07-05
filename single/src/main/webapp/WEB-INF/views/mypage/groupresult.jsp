<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<div class="row">
<!-- 모임 출력 시작 -->
<c:forEach items="${groupList}" var="group">

	<!-- 카드 사진 위버전 -->

	<div class="col-lg-4 col-sm-6 portfolio-item groupcard"
		data-num="${group.groupNum}">

		<div class="card h-100">

			<img class="card-img-top" src="${group.groupImgSrc}" alt="">

			<h4 class="card-title">${group.groupName}</h4>

			<div class="card-body">

				<p class="card-text">

					<c:choose>

						<c:when test="${fn:length(group.groupDescription) > 100}">${fn:substring(group.groupDescription, 0, 100)}...</c:when>

						<c:otherwise>${group.groupDescription}</c:otherwise>

					</c:choose>

				</p>

				<p class="card-text">인원 :

					${group.groupMemberCount}/${group.groupMemberLimit}</p>

				<p class="card-text">장소 : ${group.groupMainPlace}</p>

			</div>

			<div class="overlay">

				<div class="text">상세보기</div>

			</div>

		</div>

	</div>

</c:forEach>
<!-- 모임 출력 종료 -->
</div>

