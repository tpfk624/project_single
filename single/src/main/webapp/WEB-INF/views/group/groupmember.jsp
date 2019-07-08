<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script>
$(function() {
	$(".search-input").on("keyup", function (e) {
		if(e.keyCode == 27){
			$(this).val("");
		}
		
		var text = $(this).val();
		var names = $(".member-state-table tbody .userNickname");
		
		for(var i=0 ; i<names.length ; i++){
			var name = $(names[i]);
			if(name.text().indexOf(text) == -1){
				name.parent().hide();
			}else{
				name.parent().show();
			}
		}
		return false;
	});
	
	$("#groupDelete").on("click", function() {	
		showAlertConfirmModal("확인해주세요", "정말로 모임을 삭제 하시겠습니까?(되돌릴 수 없습니다)", "groupDelete", "", "");
	});
	
	$(".member-state-table .btn-danger").click(function () {
		var text = $(this).text();
		var name = $(this).parent().siblings(".userNickname").text();
		var type = $(this).attr("data-type");
		var targetId = $(this).parent().parent().attr("data-userId");
		
		var body = "";
		if(text == '모임장위임'){
			body = "정말 " + name + " 님에게 모임장을 위임하시겠습니까?";
		}else if(text == '승인거부'){
			body = "정말 " + name + " 님을 승인거부 하시겠습니까?";
		}else if(text == '퇴출'){
			body = "정말 " + name + " 님을 퇴출 하시겠습니까?";
		}
		
		showAlertConfirmModal("확인해주세요", body, type, targetId, name);
	});
	
	$(".member-state-table .btn-primary").click(function () {
		var name = $(this).parent().siblings(".userNickname").text();
		var type = $(this).attr("data-type");
		var targetId = $(this).parent().parent().attr("data-userId");
		
		var data = {
			groupNum : "${groupNum}"
			, type : type
			, targetId : targetId
			, userNickname : name
		}
		var url = "${root}/group/groupmember";
		
		groupMemberUpdate(data, url);
	});
	
	$("#alert_confirm .okbtn").on("click", function() {
		//console.log($(this).attr("data-type"));
		var type = $(this).attr("data-type");
		
		if(type == 'groupDelete'){
			console.log("dd");
			var url = "${root}/group/groupdelete";
			var data = {
				groupNum : "${groupNum}"
			}
			var success = function(result) {
				$("#alert_confirm").modal("hide");
				if(result.resultCode == 1){
					showSuccessAlertModal("모임 삭제", "정상적으로 모임이 삭제되었습니다(더이상 되돌릴 수 없습니다)");
					
					$("#alertSuccess").on("hidden.bs.modal", function () {
						$(location).attr("href", "${root}/group");
					});
				}else{
					showAlertModal("모임 삭제 실패", result.resultData);
				}
			}
			ajaxFunc(data, url, "get", success);
		}else{
			var url = "${root}/group/groupmember";
			var data = {
				groupNum : "${groupNum}"
				, type : type
				, targetId : $(this).attr("data-targetId")
				, userNickname : $(this).attr("data-userNickname")
			}
			
			groupMemberUpdate(data, url);
		}
		return false;
	});
});
</script>
<div class="groupmain" id="groupmain">

<!-- confirm 창 -->
<%@ include file="/WEB-INF/views/commons/alert_confirm.jsp"%>

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
		<button type="button" class="btn btn-danger col-sm-2 right writeBtn" data-type="deleteGroup" id="groupDelete">모임삭제</button>
	</div>
	<table class="table hprogress-table member-state-table">
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
			<tr data-userId="${member.userId}" >
				<td>${status.index}</td>
				<td class="userNickname">${member.userNickname}</td>
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
						<button class="btn btn-danger" data-type="leader" style="background-color: #004085; border-color: #004085;">모임장위임</button>
						<button class="btn btn-danger" data-type="fire">퇴출</button>
					</c:when>
					<c:when test="${member.groupMemberStatecode == 'W'}">
						<button class="btn btn-primary" data-type="applyok">승인</button>
						<button class="btn btn-danger" data-type="applyno">승인거부</button>
					</c:when>
				</c:choose>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</section>
</div>