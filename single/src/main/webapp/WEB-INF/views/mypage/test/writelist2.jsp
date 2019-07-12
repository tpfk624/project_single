<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include
	file="/WEB-INF/views/commons/template/modern_business_top.jsp"%>
<link rel="stylesheet" href="${root}/resources/css/group/group.css">
<link rel="stylesheet" href="${root}/resources/css/user/writelist.css">

<style>

img {
    margin-left: 0px;
}
</style>


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
						<a class="tab" href="${root}/mypage/stampgroup">찜한 모임</a>
						<a class="tab selected" href="${root}/mypage/writelist">게시물관리</a>
					</div>
				</div>
			</div>
		</div>

		<br>

		
		<div class="container">
			<div class="jumbotron">
				<div class="jumbotronTop">
					<label class="moimTitle">게시물 관리</label> <select class="moimOption">
						<option value="제목" selected="selected">내가 쓴 글</option>
						<option value="작성자">나의 댓글</option>
						<option value="작성자">찜한 글</option>
					</select>
					<hr>
				</div>


				<div class="jumbotronBottom">
				
					<!-- 글목록 -->
					<div class="cardWrite">
						<div class="cardWriteTop">
							<h5 class="card-title">배고파여</h5>
						</div>
						<div class="cardWriteCenter">
							<h6 class="card-content">안쌤 왕글씨 공격 따라해보자 글을 길게 써보자 오류를 확인해야하니까 길게 길게 길게 영차영차여차어러니러ㅣㅇ너리넝리너리ㅓㅣ
							안쌤 왕글씨 공격 따라해보자!!글을 길게 써보자 오류를 확인해야하니까 길게 길게 길게 영차영차여차어러니러ㅣㅇ너리넝리너리ㅓㅣ</h6>
						</div>
						<div class="cardWriteBottom">
							<h8 class="card-date">2019-06-28 02:06</h8>
						</div>
					</div>
					<!-- 글목록 -->
					
					<!-- 글목록 -->
					<div class="cardWrite">
						<div class="cardWriteTop">
							<h5 class="card-title">나는야 코딩천재</h5>
						</div>
						<div class="cardWriteCenter">
							<h6 class="card-content">안쌤 왕글씨 공격 따라해보자 글을 길게 써보자 오류를 확인해야하니까 길게 길게 길게 영차영차여차어러니러ㅣㅇ너리넝리너리ㅓㅣ
							안쌤 왕글씨 공격 따라해보자!!글을 길게 써보자 오류를 확인해야하니까 길게 길게 길게 영차영차여차어러니러ㅣㅇ너리넝리너리ㅓㅣ</h6>
						</div>
						<div class="cardWriteBottom">
							<h8 class="card-date">2019-06-28 02:06</h8>
						</div>
					</div>
					<!-- 글목록 -->
					
					<!-- 글목록 -->
					<div class="cardWrite">
						<div class="cardWriteTop">
							<h5 class="card-title">오늘의 요리는 가지덮밥입니다앙</h5>
						</div>
						<div class="cardWriteCenter">
							<h6 class="card-content">안쌤 왕글씨 공격 따라해보자 글을 길게 써보자 오류를 확인해야하니까 길게 길게 길게 영차영차여차어러니러ㅣㅇ너리넝리너리ㅓㅣ
							안쌤 왕글씨 공격 따라해보자!!글을 길게 써보자 오류를 확인해야하니까 길게 길게 길게 영차영차여차어러니러ㅣㅇ너리넝리너리ㅓㅣ</h6>
						</div>
						<div class="cardWriteBottom">
							<h8 class="card-date">2019-06-28 02:06</h8>
						</div>
					</div>
					<!-- 글목록 -->
					
					<!-- 글목록 -->
					<div class="cardWrite">
						<div class="cardWriteTop">
							<h5 class="card-title">룰루랄라 </h5>
						</div>
						<div class="cardWriteCenter">
							<h6 class="card-content">안쌤 왕글씨 공격 따라해보자 글을 길게 써보자 오류를 확인해야하니까 길게 길게 길게 영차영차여차어러니러ㅣㅇ너리넝리너리ㅓㅣ
							안쌤 왕글씨 공격 따라해보자!!글을 길게 써보자 오류를 확인해야하니까 길게 길게 길게 영차영차여차어러니러ㅣㅇ너리넝리너리ㅓㅣ</h6>
						</div>
						<div class="cardWriteBottom">
							<h8 class="card-date">2019-06-28 02:06</h8>
						</div>
					</div>
					<!-- 글목록 -->

				</div>
			</div>
		</div>
		
	</div>
</section>

<%@ include file="/WEB-INF/views/commons/template/modern_business_bottom.jsp"%>