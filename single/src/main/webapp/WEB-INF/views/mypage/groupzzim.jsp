<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/template/modern_business_top.jsp"%>
<link rel="stylesheet" href="${root}/resources/css/group/group.css">
<link rel="stylesheet" href="${root}/resources/css/user/groupzzim.css">


<%
HttpSession httpSession = request.getSession();
UserDto userInfo = new UserDto();
userInfo.setUserId("calubang1@naver.com");
httpSession.setAttribute("userInfo", userInfo);
%>


<script>

/* 셀렉트 박스 클릭 시  */
$(function() {
	getMyGroup("selected");
	//  셀렉트 박스 클릭 이벤트
	$(".moimOption").change(function() {
		var sel = $(this).val();
		getMyGroup(sel);
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
			/* alert("성공 / 응답 값: " + data); */
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

<%@ include file="groupdetailmodal2.jsp"%>


<section class="contents">
	<div id="my-page-wrap">
		<div id="my-page-header">
			<div id="header-content" class="my-page-content">
				<div class="user-photo"
					style="display: inline-block; background-image: url(&quot;https://cdn.studysearch.co.kr/images/users/199883/profile/1561443247&quot;); background-size: cover; background-position: 50% 50%;"></div>
				<div id="tabs">
					<div id="user-name">고세라</div>
					<div id="tab-box">
						<a class="tab" href="${root}/mypage/mypage">내 프로필</a> 
						<a class="tab" href="${root }/mypage/groupall">나의 모임관리</a> 
						<a class="tab selected" href="${root}/mypage/stampgroup">찜한 모임</a> 
						<a class="tab" href="${root}/user_mypage/myPageWrite.jsp">게시물관리</a>
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

