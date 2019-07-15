<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/template/modern_business_top.jsp"%>
<link rel="stylesheet" href="${root}/resources/css/group/group.css">
<link rel="stylesheet" href="${root}/resources/css/user/group.css">
<script>

/* 셀렉트 박스 클릭 시  */
$(function() {
	
	getMyGroup("selected");
	//  셀렉트 박스 클릭 이벤트
	$(".moimOption").change(function() {
		var sel = $(this).val();
		getMyGroup(sel);
	});
	
	/* 모임 페이지 들어가기  */
	 $("#moimIn").click(function() {
		 var groupNum = $(this).attr("data-num");
		 console.log("모임 들어가기 버튼클릭됨 , 그룹넘버: " + groupNum);
		 
		 location.href = '${root}/group/' + groupNum;
		return false;
	});
	
	 /* 모임 탈퇴 버튼 클릭 시  */
	 $("#deleteMoinBtn").click(function() {
		 var groupNum = $("#moimIn").attr("data-num");
		 console.log("모임 탈퇴 버튼클릭됨 , 그룹넘버: " + groupNum);
		$.ajax({
			url: "${root}/mypage/moimdelete",
			type: "GET",
			dataType: "json", //응답
			data : {
				'groupNum' : groupNum
			},
			success : function(result) {
				if(result.resultCode == 1) {
					alert(result.resultData);
					location.reload(); //자동으로 새로고침되는거
				}
			}
		});	
		return false;
	});
});

function getMyGroup(sel) {
	if(sel == null || sel == ''){
		sel = "all"; 
	}
	
	$.ajax({
		type : 'GET',
		url : '${root}/mypage/select',
		dataType : 'text',
		data : {
			'option' : sel
		},
		success : function(data) {
			/* alert("성공 / 응답 값: " + data); */
			$(".jumbotronBottom").html(data);
			$(".groupcard").click(groupcardClick);
		}
	});
}





//그룹 클릭 시 상세페이지 모달뜨는 부분
function groupcardClick() {
	var groupNum = $(this).attr("data-num");

	$.ajax({
		url : "${root}/mypage/groupdetail",
		method : "get",
		dataType : "json",
		data : {
			"groupNum" : groupNum
		},
		success : function(result) {
			//console.log(result);
			groupDetailModalSetting(result);
			$("#groupDetailModal").modal("show");
		}
	});
}



// 	$.ajax({
// 	type : 'GET',
// 	url : '${root}/group/' + groupNum,
// 	success : function(result) {
// 		alert("모임 들어가기 성공");
// 	}
// });	

</script>

<%@ include file="groupdetailmodal.jsp"%>

<section class="contents">
	<div id="my-page-wrap">
		<div id="my-page-header">
			<div id="header-content" class="my-page-content">
			
				<!-- 프로필사진 -->
				<div class="user-photo" style="display: inline-block;">
					<c:if test="${userInfo.userProfile != null}">
		            	<img src="${userInfo.userProfile}" class="rounded-circle" width="90" height="90">             			
					</c:if>
					<c:if test="${userInfo.userProfile == null}">
	            		<img id = "userpic" src='${root}/resources/img/seonimg/kakaopic.png'  class="rounded-circle" width="90" height="90">  			
					</c:if>
				</div>
				<!-- 프로필사진 -->
				
				<div id="tabs">
					<div id="user-name">${userInfo.userName} (${userInfo.userNickname})</div>
					<div id="tab-box">
						<a class="tab" href="${root}/mypage/mypage">내 프로필</a> 
						<a class="tab selected" href="${root }/mypage/groupall">나의 모임관리</a> 
						<a class="tab" href="${root}/mypage/stampgroup">찜한 모임</a>
						<a class="tab" href="${root}/mypage/writelist">게시물관리</a>
					</div>
				</div>
			</div>
		</div>
		<br>
		<div class="container">
			<div class="jumbotron">
				<div class="jumbotronTop">
					<label class="moimTitle">내 모임 목록 </label> 
					<select class="moimOption" data-userInfo="${userInfo.userId}">
						<option class="allBtn" value="전체보기" selected="selected">전체보기</option>
						<option class="leaderBtn" value="groupleader">개설모임</option>
						<option class="memberBtn" value="groupmember">가입모임</option>
					</select>
					<hr>
				</div>
				<div class="jumbotronBottom">
					<!-- 모임 출력 시작(groupResult) -->
			
					<!-- 모임 출력 종료 -->
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/views/commons/template/modern_business_bottom.jsp"%>