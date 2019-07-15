<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/template/modern_business_top.jsp"%>
<link rel="stylesheet" href="${root}/resources/css/group/group.css">
<link rel="stylesheet" href="${root}/resources/css/user/groupzzim.css">
<%@ include file="/WEB-INF/views/commons/alert_danger.jsp"%>
<%@ include file="/WEB-INF/views/commons/alert_success.jsp"%>

<script>

/* 셀렉트 박스 클릭 시  */
$(function() {
	getMyGroup("selected");
	
	//  셀렉트 박스 클릭 이벤트
	$(".moimOption").change(function() {
		var sel = $(this).val();
		getMyGroup(sel);
	});
	
	/* 모임 가입하기  */
	 $("#moimApply").click(function() {
		 var groupNum = $(this).attr("data-num");
		 console.log("모임 가입하기 버튼클릭됨 , 그룹넘버: " + groupNum);
		$.ajax({
			type : 'GET',
			url : '${root}/group/groupmember',
			dataType: "json",
			data : {
				'type' : "apply",
				'groupNum' : groupNum
			},
			success : function(result) {
				if(result.resultCode == 1) {
					alert(result.resultData);
				}
			}
		});	
		return false;
	});
	
	 /* 찜하기 취소  */
	 $("#zzimDelete").click(function() {
		 var groupNum = $("#moimApply").attr("data-num");
		 console.log("찜 취소하기 버튼클릭됨 , 그룹넘버: " + groupNum);
		$.ajax({
			type : 'GET',
			url : '${root}/mypage/stampdelete',
			dataType: "json",
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
		url : '${root}/mypage/zselect',
		dataType : 'text',
		data : {
			'option' : sel
		},
		success : function(data) {
			$(".jumbotronBottom").html(data);
			$(".groupcard").click(groupcardClick);
		}
	});
}

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


</script>

<%@ include file="groupzzimmodal.jsp"%>


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
						<a class="tab" href="${root }/mypage/groupall">나의 모임관리</a> 
						<a class="tab selected" href="${root}/mypage/stampgroup">찜한 모임</a> 
						<a class="tab" href="${root}/mypage/writelist">게시물관리</a>
					</div>
				</div>
			</div>
		</div>

		<br>

		<div class="container">
			<div class="jumbotron">
				<div class="jumbotronTop">
					<label class="moimTitle">찜한 모임 목록 </label> 
					<select class="moimOption" data-userInfo="${userInfo.userId}">
						<option value="전체보기" selected="selected">전체보기</option>
						<option value="study">스터디</option>
						<option value="hobby">취미</option>
						<option value="friend">친목도모</option>
						<option value="foodtour">맛집탐방</option>
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

<%@ include  file="/WEB-INF/views/commons/template/modern_business_bottom.jsp"%>

