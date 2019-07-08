<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script>
$(function() {
	$(".writeBtn").click(function() {
		$("#hprogressCreateModal").modal("show");
	});
	
	$(".search-input").on("keyup", function () {
		var text = $("this").val();
		var names = $("")
	});
});
</script>
<div class="groupmain" id="groupmain">
<!-- 모임 이름 뿌져지는 곳 -->
<section class="groupsection groupheader">
	<div class="row">
		<div class="groupname center">모임멤버관리</div>
	</div>
</section>

<section class="groupsection group-info" style="overflow: visible;">
	<div>
		<input class="col-sm-9 form-control search-input" type="text" 
			id="myInput" onkeyup="" placeholder="이름을 검색해주세요" title="이름을 검색해주세요">
		<button type="button" class="btn btn-danger col-sm-2 right writeBtn">모임삭제</button>
	</div>
	<table class="table hprogress-table">
		<thead>
			<tr>
				<th style="width: 7%;">번호</th>
				<th style="width: 15%;">이름</th>
				<th style="width: 20%;">요청일</th>
				<th style="width: 20%;">가입일</th>
				<th style="width: 15%;">상태</th>
				<th style="width: 28%;"></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${memberlist}" var="member" varStatus="status">
			<tr>
				<td>${status.index}</td>
				<td>${member.userNickname}</td>
				<td>${member.groupRequestdate}</td>
				<td>${member.groupJoindate}</td>
				<td><c:choose>
					<c:when test="${member.groupMemberStatecode == 'L'}">모임장<i class="fas fa-crown" style="color: #dede32; font-size: 25px;"></i></c:when>
					<c:when test="${member.groupMemberStatecode == 'M'}">모임원</c:when>
					<c:when test="${member.groupMemberStatecode == 'W'}">승인대기중</c:when>
				</c:choose></td>						
				<td><c:choose>
					<c:when test="${member.groupMemberStatecode == 'L'}">
					</c:when>
					<c:when test="${member.groupMemberStatecode == 'M'}">
						<button class="btn btn-primary">모임장위임</button>
						<button class="btn btn-danger">퇴출</button>
					</c:when>
					<c:when test="${member.groupMemberStatecode == 'W'}">
						<button class="btn btn-info">승인</button>
						<button class="btn btn-danger">승인거부</button>
					</c:when>
				</c:choose>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</section>
</div>