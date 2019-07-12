<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include
	file="/WEB-INF/views/commons/template/modern_business_top.jsp"%>
<link rel="stylesheet" href="${root}/resources/css/group/group.css">
<link rel="stylesheet" href="${root}/resources/css/user/writelist.css">

<style>
img {
	margin-left: 0px;
}
</style>


<script>
	/* 셀렉트 박스 클릭 시  */
	$(function() {
		getMyList("selected");
		//  셀렉트 박스 클릭 이벤트
		$(".listOption").change(function() {
			var sel = $(this).val();
			getMyList(sel);
		});
		
		// 글 상세보기.
		$(document).on("click",".boardDetail", function () {
			var boardNum = $(this).find(".boardNum").val();
			
			if (boardNum == null || boardNum == "" || boardNum == 0) {
				alert("오류로 인해 접근이 불가능 합니다.");
			} else {
				location.href="${root}/board/view?boardNum=" + boardNum;
			}
			
		});
		
	});

	function getMyList(sel) {
		if (sel == null || sel == '') {
			sel = "all";
		}

		$.ajax({
			type : 'GET',
			url : '${root}/mypage/writeother',
			dataType : 'text',
			data : {
				'option' : sel
			},
			success : function(data) {
				$(".jumbotronBottom").html(data);
			}
		});
	}
</script>



<section class="contents">
	<div id="my-page-wrap">
		<div id="my-page-header">
			<div id="header-content" class="my-page-content">
				<!-- 프로필사진 -->
				<div class="user-photo" style="display: inline-block;">
					<c:if test="${userInfo.userProfile != null}">
						<img src="${userInfo.userProfile}" class="rounded-circle"
							width="90" height="90">
					</c:if>
					<c:if test="${userInfo.userProfile == null}">
						<img id="userpic" src='${root}/resources/img/seonimg/kakaopic.png'
							class="rounded-circle" width="90" height="90">
					</c:if>
				</div>
				<!-- 프로필사진 -->
				<div id="tabs">
					<div id="user-name">${userInfo.userName}
						(${userInfo.userNickname})</div>
					<div id="tab-box">
						<a class="tab" href="${root}/mypage/mypage">내 프로필</a> <a
							class="tab" href="${root }/mypage/groupall">나의 모임관리</a> <a
							class="tab" href="${root}/mypage/stampgroup">찜한 모임</a> <a
							class="tab selected" href="${root}/mypage/writelist">게시물관리</a>
					</div>
				</div>
			</div>
		</div>

		<br>


		<div class="container">
			<div class="jumbotron">
				<div class="jumbotronTop">
					<label class="moimTitle">게시물 관리</label> 
					<select class="listOption" data-userInfo="${userInfo.userId}">
						<option class="allBtn" value="selected" selected="selected">내가 쓴 글</option>
						<option class="replyBtn" value="reply">나의 댓글</option>
						<option class="zzimBtn" value="zzim">찜한 글</option>
					</select>
					<hr>
				</div>


				<div class="jumbotronBottom">
					<!-- 리스트 출력 시작(groupResult) -->
					
					<!-- 리스트 출력 종료 -->

				</div>
			</div>
		</div>

	</div>
</section>

<%@ include
	file="/WEB-INF/views/commons/template/modern_business_bottom.jsp"%>